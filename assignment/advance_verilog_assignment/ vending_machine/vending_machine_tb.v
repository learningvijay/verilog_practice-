`timescale 1us/10ns
module vending_machine_tb;
reg [1:0]coin;
reg rst;
reg clk;
wire y;


//reg [10:0] count;
//reg [2:0]next_state;
//reg [2:0]present_state;
//integer  i;
//reg [1:0]temp;
parameter      IDLE=3'B000,
                   STATE1=3'B001,
                   STATE2=3'B010,
                   STATE3=3'B011,
                   STATE4=3'B100;
                   
 vending_machine v1(
.coin(coin[1:0]),
.rst(rst),
.clk(clk),
.y(y)
);
    
 
 
initial clk=1'b0; 
 always #3906.25 clk=~clk;
 
 task init;
 begin
 coin=2'b11;
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
 
task inputs(input [1:0]i);
begin
@(negedge clk);
@(negedge clk);
@(negedge clk);
@(negedge clk);
@(negedge clk)
coin=i;
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
inputs(2'b00);
inputs(2'b11);
inputs(2'b00);
inputs(2'b11);
inputs(2'b00);
inputs(2'b11);
inputs(2'b00);
inputs(2'b11);
#(3906.25*3906.25);
inputs(2'b00);
delay;
inputs(2'b10);
/*for(i=0;i<25;i=i+1)
begin
delay;
temp={$random}%4;
/inputs(temp);
end*/
delay;
inputs(2'b11);

#(3906.25*3906.25) $finish;

end

always@(posedge y)
begin
$display(" product is delivired");
end

initial 
$monitor("time=%t, coin=%b , y=%b, state=%b",$time,coin,y,v1.present_state);

endmodule





















 






