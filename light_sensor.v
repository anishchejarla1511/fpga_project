module light_sensor (  
input led_state,  
output reg light_output 
); 
always @(*) begin  
light_output = ~led_state;  
end  
endmodule
