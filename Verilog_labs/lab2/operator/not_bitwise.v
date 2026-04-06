module not_bitwise#(parameter N= 4)(
    input [N-1:0]a,
    output wire [N-1:0]y
   
);
//genvar i;
assign y= ~a;

/*generate
    for(i=0;i<N;i=i+1)
    begin
      assign y[i]=~a[i];
    end
endgenerate*/

endmodule