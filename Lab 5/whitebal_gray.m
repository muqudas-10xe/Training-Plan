function I = whitebal_gray(img)
I = zeros(size(img));

Rm      = mean(mean(img(:,:,1)));
Gm      = mean(mean(img(:,:,2)));
Bm      = mean(mean(img(:,:,3)));

I(:,:,1)    = img(:,:,1).*(Gm/Rm);
I(:,:,2)    = img(:,:,2).*(Gm/Gm);
I(:,:,3)    = img(:,:,3).*(Gm/Bm);

end