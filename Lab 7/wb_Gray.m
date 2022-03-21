function I = wb_gray(img , s)

switch s
    case 'rggb'
        Rm = mean(mean(img(1:2:end,1:2:end)));
        Gm = mean(mean(img(2:2:end,1:2:end)));
        Bm = mean(mean(img(2:2:end,2:2:end)));


        wbmults(1) = Gm/Rm;
        wbmults(2) = Gm/Gm;
        wbmults(3) = Gm/Bm;
        colormask  = wbmults(2)*ones(size(img));
        
        colormask(1:2:end,1:2:end) = wbmults(1); %r
        colormask(2:2:end,2:2:end) = wbmults(3); %b
    case  'bggr'
        Rm = mean(mean(img(2:2:end,2:2:end)));
        Gm = mean(mean(img(2:2:end,1:2:end)));
        Bm = mean(mean(img(1:2:end,1:2:end)));


        wbmults(1) = Rm/Gm;
        wbmults(2) = Gm/Gm;
        wbmults(3) = Bm/Gm;
        colormask  = wbmults(2)*ones(size(img));

        colormask(2:2:end,2:2:end) = wbmults(1); %r
        colormask(1:2:end,1:2:end) = wbmults(3); %b 
    case 'grbg'
        Rm = mean(mean(img(1:2:end,2:2:end)));
        Gm = mean(mean(img(1:2:end,1:2:end)));
        Bm = mean(mean(img(1:2:end,2:2:end)));


        wbmults(1) = Rm/Gm;
        wbmults(2) = Gm/Gm;
        wbmults(3) = Bm/Gm;
        colormask  = wbmults(2)*ones(size(img));

        colormask(1:2:end,2:2:end) = wbmults(1); %r
        colormask(1:2:end,2:2:end) = wbmults(3); %b
    case  'gbrg'
        Rm = mean(mean(img(2:2:end,1:2:end)));
        Gm = mean(mean(img(1:2:end,1:2:end)));
        Bm = mean(mean(img(1:2:end,2:2:end)));


        wbmults(1) = Rm/Gm;
        wbmults(2) = Gm/Gm;
        wbmults(3) = Bm/Gm;
        colormask  = wbmults(2)*ones(size(img));

        colormask(2:2:end,1:2:end) = wbmults(1); %r
        colormask(1:2:end,2:2:end) = wbmults(3); %b
end
I = colormask.*img;
end