function G = taffine(F, a11, a12, a21, a22, tx, ty)
% TAFFINE Digunakan untuk melakukan transformasi affine.
% Masukan: F = Citra berskala keabuan
% a11, a12, a21, a22, tx, ty = mengatur
% transformasi affine
[tinggi, lebar] = size(F);
for y=1 : tinggi
for x=1 : lebar
x2 = a11 * x + a12 * y + tx;
y2 = a21 * x + a22 * y + ty;
if (x2>=1) && (x2<=lebar) && ...
(y2>=1) && (y2<=tinggi)
% Lakukan interpolasi bilinear
p = floor(y2);
q = floor(x2);
a = y2-p;
b = x2-q;
if (floor(x2)==lebar) || ...
(floor(y2) == tinggi)
G(y, x) = F(floor(y2), floor(x2));
else
intensitas = (1-a)*((1-b)*F(p,q) + ...
b * F(p, q+1)) + ...
a *((1-b)* F(p+1, q) + ...
b * F(p+1, q+1));
G(y, x) = intensitas;
end
else
G(y, x) = 0;
end
end
end
G = uint8(G);