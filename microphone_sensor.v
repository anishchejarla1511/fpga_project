module microphone_sensor (  
input clk, input reset, input [7:0] mic_signal,  
output reg mic_detected  
);  
wire [7:0] filtered_mic;  
fir_filter mic_filter (.clk(clk), .reset(reset), .signal_in(mic_signal), .signal_filtered(filtered_mic));  
parameter MIC_THRESHOLD = 8'd150;  
always @(posedge clk or posedge reset) begin  
if (reset) mic_detected <= 0;  
else mic_detected <= (filtered_mic >= MIC_THRESHOLD);  
end  
endmodule
