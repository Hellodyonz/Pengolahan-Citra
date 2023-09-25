function [hasil] = normomen(F, p, q)
% NORMOMEN Menghitung moment pusat ternormalisasi.
% Masukan: F = Citra biner.
% p dan q = orde momen.
F = double(F);
m00 = momen_spasial(F, 0, 0);
normalisasi = m00 ^ ((p+q+2)/2.0);
hasil = momen_pusat(F, p, q) / normalisasi;