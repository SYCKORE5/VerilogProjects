`timescale 1ns/1ps

module tb_debounce_fast;

    reg clk;
    reg reset;
    reg button_in;
    wire button_out;

    // Instantiate the DUT (Device Under Test)
    debounce_fast_majority #(
        .THRESHOLD(16'd10),   // Lower threshold for fast simulation
        .WINDOW(16'd20)       // Simulate 20 cycles = 400ns window at 50MHz
    ) uut (
        .clk(clk),
        .reset(reset),
        .button_in(button_in),
        .button_out(button_out)
    );

    // Clock: 50MHz = 20ns period
    always #10 clk = ~clk;

    initial begin
        $dumpfile("debounce.vcd");
        $dumpvars(0, tb_debounce_fast);

        // Init
        clk = 0;
        reset = 1;
        button_in = 0;

        #25 reset = 0; // Deassert reset

        // Simulate bouncing button: toggles quickly
        #20  button_in = 1;
        #20  button_in = 0;
        #20  button_in = 1;
        #20  button_in = 0;
        #20  button_in = 1;
        #20  button_in = 0;
        #20  button_in = 1;

        // Now stable press (held high)
        #200 button_in = 1;

        // Hold for a while
        #500;

        // Release button
        button_in = 0;

        // Test reset during active signal
        #100 reset = 1;
        #30  reset = 0;

        // Bounce again
        #20  button_in = 1;
        #20  button_in = 0;
        #20  button_in = 1;
        #200 button_in = 1;

        #200 $finish;
    end

endmodule
