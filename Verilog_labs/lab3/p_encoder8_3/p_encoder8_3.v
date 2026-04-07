module p_encoder8_3 (
input [7:0]data_in,
output reg[2:0]data_out,
output reg valid
);



always@(*)
begin
valid=1;

if(data_in[7])
begin
data_out=3'b111;
end

else if(data_in[6])
begin
data_out=3'b110;
end

else if(data_in[5])
begin
data_out=3'b101;
end

else if(data_in[4])
begin
data_out=3'b100;
end

else if(data_in[3])
begin
data_out=3'b011;
end

else if(data_in[2])
begin
data_out=3'b010;
end

else if(data_in[1])
begin
data_out=3'b001;
end

else if(data_in[0])
begin
data_out=3'b000;
end

else 
begin

valid=0;
end
end


/*
always@(*)
begin
valid=1;

if(data_in[7])
begin
data_out=3'b000;
end

else if(data_in[6])
begin
data_out=3'b001;
end

else if(data_in[5])
begin
data_out=3'b010;
end

else if(data_in[4])
begin
data_out=3'b011;
end

else if(data_in[3])
begin
data_out=3'b100;
end

else if(data_in[2])
begin
data_out=3'b101;
end

else if(data_in[1])
begin
data_out=3'b110;
end

else if(data_in[0])
begin
data_out=3'b111;
end

else 
begin

valid=0;
end

end
*/
endmodule
