module r8_16_asyn_ram(
input clk,
input rst,
input [15:0]data_in,
input [2:0]write_addr,
input write_en,
input read_en,
input [2:0]read_addr,
output reg [15:0]data_out
);
reg [15:0] mem [7:0];
integer i;

always@(posedge clk or posedge rst)
begin

if(rst)
begin
 for (i = 0; i < 7; i = i + 1)
begin
mem[i] <= 16'b0;
end
data_out<=16'b0;
end

if(write_en)
begin
mem[write_addr]<=data_in;
end


if(read_en)
begin
data_out<=mem[read_addr];
end
else
begin
data_out<=16'b0;
end

end

endmodule


