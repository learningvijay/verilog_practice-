
module up_down_counter_loadable #(parameter MOD_NUMBER=16 ,N=4)(
input clk,
input rst,up_down,
input load,
input [N-1:0]data_in,
output reg [N-1:0]count


);

always@(posedge clk)

begin

if(rst)
begin
count<=4'b0000;
end


else if (load)
begin
count<=data_in;
end



else if(up_down)
begin
count<=count-1'b1;
end

else
begin
count<=count+1'b1;
end


end
endmodule

