function G = thickening(F, n_iterasi)
% THICKENING Digunakan untuk menebalkan objek yang terdapat pada
% citra F.
% Argumen n_iterasi menyatakan jumlah iterasi atau
% fase yang dikehendaki untuk melakukan
% penebalan objek'
H1 = [ 1 1 1; 0 0 0; 0 0 0 ];
H2 = [ 0 0 0; 0 0 0; 1 1 1 ];
H3 = [ 1 0 0; 1 0 0; 1 0 0 ];
H4 = [ 0 0 1; 0 0 1; 0 0 1 ];
H5 = [ 0 1 1; 0 0 1; 0 0 0 ];
H6 = [ 0 0 0; 1 0 0; 1 1 0 ];
H7 = [ 0 0 0; 0 0 1; 0 1 1 ];
H8 = [ 1 1 0; 1 0 0; 0 0 0 ];
C = F; % Salin citra F ke C
for p = 1 : n_iterasi
 C = or(C, thm(C,H1));
 C = or(C, thm(C,H2));
 C = or(C, thm(C,H3));
 C = or(C, thm(C,H4));
 C = or(C, thm(C,H5));
 C = or(C, thm(C,H6));
 C = or(C, thm(C,H7));
 C = or(C, thm(C,H8));
end
G = C;
