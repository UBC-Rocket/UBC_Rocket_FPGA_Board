module DOT_PRODUCT (clk, areset, start,
                    a0, a1, a2,
                    b0, b1, b2,
                    q, finish);
    input  logic        clk;
    input  logic        areset;     
    input  logic        start;       // input valid for a*, b*
    input  logic [31:0] a0;         // input vector element 0
    input  logic [31:0] a1;         // input vector element 1
    input  logic [31:0] a2;         // input vector element 2
    input  logic [31:0] b0;         // input vector element 0
    input  logic [31:0] b1;         // input vector element 1
    input  logic [31:0] b2;         // input vector element 2
    output logic [31:0] q;          // output dot product
    output logic        finish;     // output valid for q
    
    // =========================
    // State encoding
    // =========================
    typedef enum logic [1:0] {
        S_IDLE      = 2'd0,
        S_WAIT_MUL  = 2'd1,
        S_WAIT_SUM0 = 2'd2,
        S_WAIT_SUM1 = 2'd3
    } state_t;

    state_t state, state_next;

    // =========================
    // Wires to MULT / SUM units
    // =========================

    // MULT outputs
    logic [31:0] mult0_q, mult1_q, mult2_q;
    logic        mult0_done, mult1_done, mult2_done;

    // SUM0: mult0 + mult1
    logic [31:0] sum0_q;
    logic        sum0_done;

    // SUM1: sum0 + mult2
    logic [31:0] sum1_q;
    logic        sum1_done;

    // start signals for submodules (1-cycle pulses)
    logic start_mults;
    logic start_sum0;
    logic start_sum1;

    // =========================
    // Submodule instantiations
    // =========================

    // Three parallel multiplies, started together in S_IDLE
    MULT mult_inst0 (
        .clk    (clk),
        .areset (areset),
        .start  (start_mults),
        .a      (a0),
        .b      (b0),
        .q      (mult0_q),
        .finish (mult0_done)
    );

    MULT mult_inst1 (
        .clk    (clk),
        .areset (areset),
        .start  (start_mults),
        .a      (a1),
        .b      (b1),
        .q      (mult1_q),
        .finish (mult1_done)
    );

    MULT mult_inst2 (
        .clk    (clk),
        .areset (areset),
        .start  (start_mults),
        .a      (a2),
        .b      (b2),
        .q      (mult2_q),
        .finish (mult2_done)
    );

    // SUM0 = mult0_q + mult1_q
    SUM sum_inst0 (
        .clk    (clk),
        .areset (areset),
        .start  (start_sum0),
        .a      (mult0_q_reg),   // use latched products
        .b      (mult1_q_reg),
        .q      (sum0_q),
        .finish (sum0_done)
    );

    // SUM1 = sum0_q + mult2_q
    SUM sum_inst1 (
        .clk    (clk),
        .areset (areset),
        .start  (start_sum1),
        .a      (sum0_q_reg),    // use latched partial sum
        .b      (mult2_q_reg),
        .q      (sum1_q),
        .finish (sum1_done)
    );

    // =========================
    // Registers for data path
    // =========================

    // latch multiplier results once all are done
    logic [31:0] mult0_q_reg, mult1_q_reg, mult2_q_reg;

    // latch first sum result
    logic [31:0] sum0_q_reg;

    // final result register
    logic [31:0] q_reg;

    // finish pulse register
    logic finish_reg;

    // =========================
    // Next-state / control logic
    // =========================

    // start pulses (combinational; 1-cycle when conditions met)
    assign start_mults = (state == S_IDLE) && start;

    // kick SUM0 when all three MULTs are done (single cycle)
    assign start_sum0  = (state == S_WAIT_MUL)  &&
                         mult0_done && mult1_done && mult2_done;

    // kick SUM1 when SUM0 is done (single cycle)
    assign start_sum1  = (state == S_WAIT_SUM0) && sum0_done;

    // finish pulse when SUM1 done
    assign finish      = finish_reg;
    assign q           = q_reg;

    // Next-state logic
    always_comb begin
        state_next = state;

        unique case (state)
            S_IDLE: begin
                if (start)
                    state_next = S_WAIT_MUL;
            end

            S_WAIT_MUL: begin
                if (mult0_done && mult1_done && mult2_done)
                    state_next = S_WAIT_SUM0;
            end

            S_WAIT_SUM0: begin
                if (sum0_done)
                    state_next = S_WAIT_SUM1;
            end

            S_WAIT_SUM1: begin
                if (sum1_done)
                    state_next = S_IDLE;
            end
        endcase
    end

    // =========================
    // Sequential logic
    // =========================
    always_ff @(posedge clk or posedge areset) begin
        if (areset) begin
            state        <= S_IDLE;
            mult0_q_reg  <= 32'd0;
            mult1_q_reg  <= 32'd0;
            mult2_q_reg  <= 32'd0;
            sum0_q_reg   <= 32'd0;
            q_reg        <= 32'd0;
            finish_reg   <= 1'b0;
        end else begin
            state      <= state_next;
            finish_reg <= 1'b0;   // default: no finish

            // latch mult results once, when all done
            if (state == S_WAIT_MUL &&
                mult0_done && mult1_done && mult2_done) begin
                mult0_q_reg <= mult0_q;
                mult1_q_reg <= mult1_q;
                mult2_q_reg <= mult2_q;
            end

            // latch first sum result
            if (state == S_WAIT_SUM0 && sum0_done) begin
                sum0_q_reg <= sum0_q;
            end

            // latch final result + raise finish
            if (state == S_WAIT_SUM1 && sum1_done) begin
                q_reg      <= sum1_q;
                finish_reg <= 1'b1;   // 1-cycle valid pulse for this dot product
            end
        end
    end

endmodule
