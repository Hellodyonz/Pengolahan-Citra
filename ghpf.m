function output = GHPF(input, D0, n)
% GHPF : Generalized High Pass Filter
% ================================================================
% output = GHPF(input, D0, n)
% This function performs frequency domain filtering on input image
% using the Generalized High Pass Filter
%
% INPUTS
% ================================================================
% input : input image
% D0 : cutoff frequency of the filter
% n : order of the filter
%
% OUTPUTS
% ================================================================
% output : filtered image
%
% EXAMPLE
% ================================================================
% output = GHPF(input, 50, 2);
%

% Step 1: Convert input image to double precision and grayscale
input = im2double(rgb2gray(input));

% Step 2: Determine the size of the input image and generate meshgrid
[M, N] = size(input);
[U, V] = meshgrid(1:N, 1:M);

% Step 3: Calculate the distance of each point in the meshgrid from the center
D = sqrt((U - N/2).^2 + (V - M/2).^2);

% Step 4: Calculate the filter
H = 1 - exp(-(D.^2)./(2*(D0^2)));
H = 1./(1 + (H./max(max(H))).^(2*n));

% Step 5: Apply the filter in frequency domain
F = fftshift(fft2(input));
G = F.*H;
output = real(ifft2(ifftshift(G)));

% Step 6: Convert the output to uint8 and rescale to the range [0, 255]
output = uint8(255*mat2gray(output));
end
