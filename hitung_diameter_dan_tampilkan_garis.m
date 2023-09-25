function diameter = hitung_diameter_dan_tampilkan_garis(citra_tepi)
    % Menghitung diameter tepi biner dan menampilkan garis diameter pada citra
    
    % Menghitung kontur dari citra tepi
    kontur = bwboundaries(citra_tepi);
    kontur = kontur{1}; % Mengambil kontur pertama (asumsikan hanya ada satu objek)
    
    % Menghitung jarak antara setiap pasangan titik pada kontur
    jarak = pdist2(kontur, kontur);
    
    % Mencari titik awal dan titik akhir dengan jarak terjauh
    [~, indeks_max] = max(jarak(:));
    [indeks_piksel1, indeks_piksel2] = ind2sub(size(jarak), indeks_max);
    
    % Mendapatkan koordinat titik awal dan titik akhir
    piksel1 = kontur(indeks_piksel1, :);
    piksel2 = kontur(indeks_piksel2, :);
    
    % Menghitung jarak antara titik awal dan titik akhir
    diameter = sqrt(sum((piksel1 - piksel2).^2));
    
    % Menampilkan garis diameter pada citra tepi
    figure;
    imshow(citra_tepi);
    hold on;
    plot(kontur(:, 2), kontur(:, 1), 'g', 'LineWidth', 1); % Tampilkan kontur
    plot([piksel1(2), piksel2(2)], [piksel1(1), piksel2(1)], 'r', 'LineWidth', 2); % Tampilkan garis diameter
    hold off;
    title(['Citra Tepi dengan Diameter: ', num2str(diameter)]);
end
