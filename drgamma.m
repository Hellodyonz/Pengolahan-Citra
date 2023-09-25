function [G] = drgamma(F, a, b)
% DRGAMMA Menghasilkan citra yang telah diberi derau
% menggunakan fungsi Gamma.
%
% Berdasarkan
% Rafael C. Gonzales, Richard E. Woods, dan
% Steven L. Eddins, 2004
%
% F = citra berskala keabuan
% a dan b = argumen untuk menentukan bentuk kurva
% a > 0 dan b bilangan bulat positif
if nargin ~= 3
 error('Penggunaan: drgamma(F, a, b)');
end
if (a <= 0) || (a ~= round(a))
 error('Argumen kedua harus berupa integer > 0');
end
if b < 1 || (b ~= round(b))
 error('Argumen ketiga harus berupa integer > 0');
end
[m, n] = size(F);
alpha = b;
varians = b / (a * a);
p = sqrt(varians * a ) / 2.0;
F = double(F);
for i=1 : m
 for j=1 : n
 k = -1 / a;
 derau = 0;
 for p=1 : b
 derau = derau + k * log(1 - rand);
 end
 G(i,j) = round(F(i,j)+derau);

 if G(i,j) > 255
 G(i,j) = 255;
 end
 end
end
G = uint8(G);
