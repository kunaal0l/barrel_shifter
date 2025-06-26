`timescale 1ns / 1ps

module barrel_shifter_df_tb;

  // Inputs
  reg [3:0] i;
  reg [1:0] n;
  reg lr;

  // Output
  wire [3:0] out;

  // Instantiate the UUT (Unit Under Test)
  barrel_shifter_df uut (
    .out(out),
    .i(i),
    .n(n),
    .lr(lr)
  );

  initial begin
    $monitor("Time = %0t | i = %b | n = %d | lr = %b | out = %b", $time, i, n, lr, out);

    // Test left shifts (lr = 1)
    i = 4'b1101; lr = 1;
    n = 2'd0; #10;
    n = 2'd1; #10;
    n = 2'd2; #10;
    n = 2'd3; #10;

    // Test right shifts (lr = 0)
    i = 4'b1101; lr = 0;
    n = 2'd0; #10;
    n = 2'd1; #10;
    n = 2'd2; #10;
    n = 2'd3; #10;

    // More test vectors
    i = 4'b1010; lr = 1; n = 2'd2; #10;
    i = 4'b0011; lr = 0; n = 2'd1; #10;

    $finish;
  end

endmodule
