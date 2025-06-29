`timescale 1ns / 1ps
module tb_fsm_controller;

    // Inputs
    reg clock;
    reg reset;
    reg enable;
    reg wr_en;
    reg rd_en;

    // Output
    wire [2:0] state;

    // Instantiate the FSM module
    fsm_controller uut (
        .clock(clock),
        .reset(reset),
	.enable(enable),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .state(state)
    );

    // Clock generation: 10ns period
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Stimulus block
    initial begin
        // Initialize inputs
        reset = 0;
        wr_en = 0;
        rd_en = 0;
	enable = 0;

        // Hold reset for a few cycles
        repeat(100) @(posedge clock); reset = 1; enable = 1'b1;

        // -------- Test Write Cycle --------
        #10;
        wr_en = 1;   // Assert write enable
        #10;
        wr_en = 0;   // De-assert after one cycle

        // Wait for FSM to return to IDLE
        #30;

        // -------- Test Read Cycle -------
        rd_en = 1;   // Assert read enable
        #10;
        rd_en = 0;   // De-assert after one cycle

        // Wait for FSM to return to IDLE
        #30;

        // -------- No operation (stay IDLE) --------
        #20;

        // End simulation
    end

    // Monitor state transitions
    initial begin
	$monitor("FIRE : %0b ", uut.fire_request_when_FSM_idle);
        // $display("Time\tclock\treset\twr_en\trd_en\tstate");
        // $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clock, reset, wr_en, rd_en, state);
    end

endmodule

