function [G] = drrayleigh(F, a, b)
% DRRAYLEIGH Menghasilkan citra yang telah diberi derau
% menggunakan fungsi Rayleigh.
%
% Berdasarkan kode
% Rafael C. Gonzales, Richard E. Woods, dan
% Steven L. Eddins, 2004
%
% F = citra berskala keabuan
% a dan b = paramater untuk menentukan fungsi Rayleigh
if nargin ~= 3
 error('Penggunaan: drrayleigh(F, a, b)');
end
if a <= 0 || b <= 0
 error('Parameter a atau b berupa sebarang bilangan > 0');
end
[m, n] = size(F);
F = double(F);
G = zeros(m, n);
for i=1 : m
 for j=1 : n
 derau = a + sqrt(-b * log(1 - rand));

 G(i,j) = round(F(i,j) + derau);
 if G(i,j) > 255
 G(i,j) = 255;
 end
 end
end
G = uint8(G);
