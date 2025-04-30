// AND gate module
module and_gate(
    input a,
    input b,
    output c
);
    assign c = a & b;
endmodule

// Testbench for AND gate
module test_and();
    reg a, b;         // Inputs should be `reg` since we drive them in initial block
    wire c;           // Output from the module under test

    // Instantiate the AND gate
    and_gate uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        $monitor("Time=%0t, a=%b, b=%b, aANDb=%b", $time, a, b, c);

        a = 0; b = 0;
        #10 b = 1;
        #10 a = 1; b = 0;
        #10 b = 1;
        #10 $finish;
    end
endmodule
