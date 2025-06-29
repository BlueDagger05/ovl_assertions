// synopsys translate_off
`define OVL
`define OVL_ASSERT_ON
`define OVL_INIT_MSG
// synopsys translate_on
module fsm_controller (
    input  wire clock,
    input  wire reset,      // Active-high synchronous reset
    input  wire enable,      // Enable
    input  wire wr_en,    // Write enable
    input  wire rd_en,    // Read enable
    output reg  [2:0] state
);

    reg req;
    reg [3:0] counter;
    wire [2:0] fire_request_when_FSM_idle;

    // State encoding
     localparam [2:0]  IDLE = 3'd0,
            	       RDY  = 3'd4,
		       WR   = 3'd1,
		       RD   = 3'd2,
		       WAIT = 3'd3;
    reg [2:0] next_state;
    // State transition (sequential block)
    always @(posedge clock) begin
        if (~reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic (combinational block)
    always @(*) begin
        case (state)
            IDLE:
	     begin
		if ( enable ) 
			next_state = RDY;
		else    next_state = IDLE;
             end
	     RDY:
	     begin
                if (wr_en)
                    next_state = WR;
                else if (rd_en)
                    next_state = RD;
                else
                    next_state = RDY;
	    end

            WR: begin
                next_state = WAIT;
            end

            RD: begin
                next_state = WAIT;
            end

            WAIT: begin
                next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    always @ ( posedge clock )
    begin
	    if ( ~reset ) counter <= 4'b0;
	    else          counter <= counter + 1'b1;
    end

    always @ ( posedge clock )
    begin
	    if ( ~reset ) req <= 1'b0;
	    else if ( counter % 2 == 0 ) req <= 1'b1;
	    else                         req <= 1'b0;
    end

    // synopsys translate_off
	    ovl_always_on_edge #(
		    `OVL_ERROR,
		    `OVL_POSEDGE,
		    `OVL_ASSERT,
		    "ERROR : new req when FSM not ready",
		    `OVL_COVER_NONE,
		    `OVL_POSEDGE,
		    `OVL_ACTIVE_LOW,
		    `OVL_GATE_CLOCK)request_when_fsm_is_idle (
			    .clock              ( clock  ),
			    .reset              ( reset  ),
			    .enable             ( enable ),
			    .sampling_event     ( req    ),
			    .test_expr          ( state == RDY ),
			    .fire               ( fire_request_when_FSM_idle));
    // synopsys translate_on
endmodule


