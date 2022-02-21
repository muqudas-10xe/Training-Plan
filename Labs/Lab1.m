%% Fresh start
clear all; clc; close all; 

%% Original Image
A       = rgb2gray(imread('yacht.jpg'));
B       = double(A);
figure
image(B);
colormap(gray(256));
axis('image');

%% Flipped Image
Fimg    = flip(B,2);
figure
image(Fimg);
colormap(gray(256));
axis('image');


%% Negative Image
NegI    = B - 255;
figure
image(NegI);
colormap(gray(256));
axis('image');


%% Factor 1.5
FacI    = B.*1.5;
figure
image(FacI);
colormap(gray(256));
axis('image');

%% Histogram
[M,N]   = size(A);
x       = reshape(A,1,M*N);
figure
hist(x,0:255);
xlabel('pixel intensity')
ylabel('no. of pixels')
title('Histogram of an Image')
