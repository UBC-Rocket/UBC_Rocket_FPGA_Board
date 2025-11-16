module MULT (clk, areset, start, a, b, q, finish);
    input logic clk, areset, start;
    input logic [31:0] a;
    input logic [31:0] b;
    output logic [31:0] q;
    output logic finish;
    
    // ----------------
    // Stage 0: inputs register
    // ----------------
    logic [31:0] a_s0, b_s0;
    logic valid_s0;

    always_ff @(posedge clk or posedge areset) begin
        if (areset) begin
            a_s0 <= 32'd0;
            b_s0 <= 32'd0;
            valid_s0 <= 1'b0;
        end else begin
            a_s0 <= a;
            b_s0 <= b;
            valid_s0 <= start;
        end
    end

    // -----------------------------------------
    // Stage 1: unpack + precompute (no multiply)
    // -----------------------------------------
    logic sign_res_c1;
    logic [23:0] mant_a_c1, mant_b_c1;
    logic [9:0]  e_c1;                // exp_a + exp_b - 127 (denorms -> 0)
    logic a_zero_c1, b_zero_c1;

    always_comb begin
        logic sign_a, sign_b;
        logic [7:0] exp_a, exp_b;

        sign_a = a_s0[31];
        sign_b = b_s0[31];
        exp_a  = a_s0[30:23];
        exp_b  = b_s0[30:23];

        // zero detect
        a_zero_c1 = (exp_a == 8'd0) && (a_s0[22:0] == 23'd0);
        b_zero_c1 = (exp_b == 8'd0) && (b_s0[22:0] == 23'd0);

        // sign of result
        sign_res_c1 = sign_a ^ sign_b;

        // 1.xxx for normals, 0.xxx for denormals
        mant_a_c1 = (exp_a == 8'd0) ? {1'b0, a_s0[22:0]} : {1'b1, a_s0[22:0]};
        mant_b_c1 = (exp_b == 8'd0) ? {1'b0, b_s0[22:0]} : {1'b1, b_s0[22:0]};

        // exponent sum with denorms treated as 0
        // BIG comb CHECK 
        e_c1 = (exp_a == 8'd0 ? 10'd0 : {2'b00, exp_a}) + (exp_b == 8'd0 ? 10'd0 : {2'b00, exp_b}) - 10'd127;
    end

    // regs
    logic sign_res_s1;
    logic [23:0] mant_a_s1, mant_b_s1;
    logic [9:0]  e_s1;
    logic a_zero_s1, b_zero_s1;
    logic valid_s1;

    always_ff @(posedge clk or posedge areset) begin
        if (areset) begin
            sign_res_s1 <= 1'b0;
            mant_a_s1 <= 24'd0;
            mant_b_s1 <= 24'd0;
            e_s1 <= 10'd0;
            a_zero_s1 <= 1'b0;
            b_zero_s1 <= 1'b0;
            valid_s1 <= 1'b0;
        end else begin
            sign_res_s1 <= sign_res_c1;
            mant_a_s1 <= mant_a_c1;
            mant_b_s1 <= mant_b_c1;
            e_s1 <= e_c1;
            a_zero_s1 <= a_zero_c1;
            b_zero_s1 <= b_zero_c1;
            valid_s1 <= valid_s0;
        end
    end

    // -------------------------
    // Stage 2: 24x24 multiply for the mantissas
    // -------------------------
    logic [47:0] mant_prod_c2;

    always_comb begin
        mant_prod_c2 = mant_a_s1 * mant_b_s1;  // pure combinational multiply
    end

    // regs
    logic [47:0] mant_prod_s2;
    logic [9:0]  e_s2;
    logic sign_res_s2;
    logic a_zero_s2, b_zero_s2;
    logic valid_s2;

    always_ff @(posedge clk or posedge areset) begin
        if (areset) begin
            mant_prod_s2 <= 48'd0;
            e_s2 <= 10'd0;
            sign_res_s2 <= 1'b0;
            a_zero_s2 <= 1'b0;
            b_zero_s2 <= 1'b0;
            valid_s2 <= 1'b0;
        end else begin
            mant_prod_s2 <= mant_prod_c2;
            e_s2  <= e_s1;
            sign_res_s2 <= sign_res_s1;
            a_zero_s2 <= a_zero_s1;
            b_zero_s2 <= b_zero_s1;
            valid_s2 <= valid_s1;
        end
    end

    // -----------------------------------------------
    // Stage 3: normalize + handle ovf/udf + pack q
    // -----------------------------------------------
    logic [31:0] q_c3;
    logic [9:0]  e;
    logic [22:0] frac_norm;
    logic [7:0]  exp_norm;
    logic  is_zero_result;

    always_comb begin
        // defaults
        q_c3 = 32'd0;

        // zero short-circuit
        if (a_zero_s2 || b_zero_s2) begin
            q_c3 = {sign_res_s2, 8'd0, 23'd0};  
        end else begin
            is_zero_result = 1'b0;
            e = e_s2;

            // normalize product
            if (mant_prod_s2[47]) begin
                e = e + 10'd1;
                frac_norm = mant_prod_s2[46:24];
            end else begin
                // in [1.0,2.0)
                frac_norm = mant_prod_s2[45:23];
            end

            // exponent range handling
            if (e >= 10'd255) begin
                exp_norm = 8'hFF; // overflow -> Inf
            end else if (e <= 10'd0) begin
                exp_norm = 8'd0;   // underflow -> treat as 0 
                is_zero_result = 1'b1;
            end else begin
                exp_norm = e[7:0];
            end

            // pack
            if (is_zero_result) begin
                q_c3 = {sign_res_s2, 8'd0, 23'd0};
            end else if (exp_norm == 8'hFF) begin
                q_c3 = {sign_res_s2, 8'hFF, 23'd0}; 
            end else begin
                q_c3 = {sign_res_s2, exp_norm, frac_norm};
            end
        end
    end

    // regs
    logic [31:0] q_s3;
    logic valid_s3;

    always_ff @(posedge clk or posedge areset) begin
        if (areset) begin
            q_s3 <= 32'd0;
            valid_s3 <= 1'b0;
        end else begin
            q_s3 <= q_c3;
            valid_s3 <= valid_s2;
        end
    end

    assign q = q_s3;
    assign finish = valid_s3;   // valid when output is ready

endmodule
