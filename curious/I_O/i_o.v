module file_io_practice;

    integer infile, outfile;
    integer data;
    integer sum;
    integer status;

    initial begin
        sum = 0;

        // Open files
        infile  = $fopen("input.txt", "r");
        outfile = $fopen("output.txt", "w");

        if (infile == 0) begin
            $display("ERROR: Cannot open input file");
            $finish;
        end

        // Read until EOF
        while (!$feof(infile)) begin

            status = $fscanf(infile, "%d\n", data);

            if (status == 1) begin
                sum = sum + data;

                $display("Read Data = %0d", data);

                $fdisplay(outfile,
                          "Data = %0d, Square = %0d",
                          data, data*data);
            end

        end

        $display("Total Sum = %0d", sum);

        $fdisplay(outfile,
                  "Final Sum = %0d", sum);

        // Close files
        $fclose(infile);
        $fclose(outfile);

        $finish;
    end

endmodule
