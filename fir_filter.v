module fir_filter (  
input clk, reset, input [7:0] signal_in,  
output reg [7:0] signal_filtered  
); reg signed [31:0] coeffs [0:63];  
reg signed [31:0] shift_reg [0:63];  
reg signed [31:0] acc;  
integer i;  
initial begin  
for (i = 0; i < 64; i = i + 1) begin  
coeffs[i] = 0;  
end //  
$readmemh("fir_coeffs.hex", coeffs);  
end  
always @(posedge clk or posedge reset) begin  
if (reset) begin  
for (i = 0; i < 64; i = i + 1) begin  
shift_reg[i] <= 0;  
end  
acc <= 0;  
signal_filtered <= 0;  
end  
else begin  
acc = 0;  
shift_reg[0] <= signal_in;  
for (i = 1; i < 64; i = i + 1) begin  
shift_reg[i] <= shift_reg[i-1]; 
// Shift operation  
acc = acc + coeffs[i] * shift_reg[i];  
end  
signal_filtered <= acc[31:24];  
end  
end  
endmodule
