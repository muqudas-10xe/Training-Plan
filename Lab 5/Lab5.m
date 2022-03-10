%% Fresh start 
clear all; close all; clc; 

%% 
x = double(imread('banana_slug.pgm'));
I = (demosaic_linear(x,'rggb'))./(2^16-1);
%%
M = demosaic_median(I,'rggb');
W = whitebal_gray(M);

imshow(W)
