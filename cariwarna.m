function [Hasil] = cariwarna(warna, lokdir)
% CARIWARNA Digunakan untuk mencari gambar yang berada
% pada folder lokdir
% dan memiliki warna dominan sesuai
% dengan argumen warna
% Keluaran:
% Hasil = berisi nama-nama warna yang dicari
if (strcmp(warna,'merah')) || ...
 (strcmp(warna,'biru')) || ...
 (strcmp(warna,'cyan')) || ...
 (strcmp(warna,'hijau')) || ...
 (strcmp(warna,'magenta')) || ...
 (strcmp(warna,'jingga')) || ...
 (strcmp(warna,'merah muda')) || ...
 (strcmp(warna,'ungu')) || ...
 (strcmp(warna,'putih')) || ...
 (strcmp(warna,'hitam')) || ...
 (strcmp(warna,'abu-abu')) || ...
 (strcmp(warna,'kuning'))
 disp('Tunggu...');
else
 disp(['Untuk sementara warna yang bisa dipakai: '...
 'merah, biru, cyan, hijau, magenta, jingga, ' ...
 'merah muda, ungu, ' ...
 'putih hitam abu-abu kuning']);
 return;
end
berkas = dir(lokdir);
jum=0;
indeks=0;
for i=3:length(berkas)
    nama_file = sprintf('%s/%s',lokdir, berkas(i).name);
 disp(berkas(i).name);
 Img = imread(nama_file);
 [tinggi, lebar, dim] = size(Img);

 % Mengantisipasi warna hitam, putih, dan abu-abu
 % yang homogen dan selalu dianggap
 % berdimensi satu pada Octave
 if dim == 1
 Img(:,:,2) = Img(:,:,1);
 Img(:,:,3) = Img(:,:,1);
 end

 % Konversi ke HVS
 [H,S,V] = RGBkeHSV(Img(:,:,1),Img(:,:,2),Img(:,:,3));

 H = double(H);
 S = double(S);
 V = double(V);

 mem_val = 0.0;

 anggota_merah = 0.0;
 anggota_biru = 0.0;
 anggota_cyan = 0.0;
 anggota_hijau = 0.0;
 anggota_magenta = 0.0;
 anggota_oranye = 0.0;
 anggota_pink = 0.0;
 anggota_ungu = 0.0;
 anggota_putih = 0.0;
 anggota_hitam = 0.0;
 anggota_abu_abu = 0.0;
 anggota_kuning = 0.0;

 for y=1: tinggi
 for x=1: lebar
 h = H(y,x);
 s = S(y,x);
 v = V(y,x);

 mem_val = f_red(h,s,v);
 if mem_val > 0
 anggota_merah = anggota_merah + mem_val;
 end

 mem_val = f_blue(h,s,v);
 if mem_val > 0
 anggota_biru = anggota_biru + mem_val;
 end

 mem_val = f_cyan(h,s,v);
 if mem_val > 0
 anggota_cyan = anggota_cyan + mem_val;
 end

 mem_val = f_green(h,s,v);
 if mem_val > 0
 anggota_hijau = anggota_hijau + mem_val;
 end
 mem_val = f_magenta(h,s,v);
 if mem_val > 0
 anggota_magenta = anggota_magenta + mem_val;
 end
 mem_val = f_orange(h,s,v);
 if mem_val > 0
 anggota_oranye = anggota_oranye + mem_val;
 end
 mem_val = f_yellow(h,s,v);
 if mem_val > 0
 anggota_kuning = anggota_kuning + mem_val;
 end
 mem_val = f_pink(h,s,v);
 if mem_val > 0
 anggota_pink = anggota_pink + mem_val;
 end
 mem_val = f_purple(h,s,v);
 if mem_val > 0
 anggota_ungu = anggota_ungu + mem_val;
 end

 mem_val = f_white(h,s,v);
 if mem_val > 0
 anggota_putih = anggota_putih + mem_val;
 end
 mem_val = f_black(h,s,v);
 if mem_val > 0
 anggota_hitam = anggota_hitam + mem_val;
 end
 mem_val = f_gray(h,s,v);
 if mem_val > 0
 anggota_abu_abu = anggota_abu_abu + mem_val;
 end
 end
 end

 maks = max( ...
 [anggota_merah anggota_biru anggota_cyan anggota_hijau ...
 anggota_magenta anggota_oranye anggota_pink ...
 anggota_ungu anggota_putih anggota_abu_abu ...
 anggota_hitam anggota_kuning]);

 % Memperoleh hasil yang memenuhi warna permintaan

 if strcmp(warna,'merah')
 if maks == anggota_merah
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_merah;
 end
 elseif strcmp(warna,'biru')
     if maks == anggota_biru
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_biru;
 end
 elseif strcmp(warna,'cyan')
 if maks == anggota_cyan
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_cyan;
 end
 elseif strcmp(warna,'hijau')
 if maks == anggota_hijau
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_hijau;
 end
 elseif strcmp(warna,'magenta')
 if maks == anggota_magenta
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_magenta;
 end
 elseif strcmp(warna,'jingga')
 if maks == anggota_oranye
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_oranye;
 end
 elseif strcmp(warna,'pink')
 if maks == anggota_pink
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_pink;
 end
 elseif strcmp(warna,'ungu')
 if maks == anggota_ungu
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_ungu;
 end
 elseif strcmp(warna,'putih')
 if maks == anggota_putih
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_putih;
 end
 elseif strcmp(warna,'hitam')
 if maks == anggota_hitam
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_hitam;
 end
 elseif strcmp(warna,'abu-abu')
 if maks == anggota_abu_abu
 jum = jum +1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_abu_abu;
 end 
 elseif strcmp(warna,'yellow')
 if maks == anggota_kuning
 jum = jum + 1 ;
 Hasil{jum}.nama = nama_file;
 Hasil{jum}.bobot = anggota_kuning;
 end
 end
end
% Lakukan pengurutan secara descending
for p = 2: jum
 x = Hasil{p};
 % Sisipkan x ke dalam data[1..p-1]
 q = p - 1;
 ketemu = 0;
 while ((q >= 1) && (~ketemu))
 if (x.bobot > Hasil{q}.bobot)
 Hasil{q+1} = Hasil{q};
 q = q - 1;
 else
 ketemu = 1;
 end
 Hasil{q+1} = x;
 end
end
% Menampilkan maksimum 24 warna
if jum>24
 jum = 24;
end
if jum >= 20
 m=5; n=5;
else
 if jum>=16
 m=5; n=4;
 else
 m=4; n=4;
 end
end
if jum>0
 close;
 figure(1);
 for i=1:jum
 % Tampilkan citra dan nama depan file
 nama = Hasil{i}.nama;
 subplot(m,n,i);
 Citra = imread(nama);
 imshow(Citra);
 [pathstr, name, ext] = fileparts(nama);
 title([name ext]);
 end
end
return
% -----------------------------------------
% Bagian untuk menghitung keanggotaan fuzzy
% -----------------------------------------
function derajat=f_red(h, s, v)
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_segitiga_kanan(0,21, h) + ...
 f_segitiga_kiri(234,255, h);
 end
function derajat=f_green(h, s, v)
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_trapesium(43,65,105,128, h);
 end;
function derajat=f_yellow(h, s,v)
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_segitiga(21,43, 65, h);
 end
function derajat=f_blue(h, s,v )
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_trapesium(128,155,180,191, h);
 end;
function derajat=f_purple(h,s,v)
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_segitiga(180,191,213, h);
 end
function derajat=f_cyan(h,s,v)
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_segitiga(105,128,155, h);
 end;
function derajat=f_orange(h,s,v)
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_segitiga(0,21,43, h);
 end;
function derajat=f_magenta(h,s,v)
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_segitiga(191,213,234, h);
 end
function derajat=f_pink(h,s,v)
 if (h==0) && (s==0)
 derajat = 0.0;
 else
 derajat = f_segitiga(213,234,255, h);
 end;
function derajat=f_white(h, s,v )
 if (s <= 10) && (v>=250)
 derajat = 1.0;
 else
 derajat = 0.0;
 end;
function derajat=f_gray(h, s,v )
 if (h==0) && (s==0) && (v>=15) && (v<250)
 derajat = 1.0;
 else
 derajat = 0.0;
 end;
function derajat=f_black(h, s,v )
 if (h==0) && (s==0) && (v<15)
 derajat = 1.0;
 else
 derajat = 0.0;
 end;
function derajat=f_trapesium(a,b,c,d,h)
 if (h>a) && (h<b)
 derajat = (h-a)/(b-a);
 else
 if (h>c) && (h<d)
 derajat = (d-h)/(d-c);
 else
 if (h>=b) && (h<=c)
 derajat = 1.0;
 else
 derajat = 0.0;
 end
 end
 end
function derajat=f_segitiga(a,b,c,h)
if h==b
 derajat = 1.0;
else
 if (h>a) && (h<b)
 derajat = (h-a)/(b-a);
 else
 if (h>b) && (h<c)
 derajat = (c-h)/(c-b);
 else
     derajat = 0.0;
 end
 end
end
function derajat=f_segitiga_kiri(a,b,h)
if h==b
 derajat=1.0;
else
 if (h>a) && (h<b)
 derajat = (h-a)/(b-a);
 else
 derajat = 0.0;
 end
end
function derajat=f_segitiga_kanan(a,b,h)
if h==a
 derajat=1.0;
else
 if (h>a) && (h<b)
 derajat = (b-h)/(b-a);
 else
 derajat = 0.0;
 end
end
