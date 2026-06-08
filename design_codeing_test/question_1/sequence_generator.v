module sequence_generator(
input clk,reset_in,
output reg reset
);

reg [3:0]count;
reg [3:0]temp;
reg [3:0]num;

always@(posedge clk)
begin

if(reset_in)
begin
count<=4'b0001;
temp<=4'b0001;
reset<=1'b0;
end

else if (count<=temp)
begin
temp<=temp;
count<=count+4'b0001;
reset<=1'b1;
end
else if(count>temp)
begin
temp<=count;
reset<=1'b0;
count<=4'b0001;
end
end

always@(*)
begin

if(reset)
begin
num<=temp;
end

else
num<=4'b0;

end

endmodule
