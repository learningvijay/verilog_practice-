module v_m_tb;
reg i,j;
reg clk;
reg rst;
wire x,y;


v_m  v1(
.i(i),
.j(j),
.clk(clk),
.rst(rst),
.x(x),
.y(y)
);

initial clk=1'b0;
always #5 clk = ~clk;

task init;
begin
i=1'b0;
j=1'b0;
rst=1'b0;
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


task inputs(input k,l);
begin
i=k;
j=l;
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
inputs(1'b1,1'b1);
inputs(1'b1,1'b1);
inputs(1'b0,1'b1);
inputs(1'b0,1'b0);
inputs(1'b1,1'b0);
inputs(1'b1,1'b1);
inputs(1'b1,1'b1);
inputs(1'b1,1'b1);
inputs(1'b1,1'b1);
inputs(1'b1,1'b0);
inputs(1'b1,1'b0);
inputs(1'b1,1'b0);

#20 $finish;
end
initial
begin 
$monitor( " i=%b , j=%b , rst=%b , present_state=%b , next_state=%b , x=%b ,y=%b" ,i,j,rst,v1.present_state,v1.nextstate, x,y);
end

always@(v1.present_state==v1.STATE3)
begin
$display(" product is dilivered ");
end

always@(v1.present_state==v1.STATE4)
begin
$display(" product is dilivered and take your change ");
end


endmodule
