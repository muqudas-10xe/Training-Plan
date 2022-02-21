%% Fresh start 
clear all; clc; close all; 

%% 
img     = double(imread('lena.tif'));
R       = img(:,:,1);
G       = img(:,:,2);
B       = img(:,:,3);

Y       = 0.299*R+ 0.587*G+ 0.114*B;
Cb      = 0.564*(B-Y) + 128;
Cr      = 0.713*(R-Y) + 128;

LCC(:,:,1) = Y;
LCC(:,:,2) = Cb;
LCC(:,:,3) = Cr;

ii(:,:,1)  = Y + 1.4025*(Cr-128);
ii(:,:,2)  = Y - 0.3443*(Cb-128)-0.7144*(Cr-128);
ii(:,:,3)  = Y + 1.7730*(Cb-128);


%% Halftoning 
clear all; clc; close all; 
img     = rgb2gray(imread('lena.tif'));
orig    = img;
T       = 108;

img(img>T) = 255;
img(img<T) = 0;
imshow(img)

clear T;
clc; close all; 

I       = abs(orig - img);
imshow(I)
Ind     = [12 8 10 6; 4 16 2 14; 9 5 11 7; 1 13 3 15];
n       = size(Ind,1)*size(Ind,2);
T       = 255.*(Ind-0.5)./(n^2);

while(size(T,1)<512)
    T = [T T; T T];
end
Y = 255*(orig>uint8(T));
E = abs(orig - uint8(Y));














