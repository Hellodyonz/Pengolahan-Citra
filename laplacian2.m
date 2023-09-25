function [G] = laplacian2(F)
% LAPALACIAN2 Pemerolehan tepi objek pada citra F
% melalui operator Laplacian #1
% Hasil: citra G
[m, n] = size(F);
G=zeros(m,n); % Semua berisi nol
F=double(F);
for y=2 : m-1
 for x=2 : n-1
 G(y, x) = 8 * F(y,x) - ...
 (F(y-1,x)+ F(y,x-1)+F(y,x+1)+F(y+1,x) + ...
 F(y-1,x-1)+ F(y-1,x+1)+F(y+1,x-1)+F(y+1,x+1));
end
end
G = uint8(G);
