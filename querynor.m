function querynor(berkas)

load dbfitur;
Query = im2bw(imread(berkas), 0.5);
ZQuery = normomen(Query, 1, 0);
Hasil = [];
jumFitur = length(Fitur(1).momen);

for i=1 : length(Fitur)
  nama = Fitur(i).nama;
  jarak = 0;
  for j=1 : jumFitur
    jarak = jarak + abs(ZQuery(j) - Fitur(i).momen(j));
  end
  Hasil(i).nama = Fitur(i).nama;
  Hasil(i).jarak = jarak;
end

jum = length(Hasil);
for p = 2: jum
  x = Hasil(p);
  q = p - 1;
  ketemu = 0;
  while ((q >= 1) && (~ketemu))
    if (x.jarak < Hasil(q).jarak)
      Hasil(q+1) = Hasil(q);
      q = q - 1;
    else
      ketemu = 1;
    end
    Hasil(q+1) = x;
  end
end

disp('Hasil pencocokan dapat dilihat pada jendela gambar');
subplot(3,3,1);
G = imread(berkas); imshow(G);
title('Query');

for i=1 : jum
  subplot(3,3, i+1);
  G = imread(char(Hasil(i).nama)); imshow(G);
  title(num2str(Hasil(i).jarak));
end