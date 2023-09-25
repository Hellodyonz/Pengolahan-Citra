function output = hitOrMiss(input, B1, B2)
% Konversi input menjadi biner
input(input < 128) = 0;
input(input >= 128) = 1;
% Dilasi dengan structuring element B1
dilate1 = imdilate(input, B1);
% Dilasi dengan structuring element B2
dilate2 = imdilate(~input, B2);
% Hit-or-Miss dengan dilasi menggunakan B1 dan B2
output = dilate1 & dilate2;
% Konversi output kembali menjadi citra grayscale
output = output * 255;
output = uint8(output);
end