function x = SSD(img1, img2)
x = sum(sum(sum((img1-img2).^2)));
% x = normxcorr2(rgb2gray(img1),rgb2gray(img2));
x = sum(x(:));
end