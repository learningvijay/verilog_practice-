module r16_8_syn_ram(
input clk,
input rst,
input [7:0]data_in,
input [3:0]write_addr,
input write_en,
input read_en,
input [3:0]read_addr,
output reg [7:0]data_out
);
reg [7:0] mem [15:0];
integer i;

always@(posedge clk)
begin

if(rst)
begin
 for (i = 0; i < 16; i = i + 1)
begin
mem[i] <= 8'b0;
end
data_out<=8'b0;
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
data_out<=8'b0;
end

end

endmodule


