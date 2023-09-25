function [output] = olahGambar(input, warna)
% OLAHGAMBAR Memproses citra berwarna berdasarkan warna yang diinginkan
% input : citra berwarna
% warna : warna yang ingin dipertahankan dalam citra (misalnya 'merah', 'hijau', 'biru')

% Membaca citra input
img = imread(input);

% Mengubah citra menjadi format HSV
hsv = rgb2hsv(img);

% Memisahkan saluran warna dalam citra (HSV)
hueChannel = hsv(:,:,1);
saturationChannel = hsv(:,:,2);
valueChannel = hsv(:,:,3);

% Menyiapkan citra output dengan saluran warna yang diinginkan
output = img;
if strcmpi(warna, 'merah')
    output(repmat(hueChannel < 0.1 | hueChannel > 0.85, [1 1 3])) = 0; % Menghapus saluran merah
    output(repmat(saturationChannel < 0.4 | saturationChannel > 1, [1 1 3])) = 0; % Menghapus saluran hijau
elseif strcmpi(warna, 'hijau')
    output(repmat(hueChannel < 0.25 | hueChannel > 0.45, [1 1 3])) = 0; % Menghapus saluran merah
    output(repmat(saturationChannel < 0.4 | saturationChannel > 1, [1 1 3])) = 0; % Menghapus saluran biru
elseif strcmpi(warna, 'biru')
    output(repmat(hueChannel < 0.5 | hueChannel > 0.7, [1 1 3])) = 0; % Menghapus saluran merah
    output(repmat(saturationChannel < 0.4 | saturationChannel > 1, [1 1 3])) = 0; % Menghapus saluran hijau
end

% Menampilkan citra output
imshow(output);
title(['Citra dengan warna ', warna]);
end