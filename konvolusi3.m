function [G] = konvolusi3(F, Hkol, Hbrs)
% KONVOLUSI3 Melakukan konvolusi kernel Hkol dan Hbrs dengan citra
F
% (Versi Algoritma 4.4)
% Hkol dan Hbrs harus mempunyai tinggi dan lebar ganjil
% dan ukurannnya sama
% Hkol dan Hbrs berupa vektor mendatar
% Hasil: citra G
[tinggi_f, lebar_f] = size(F);
[tinggi_h, lebar_h] = size(Hbrs);
m2 = floor(lebar_h/2);
F2=double(F);
T = F2;
for y=m2+1 : tinggi_f-m2
 for x=1 : lebar_f
 jum = 0;
 for p=-m2 : m2
 jum = jum + Hkol(p+m2+1) * F2(y-p, x);
 end

 T(y, x) = jum;
 end
end
for y=1 : tinggi_f
 for x=m2+1 : lebar_f-m2
 jum = 0;
 for p=-m2 : m2
 jum = jum + Hbrs(p+m2+1) * T(y, x-p);
 end

 G(y, x) = jum;
 end
end
