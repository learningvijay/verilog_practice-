 `timescale 1ns/100ps
        module snippet;
        reg a;
            initial
               begin
                  #2.37 a = 1;
                  #0.29 a = 0;
                  #0.41 a = 1;
                  $stop;
               end       
          endmodule
