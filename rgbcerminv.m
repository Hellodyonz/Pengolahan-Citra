function G = cerminv(F)
% CERMINV Berfungsi untuk mencerminkan citra
% secara vertikal
% Masukan: F = Citra berwarna atau berskala keabuan
[tinggi, lebar, dimensi] = size(F);
if dimensi == 3 % Jika citra berwarna
    G = uint8(zeros(tinggi, lebar, dimensi));
    for y=1 : tinggi
        for x=1 : lebar
            x2 = x;
            y2 = tinggi - y + 1;
            G(y, x, :) = F(y2, x2, :);
        end
    end
else % Jika citra berskala keabuan
    G = uint8(zeros(tinggi, lebar));
    for y=1 : tinggi
        for x=1 : lebar
            x2 = x;
            y2 = tinggi - y + 1;
            G(y, x) = F(y2, x2);
        end
    end
end