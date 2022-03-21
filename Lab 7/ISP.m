%% Fresh start 
clear all; close all; clc;

%% Loading file 

img         = double(imread("banana_slug.tiff"));

%% Linearization
black       = 2047; % For Canon 1100D
saturation  = 15000;
lin_bayer   = (img-black)/(saturation-black);
lin_bayer   = max(0,min(lin_bayer,1));
figure; imshow(im2uint16(lin_bayer))

%% White Balancing
% % Gray World
gbalanced_bayer  = wb_Gray(lin_bayer,'rggb');
figure; imshow(im2uint16(gbalanced_bayer))

% % White Patch
wbalanced_bayer  = wb_white(lin_bayer,'rggb');
figure; imshow(im2uint16(wbalanced_bayer))

%% Demosaicing 
I               = demosaic_BI(wbalanced_bayer,'rggb');
figure; imshow(im2uint16(I))


%% Brightness Adjustment & Gamma Correction 
grayim          = rgb2gray(I);
grayscale       = 0.25/mean(grayim(:));
bright_srgb     = min(1,I*grayscale);
figure; imshow(im2uint16(bright_srgb))

nl_srgb = bright_srgb.^(1/2.2);
figure; imshow(im2uint16(nl_srgb))

imwrite((nl_srgb),'Img1.jpeg','Quality',95);
imwrite((nl_srgb),'Img2.png');




