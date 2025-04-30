module NAND_gate(
    input A,
    input B,
    output Y
);
    assign Y = ~(A & B);
endmodule
//********** Testbench for NAND_gate **********/
module testbench;
    reg A, B;
    wire Y;

    // Instantiate the NAND gate
    NAND_gate uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Test all combinations of inputs
        $monitor("A=%b, B=%b, Y=%b", A, B, Y);
        
        A = 0; B = 0; #10; // Expected Y = 1
        A = 0; B = 1; #10; // Expected Y = 1
        A = 1; B = 0; #10; // Expected Y = 1
        A = 1; B = 1; #10; // Expected Y = 0
        
        $finish;
    end
endmodule