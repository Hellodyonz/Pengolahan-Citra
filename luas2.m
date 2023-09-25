function hasil = luas2(BW)
% LUAS2 Untuk menghitung luas citra BW (citra biner)
% melalui kode rantai
[tinggi, lebar] = size(BW);
U = inbound_tracing(BW);
kode_rantai = chain_code(U);
hasil = 0;
for p=1: length(kode_rantai)
 kode = kode_rantai(p);
 y = tinggi + 1 -U(p);

 switch kode
 case '0'
 hasil = hasil + y;
 case '1'
 hasil = hasil + y + 0.5;
 case '3'
 hasil = hasil - y - 0.5;
 case '4'
 hasil = hasil - y;
 case '5'
 hasil = hasil - y + 0.5;
 case {'2','6'}
 hasil = hasil ;
 case '7'
 hasil = hasil + y - 0.5;
 end
end
