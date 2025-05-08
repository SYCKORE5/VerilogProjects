module debounce_fast_majority (
    input wire clk,
    input wire reset,
    input wire button_in,
    output reg button_out
);
    parameter THRESHOLD = 16'd40000;   // Number of 1s to confirm press
    parameter WINDOW    = 16'd50000;   // Max sample window (1ms @ 50MHz)

    reg [15:0] ones_counter = 0;
    reg [15:0] total_counter = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ones_counter  <= 0;
            total_counter <= 0;
            button_out    <= 0;
        end else begin
            // Count number of 1s
            if (button_in)
                ones_counter <= ones_counter + 1;

            total_counter <= total_counter + 1;

            // Early decision if threshold reached
            if (ones_counter >= THRESHOLD) begin
                button_out    <= 1;
                ones_counter  <= 0;
                total_counter <= 0;
            end
            // Timeout fallback decision
            else if (total_counter >= WINDOW) begin
                button_out    <= (ones_counter >= THRESHOLD);
                ones_counter  <= 0;
                total_counter <= 0;
            end
        end
    end
endmodule
