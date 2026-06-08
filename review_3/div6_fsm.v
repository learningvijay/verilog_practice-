module div6_fsm(
input clk,
input rst,
input si,
output reg y
);
reg [31:0]data;
reg [1:0]present_state;
reg [1:0]next_state;
parameter IDLE= 2'b00,
                   STATE0=2'b01,
                   STATE1=2'b10;


always@(posedge clk or posedge rst)
begin
if(rst)
begin
data<=31'b0;
present_state<=IDLE;
end
else begin
present_state<=next_state;
y<=1'b0;
end
end

always@(si)
begin
data<={data[30:0],si};
end                                                                  


always@(data)
begin
if(data>6)
begin
case(present_state)
IDLE:if((data%6)==0)
          begin
          next_state<=STATE0;
          y<=1'b1;
          data<=31'b0;
          end
          else if((data%6)!=0)
          begin
          next_state<=STATE1;
          y<=1'b0;
          end
          else 
          begin
          next_state<=IDLE;
          end      
          
 STATE0:if((data%6)==0)
          begin
          next_state<=STATE0;
          y<=1'b1;
          data<=31'b0;
          end
          else if((data%6)!=0)
          begin
          next_state<=STATE1;
          y<=1'b0;
          end
           else 
          begin
          next_state<=IDLE;
          end      
          
          
    STATE1:if((data%6)==0)
          begin
          next_state=STATE0;
          y<=1'b1;
          data<=31'b0;
          end
          else if((data%6)!=0)
          begin
          next_state=STATE1;
          y<=1'b0;
          end
          else
           begin
          next_state<=IDLE;
          end  
default:next_state<=IDLE;
endcase
end
end
endmodule
