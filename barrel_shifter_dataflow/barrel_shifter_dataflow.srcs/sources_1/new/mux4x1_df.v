`timescale 1ns / 1ps
module mux4x1_df(y,i,s);
input [3:0]i;
input [1:0]s;
output y;
assign y=i[s];
endmodule
