function G = twirl(F)
dimensi = size(F);
tinggi = dimensi(1);
lebar = dimensi(2);
xc = round(lebar / 2);
yc = round(tinggi / 2);
alpha = 45 * pi / 180;
rmaks = 0.25 * sqrt(xc^2 + yc ^ 2); 
for y=1 : tinggi
    for x=1 : lebar
    r = sqrt((x-xc)^2+(y-yc)^2);
    beta = atan2(y-yc, x-xc) + ...
           alpha * (rmaks - r) / rmaks;
    x2 = xc + r * cos(beta);
    y2 = yc + r * sin(beta);
    if (x2>=1) && (x2<=lebar) && ...
       (y2>=1) && (y2<=tinggi)
     
       p = floor(y2);
       q = floor(x2);
       a = y2-p;
       b = x2-q;
       if (floor(x2)==lebar) || ...
          (floor(y2) == tinggi)
          G(y, x) = F(floor(y2), floor(x2));
       else
          intensitas = (1-a)*((1-b)*F(p,q) + ...
          b * F(p, q+1)) + ...
          a *((1-b)* F(p+1, q) + ...
          b * F(p+1, q+1));
          G(y, x) = intensitas;
       end
    else
       G(y, x) = 0;
    end
  end
end
G = uint8(G);
