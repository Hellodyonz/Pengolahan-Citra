function [GLCM] = glcm(F, jarak)
% GLCM Menghasilkan fitur GLCM.
% Masukan: F = Citra berskala keabuan
%          jarak = jarak antar piksel dalam GLCM
% Keluaran: GLCM = fitur GLCM untuk sudut 0 derajat.

[tinggi, lebar] = size(F);

% Bentuk GLCM
num_levels = 256;
GLCM = zeros(num_levels, num_levels);

for y = 1:tinggi
    for x = 1:lebar
        center_pixel = F(y, x);
        
        % Loop untuk mengambil tetangga pada jarak tertentu
        for dy = -jarak:jarak
            for dx = -jarak:jarak
                if (y+dy >= 1 && y+dy <= tinggi && x+dx >= 1 && x+dx <= lebar)
                    neighbor_pixel = F(y+dy, x+dx);
                    GLCM(center_pixel+1, neighbor_pixel+1) = GLCM(center_pixel+1, neighbor_pixel+1) + 1;
                end
            end
        end
    end
end

% Normalisasi GLCM
GLCM = GLCM / sum(GLCM(:));

end


