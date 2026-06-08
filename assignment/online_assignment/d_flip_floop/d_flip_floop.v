module d_flip_floop(
input clk,
input d,
output wire q,
output wire qb
);

wire n_clk;
wire w1;


 d_latch d1(
                  .d(d),
                  .control(~clk),
                  .q(w1),
                  .qbar( )
                  );
                  
d_latch d2(
                  .d(w1),
                  .control(clk),
                  .q(q),
                  .qbar(qb)
                  );
endmodule

