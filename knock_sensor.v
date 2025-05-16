module knock_sensor (  
input clk, input reset, input [7:0] knock_in,  
output reg knock_detected  
);  
wire [7:0] filtered_knock;  
fir_filter knock_filter (.clk(clk), .reset(reset), .signal_in(knock_in), .signal_filtered(filtered_knock));  
parameter KNOCK_THRESHOLD = 8'd75; 
always @(posedge clk or posedge reset) begin  
if (reset) knock_detected <= 0; 
else knock_detected <= (filtered_knock >= KNOCK_THRESHOLD);  
end  
endmodule 
