module SUB (clk, areset, start, a, b, q, finish);
    input logic clk;
    input logic areset;
    input logic start;
    input logic [31:0] a; // minuend
    input logic [31:0] b; // subtrahend
    output logic [31:0] q; // difference
    output logic finish;
    
    // a - b = a + (-b)
    logic [31:0] b_neg;

    always_comb begin
        b_neg = {~b[31], b[30:0]}; // flip sign bit of b
    end

    SUM subs_sum_inst (
        .clk    (clk),
        .areset (areset),
        .start  (start),
        .a      (a),
        .b      (b_neg),
        .q      (q),
        .finish (finish)
    );

endmodule : SUB
