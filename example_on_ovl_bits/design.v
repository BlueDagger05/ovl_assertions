module my_design (
	input wire clk,
	input wire resetn,
	input wire id_ok,
	input wire [3:0] id_sel,
	output reg [3:0] id_sel_out);

always @ ( posedge clk )
	if ( ~resetn ) id_sel_out <= 4'h0;
	else begin
		case ( id_sel )
			4'h0: id_sel_out <= id_sel ^ 4'h1;
			4'h1: id_sel_out <= id_sel ^ 4'h2;
			4'h2: id_sel_out <= id_sel ^ 4'h3;
			4'h3: id_sel_out <= id_sel ^ 4'h4;
			4'h4: id_sel_out <= id_sel ^ 4'h5;
			4'h5: id_sel_out <= id_sel ^ 4'h6;
			4'h6: id_sel_out <= id_sel ^ 4'h7;
			4'h7: id_sel_out <= id_sel ^ 4'h8;
			4'h8: id_sel_out <= id_sel ^ 4'h9;
			4'h9: id_sel_out <= id_sel ^ 4'h9;
			4'hA: id_sel_out <= id_sel ^ 4'h9;
			4'hB: id_sel_out <= id_sel ^ 4'hE;
			4'hC: id_sel_out <= id_sel ^ 4'hD;
			4'hD: id_sel_out <= id_sel ^ 4'hC;
			4'hE: id_sel_out <= id_sel ^ 4'hB;
			4'hF: id_sel_out <= id_sel ^ 4'hA;
		endcase // id_sel
	end

	wire [2:0] fire_id_sel_bits;

	// synopsys translate_off
	`ifdef OVL
		ovl_bits # ( 
			`OVL_ERROR,                                     // severity level	
			1,                                              // min
			2,                                              // max
			4,                                              // width
			1,                                              // asserted
			`OVL_ASSERT,                                    // property type
			"ERROR : ID select bits out of range .",        // msg
			`OVL_COVER_NONE,                                // coverage_level
			`OVL_POSEDGE,                                   // clock edge
			`OVL_ACTIVE_LOW,                                // reset polarity
			`OVL_GATE_CLOCK )                               // gating type

			ovl_id_sel_bits_in_range (
				.clock      ( clk  ),
				.reset      ( resetn ),
				.enable     ( id_ok  ),
				.test_expr  ( id_sel_out ),
				.fire       ( fire_id_sel_bits ));
	`endif
	// synopsys translate_on
endmodule
