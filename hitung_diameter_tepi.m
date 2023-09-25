function [diameter, x1, y1, x2, y2] = hitung_diameter_tepi(citra_tepi)
    % Mencari titik awal diameter
    [baris, kolom] = find(citra_tepi);
    x1 = kolom(1);
    y1 = baris(1);
    
    % Mencari titik akhir diameter
    jarak_maks = 0;
    for i = 1:numel(baris)
        jarak = sqrt((kolom(i) - x1)^2 + (baris(i) - y1)^2);
        if jarak > jarak_maks
            jarak_maks = jarak;
            x2 = kolom(i);
            y2 = baris(i);
        end
    end
    
    % Menghitung diameter
    diameter = jarak_maks;
end
