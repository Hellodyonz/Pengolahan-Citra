function G = thm2(F, H)
% THM2 Digunakan untuk menangani transformasi Hit-or-Miss
% F adalah citra yang akan dikenai operasi
% H adalah elemen penstruktur
% H bisa mengandung nilai -1 untuk menyatakan
% don't care
[tinggi, lebar] = size(H);
% Membentuk H1
% Periksa nilai don't care (yaitu -1) dan gantilah dengan nol
H1 = H;
for baris = 1 : tinggi
 for kolom = 1 : lebar
 if H1(baris, kolom) == -1
 H1(baris, kolom) = 0;
 end
 end
end
% Membentuk H2 sebagai komplemen H1
% Periksa nilai don't care (yaitu -1) dan gantilah dengan nol
for baris = 1 : tinggi
 for kolom = 1 : lebar
 if H(baris, kolom) == -1
 H2(baris, kolom) = 0;
 else
 H2(baris, kolom) = not(H(baris, kolom));
 end
 end
end
G = and(erosi(F, H1) , erosi(not(F), H2));
return