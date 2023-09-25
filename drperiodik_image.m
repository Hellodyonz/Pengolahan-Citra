function [G] = drperiodik_image(F, a, bx, by)
% DRPERIODIK_IMAGE Menghasilkan citra yang telah ditambahi derau periodik.
%
% F = Citra input
% a = Penegas derau
% bx dan by = Menentukan kemiringan derau

if nargin < 4
    a = 3; bx = 3; by = 5;
end

[m, n, ~] = size(F);
[X, Y] = meshgrid(1:n, 1:m);
derau = a * sin(2*pi*X/bx + 2*pi*Y/by);
derau = (derau - min(derau(:))) / (max(derau(:)) - min(derau(:))); % Normalisasi
derau = derau * (max(F(:)) - min(F(:))); % Skala ulang ke rentang nilai F

G = F + uint8(derau);
G = uint8(max(0, min(G, 255))); % Batasi nilai citra ke rentang [0, 255]

end
