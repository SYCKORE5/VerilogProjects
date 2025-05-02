module MUX(
  input [1:0] sel,
  input [3:0] in,
  output reg out
);
  always @(*) begin
    case (sel)
      2'b00: out = in[0];
      2'b01: out = in[1];
      2'b10: out = in[2];
      2'b11: out = in[3];
      default: out = 1'b0; // Default case to handle unexpected values
    endcase
  end
endmodule
//testbench for MUX module
module tb_MUX;
  reg [1:0] sel;
  reg [3:0] in;
  wire out;

  // Instantiate the MUX module
  MUX uut (
    .sel(sel),
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 00, in = 4'b1010
    sel = 2'b00; in = 4'b1010; #10;
    $display("sel=%b, in=%b, out=%b", sel, in, out); // Expected output: out=1

    // Test case 2: sel = 01, in = 4'b1010
    sel = 2'b01; in = 4'b1010; #10;
    $display("sel=%b, in=%b, out=%b", sel, in, out); // Expected output: out=0

    // Test case 3: sel = 10, in = 4'b1010
    sel = 2'b10; in = 4'b1010; #10;
    $display("sel=%b, in=%b, out=%b", sel, in, out); // Expected output: out=1

    // Test case 4: sel = 11, in = 4'b1010
    sel = 2'b11; in = 4'b1010; #10;
    $display("sel=%b, in=%b, out=%b", sel, in, out); // Expected output: out=0

    // End simulation
    $finish;
  end
  endmodule