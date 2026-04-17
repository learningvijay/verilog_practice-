module siso_s_r(
input s_in, 
input shift_en,
input rst,
input clk,
output reg s_out
);
reg [3:0]shift_reg;


always@(posedge clk, posedge rst)
begin
if(rst)
begin
shift_reg<=4'b0000;
s_out<=1'b0;
end

else if(shift_en)
begin
shift_reg<={shift_reg[2:0],s_in};
s_out<=shift_reg[3];
end 
end
endmodule


