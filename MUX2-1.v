module MUX_gate
(
    input wire [1:0] a,
    input wire [1:0] b,
    input wire sel,
    output wire [1:0] y
);
    assign y = sel ? b : a;
endmodule
//********** Testbench **********/
module tb_MUX_gate;
    reg [1:0] a;
    reg [1:0] b;
    reg sel;
    wire [1:0] y;

    // Instantiate the MUX_gate module
    MUX_gate uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, expect y = a
        a = 2'b01; b = 2'b10; sel = 0;
        #10; // Wait for 10 time units
        $display("Test case 1: sel = %b, a = %b, b = %b, y = %b", sel, a, b, y);

        // Test case 2: sel = 1, expect y = b
        a = 2'b01; b = 2'b10; sel = 1;
        #10; // Wait for 10 time units
        $display("Test case 2: sel = %b, a = %b, b = %b, y = %b", sel, a, b, y);

        // Test case 3: Change inputs and test again
        a = 2'b11; b = 2'b00; sel = 0;
        #10; // Wait for 10 time units
        $display("Test case 3: sel = %b, a = %b, b = %b, y = %b", sel, a, b, y);

        // Test case 4: Change inputs and test again
        a = 2'b11; b = 2'b00; sel = 1;
        #10; // Wait for 10 time units
        $display("Test case 4: sel = %b, a = %b, b = %b, y = %b", sel, a, b, y);

        // Finish simulation
        $finish;
    end
endmodule