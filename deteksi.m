function [G] = deteksi(F, H, potong, pembulatan)
% DETEKSI Melakukan operasi korelasi kernel H dengan citra F
% H harus mempunyai tinggi dan lebar ganjil
% Argumen potong bersifat opsional. Apabila
% bernilai true, bagian citra yang tidak diproses
% akan dipotong. Bawaan = false
% Argumen pembulatan bersifat opsional.
% Apabila bernilai true, pembulatan dengan uint8
% tidak dilakukan. Bawaan = true
%
% Hasil: citra G

if nargin < 3
    potong = false;
end

if nargin < 4
    pembulatan = true;
end

[tinggi_f, lebar_f] = size(F);
[tinggi_h, lebar_h] = size(H);

if rem(lebar_h, 2) == 0 || rem(tinggi_h, 2) == 0
    disp('Lebar dan tinggi H harus ganjil');
    return;
end

m2 = floor(tinggi_h/2);
n2 = floor(lebar_h/2);

% Menentukan ukuran hasil beserta penentu ofset koordinat
if potong == true
    sisi_m2 = m2;
    sisi_n2 = n2;
    G = zeros(tinggi_f - 2 * m2, lebar_f - 2 * n2);
else
    sisi_m2 = 0;
    sisi_n2 = 0;
    G = zeros(size(F));
end

F2 = double(F);
for y = m2 + 1 : tinggi_f - m2
    for x = n2 + 1 : lebar_f - n2
        % Pelaksanaan korelasi F(baris, kolom)
        jum = 0;
        for p = -m2 : m2
            for q = -n2 : n2
                jum = jum + H(p + m2 + 1, q + n2 + 1) * F2(y + p, x + q);
            end
        end
        G(y - sisi_m2, x - sisi_n2) = jum;
    end
end

if pembulatan == true
    G = uint8(G);
end