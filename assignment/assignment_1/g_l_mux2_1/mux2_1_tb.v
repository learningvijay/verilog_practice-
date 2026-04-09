module mux2_1_tb ;
reg  [1:0]data_in;
reg select;
wire data_out;
integer i;

mux2_1 m1(
.data_in(data_in[1:0]),
.select(select),
.data_out(data_out)
);

task inputs(input [2:0]i);
begin
data_in=i[1:0];
select=i[2];
end
endtask

initial
begin 
for(i=0;i<8;i=i+1)
begin
inputs(i);
#10;
end
end

initial 
$monitor("input I0= %b ,I1= %b , select =%b ,output  data_out= %b",data_in[0],data_in[1],select,data_out);

endmodule

