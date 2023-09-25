function G = gopening(F, H)
% GOPENING berguna untuk melaksanakan operasi opening
% citra beraras keabuan
% Masukan:
% F = citra yang akan dikenai erosi
% H = elemen pentruksur
G = gdilasi(gerosi(F, H), H);
