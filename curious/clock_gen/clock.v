
`timescale 10ns/1ns
module clock;
 parameter N=10;
  reg clk_1;
  reg clk_2;
  wire clk_3;
  wire clk_4;

 initial clk_1 =0;
always
begin
#(N/2) clk_1=1'b0;
#(N/2) clk_1=1'b1;
end

always
begin
#3 clk_2=1'b0;
#7 clk_2=1'b1;
end

 assign #2 clk_3=clk_2;
 assign clk_4=clk_3 & clk_2;
initial
#100 $finish;

 endmodule
