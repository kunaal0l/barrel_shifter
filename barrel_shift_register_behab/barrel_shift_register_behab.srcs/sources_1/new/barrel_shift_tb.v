`timescale 1ns / 1ps

module barrel_shift_tb;

  // Inputs
  reg [7:0] in;
  reg [2:0] n;
  reg lr;

  // Output
  wire [7:0] out;

  // Instantiate the Unit Under Test (UUT)
  barrel_shift uut (
    .out(out),
    .in(in),
    .n(n),
    .lr(lr)
  );

  initial begin
    // Monitor signals
    $monitor("Time=%0t | in=%b | n=%d | lr=%b | out=%b", 
              $time, in, n, lr, out);

    // Test left shifts
    in = 8'b10110011; lr = 1;
    n = 3'd0; #10;
    n = 3'd1; #10;
    n = 3'd2; #10;
    n = 3'd3; #10;

    // Test right shifts
    in = 8'b10110011; lr = 0;
    n = 3'd0; #10;
    n = 3'd1; #10;
    n = 3'd2; #10;
    n = 3'd3; #10;

    $finish;
  end

endmodule
