module hw_accelerator_v1_datapath(LEDS, SWITCHES, CLK_250, reset); 
    parameter NUMBER_OF_SUM_BLOCKS = 0;
    parameter NUMBER_OF_SUB_BLOCKS = 0;
    parameter NUMBER_OF_MULT_BLOCKS = 0;
    parameter NUMBER_OF_GAIN_BLOCKS = 0;
    parameter NUMBER_OF_SQRT_BLOCKS = 0;
    parameter NUMBER_OF_DOT_PRODUCT_BLOCKS = 3;
    parameter NUMBER_OF_SAT_BLOCKS = 0;
    parameter NUMBER_OF_SIGNUM_BLOCKS = 2;
    parameter NUMBER_OF_ATAN2_BLOCKS = 2;
    parameter NUMBER_OF_ASIN_BLOCKS = 1; 
    parameter NUMBER_OF_SIN_BLOCKS = 2;
    parameter NUMBER_OF_COS_BLOCKS = 3;
	 parameter NUMBER_OF_PLL_100MHZ_BLOCKS = 1;
    
    output logic [8:0] LEDS;
    input logic [3:0] SWITCHES;
    input logic CLK_250;
    input logic reset;

    logic [8:0] leds_chase;
    always_ff @(posedge CLK_250 or posedge reset) begin
        if (reset)
            leds_chase <= 9'b000000001;
        else
            leds_chase <= {leds_chase[7:0], leds_chase[8]};
    end

    (* keep = "true" *) logic [31:0] sum_in_a, sum_in_b [NUMBER_OF_SUM_BLOCKS-1:0]; 
    (* keep = "true" *) logic [31:0] sum_out [NUMBER_OF_SUM_BLOCKS-1:0];  

    genvar i; 
    generate
        for (i = 0; i < NUMBER_OF_SUM_BLOCKS; i = i + 1) begin : SUM_BLOCK
            SUM SUM_inst (
                .clk(CLK_250),
                .areset(reset),
                .a(sum_in_a[i]),
                .b(sum_in_b[i]),
                .q(sum_out[i]), 
                .finish(), 
                .start(1'b1)
            );
        end
    endgenerate

    (* keep = "true" *) logic [31:0] sub_in_a, sub_in_b [NUMBER_OF_SUB_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] sub_out [NUMBER_OF_SUB_BLOCKS-1:0];

    genvar j; 
    generate
        for (j = 0; j < NUMBER_OF_SUB_BLOCKS; j = j + 1) begin : SUB_BLOCK
            SUB SUB_inst (
                .clk(CLK_250),
                .areset(reset),
                .a(sub_in_a[j]),
                .b(sub_in_b[j]),
                .q(sub_out[j]), 
                .finish(),
                .start(1'b1)
            );
        end
    endgenerate

    (* keep = "true" *) logic [31:0] mult_in_a, mult_in_b [NUMBER_OF_MULT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] mult_out [NUMBER_OF_MULT_BLOCKS-1:0];

    genvar k;
    generate
        for (k = 0; k < NUMBER_OF_MULT_BLOCKS; k = k + 1) begin : MULT_BLOCK
            MULT MULT_inst (
                .clk(CLK_250),
                .areset(reset),
                .a(mult_in_a[k]),
                .b(mult_in_b[k]),
                .q(mult_out[k]),
                .finish(),
                .start(1'b1)
            );
        end
    endgenerate


    (* keep = "true" *) logic [31:0] gain_a [NUMBER_OF_GAIN_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] gain_b = 32'h3f800000; // 1.0 in IEEE 754
    (* keep = "true" *) logic [31:0] gain_out [NUMBER_OF_GAIN_BLOCKS-1:0];

    genvar m;
    generate
        for (m = 0; m < NUMBER_OF_GAIN_BLOCKS; m = m + 1) begin : GAIN_BLOCK
            GAIN GAIN_inst (
                .clk(CLK_250),
                .areset(reset),
                .a(gain_a[m]),
                .b(gain_b),
                .q(gain_out[m]), 
                .finish(),
                .start(1'b1)
            );
        end
    endgenerate

    (* keep = "true" *) logic [31:0] sqrt_in [NUMBER_OF_SQRT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] sqrt_out [NUMBER_OF_SQRT_BLOCKS-1:0];

    genvar n;
    generate
        for (n = 0; n < NUMBER_OF_SQRT_BLOCKS; n = n + 1) begin : SQRT_BLOCK
            SQRT SQRT_inst (
                .clk(CLK_250),
                .areset(reset),
                .a(sqrt_in[n]),
                .q(sqrt_out[n]), 
                .finish(),
                .start(1'b1)
            );
        end
    endgenerate

    (* keep = "true" *) logic [31:0] dot_a_0 [NUMBER_OF_DOT_PRODUCT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] dot_a_1 [NUMBER_OF_DOT_PRODUCT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] dot_a_2 [NUMBER_OF_DOT_PRODUCT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] dot_b_0 [NUMBER_OF_DOT_PRODUCT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] dot_b_1 [NUMBER_OF_DOT_PRODUCT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] dot_b_2 [NUMBER_OF_DOT_PRODUCT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] dot_out [NUMBER_OF_DOT_PRODUCT_BLOCKS-1:0];

    genvar p;
    generate
        for (p = 0; p < NUMBER_OF_DOT_PRODUCT_BLOCKS; p = p + 1) begin : DOT_PRODUCT_BLOCK
            DOT_PRODUCT DOT_PRODUCT_inst (
                .clk(CLK_250),
                .areset(reset),
                .a0(dot_a_0[p]),
                .a1(dot_a_1[p]),
                .a2(dot_a_2[p]),
                .b0(dot_b_0[p]),
                .b1(dot_b_1[p]),
                .b2(dot_b_2[p]),
                .q(dot_out[p]), 
                .finish(),
                .start(1'b1)
            );
        end
    endgenerate

    (* keep = "true" *) logic [31:0] sat_in [NUMBER_OF_SAT_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] sat_out [NUMBER_OF_SAT_BLOCKS-1:0];

    genvar q;
    generate
        for (q = 0; q < NUMBER_OF_SAT_BLOCKS; q = q + 1) begin : SAT_BLOCK
            SAT SAT_inst (
                .clk(CLK_250),
                .areset(reset),
                .in(sat_in[q]),
                .out(sat_out[q]), 
            );
        end
    endgenerate

    (* keep = "true" *) logic [31:0] signum_in [NUMBER_OF_SIGNUM_BLOCKS-1:0];
    (* keep = "true" *) logic [31:0] signum_out [NUMBER_OF_SIGNUM_BLOCKS-1:0];

    genvar r;
    generate
        for (r = 0; r < NUMBER_OF_SIGNUM_BLOCKS; r = r + 1) begin : SIGNUM_BLOCK
            SIGNUM SIGNUM_inst (
                .clk(CLK_250),
                .rst(reset),
                .in(signum_in[r]),
                .out(signum_out[r])
            );
        end
    endgenerate

    // (* keep = "true" *) logic [31:0] atan2_in_y [NUMBER_OF_ATAN2_BLOCKS-1:0];
    // (* keep = "true" *) logic [31:0] atan2_in_x [NUMBER_OF_ATAN2_BLOCKS-1:0];
    // (* keep = "true" *) logic [31:0] atan2_out [NUMBER_OF_ATAN2_BLOCKS-1:0];

    // genvar s;
    // generate
    //     for (s = 0; s < NUMBER_OF_ATAN2_BLOCKS; s = s + 1) begin : ATAN2_BLOCK
    //         ATAN2 ATAN2_inst (
    //             .clk(CLK_250),
    //             .areset(reset),
    //             .a(atan2_in_y[s]),
    //             .b(atan2_in_x[s]),
    //             .q(atan2_out[s])
    //         );
    //     end
    // endgenerate  

    // (* keep = "true" *) logic [31:0] asin_in [NUMBER_OF_ASIN_BLOCKS-1:0];
    // (* keep = "true" *) logic [31:0] asin_out [NUMBER_OF_ASIN_BLOCKS-1:0];

    // genvar t;   
    // generate
    //     for (t = 0; t < NUMBER_OF_ASIN_BLOCKS; t = t + 1) begin : ASIN_BLOCK
    //         ASIN ASIN_inst (
    //             .clk(CLK_250),
    //             .areset(reset),
    //             .a(asin_in[t]),
    //             .q(asin_out[t])
    //         );
    //     end
    // endgenerate

    // (* keep = "true" *) logic [31:0] sin_in [NUMBER_OF_SIN_BLOCKS-1:0];
    // (* keep = "true" *) logic [31:0] sin_out [NUMBER_OF_SIN_BLOCKS-1:0];
    // genvar u;
    // generate
    //     for (u = 0; u < NUMBER_OF_SIN_BLOCKS; u = u + 1) begin : SIN_BLOCK
    //         SIN SIN_inst (
    //             .clk(CLK_250),
    //             .areset(reset),
    //             .a(sin_in[u]),
    //             .q(sin_out[u])
    //         );
    //     end
    // endgenerate

    // (* keep = "true" *) logic [31:0] cos_in [NUMBER_OF_COS_BLOCKS-1:0];
    // (* keep = "true" *) logic [31:0] cos_out [NUMBER_OF_COS_BLOCKS-1:0];
    // genvar v;
    // generate
    //     for (v = 0; v < NUMBER_OF_COS_BLOCKS; v = v + 1) begin : COS_BLOCK
    //         COS COS_inst (
    //             .clk(CLK_250),
    //             .areset(reset),
    //             .a(cos_in[v]),
    //             .q(cos_out[v])
    //         );
    //     end
    // endgenerate


    logic [31:0] fabric_mix;
    always_comb begin
        fabric_mix = 32'h0;
        for (int x = 0; x < NUMBER_OF_SUM_BLOCKS;  x++) fabric_mix ^= sum_out[x];
        for (int x = 0; x < NUMBER_OF_MULT_BLOCKS; x++) fabric_mix ^= mult_out[x];
        for (int x = 0; x < NUMBER_OF_SQRT_BLOCKS; x++) fabric_mix ^= sqrt_out[x];
        for (int x = 0; x < NUMBER_OF_DOT_PRODUCT_BLOCKS; x++) fabric_mix ^= dot_out[x];
        for (int x = 0; x < NUMBER_OF_SAT_BLOCKS; x++) fabric_mix ^= sat_out[x];
        for (int x = 0; x < NUMBER_OF_SIGNUM_BLOCKS; x++) fabric_mix ^= signum_out[x];
        // for (int x = 0; x < NUMBER_OF_ATAN2_BLOCKS; x++) fabric_mix ^= atan2_out[x];
        // for (int x = 0; x < NUMBER_OF_ASIN_BLOCKS; x++) fabric_mix ^= asin_out[x];
        // for (int x = 0; x < NUMBER_OF_SIN_BLOCKS; x++) fabric_mix ^= sin_out[x];
        // for (int x = 0; x < NUMBER_OF_COS_BLOCKS; x++) fabric_mix ^= cos_out[x];
    end

    always_comb begin 
        for (int y = 0; y < NUMBER_OF_SUM_BLOCKS; y++) begin 
            sum_in_a[y] = fabric_mix;
            sum_in_b[y] = fabric_mix;
        end

        for (int y = 0; y < NUMBER_OF_SUB_BLOCKS; y++) begin 
            sub_in_a[y] = fabric_mix;
            sub_in_b[y] = fabric_mix;
        end

        for (int y = 0; y < NUMBER_OF_MULT_BLOCKS; y++) begin 
            mult_in_a[y] = fabric_mix;
            mult_in_b[y] = fabric_mix;
        end

        for (int y = 0; y < NUMBER_OF_GAIN_BLOCKS; y++) begin 
            gain_a[y] = fabric_mix;
        end

        for (int y = 0; y < NUMBER_OF_SQRT_BLOCKS; y++) begin 
            sqrt_in[y] = fabric_mix;
        end

        for (int y = 0; y < NUMBER_OF_DOT_PRODUCT_BLOCKS; y++) begin 
            dot_a_0[y] = fabric_mix;
            dot_a_1[y] = fabric_mix;
            dot_a_2[y] = fabric_mix;
            dot_b_0[y] = fabric_mix;
            dot_b_1[y] = fabric_mix;
            dot_b_2[y] = fabric_mix;
        end

        for (int y = 0; y < NUMBER_OF_SAT_BLOCKS; y++) begin 
            sat_in[y] = fabric_mix;
        end

        for (int y = 0; y < NUMBER_OF_SIGNUM_BLOCKS; y++) begin 
            signum_in[y] = fabric_mix;
        end

        
    end 

    assign LEDS = leds_chase ^ fabric_mix[8:0];



endmodule : hw_accelerator_v1