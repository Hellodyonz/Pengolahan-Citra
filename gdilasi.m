function G = gdilasi(F, H, hotx, hoty)
% GDILASI Berguna untuk melaksanakan operasi dilasi pada
% citra beraras keabuan.
% Masukan:
% F = citra yang akan dikenai dilasi
% H = elemen pentruksur
% (hy, hx) koordinat pusat piksel
[th, lh]=size(H);
[tf, lf]=size(F);
if nargin < 3
 hotx = round(lh/2);
 hoty = round(th/2);
end
G = zeros(tf, lf); % Nolkan semua pada hasil dilasi
% Memproses dilasi
for baris = 1 : tf
 for kolom = 1 : lf
 terbesar = 0;
 for p=1:th
 for q=1:lh
 ypos = baris - (p - hoty);
 xpos = kolom - (q - hotx);
 if (xpos >= 1) && (xpos <= lf) && ...
 (ypos >= 1) && (ypos <= tf)
 nilai = F(ypos, xpos) + H(p, q);
if terbesar < nilai
 terbesar = nilai;
 end
 end
 end
 end

 % Potong nilai terbesar kalau melebihi 255
 if terbesar > 255
 terbesar = 255;
 end

 % Berikan nilai terbesar ke G
 G(baris, kolom) = terbesar;
 end
end
G = uint8(G);