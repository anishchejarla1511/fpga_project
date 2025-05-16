module push_button ( 
input clk, input reset, input button,  
output reg button_pressed  
); 
always @(posedge clk or posedge reset) begin  
if (reset) button_pressed <= 0; 
else button_pressed <= button;  
end  
endmodule
