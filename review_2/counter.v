module counter(
input clk,
input rst,
input up_down,
output reg [3:0]count
);

always@(posedge clk)
begin

if(rst)
begin
count<=4'b0;
end



else if(up_down)
begin
if((count[0])!=4'd0)
begin
count<=count+4'd1;
end
else
begin
count<=count+4'd2;
end
end




else
begin
if((count[0])==4'd0)
begin
count<=count-4'd1;
end
else
begin
count<=count-4'd2;
end
end


end
endmodule

