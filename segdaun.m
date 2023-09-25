function [processed_image] = segdaun(input_image)
    % SEGDAUN Contoh eksperimen untuk memisahkan daun
    % yang dipotret dengan latarbelakang putih
    % tetapi pencahayaan tidak sempurna

    G = imread(input_image);
    subplot(1, 3, 1);
    imshow(G);
    title('Gambar Asli');

    G = segwarna(input_image);
    subplot(1, 3, 2);
    imshow(G);
    title('Gambar Setelah Segmentasi Warna');

    H = G;
    [m, n, ~] = size(H);
    for i = 1:m
        for j = 1:n
            % Buang warna abu-abu
            if H(i, j, 1) == 128 && H(i, j, 2) == 128 && H(i, j, 3) == 128
                H(i, j, 1) = 255;
                H(i, j, 2) = 255;
                H(i, j, 3) = 255;
            end
            % Buang warna hitam
            if H(i, j, 1) == 0 && H(i, j, 2) == 0 && H(i, j, 3) == 0
                H(i, j, 1) = 255;
                H(i, j, 2) = 255;
                H(i, j, 3) = 255;
            end
        end
    end
    subplot(1, 3, 3);
    imshow(H);
    title('Gambar Setelah Penyaringan Warna');

    processed_image = H;
end
