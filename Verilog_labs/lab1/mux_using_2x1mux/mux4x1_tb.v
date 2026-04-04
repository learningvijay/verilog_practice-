module mux4x1_tb;
reg [3:0]data_in;
reg [1:0]s;
wire data_out;
integer i,j;

mux4x1 m1(
    .data_in(data_in[3:0]),
    .s(s[1:0]),
    .data_out(data_out)
);

initial begin
    data_in=0;
    s=0;
end

initial begin
    for (i=0;i<4;i=i+1) begin
      
        for (j=0;j<16;j=j+1) begin
            
            s=i;
            data_in=j;
            #10;
        end
        
    end
end

initial
 $monitor(" data_in= %b ,s= %b  ,data_out= %b ",data_in[3:0],s[1:0],data_out);


initial
#4000 $finish;

endmodule