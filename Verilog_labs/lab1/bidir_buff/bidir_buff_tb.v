module bidir_buff_tb;
reg control;
wire a,b;
integer i;
reg temp1,temp2;
bidir_buff bi (
    .control(control),
    .a(a),
    .b(b)
);

initial begin
    for (i=0;i<8;i=i+1) begin
        {temp2,temp1,control}=i;
        #10;
    end
end
assign a= control?1'bz:temp2;
assign b= control?temp1:1'bz;
initial
 $monitor("a=%b  ,b=%b  , control=%b",a,b,control);
 endmodule