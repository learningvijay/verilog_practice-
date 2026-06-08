module test;

reg clk,reset_in;
wire reset;
wire [3:0]sequence;


sequence_generator g1(
.clk(clk),
.reset_in(reset_in),
.reset(reset)
);

assign sequence= g1.num;

initial clk=1'b0;

always #5 clk=~clk;

task reset_task;
begin

@(posedge(clk))
reset_in=1'b1;

@(negedge(clk))
reset_in=1'b0;

end
endtask

initial begin

reset_task;

#2000 $finish;

end

always@(posedge clk)
begin

if(reset)
$write("%d ",g1.num);

end

endmodule
