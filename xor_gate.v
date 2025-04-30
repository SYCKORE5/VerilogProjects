module XOR_gate(
    input a,
    input b,
    output y
);
    assign y = a ^ b;
endmodule
//********** Testbench for XOR_gate **********/
module test_XOR_gate;
    reg a, b;
    wire y;

    // Instantiate the XOR gate
    XOR_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test all combinations of inputs
        $monitor("a=%b, b=%b, y=%b", a, b, y);
        a = 0; b = 0; #10; // 0 XOR 0 = 0
        a = 0; b = 1; #10; // 0 XOR 1 = 1
        a = 1; b = 0; #10; // 1 XOR 0 = 1
        a = 1; b = 1; #10; // 1 XOR 1 = 0
        $finish;
    end
endmodule