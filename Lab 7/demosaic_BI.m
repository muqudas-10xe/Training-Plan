function I  = demosaic_BI(img, s)

switch s
    case 'rggb'
        Rm = interp2(img(1:2:end,1:2:end),'linear');
        Gm = interp2(img(2:2:end,1:2:end),'linear');
        Bm = interp2(img(2:2:end,2:2:end),'linear');
        
        I(:,:,1)    = Rm;
        I(:,:,2)    = Gm;
        I(:,:,3)    = Bm;
        

    case  'bggr'
        Rm = interp2(img(2:2:end,2:2:end),'linear');
        Gm = interp2(img(2:2:end,1:2:end),'linear');
        Bm = interp2(img(1:2:end,1:2:end),'linear');


        I(:,:,1)    = Rm;
        I(:,:,2)    = Gm;
        I(:,:,3)    = Bm;
    case 'grbg'
        Rm = interp2(img(1:2:end,2:2:end),'linear');
        Gm = interp2(img(1:2:end,1:2:end),'linear');
        Bm = interp2(img(1:2:end,2:2:end),'linear');


        I(:,:,1)    = Rm;
        I(:,:,2)    = Gm;
        I(:,:,3)    = Bm;
    case  'gbrg'
        Rm = interp2(img(2:2:end,1:2:end),'linear');
        Gm = interp2(img(1:2:end,1:2:end),'linear');
        Bm = interp2(img(1:2:end,2:2:end),'linear');


        I(:,:,1)    = Rm;
        I(:,:,2)    = Gm;
        I(:,:,3)    = Bm;
end

end