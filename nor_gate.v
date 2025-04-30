module NOR_gate(
    input a,
    input b,
    output y
);
    assign y = ~(a | b);
endmodule
//********** Testbench **********/
module testbench;
    reg a, b;
    wire y;

    // Instantiate the NOR gate
    NOR_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test all combinations of inputs
        $monitor("a=%b, b=%b, y=%b", a, b, y);
        
        a = 0; b = 0; #10; // Expected output: 1
        a = 0; b = 1; #10; // Expected output: 0
        a = 1; b = 0; #10; // Expected output: 0
        a = 1; b = 1; #10; // Expected output: 0
        
        $finish;
    end
endmodule