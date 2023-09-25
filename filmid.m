function G = filmid(F, ukuran)
    % FILMID Melakukan penghilangan derau dengan menggunakan filter titik tengah.
    % F = Citra berskala keabuan
    % ukuran = ukuran jendela
    % G = Citra hasil pemrosesan
    
    if nargin < 2
        ukuran = 3;
    end
    
    [m, n] = size(F);
    setengah = floor(ukuran / 2);
    G = zeros(m-2*setengah, n-2*setengah);
    
    for i = 1+setengah : m-setengah
        for j = 1+setengah : n-setengah
            terkecil = 255;
            terbesar = 0;
            
            for p = -setengah : setengah
                for q = -setengah : setengah
                    if terkecil > F(i+p, j+q)
                        terkecil = F(i+p, j+q);
                    end

                    if terbesar < F(i+p, j+q)
                        terbesar = F(i+p, j+q);
                    end
                end
            end
            
            G(i-setengah, j-setengah) = round((terbesar + terkecil) / 2);
        end
    end
    
    G = uint8(G);
end
