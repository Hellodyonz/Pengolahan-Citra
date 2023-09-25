function [G] = dreksponensial_image(F, lambda)
% DREKSPOSENSIAL_IMAGE Menghasilkan citra yang telah ditambahi derau eksponensial.
%
% F = Citra input
% lambda = Parameter lambda dari distribusi eksponensial

[m, n, ~] = size(F);
noise = exprnd(lambda, m, n); % Matriks derau eksponensial
G = double(F) + noise;
G = uint8(max(0, min(G, 255))); % Batasi nilai citra ke rentang [0, 255]

end
