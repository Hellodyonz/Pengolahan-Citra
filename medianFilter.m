function denoisedImage = medianFilter(image, windowSize)
    % Menerapkan filter median pada gambar input untuk menghilangkan derau garam dan merica
    
    % Mengkonversi gambar ke tipe data double
    image = im2double(image);
    
    % Mendapatkan ukuran gambar
    [rows, cols] = size(image);
    
    % Menginisialisasi gambar hasil dengan nilai nol
    denoisedImage = zeros(rows, cols);
    
    % Mendefinisikan ukuran jendela
    halfWindowSize = floor(windowSize / 2);
    
    % Melakukan filter median pada setiap piksel dalam gambar
    for i = 1:rows
        for j = 1:cols
            % Mendapatkan piksel dan sekitarnya dalam jendela
            rowStart = max(1, i - halfWindowSize);
            rowEnd = min(rows, i + halfWindowSize);
            colStart = max(1, j - halfWindowSize);
            colEnd = min(cols, j + halfWindowSize);
            window = image(rowStart:rowEnd, colStart:colEnd);
            
            % Mengambil nilai median dari jendela dan menetapkan ke piksel hasil
            denoisedImage(i, j) = median(window(:));
        end
    end
    
    % Mengonversi gambar hasil kembali ke tipe data asli
    denoisedImage = im2uint8(denoisedImage);
end
