module decoderdut;
reg [1:0]data_in;
wire [3:0]data_out;
integer i;

decoder d1 ( 
    .data_in(data_in),
    .data_out(data_out)
    );
initial
begin
    {data_in[1],data_in[0]}=0;

    end
initial 
begin
    

for(i=0;i<4;i=i+1)
begin
{data_in[1],data_in[0]}=i;
#10;

end
end
initial 
      $monitor("Input data_in[1]=%b,data_in[0]=%b, output data_out[3]=%b,data_out[2]=%b,data_out[1]=%b,data_out[0]=%b",data_in[1],data_in[0],data_out[3],data_out[2],data_out[1],data_out[0]);
									
   
initial #100 $finish;

		
   
endmodule