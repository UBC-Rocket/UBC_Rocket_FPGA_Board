
module SAT(in, out, clk, areset);
    parameter MIN = 32'hC2C80000, MAX = 32'h42C80000;
    input logic [31:0] in;
    output logic [31:0] out;
    input logic clk, areset;
    logic [0:0] geq, leq;

    //DO compare mannually USE LESS IP
    //in = sign(1) exponent(8) mantissa(23)

    //STEP BY STEP COMPARISON
    //FOR MAX
    // CHECK SIGN BIT
    // IF POSITIVE, CHECK EXPONENT
    // IF EXPONENT GREATER, SET GEQ
    // IF EXPONENT EQUAL, CHECK MANTISSA
    // IF MANTISSA GREATER OR EQUAL, SET GEQ
    // ELSE CLEAR GEQ
    // IF NEGATIVE, CHECK EXPONENT
    // IF EXPONENT LESS, SET LEQ
    // IF EXPONENT EQUAL, CHECK MANTISSA
    // IF MANTISSA LESS OR EQUAL, SET LEQ
    // ELSE CLEAR LEQ
    
    always_comb begin 
        
        if (in[31] == 1'b0) begin //positive number
            if (in[30:23] > MAX[30:23]) begin 
                geq = 1'b1;
                leq = 1'b0;
            end else if (in[30:23] == MAX[30:23]) begin
                if (in[22:0] >= MAX[22:0]) begin
                    geq = 1'b1;
                    leq = 1'b0;
                end else begin
                    geq = 1'b0;
                    leq = 1'b0;
                end
            end else begin
                geq = 1'b0;
                leq = 1'b0;
            end
        end else begin //negative number
            if (in[30:23] < MIN[30:23]) begin
                geq = 1'b0;
                leq = 1'b1;
            end else if (in[30:23] == MIN[30:23]) begin
                if (in[22:0] <= MIN[22:0]) begin
                    geq = 1'b0;
                    leq = 1'b1;
                end else begin
                    geq = 1'b0;
                    leq = 1'b0;
                end
            end else begin
                geq = 1'b0;
                leq = 1'b0;
            end
        end
    end 

    always_ff @(posedge clk or posedge areset) begin
        if (areset) begin
            out <= 32'h00000000;
        end else begin
            if (geq) begin
                out <= MAX;
            end else if (leq) begin
                out <= MIN;
            end else begin
                out <= in;
            end
        end
    end

endmodule : SAT