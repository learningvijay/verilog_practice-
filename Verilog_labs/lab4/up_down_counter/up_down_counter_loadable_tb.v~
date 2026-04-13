
module up_down_counter_loadable_tb;
parameter CYCLE=10;
parameter N=4;

reg clk,rst,load,up_down; 
reg[N-1:0]data_in;
wire [N-1:0]count;





up_down_counter_loadable c1(
.clk(clk),
.rst(rst),
.up_down(up_down),
.load(load),
.data_in(data_in[N-1:0]),
.count(count[N-1:0])

);


task initialize;
begin
rst=1'b0;
load=1'b0;
data_in=4'b0000;
up_down=1'b0;

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

task loading (input [N-1:0]i);
begin
@(negedge clk)
load=1'b1;
data_in=i[N-1:0];
#10;
@(negedge clk)
load=1'b0;
end
endtask

task delay;
begin
#10;
end
endtask

task count_dir(input i);
begin
up_down=i;
end
endtask

initial
clk=0;
always #(CYCLE/2) clk=~clk;

initial
begin
initialize;
delay;
reset;
delay;
delay;
count_dir(1'b1);
delay;
delay;
delay;
loading(4'd11);
delay;
delay;
reset;
delay;
delay;
loading(4'd12);
reset;
delay;
delay;
count_dir(1'b0);
delay;
delay;
delay;
#100;
count_dir(1'b1);
#100;
count_dir(1'b0);


end

initial
$display("up_down     0=up     1=down ");

initial
$monitor("input rst=%b load=%b data_in=%d up_down=%b  output count=%d  ",rst,load,data_in,up_down,count);

initial
#500 $finish;

endmodule





