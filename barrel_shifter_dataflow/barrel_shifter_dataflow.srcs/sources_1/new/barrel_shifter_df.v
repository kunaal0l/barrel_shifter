`timescale 1ns / 1ps
module barrel_shifter_df(out,i,n,lr);
input [3:0]i;
input [1:0]n;
input lr;
output [3:0]out;
wire [3:0]out_l,out_r;
wire [3:0]a,b,c,d,a1,b1,c1,d1;
assign a={i[3],i[2],i[1],i[0]};
assign b={1'b0,i[3],i[2],i[1]};
assign c={1'b0,1'b0,i[3],i[2]};
assign d={1'b0,1'b0,1'b0,i[3]};
assign a1={i[0],i[1],i[2],i[3]};
assign b1={1'b0,i[0],i[1],i[2]};
assign c1={1'b0,1'b0,i[0],i[1]};
assign d1={1'b0,1'b0,1'b0,i[0]};
//if(lr)
    mux4x1_df m0(.y(out_r[3]),.i(d),.s(n));
    mux4x1_df m1(.y(out_r[2]),.i(c),.s(n));
    mux4x1_df m2(.y(out_r[1]),.i(b),.s(n));
    mux4x1_df m3(.y(out_r[0]),.i(a),.s(n));
//else
    mux4x1_df m4(.y(out_l[0]),.i(d1),.s(n));
    mux4x1_df m5(.y(out_l[1]),.i(c1),.s(n));
    mux4x1_df m6(.y(out_l[2]),.i(b1),.s(n));
    mux4x1_df m7(.y(out_l[3]),.i(a1),.s(n));
assign out =lr?out_l:out_r;



endmodule
