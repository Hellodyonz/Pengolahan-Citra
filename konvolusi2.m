function [G] = konvolusi2(F, H)
% KONVOLUSI2 Melakukan konvolusi kernel H dengan citra F
% (Versi Algoritma 4.3)
% H harus mempunyai tinggi dan lebar ganjil
% Hasil: citra G
[tinggi_f, lebar_f] = size(F);
[tinggi_h, lebar_h] = size(H);
m2 = floor(tinggi_h/2);
n2 = floor(lebar_h/2);
F2=double(F);
for y=1 : tinggi_f
 for x=1 : lebar_f
 % Pelaksanaan konvolusi F(baris, kolom)
 jum = 0;
 for p=-m2 : m2
 for q=-n2 : n2
 % Penanganan x
 x2 = x-q;
 if x2 < 1
 x2 = -x2 + 1;
 else
 if x2 > lebar_f
 x2 = 2 * lebar_f - x2 + 1;
 end
 end

 % Penanganan y
 y2 = y-p;
 if y2 < 1
 y2 = -y2 + 1;
 else
 if y2 > tinggi_f
 y2 = 2 * tinggi_f - y2 + 1;
 end
 end


 jum = jum + H(p+m2+1,q+m2+1) * ...
 F2(y2, x2);
 end
 end

 G(y, x) = jum;
 end
end
