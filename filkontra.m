function [G] = filkontra(F, ukuran, orde)
% FILKONTRA Melakukan penghilangan derau dengan
% menggunakan filter rerata kontraharmonik
% F = Citra berskala keabuan
% ukuran = ukuran jendela
% orde = orde filter
% G = Citra hasil pemrosesan
if nargin < 2
 ukuran = 3;
end
if nargin < 3
 orde = 2;
end
[m, n] = size(F);
setengah = floor(ukuran / 2);
F = double(F);
G = zeros(m-2*setengah, n-2*setengah);
for i=1+setengah : m-setengah
 for j=1+setengah: n-setengah
 atas = 0;
 bawah = 0;
 for p = -setengah : setengah
 for q = -setengah : setengah
 atas = atas + F(i+p, j+q)^orde;
 bawah = bawah + F(i+p, j+q)^(orde-1);
 end
 end

 G(i-setengah, j-setengah) = atas / bawah;
 end
end
G = uint8(G);