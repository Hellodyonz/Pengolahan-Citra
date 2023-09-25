function [centroid_x, centroid_y] = centroid(BW)
% CENTROID Digunakan untuk menghitung koordinat centroid dari citra biner BW
% Masukan: BW - Citra biner
% Keluaran: centroid_x - Koordinat X centroid
%           centroid_y - Koordinat Y centroid

[m, n] = size(BW);
[x, y] = meshgrid(1:n, 1:m);

total_pixels = sum(BW(:));
centroid_x = sum(x(BW)) / total_pixels;
centroid_y = sum(y(BW)) / total_pixels;

end
