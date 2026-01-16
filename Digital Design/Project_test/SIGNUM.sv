
module SIGNUM(in, out, clk, rst); 
    input logic [31:0] in;
    output logic [31:0] out;
    input logic clk;
    input logic rst;

    SAT #(.MIN(32'hbf800000), .MAX(32'h3f800000)) SAT_1  (.in(in), 
                                                         .out(out), 
                                                         .clk(clk), 
                                                         .areset(rst));
    

endmodule : SIGNUM 