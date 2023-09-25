function hasil = luas(BW)
% LUAS Untuk menghitung luas citra BW (citra biner)
[tinggi, lebar] = size(BW);
hasil = 0;
for p = 1 : tinggi
    for q = 1 : lebar
        if BW(p, q) == 1
            hasil = hasil + 1;
        end
    end
end