
module mod_counter_loadable #(parameter MOD_NUMBER=12 ,N=4)(
input clk,
input rst,
input load,
input [N-1:0]data_in,
output reg [N-1:0]count,
output wire data_in_invalid

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

else if(count>=(MOD_NUMBER-1))
begin
count<=4'b0000;
end

else
begin
count<=count+1'b1;

end



end

assign data_in_invalid = load & (data_in >= MOD_NUMBER);

endmodule

