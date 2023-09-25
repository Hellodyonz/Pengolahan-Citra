function [diameter, x1, y1, x2, y2] = peroleh_diameter(BW)
% PEROLEH_DIAMETER Digunakan untuk menghitung panjang objek
% pada citra BW (citra biner).
% Hasil:
% diameter : panjang objek
% x1, y1, x2, y2 : menyatakan dua titik yang
% mewakili panjang tersebut

U = get_contour(BW);
n = length(U);
jarak_maks = 0;
piksel1 = 0;
piksel2 = 0;

for p = 1 : n-1
    for q = p+1 : n
        jarak = sqrt((U(p,1) - U(q,1))^2 + (U(p,2) - U(q,2))^2);
        
        if jarak > jarak_maks
            jarak_maks = jarak;
            piksel1 = p;
            piksel2 = q;
        end
    end
end

y1 = U(piksel1, 1);
x1 = U(piksel1, 2);
y2 = U(piksel2, 1);
x2 = U(piksel2, 2);
diameter = jarak_maks;