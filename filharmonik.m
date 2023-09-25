function [G] = filharmonik(F, ukuran)
% FILHARMONIK Melakukan penghilangan derau dengan
% menggunakan filter rerata harmonik
% F = Citra berskala keabuan
% ukuran = ukuran jendela
% G = Citra hasil pemrosesan
if nargin < 2
 ukuran = 3;
end
[m, n] = size(F);
setengah = floor(ukuran / 2);
F = double(F);
G = zeros(m-2*setengah, n-2*setengah);
for i=1+setengah : m-setengah
    for j=1+setengah: n-setengah
 jum = 0;
 for p = -setengah : setengah
 for q = -setengah : setengah
 jum = jum + 1 / F(i+p, j+q);
 end
 end

 G(i-setengah, j-setengah) = (ukuran * ukuran) / jum;
 end
end
G = uint8(G);