function [lebar] = hitung_lebar_tepi(citra_tepi)
% HITUNG_LEBAR_TEPI Berfungsi untuk menghitung lebar tepi biner pada citra.
% Input: citra_tepi = citra tepi biner
% Output: lebar = ukuran lebar tepi biner

[y, x] = find(citra_tepi);

% Cari titik paling kiri dan titik paling kanan
x_min = min(x);
x_max = max(x);

% Cari titik paling panjang di kiri
idx_kiri = find(x == x_min & y == max(y(x == x_min)));
x1 = x(idx_kiri);
y1 = y(idx_kiri);

% Cari titik paling panjang di kanan
idx_kanan = find(x == x_max & y == max(y(x == x_max)));
x2 = x(idx_kanan);
y2 = y(idx_kanan);

% Hitung lebar tepi
lebar = abs(x2 - x1);

% Tampilkan citra dengan garis lebar
figure;
imshow(citra_tepi);
hold on;
plot([x1, x2], [y1, y2], 'r-', 'LineWidth', 2);
hold off;

end
