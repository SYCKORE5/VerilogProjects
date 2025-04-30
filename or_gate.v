module OR_gate
(
    input wire A,
    input wire B,
    output wire Y
);

    assign Y = A | B; // OR operation
endmodule
//********** Testbench for OR_gate **********/
module OR_gate_tb;
    reg A; // Test input A
    reg B; // Test input B
    wire Y; // Test output Y

    // Instantiate the OR_gate module
    OR_gate uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Test all combinations of inputs
        $monitor("A=%b, B=%b, Y=%b", A, B, Y); // Monitor changes in inputs and output

        A = 0; B = 0; #10; // Test case 1: 0 OR 0 = 0
        A = 0; B = 1; #10; // Test case 2: 0 OR 1 = 1
        A = 1; B = 0; #10; // Test case 3: 1 OR 0 = 1
        A = 1; B = 1; #10; // Test case 4: 1 OR 1 = 1

        $finish; // End simulation
    end
endmodule