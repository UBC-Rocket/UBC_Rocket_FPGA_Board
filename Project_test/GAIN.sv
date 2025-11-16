module GAIN(clk, areset, a, b, q, start, finish);
    input logic clk;
    input logic areset;
    input logic [31:0] a; // input data
    input logic [31:0] b; // gain factor
    output logic [31:0] q; // output data after gain multiplication
    output logic finish;
    input logic start;

	MULT gains_MULT_instance (
		.clk(clk),
		.areset (areset), 
		.a(a),    
		.b(b),    
		.q(q), 
        .finish(),    
        .start(start)
	);

endmodule : GAIN