module NOT_gate(
    input wire a,
    output wire y
);
    assign y = ~a;
endmodule
// Testbench for NOT_gate
module test_NOT_gate;
    reg a;
    wire y;

    // Instantiate the NOT_gate module
    NOT_gate uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: a = 0
        a = 0;
        #10; // Wait for 10 time units
        $display("a = %b, y = %b", a, y); // Expected output: y = 1

        // Test case 2: a = 1
        a = 1;
        #10; // Wait for 10 time units
        $display("a = %b, y = %b", a, y); // Expected output: y = 0

        // End the simulation
        $finish;
    end
endmodule