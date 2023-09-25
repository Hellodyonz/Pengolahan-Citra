function G = thm(F, H)
% THM Digunakan untuk menangani transformasi Hit-or-Miss
% F adalah citra yang akan dikenai operasi
% H adalah elemen penstruktur
[tinggi, lebar] = size(H);
H1 = H;
H2 = not(H1);
G = and(erosi(F, H1) , erosi(not(F), H2));