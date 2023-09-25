function [kode_rantai, xawal, yawal] = chain_code(U)
% CHAIN_CODE Digunakan untuk mendapatkan titik awal (x, y) dan
% kode rantai dari kontur U yang datanya telah terurutkan
% misalnya melalui get_contour
% Kode 1 2 3 4 5 6 7 8 9
Kode = ['3', '2', '1', '4', '0', '0', '5', '6', '7' ];
xawal = U(1,2);
yawal = U(1,1);
kode_rantai = '';
for p=2: length(U)
 deltay = U(p, 1) - U(p-1, 1);
 deltax = U(p, 2) - U(p-1, 2);
 indeks = 3 * deltay + deltax + 5;
 kode_rantai = strcat(kode_rantai, Kode(indeks));
end