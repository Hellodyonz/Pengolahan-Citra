function [G] = filmax(F, ukuran)
% FILMAX Melakukan penghilangan derau dengan
% menggunakan filter max.
% F = Citra berskala keabuan
% ukuran = ukuran jendela
% orde = orde filter
% G = Citra hasil pemrosesan
if nargin < 2
 ukuran = 3;
end
[m, n] = size(F);
setengah = floor(ukuran / 2);
G = zeros(m-2*setengah, n-2*setengah);
for i=1+setengah : m-setengah
 for j=1+setengah: n-setengah
 maks = 0;
 for p = -setengah : setengah
 for q = -setengah : setengah
 if F(i+p,j+q) > maks
 maks = F(i+p,j+q);
 end
 end
 end
 G(i-setengah, j-setengah) = maks;
 end
end
G = uint8(G);