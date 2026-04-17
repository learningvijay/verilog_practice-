module siso_s_r_tb;
reg s_in; 
reg shift_en;
reg rst;
reg clk;
wire s_out;
reg temp;
integer i;

siso_s_r s1(
.s_in(s_in),
.shift_en(shift_en),
.rst(rst),
.clk(clk),
.s_out(s_out)
);

initial
clk=1'b0;
always #5 clk=~clk;

task initialization;
begin
s_in=1'b0;
shift_en=1'b0;
rst=1'b0;
end
endtask

task reset;
fork
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
begin
shift_en=1'b0;
end
join
endtask

task inputs;
begin
 temp={$random}%2;
@(negedge clk)
shift_en=1'b1;
s_in=temp;
end
endtask

task delay;
begin
#10;
end
endtask

initial 
begin
initialization;

reset;

for(i=0;i<4;i=i+1)
begin
inputs;
end

for(i=0;i<4;i=i+1)
begin
delay;
inputs;
end

reset;

for(i=0;i<10;i=i+1)
begin
delay;
inputs;
/*if(i==5)
begin
reset;
end*/
end
#10 $finish;

end


always @(posedge clk) begin
    $display("T=%0t | clk=%b rst=%b shift_en=%b sin=%b reg=%b sout=%b",
              $time, clk, rst, shift_en,s_in, s1.shift_reg, s_out);
end
/*initial begin
    $monitor("Time=%0t | clk=%b rst=%b shift_en=%b s_in=%b | shift_reg=%b | s_out=%b",
              $time, clk, rst, shift_en, s_in, s1.shift_reg, s_out);
end
*/

endmodule









