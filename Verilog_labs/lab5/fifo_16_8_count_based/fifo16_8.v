module fifo16_8(
input re_en,
input wr_en,
input clk,
input rst, 
input [7:0]data_in,
output reg[7:0]data_out,
output wire empty,
output wire full
);

reg [7:0]mem[15:0];
integer i;
reg [4:0]wr_addr_p;
reg [4:0]re_addr_p;
reg [4:0]count;

always@(posedge clk)
begin


if(rst)
  begin

data_out<=8'b0;
for(i=0;i<16;i=i+1)
 begin
mem[i]<=8'b0;
 end
wr_addr_p<=5'b0;
re_addr_p<=5'b0;
count<=5'b0;
 end




else
begin

if(wr_en && ~full)
begin
mem[wr_addr_p[3:0]]<=data_in;
wr_addr_p<=wr_addr_p+5'd1;
count<=count+5'd1;
end


if(re_en && ~empty)
begin
data_out<=mem[re_addr_p[3:0]];
re_addr_p<=re_addr_p+5'd1;
count<=count-5'd1;
end
end
end


assign empty=(count==5'b0);
assign full=(count>=5'b10000);


endmodule















                       
