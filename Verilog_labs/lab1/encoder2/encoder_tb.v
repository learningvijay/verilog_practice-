module encoder_tb;
reg [7:0]data_in;
wire [2:0]data_out;
reg [7:0]x;
integer i;
encoder e1(
    .data_in(data_in[7:0]),
    .data_out(data_out[2:0])
);
initial
begin
    
    x=8'b00000001;
     data_in=x;
end
initial begin
    for(i=0;i<9;i=i+1)
    begin
        x=x<<1;
        data_in=x;
        #10;
        
    end
    #200 $finish;
end
endmodule