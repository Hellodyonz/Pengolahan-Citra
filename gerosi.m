function G = gerosi(F, H, hotx, hoty)
% GEROSI Berguna untuk melaksanakan operasi dilasi
% citra beraras keabuan.
% Masukan:
% F = citra yang akan dikenai erosi
% H = elemen pentruksur
% (hy, hx) koordinat pusat piksel
[th, lh]=size(H);
[tf, lf]=size(F);
if nargin < 3
 hotx = round(lh/2);
 hoty = round(th/2);
end
G = zeros(tf, lf); % Nolkan semua pada hasil erosi
% Memproses erosi
for baris = 1 : tf
 for kolom = 1 : lf
 terkecil = 255;
 for p=1:th
 for q=1:lh
 ypos = baris + p - hoty;
 xpos = kolom + q - hotx;
 if (xpos >= 1) && (xpos <= lf) && ...
 (ypos >= 1) && (ypos <= tf)
 nilai = F(ypos, xpos) + H(p, q);
if terkecil > nilai
 terkecil = nilai;
 end
 end
 end
 end

 % Berikan nilai ke G
 if terkecil < 0
 terkecil = 0;
 end

 G(baris, kolom) = terkecil;
 end
end
G = uint8(G);
