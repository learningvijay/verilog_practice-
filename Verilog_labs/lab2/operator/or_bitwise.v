module or_bitwise #(parameter N= 4)(
    input [N-1:0]a,b,
    output wire [N-1:0]y
    
);

//genvar i;

assign  y=a|b;
/*generate
    for(i=0;i<N;i=i+1)
    begin
      assign  y[i]=a[i]|b[i];
    end
endgenerate*/

endmodule
