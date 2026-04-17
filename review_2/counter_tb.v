module counter_tb;
reg clk;
reg rst;
reg up_down;
wire [3:0]count;

integer i;

counter c1(
.clk(clk),
.rst(rst),
.up_down(up_down),
.count(count[3:0])
);

initial clk=0;
always #5 clk=~clk;

task inti;
begin
rst=1'b0;
up_down=1'b1;
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

task stimulus(input i);
begin
@(negedge clk)
up_down=i;
end 
endtask

task delay;
begin
#10;
end
endtask

initial 
begin
inti;
delay;
reset;
for(i=0;i<8;i=i+1)
begin
stimulus(1'b0);
end

for(i=0;i<8;i=i+1)
begin
stimulus(1'b1);
end

#20 $finish;
end

always@(posedge clk)
begin
$display(" rst=%b up_down=%b count=%b",rst,up_down,count);
end

endmodule
