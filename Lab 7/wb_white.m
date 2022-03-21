function I = wb_white(img, s)
switch s
    case 'rggb'
        Rm = max(max(img(1:2:end,1:2:end)));
        Gm = max(max(img(2:2:end,1:2:end)));
        Bm = max(max(img(2:2:end,2:2:end)));


        wbmults(1) = Gm/Rm;
        wbmults(2) = Gm/Gm;
        wbmults(3) = Gm/Bm;
        colormask  = wbmults(2)*ones(size(img));
        
        colormask(1:2:end,1:2:end) = wbmults(1); %r
        colormask(2:2:end,2:2:end) = wbmults(3); %b
    case  'bggr'
        Rm = max(max(img(2:2:end,2:2:end)));
        Gm = max(max(img(2:2:end,1:2:end)));
        Bm = max(max(img(1:2:end,1:2:end)));


        wbmults(1) = Rm/Gm;
        wbmults(2) = Gm/Gm;
        wbmults(1) = Bm/Gm;
        colormask  = wbmults(2)*ones(m,n);

        colormask(2:2:end,2:2:end) = wbmults(1); %r
        colormask(1:2:end,1:2:end) = wbmults(3); %b 
    case 'grbg'
        Rm = max(max(img(1:2:end,2:2:end)));
        Gm = max(max(img(1:2:end,1:2:end)));
        Bm = max(max(img(1:2:end,2:2:end)));


        wbmults(1) = Rm/Gm;
        wbmults(2) = Gm/Gm;
        wbmults(1) = Bm/Gm;
        colormask  = wbmults(2)*ones(m,n);

        colormask(1:2:end,2:2:end) = wbmults(1); %r
        colormask(1:2:end,2:2:end) = wbmults(3); %b
    case  'gbrg'
        Rm = max(max(img(2:2:end,1:2:end)));
        Gm = max(max(img(1:2:end,1:2:end)));
        Bm = max(max(img(1:2:end,2:2:end)));


        wbmults(1) = Rm/Gm;
        wbmults(2) = Gm/Gm;
        wbmults(1) = Bm/Gm;
        colormask  = wbmults(2)*ones(m,n);

        colormask(2:2:end,1:2:end) = wbmults(1); %r
        colormask(1:2:end,2:2:end) = wbmults(3); %b
end
I = colormask.*img;

end