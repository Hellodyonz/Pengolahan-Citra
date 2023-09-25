function [H] = cadarLoG(ukuran, sigma)
% CADARLOG Menghasilkan cadar LoG berdasarkan
% Nixon dan Aguido (2002)
% Masukan:
% ukuran : ukuran cadar
% sigma : Deviasi standar
% Keluaran : H = cadar LoG
cx = floor((ukuran-1) / 2);
cy = cx;
jum = 0;
H = zeros(ukuran, ukuran);
for y=0 : ukuran-1
 for x=0 : ukuran -1
 nx = x - cx;
 ny = y - cy;

 nilai = 1 / (sigma ^ 2) * ...
 ((nx^2 + ny^2)/(sigma^2)-2) * ...
exp((-nx^2 - ny^2) / (2 * sigma^2));
 H(y+1, x+1) = nilai;
 jum = jum + nilai;
 end
end
% Lakukan normalisasi
for y=1 : ukuran
    for x=1 : ukuran
 H(y,x) = H(y,x) / jum;
 end
end
