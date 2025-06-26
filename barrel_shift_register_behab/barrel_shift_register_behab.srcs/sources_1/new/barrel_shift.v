`timescale 1ns / 1ps
module barrel_shift(out,in,n,lr);
input [7:0]in;
input[2:0]n;input lr;
output reg [7:0]out;
always @(*)
begin
 if(lr)
    out=in<<n;
 else 
    out=in>>n;
end
endmodule
