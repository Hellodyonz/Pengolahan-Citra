function [G] = drimpuls(F, probabilitas)
% DRIMPULS Menghasilkan citra yang telah diberi derau
% menggunakan fungsi impuls.
% F = citra berskala keabuan
% probabilitas = Probabilitas kemunculan derau
% (0 s/d 1)
if nargin < 2
 probabilitas = 0.05; % Nilai bawaan
end;
if probabilitas < 0 || probabilitas > 1
 error('Nilai probabilitas harus antara 0 s/d 1');
end
[m, n] = size(F);
G = double(F);
for i=1 : m
 for j=1 : n
 nilai_acak = rand;

 if nilai_acak <= probabilitas / 2
 G(i,j) = 0;
 elseif (nilai_acak > probabilitas / 2) && ...
 (nilai_acak <= probabilitas)
 G(i,j) = 255;
 end
 end
 end
G = uint8(G);