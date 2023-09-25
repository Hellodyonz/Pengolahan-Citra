function G = thinning(F, fase)
% THINNING Untuk melakukan operasi thinning terhadap citra F
% Argumen fase menentukan hasil thinning untuk
% fase tersebut. Jika fase tidak disebutkaan,
% operasi thinning dilakukan sampai cstruktur citra
% tidak berubah lagi
if nargin == 1 % Kalau fase tidak disebutkan
 fase = 1000000000; % Isi dengan bilangan yang besar
end
% Elemen penstruktur
H1 = [ 0 0 0; 1 1 1; 1 1 1 ];
H2 = [ 1 0 0; 1 1 1; 1 1 1 ];
H3 = [ 1 1 0; 1 1 0; 1 1 0 ];
H4 = [ 1 1 1; 1 1 0; 1 0 0 ];
H5 = [ 1 1 1; 1 1 1; 0 0 0 ];
H6 = [ 1 1 1; 0 1 1; 0 0 1 ];
H7 = [ 0 1 1; 0 1 1; 0 1 1 ];
H8 = [ 0 0 1; 0 1 1; 1 1 1 ];
[tinggi, lebar] = size(F);
C = F;
for p = 1 : fase
 C1 = C;
 C = and(C, not(thm(C,H1)));
 C = and(C, not(thm(C,H2)));
 C = and(C, not(thm(C,H3)));
 C = and(C, not(thm(C,H4)));
 C = and(C, not(thm(C,H5)));
 C = and(C, not(thm(C,H6)));
 C = and(C, not(thm(C,H7)));
 C = and(C, not(thm(C,H8)));

 % Periksa hasil C1 dan C sama atau tidak
 sama = true;
 for baris = 1 : tinggi
 for kolom = 1 : lebar
 if C1(baris, kolom) ~= C(baris, kolom)
 sama = false;
 break;
 end
 end

 if sama == false
 break;
 end
 end

 if sama == true
 break; % Akhiri kalang
 end
end
G = C;
