module alu_tb();
    
   //Testbench global variables
   reg [7:0]a,b;
   reg [3:0]command;
   reg enable;
   wire [15:0]out;
	
  integer i;
   reg [4*8:0]string_cmd;

   //Step1 : Instantiate the design ALU
   alu a1(.a(a),
          .b(b),
          .command_in(command),
	       .oe(enable),
	       .y(out)
);



   //Step2 : Write a task named "initialize" to initialize the inputs of DUT
  task initialize();
  begin
   {a,b,command,enable}=0;
  end
   endtask

   //Tasks used for generating stimulus
   task en_oe(input i);
      begin
         enable=i;
      end
   endtask

   task inputs(input [7:0]j,k);
      begin
	 a=j;
	 b=k;
      end
   endtask

   task cmd (input [3:0]l);
      begin
         command=l;
      end
   endtask

   task delay();
      begin
	 #10;
      end
   endtask
	

   always@(command)
      begin
         case (command)
	    SHL    :  string_cmd = "SHL";
	    SHR    :  string_cmd = "SHR";
	    INV    :  string_cmd = "INV";
	    AND    :  string_cmd = "AND";
	    OR     :  string_cmd = "OR";
	    NAND   :  string_cmd = "NAND";
	    NOR    :  string_cmd = "NOR";
	    XOR    :  string_cmd = "XOR";-
	    XNOR   :  string_cmd = "XNOR";
	    BUF    :  string_cmd = "BUF";
	 endcase
      end
			
  
			
   initial
   begin
      en_oe(1'b0);
      initialize;
      delay;
      en_oe(1'b1);	
      delay;
      inputs(8'd20,8'd10);
      for ( m=0;m<10;m=m+1 ) begin
         delay;
         command=m;
         cmd(command);
         delay;
         en_oe(1'b1);
      end
   end



   initial 
      $monitor("Input oe=%b, a=%b, b=%b, command=%s, Output out=%b",enable,a,b,string_cmd,out);
								
   
endmodule
