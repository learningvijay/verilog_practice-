module decoder3_8_tb;

reg [2:0]data_in;
wire [7:0]data_out;
integer i;

decoder3_8  d1(
               .data_in(data_in[2:0]),
               .data_out(data_out[7:0])
);

task initialize ();
begin
data_in=3'bx;

end
endtask

task stimulus (input [2:0]a);
begin
data_in=a;
end
endtask

initial
begin
initialize();
#10;
for(i=0;i<8;i=i+1)
begin
stimulus(i);
#10;
end
end

initial
$monitor("input data_in= %b  ,output data_out= %b",data_in,data_out);

endmodule
