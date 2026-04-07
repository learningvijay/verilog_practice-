module p_encoder8_3_tb;
reg [7:0]data_in;
wire valid;
wire [2:0]data_out;
reg [7:0]register;
integer i,j;

p_encoder8_3 e1 (
                 .data_in(data_in[7:0]),
                 .valid(valid),
                 .data_out(data_out[2:0])
);

task initilize();
begin
data_in=8'b0;
end
endtask

task stimulus(input [7:0]a);
begin
data_in=a;
end
endtask

initial
begin
initilize();
#10;
register=8'd1;
for(i=0;i<9;i=i+1)
begin
register = register+i;
for(j=0;j<9;j=j+1)
begin
register = register+i;
stimulus(register[7:0]);
register=register<<1;
#10;
end
end
end

initial
$monitor("input data_in = %b  ,output valid= %b  ,data_out= %b",data_in,valid,data_out);

endmodule




