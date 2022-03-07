%% Fresh start 
clear all; close all; clc;

%% Part 1
img1        = double(imread("img1.jpg"));
img2        = double(imread("img2.png"));
LAB         = COLORTRANSFER(img1, img2);

imshow(im2uint8(LAB))
imk = img2;
[r1, c1, d1] = size(img1);
[r2, c2, d2] = size(img2);
reg = 100;
for i = 1:reg:r1-reg
    for j = 1:reg:c1-reg
        pat1 = img1(i:i+reg-1,j:j+reg-1,:);
        for ii = 1:reg:r2-reg
            for jj = 1:reg:c2-reg
                pat2 = img2(ii:ii+reg-1,jj:jj+reg-1,:);
                temp = imk(ii:ii+reg-1,jj:jj+reg-1,:);
                c = SSD(pat1,pat2)./(r1*c1);
                if c<500 && SSD(pat2,temp)==0
                    img2(ii:ii+reg-1,jj:jj+reg-1,:) = COLORTRANSFER(pat1, pat2);
                end
            end
        end
        imshow(uint8(img2))
        
    end
end