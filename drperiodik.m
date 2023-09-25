function [G] = drperiodik(F, a, bx, by)
% DRPERIODIK Menghasilkan citra yang telah ditambahi
% derau periodik.
%
% F = Citra berskala keabuan
% a = penegas derau
% bx dan by = menentukan kemiringan derau

if nargin < 4
    a = 3; bx = 3; by = 5;
end

[m, n] = size(F);
[X, Y] = meshgrid(1:n, 1:m);
derau = a * sin(2*pi*X/bx + 2*pi*Y/by);
G = uint8(double(F) + derau);

end
