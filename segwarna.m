function [RGB] = segwarna(nama_file)
    % SEGWARNA Digunakan untuk melakukan segmentasi citra
    % berdasarkan warna
    % F = citra berwarna
    % Keluaran:
    % G = citra berwarna yang telah disegmentasi
    Img = imread(nama_file);
    [tinggi, lebar, dim] = size(Img);
    if dim < 3
        error('Masukan harus berupa citra berwarna');
    end
    % Konversi ke HSL
    [H, S, L] = RGBkeHSL(Img(:,:,1), Img(:,:,2), Img(:,:,3));

    H_new = H;
    S_new = S;
    L_new = L;

    % Ubah ukuran matriks H, S, L sesuai dengan ukuran citra
    H_new = imresize(H_new, [tinggi, lebar]);
    S_new = imresize(S_new, [tinggi, lebar]);
    L_new = imresize(L_new, [tinggi, lebar]);

    for y = 1: tinggi
        for x = 1: lebar
            h = H_new(y, x);

            % Ubah warna
            if h < 11
                h = 0;
            elseif h < 32
                h = 21;
            elseif h < 54
                h = 43;
            elseif h < 116
                h = 85;
            elseif h < 141
                h = 128;
            elseif h < 185
                h = 170;
            elseif h < 202
                h = 191;
            elseif h < 223
                h = 213;
            elseif h < 244
                h = 234;
            else
                h = 0;
            end

            % Ubah komponen H
            H_new(y, x) = h;

            % Ubah komponen S
            if S_new(y, x) >= 200
                S_new(y, x) = 255;
            elseif S_new(y, x) <= 20
                S_new(y, x) = 0;
            else
                S_new(y, x) = 128;
            end

            % Ubah komponen L
            if L_new(y, x) >= 200
                L_new(y, x) = 255;
            elseif L_new(y, x) <= 20
                L_new(y, x) = 0;
            else
                L_new(y, x) = 128;
            end
        end
    end

    [R, G, B] = HSLkeRGB(H_new, S_new, L_new);
    RGB = cat(3, R, G, B);
end
