function LAB = COLORTRANSFER(img1, img2)
img1        = double(rgb2lab(img1));
img2        = double(rgb2lab(img2));

l1          = img1(:,:,1);
a1          = img1(:,:,2);
b1          = img1(:,:,3);

l2          = img2(:,:,1);
a2          = img2(:,:,2);
b2          = img2(:,:,3);

mu1(1)      = mean(l1(:));
mu1(2)      = mean(a1(:));
mu1(3)      = mean(b1(:));

mu2(1)      = mean(l2(:));
mu2(2)      = mean(a2(:));
mu2(3)      = mean(b2(:));

st1(1)      = std(l1(:));
st1(2)      = std(a1(:));
st1(3)      = std(b1(:));

st2(1)      = std(l2(:));
st2(2)      = std(a2(:));
st2(3)      = std(b2(:));

lr          = l2 - mu2(1);
ar          = a2 - mu2(2);
br          = b2 - mu2(3);

lr          = lr.*(st2(1)/st1(1));
ar          = ar.*(st2(2)/st1(2));
br          = br.*(st2(3)/st1(3));

lr          = lr + mu1(1);
ar          = ar + mu1(2);
br          = br + mu1(3);

LAB(:,:,1)  = lr;
LAB(:,:,2)  = ar;
LAB(:,:,3)  = br;

LAB         = uint8(lab2rgb(LAB));
end