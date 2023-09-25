function G = convhull8(A)
% CONVHULL8 untuk melakukan operasi convex hull terhadap citra A
% dengan menggunakan 8 elemen penstruktur
% G = hasil convex hull
[tinggi, lebar] = size(A);

% Elemen penstruktur
H1 = [ 1 -1 -1; 1 0 -1; 1 -1 -1 ];
H2 = [ 1 1 -1; 1 0 -1; -1 -1 -1 ];
H3 = [ -1 1 1; -1 0 1; -1 1 1 ];
H4 = [ -1 -1 1; -1 0 1; -1 -1 1 ];
H5 = [ -1 -1 -1; -1 0 -1; 1 1 1 ];
H6 = [ -1 -1 -1; -1 0 1; -1 1 1 ];
H7 = [ 1 -1 -1; -1 0 1; -1 1 1 ];
H8 = [ 1 1 -1; -1 0 1; -1 -1 1 ];

C = zeros(tinggi, lebar);
C = or(C, chull(A, H1));
C = or(C, chull(A, H2));
C = or(C, chull(A, H3));
C = or(C, chull(A, H4));
C = or(C, chull(A, H5));
C = or(C, chull(A, H6));
C = or(C, chull(A, H7));
C = or(C, chull(A, H8));

G = C;

end

function [G, k] = chull(A, B)
% A = citra
% B = elemen penstruktur
% G = hasil yang konvergen
% k = iterasi hingga konvergen
[tinggi, lebar] = size(A);
k=1;
Ckmin1 = A;
while (true)
 Ck = or(Ckmin1, thm2(Ckmin1,B));

 % Cek Ckmin1 apa sama dengan Ck
 sama = true;
 for baris = 1 : tinggi
 for kolom = 1 : lebar
 if Ckmin1(baris, kolom) ~= Ck(baris, kolom)
 sama = false;
 break;
 end
 end

 if sama == false
     break;
 end
 end

 if sama == true
 break; % Berarti sudah konvergen
 end

 % Ke iterasi berikutnya
 k = k + 1;
 Ckmin1 = Ck;
end
k = k-1;
G = Ckmin1;

end

function G = thm2(A, B)
% A = citra
% B = elemen penstruktur
% G = hasil operasi transformasi Top-Hat

% Dilasi
D = imdilate(A, B);
% Erosi
E = imerode(A, B);
% Top-Hat
G = A - E + D;

end
