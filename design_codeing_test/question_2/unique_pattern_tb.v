module unique_pattern;

reg [2:0]count;
reg [7:0]pattern;
reg clk;

initial clk=1'b0;

always #5 clk = ~ clk;

always@(posedge clk)
begin

if (count==3'b000)
begin
pattern<=7'd82;
count=count+3'b001;
end

else if(count==3'b001)
begin
pattern<=7'd86;
count=count+3'b001;
end

else if(count==3'b010)
begin
pattern<=7'd90;
count=count+3'b001;
end

else if(count==3'b011)
begin
pattern<=7'd94;
count=count+3'b001;
end

else if(count==3'b100)
begin
pattern<=7'd98;
count<=3'b000;
end

else
begin
count=3'b00;
end

end

initial
begin
count=3'b000;

#2000 $finish;

end

initial
$monitor("%d ",pattern);

endmodule
