module tb_my_design ();
reg clk;
reg resetn;
reg id_ok;
reg   [3:0] id_sel;
wire  [3:0] id_sel_out;

my_design dut (
	.clk ( clk ),
	.resetn ( resetn ),
	.id_ok  ( id_ok  ),
	.id_sel ( id_sel ),
	.id_sel_out ( id_sel_out )); 


initial begin
	clk = 0;
	resetn = 0;
	id_ok  = 0;
	id_sel = 4'h0;

	#1000 resetn = 1'b1;
	      id_ok  = 1'b1;

	repeat (16) @ ( posedge clk ) id_sel = $random();
end

always #50 clk = ~clk;

endmodule
