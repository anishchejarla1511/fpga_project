module vibration_motor (  
input knock_signal,  
input mic_signal, 
input button_signal,  
output  
reg vibration  
);  
always @(*) begin  
vibration = knock_signal | mic_signal | button_signal;  
end  
endmodule 
