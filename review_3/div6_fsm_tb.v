 module div6_fsm_tb;
reg clk;
reg rst;
reg si;
wire y;
integer i;
reg [31:0]data;
reg temp=1'b0;


div6_fsm f1(
.clk(clk),
.rst(rst),
.si(si),
.y(y) 
);




initial clk=0;
always
begin
 #5 clk=~clk;
 data=f1.data;
 end
 
initial
begin
rst=1'b1;
@(negedge clk)rst=1'b0;
for(i=0;i<200;i=i+1)
begin
@(negedge clk);
@(negedge clk);
@(negedge clk);
 si={$random}%2;
end
for(i=0;i<200;i=i+1)
begin
@(negedge clk);
 si=1'b0;
 @(negedge clk);
  si=1'b1;
  
end
#10 $finish;
end

initial 
$monitor("data=%b ",f1.data);


always@(y==1'b1)
begin
$display("/n data= %d",f1.data);
end
endmodule
