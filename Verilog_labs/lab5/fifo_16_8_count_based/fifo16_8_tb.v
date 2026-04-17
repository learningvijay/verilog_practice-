
module fifo16_8_tb;
reg re_en;
reg wr_en;
reg clk;
reg rst; 
reg [7:0]data_in;
wire[7:0]data_out;
wire empty;
wire full;
reg [8:0]temp;
integer i,j;


fifo16_8  f1(
.re_en(re_en),
.wr_en(wr_en),
.clk(clk),
.rst(rst), 
.data_in(data_in[7:0]),
.data_out(data_out[7:0]),
.empty(empty),
.full(full)
);

initial clk=1'b0;
always #5 clk=~clk;

task init;
begin
re_en=1'b0;
wr_en=1'b0;
rst=1'b0;
data_in[7:0]=8'b0;
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

task write;
begin
@(negedge clk)
wr_en=1'b1;
temp=$random%256;
data_in=temp;
end
endtask

task read;
begin
@(negedge clk)
re_en=1'b1;
end
endtask

task delay;
begin
@(negedge clk);

end
endtask

initial
begin
init;
reset;
fork
 begin
for(i=0;i<16;i=i+1)
  begin
write;
  end
 end
 begin
for(j=0;j<16;j=j+1)
   begin
read;
delay;
   end
 end
join
delay;
fork
 begin
for(i=0;i<16;i=i+1)
  begin
write;
  end
     wr_en=1'b0;
 end
 begin
for(j=0;j<16;j=j+1)
   begin
read;
delay;
delay;
re_en=1'b0;
delay;
delay;

   end
 end
join
delay;
delay;
delay;
delay;

for(i=0;i<18;i=i+1)
  begin
  re_en=1'b0;
write;

  end
  delay;delay;delay;delay;
for(j=0;j<18;j=j+1)
   begin
   wr_en=1'b0;
read;
   end
#500 $finish;

end

initial

$monitor("T=%0t\n WR=%b RE=%b\n DIN=%0d DOUT=%0d\n WR_PTR=%0d RD_PTR=%0d\n FULL=%b EMPTY=%b\n COUNT =%b",$time, wr_en, re_en, data_in, data_out,f1.wr_addr_p,f1. re_addr_p, full, empty,f1.count);


endmodule
































