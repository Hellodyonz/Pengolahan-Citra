function dbfitur()

    % Citra yang akan menjadi acuan
    Citra{1} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 1.png';
    Citra{2} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 2.png';
    Citra{3} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 3.png';
    Citra{4} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 4.png';
    Citra{5} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 5.png';
    Citra{6} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 6.png';
    Citra{7} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 7.png';
    Citra{8} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 8.png';
    Citra{9} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 9.png';
    Citra{10} = 'D:/GDSC/Citra Digital/UAS/botol/Frame 10.png';

    % Proses menghitung momen Zernike
    Fitur = [];
    for i = 1:length(Citra)
        disp(sprintf('Menghitung fitur citra %s', Citra{i}));
        Image = im2bw(imread(Citra{i}), 0.5);
        Z.momen = zermoment(Image, 10, false);
        [xc, yc] = centroid(Image); % Menghitung centroid
        Z.centroid = [xc, yc]; % Menyimpan nilai centroid
        Z.nama = Citra{i};
        Fitur(i).momen = Z.momen;
        Fitur(i).centroid = Z.centroid;
        Fitur(i).nama = Z.nama;
    end

    % Simpan ke file dbfitur.mat
    save('dbfitur', 'Fitur');
    clear Citra Fitur;

end
