module r16_8_syn_ram_tb;

reg clk;
reg rst;
reg [7:0]data_in;
reg [3:0]write_addr;
reg write_en;
reg read_en;
reg [3:0]read_addr;
wire [7:0]data_out;
integer i,j;


r16_8_syn_ram r1(
.clk(clk),
.rst(rst),
.data_in(data_in[7:0]),
.write_addr(write_addr[3:0]),
.write_en(write_en),
.read_en(read_en),
.read_addr(read_addr[3:0]),
.data_out(data_out[7:0])
);

initial clk=0;
always #5 clk=~clk;


task initilize;
begin
data_in=8'b0;
read_en=1'b0;
write_en=1'b0;
read_addr=4'b0;
write_addr=4'b0;
end
endtask


task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

task stimulus(input [7:0]data);
begin
@(negedge clk)
data_in=data;

end
endtask

task read( input [3:0]addr);
begin
@(negedge clk)
read_addr=addr;
read_en=1'b1;
write_en=1'b0;
end
endtask

task write( input [3:0]addr);
begin
@(negedge clk)
write_addr=addr;
read_en=1'b0;
write_en=1'b1;
end
endtask

task readwrite( input [3:0]addr);
begin
@(negedge clk)
write_addr=addr;
read_addr=addr;
read_en=1'b1;
write_en=1'b1;
end
endtask


task delay;
begin
#10;
end
endtask

initial 
begin
initilize;
delay;
reset;

fork

begin

for(i=0;i<16;i=i+1)
begin
write(i);
end

end

begin

for(j=0;j<16;j=j+1)
begin
stimulus(j);
end
end

join

delay;


for(i=0;i<16;i=i+1)
begin
read(i);
end

delay;
delay;

fork

begin

for(i=0;i<16;i=i+1)
begin
readwrite(i);
end

end

begin

for(j=16;j<32;j=j+1)
begin
stimulus(j);
end

end


join
#50 $finish;

end

initial 
 $dumpvars(0, r16_8_syn_ram_tb);


endmodule



