module xnor_nand_tb;
reg a,b;
wire y;
integer i;


xnor_nand n1(a,b,y);

task automatic outputs;
begin
if(y==(a~^b))
begin
$display(" xnor implimented is correct a=%b  b=%b   y=%b",a,b,y);
end
else
begin 
$display(" xnor implimented is not correct a=%b  b=%b   y=%b",a,b,y);
end
end
endtask


initial
begin
a=1'b0;
b=1'b0;
$display("10 ns delay");

for(i=0;i<4;i=i+1)
begin
{a,b}=i;
#10 ;
outputs;

end

$display("5 ns delay");
for(i=0;i<4;i=i+1)
begin
 {a,b}=i;
  #5;
outputs;

end

$display("2 ns delay");
for(i=0;i<4;i=i+1)
begin
{a,b}=i;
#2;
outputs;

end

$display("1 ns delay");
for(i=0;i<4;i=i+1)
begin
{a,b}=i;
#1;
outputs;

end


#30 $finish;
end



endmodule
