module DIV (clk, areset, start, a, b, q, finish);
    input logic clk;
    input logic areset;
    input logic start;
    input logic [31:0] a; // dividend
    input logic [31:0] b; // divisor
    output logic [31:0] q; // quotient
    output logic finish;

    // IEE constants used in algorithm
    localparam logic [31:0] TWO   = 32'h40000000; // 2.0
    localparam logic [31:0] A_CST = 32'h4034B4B5; // A ≈ 48/17 ≈ 2.8235295
    localparam logic [31:0] B_CST = 32'h3FF0F0F1; // B ≈ 32/17 ≈ 1.8823529


    typedef enum logic [3:0] {
        S_IDLE          = 4'd0,

        // y0 = A - B*x
        S_Y0_MUL_START  = 4'd1, // t1 = B*x
        S_Y0_MUL_WAIT   = 4'd2,
        S_Y0_SUB_START  = 4'd3, // y0 = A - t1
        S_Y0_SUB_WAIT   = 4'd4,

        // y1 = y0*(2 - x*y0)
        S_NR_MUL1_START = 4'd5, // t2 = x*y0
        S_NR_MUL1_WAIT  = 4'd6,
        S_NR_SUB_START  = 4'd7, // t3 = 2 - t2
        S_NR_SUB_WAIT   = 4'd8,
        S_NR_MUL2_START = 4'd9, // y1 = y0*t3
        S_NR_MUL2_WAIT  = 4'd10,

        // scale to 1/b and multiply by a
        S_SCALE_MUL_START = 4'd11, // rpos = y1 * SCALE( exp_b )
        S_SCALE_MUL_WAIT  = 4'd12,
        S_FINAL_MUL_START = 4'd13, // q = a * recip_b (signed)
        S_FINAL_MUL_WAIT  = 4'd14
    } state_t;

    state_t state, state_next;


    logic sign_a, sign_b;
    logic [7:0] exp_a, exp_b;
    logic [22:0] frac_a, frac_b;
    logic a_is_zero, b_is_zero, b_is_inf;
    logic [31:0] a_reg, b_reg;
    logic [31:0] x_bits;

    // scale factor for reciprocal exponent: SCALE = 2^(126 - exp_b)
    logic [31:0] scale_bits; // sign=0, mant=0, exp = 253 - exp_b

    logic [31:0] t1; // B*x
    logic [31:0] y0; // A - t1
    logic [31:0] t2; // x*y0
    logic [31:0] t3; // 2 - t2
    logic [31:0] y1; // y0*t3 (refined reciprocal of x)
    logic [31:0] recip_pos; // y1 * SCALE (positive reciprocal of |b|)
    logic [31:0] recip_b; // recip_pos with sign of b

    // Outputs from shared MULT/SUB cores
    logic [31:0] mult_q;
    logic mult_done;

    logic [31:0] sub_q;
    logic sub_done;

    // Control to shared cores
    logic mult_start;
    logic [31:0] mult_a, mult_b;

    logic sub_start;
    logic [31:0] sub_a, sub_b;

    // Result regs
    logic [31:0] q_reg;
    logic finish_reg;

    assign q = q_reg;
    assign finish = finish_reg;

    // ONE SHARED MULT core
    MULT u_mult (
        .clk    (clk),
        .areset (areset),
        .start  (mult_start),
        .a      (mult_a),
        .b      (mult_b),
        .q      (mult_q),
        .finish (mult_done)
    );


    // ONE SHARED SUB core
    SUB u_sub (
        .clk    (clk),
        .areset (areset),
        .start  (sub_start),
        .a      (sub_a),
        .b      (sub_b),
        .q      (sub_q),
        .finish (sub_done)
    );

 

    always_comb begin
        // defaults
        mult_start = 1'b0;
        mult_a     = 32'd0;
        mult_b     = 32'd0;

        sub_start  = 1'b0;
        sub_a      = 32'd0;
        sub_b      = 32'd0;

        state_next = state;

        unique case (state)
            S_IDLE: begin
                if (start) begin
                    state_next = S_Y0_MUL_START;
                end
            end

            // y0 = A - B*x
            S_Y0_MUL_START: begin
                mult_start = 1'b1;
                mult_a = B_CST;
                mult_b = x_bits;
                state_next = S_Y0_MUL_WAIT;
            end

            S_Y0_MUL_WAIT: begin
                if (mult_done) state_next = S_Y0_SUB_START;
            end

            S_Y0_SUB_START: begin
                sub_start = 1'b1;
                sub_a = A_CST;
                sub_b = mult_q;   // t1
                state_next = S_Y0_SUB_WAIT;
            end

            S_Y0_SUB_WAIT: begin
                if (sub_done) state_next = S_NR_MUL1_START;
            end

            // y1 = y0 * (2 - x*y0)
            S_NR_MUL1_START: begin
                mult_start = 1'b1;
                mult_a = x_bits;
                mult_b = y0;      // from sub_q latched
                state_next = S_NR_MUL1_WAIT;
            end

            S_NR_MUL1_WAIT: begin
                if (mult_done) state_next = S_NR_SUB_START;
            end

            S_NR_SUB_START: begin
                sub_start = 1'b1;
                sub_a = TWO;      // 2.0
                sub_b = t2;       // mult_q
                state_next = S_NR_SUB_WAIT;
            end

            S_NR_SUB_WAIT: begin
                if (sub_done) state_next = S_NR_MUL2_START;
            end

            S_NR_MUL2_START: begin
                mult_start = 1'b1;
                mult_a = y0;
                mult_b = t3;
                state_next = S_NR_MUL2_WAIT;
            end

            S_NR_MUL2_WAIT: begin
                if (mult_done) state_next = S_SCALE_MUL_START;
            end

            S_SCALE_MUL_START: begin
                mult_start = 1'b1;
                mult_a = y1;
                mult_b = scale_bits;  
                state_next = S_SCALE_MUL_WAIT;
            end

            S_SCALE_MUL_WAIT: begin
                if (mult_done) state_next = S_FINAL_MUL_START;
            end

            S_FINAL_MUL_START: begin
                mult_start = 1'b1;
                mult_a = a_reg;
                mult_b = recip_b;
                state_next = S_FINAL_MUL_WAIT;
            end

            S_FINAL_MUL_WAIT: begin
                if (mult_done) state_next = S_IDLE;
            end

            default: state_next = S_IDLE;
        endcase
    end

	logic [8:0] e_scaled;

    always_ff @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= S_IDLE;
            q_reg <= 32'd0;
            finish_reg <= 1'b0;
            a_reg <= 32'd0;
            b_reg <= 32'd0;
            y0 <= 32'd0;
            t2 <= 32'd0;
            t3 <= 32'd0;
            y1 <= 32'd0;
            recip_pos <= 32'd0;
        end else begin
            state <= state_next;
            finish_reg <= 1'b0; // default low; pulse on final

            if (state == S_IDLE && start) begin
                a_reg <= a;
                b_reg <= b;

                sign_a <= a[31];
                sign_b <= b[31];
                exp_a <= a[30:23];
                exp_b <= b[30:23];
                frac_a <= a[22:0];
                frac_b <= b[22:0];

                a_is_zero <= (a[30:23] == 8'd0) && (a[22:0] == 23'd0);
                b_is_zero <= (b[30:23] == 8'd0) && (b[22:0] == 23'd0);
                b_is_inf <= (b[30:23] == 8'hFF) && (b[22:0] == 23'd0);

        
                if (b[30:23] != 8'd0 && b[30:23] != 8'hFF) begin
                    x_bits <= {1'b0, 8'd126, frac_b};
                end else begin 
                    x_bits <= 32'h3F000000; 
                end

                if (e_scaled <= 1)       scale_bits <= {1'b0, 8'd1, 23'd0};   
                else if (e_scaled >= 254)scale_bits <= {1'b0, 8'd254, 23'd0}; 
                else                     scale_bits <= {1'b0, e_scaled[7:0], 23'd0};
            end

            if (state == S_Y0_MUL_START) begin

                if (a_is_zero) begin
                    q_reg <= { (sign_a ^ sign_b), 8'd0, 23'd0 };
                    finish_reg <= 1'b1;
                    state <= S_IDLE;
                end
                // b==0 => inf 
                else if (b_is_zero) begin
                    q_reg      <= { (sign_a ^ sign_b), 8'hFF, 23'd0 };
                    finish_reg <= 1'b1;
                    state      <= S_IDLE;
                end
                // b==Inf => 0
                else if (b_is_inf) begin
                    q_reg <= { (sign_a ^ sign_b), 8'd0, 23'd0 };
                    finish_reg <= 1'b1;
                    state <= S_IDLE;
                end
            end

            // Latch intermediates on done pulses
            if (state == S_Y0_MUL_WAIT && mult_done) begin
                t1 <= mult_q; // B*x
            end
            if (state == S_Y0_SUB_WAIT && sub_done) begin
                y0 <= sub_q;  // A - t1
            end
            if (state == S_NR_MUL1_WAIT && mult_done) begin
                t2 <= mult_q; // x*y0
            end
            if (state == S_NR_SUB_WAIT && sub_done) begin
                t3 <= sub_q;  // 2 - t2
            end
            if (state == S_NR_MUL2_WAIT && mult_done) begin
                y1 <= mult_q; // refined reciprocal of x
            end
            if (state == S_SCALE_MUL_WAIT && mult_done) begin
                recip_pos <= mult_q;    // positive reciprocal magnitude
            end
            if (state == S_FINAL_MUL_WAIT && mult_done) begin
                q_reg <= mult_q;   
                finish_reg <= 1'b1;
            end
        end
    end


    always_comb begin
        recip_b = { sign_b, recip_pos[30:0] };
    end

endmodule : DIV