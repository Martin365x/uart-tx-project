module controller(clk,rst,v_input,p_en,busy,state,bit_index,load);
input clk;
input rst;
input v_input;
input p_en;
output reg busy;
output reg [2:0] state;
output reg [3:0] bit_index;
output reg load;
localparam IDLE=0;
localparam START=1;
localparam DATA=2;
localparam PARITY=3;
localparam STOP=4;
always @(posedge clk or negedge rst) begin
if(rst==0) begin
state<=IDLE;
busy<=0;
bit_index<=0;
load<=0;
end
else begin
case(state)
IDLE: begin
load<=0;
if(v_input==1) begin
state<=START;
busy<=1;
load<=1;
end
end
START: begin
load<=0;
bit_index<=0;
state<=DATA;
end
DATA: begin
if(bit_index<7)
bit_index<=bit_index+1;
else begin
bit_index<=0;
if(p_en==1)
state<=PARITY;
else
state<=STOP;
end
end
PARITY: begin
state<=STOP;
end
STOP: begin
state<=IDLE;
busy<=0;
end
default: state<=IDLE;
endcase
end
end
endmodule
