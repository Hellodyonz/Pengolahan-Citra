function noisyImage = addExponentialNoise(image, lambda)
    % Menghasilkan derau eksponensial dengan parameter lambda pada gambar input
    
    % Mengonversi gambar ke tipe data double
    image = im2double(image);
    
    % Menghasilkan derau dengan distribusi eksponensial
    noise = -log(1 - rand(size(image))) / lambda;
    
    % Menambahkan derau ke gambar
    noisyImage = image + noise;
    
    % Memastikan nilai pixel tetap dalam rentang [0, 1]
    noisyImage = max(0, min(noisyImage, 1));
end