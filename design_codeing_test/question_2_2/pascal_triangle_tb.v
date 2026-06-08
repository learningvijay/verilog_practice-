module pascal_triangle_tb;

integer i, j;

function integer fact;
    input integer n;
    integer k;
    begin
        fact = 1;
        for(k = 1; k <= n; k = k + 1)
            fact = fact * k;
    end
endfunction

function integer comb;
    input integer n, r;
    begin
        comb = fact(n) / (fact(r) * fact(n-r));
    end
endfunction

initial begin

    for(i = 0; i < 5; i = i + 1)
    begin

        for(j = i; j < 4; j = j + 1)
            $write(" ");

        for(j = 0; j <= i; j = j + 1)
            $write("%0d ", comb(i,j));

        $display("");
    end

    $finish;

end

endmodule
