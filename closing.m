function G = closing (F, H)
% CLOSING Melakukan operasi opening.
G = erosi(dilasi(F, H), H);
