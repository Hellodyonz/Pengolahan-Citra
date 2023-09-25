function G = cerminh(F)
% CERMINH Berfungsi untuk mencerminkan citra
% secara horizontal
% Masukan: F = Citra berwarna
[tinggi, lebar, dimensi] = size(F);
G = uint8(zeros(size(F)));
for d = 1:dimensi
    for y = 1:tinggi
        for x = 1:lebar
            x2 = lebar - x + 1;
            y2 = y;
            G(y, x, d) = F(y2, x2, d);
        end
    end
end
end