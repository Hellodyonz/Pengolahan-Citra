function signature = createSignature(image)
    % Konversi citra menjadi citra biner
    binaryImage = imbinarize(image);

    % Temukan kontur tanda tangan
    contour = bwboundaries(binaryImage);
    contour = contour{1}; % Ambil kontur pertama

    % Pusatkan kontur di titik pusat massa
    centroid = mean(contour);
    centeredContour = contour - centroid;

    % Interpolasi kontur untuk jumlah titik yang konsisten
    interpolatedContour = interpolateContour(centeredContour, 100);

    % Hitung transformasi Fourier dari koordinat x dan y kontur
    x = interpolatedContour(:, 2);
    y = interpolatedContour(:, 1);
    fourierX = fft(x);
    fourierY = fft(y);

    % Ambil spektrum frekuensi
    spectrumX = abs(fourierX);
    spectrumY = abs(fourierY);

    % Tentukan koefisien Fourier yang relevan
    numCoefficients = 20; % Jumlah koefisien Fourier yang digunakan
    relevantCoefficientsX = spectrumX(1:numCoefficients);
    relevantCoefficientsY = spectrumY(1:numCoefficients);

    % Normalisasi terhadap penyekalaan
    normalizedCoefficientsX = normalizeCoefficients(relevantCoefficientsX);
    normalizedCoefficientsY = normalizeCoefficients(relevantCoefficientsY);

    % Normalisasi terhadap rotasi
    normalizedCoefficientsX = normalizePhase(normalizedCoefficientsX);
    normalizedCoefficientsY = normalizePhase(normalizedCoefficientsY);

    % Gabungkan koefisien Fourier menjadi representasi tanda tangan
    signature = [normalizedCoefficientsX, normalizedCoefficientsY];
end

function interpolatedContour = interpolateContour(contour, numPoints)
    % Hitung jumlah titik pada kontur
    numContourPoints = size(contour, 1);

    % Lakukan interpolasi linear untuk jumlah titik yang konsisten
    t = linspace(0, 1, numPoints);
    interpolatedContour(:, 1) = interp1(1:numContourPoints, contour(:, 1), t);
    interpolatedContour(:, 2) = interp1(1:numContourPoints, contour(:, 2), t);
end

function normalizedCoefficients = normalizeCoefficients(coefficients)
    % Lakukan normalisasi terhadap penyekalaan
    normalizedCoefficients = coefficients / coefficients(1);
end

function normalizedCoefficients = normalizePhase(coefficients)
    % Lakukan normalisasi terhadap rotasi
    normalizedCoefficients = abs(coefficients);
end
