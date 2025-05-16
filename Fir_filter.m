N = 30; 
fs = 8000; 
fc1 = 1000;  
fc2 = 3000;  
wc1 = fc1 / (fs / 2); 
wc2 = fc2 / (fs / 2); 
h = fir1(N, [wc1 wc2], 'bandpass', hamming(N + 1)); 
fileID = fopen('fir_coeffs.hex', 'w');  
if fileID == -1 error('Error opening file. Check file permissions or path.');  
end  
for i = 1:length(h)  
coeff_fixed = round(h(i) * 32768);  
if coeff_fixed < 0 coeff_fixed = coeff_fixed + 65536;  
end  
fprintf(fileID, '%04X\n', coeff_fixed);  
end  
fclose(fileID); 
disp('Hex file "fir_coeffs.hex" has been created successfully.');
