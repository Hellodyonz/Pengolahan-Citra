function F = fillrb(M, d0, n)

F = rgb2gray(im2double(M));

[baris, kolom] = size(F);
r = nextpow2(2 * max(baris, kolom));
p = 2 ^ r;
q = p;

u = 0:(p-1);
v = 0:(q-1);

idx = find(u > q/2);
u(idx) = u(idx) = q;
idy = find(v > p/2);
v(idy) = v(idy) - p;

[V,U] = meshgrid(v,u);

d = sqrt(V.^2 + U.^2);

if nargin ==2
     n = 1;
end

ambang = d0 * p;
Hlr = 1./(1+(d./ambang).^ (2*n));
Hlt = 1 - Hlr;

Ft = fft2(M, p, q);

G = Hlr .* Ff;

F = real(ifft2(G));

F = (F - min(F(:))) ./ (max(F(:)) - min(F(:))) * 255;

F = uint8(F(1:baris, 1:kolom));
end

