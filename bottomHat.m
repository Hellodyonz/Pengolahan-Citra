function bottomHatImage = bottomHat(originalImage, kernelSize)
% BOTTOMHAT Operasi Bottom-Hat pada gambar
% 
% bottomHatImage = bottomHat(originalImage, kernelSize)
% 
% Masukan:
%   originalImage  = gambar asli dalam format grayscale
%   kernelSize     = ukuran kernel, ganjil (contoh: 3, 5, 7)
% Keluaran:
%   bottomHatImage = gambar yang sudah dikenakan operasi Bottom-Hat

% Buat kernel structuring element (sesuai dengan kernel Top-Hat)
kernel = strel('square', kernelSize);

% Lakukan operasi Bottom-Hat
bottomHatImage = imbothat(originalImage, kernel);
end