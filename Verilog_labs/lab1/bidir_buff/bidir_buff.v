module bidir_buff (
input control,
inout wire a,b
);
    assign a= control?b:1'bz;
    assign b= control?1'bz:a;
endmodule