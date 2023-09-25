function [G] = filyp(F, ukuran, orde)
% FILYP Melakukan penghilangan derau dengan
% menggunakan filter rerata Yp
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
 jum = 0;
 for p = -setengah : setengah
 for q = -setengah : setengah
 jum = jum + F(i+p, j+q)^orde / (ukuran * ukuran);
 end
 end

 G(i-setengah, j-setengah) = jum ^ (1/orde);
 end
end
G = uint8(G);