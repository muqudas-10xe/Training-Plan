%% Fresh start
clear all; close all; clc;

%% 
img         = double(imread('rubiks_cube.png'));
img         = img./255;

% img         = rgb2lab(img);
% Set bilateral filter parameters.
w           = 9;       % bilateral filter half-width
sig_d       = 16;
sig_r       = 0.8;

im_BF    = myBF(img,w,sig_d,sig_r);
imshow(im2uint8((im_BF)))

%% Cross Bilateral 
w           = 9;       % bilateral filter half-width
sig_d       = 5;
sig_r       = 0.8;

img1 = double(imread('lamp_ambient.tif'))./255;
img2 = double(imread('lamp_flash.tif'))./255;

k(:,:,1) = jbfilter2(img1(:,:,1),img2(:,:,1),w, [sig_d sig_r]);
k(:,:,2) = jbfilter2(img1(:,:,2),img2(:,:,2),w, [sig_d sig_r]);
k(:,:,3) = jbfilter2(img1(:,:,3),img2(:,:,3),w, [sig_d sig_r]);

