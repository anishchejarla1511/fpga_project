module smart_doorbell_top( 
input wire clk, reset, input wire [7:0] knock_in, mic_signal, 
input wire button,  
output reg led, vibration,  
output wire camera_active, // Set as a wire since it's always active  
output reg light_output ); 
wire knock_detected, mic_detected; // Knock and microphone detection thresholds  
parameter KNOCK_THRESHOLD = 8'd75; 
parameter MIC_THRESHOLD = 8'd150; // Knock detection logic  
assign knock_detected = (knock_in > KNOCK_THRESHOLD); // Microphone detection logic  
assign mic_detected = (mic_signal > MIC_THRESHOLD); // Camera is always active  
assign camera_active = 1'b1; 
always @(posedge clk or posedge reset) begin 
if (reset) begin led <= 0; vibration <= 0; light_output <= 1; // Light is off when LED is off  
end  
else begin led <= knock_detected || mic_detected || button; vibration <= led; // Vibration directly follows LED 
light_output <= ~led;  
end  
end  
endmodule
