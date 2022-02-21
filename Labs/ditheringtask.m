%% Fresh start 
clear all; clc; close all; 

%% 
i = rgb2gray(imread('lena.tif'));
o = zeros(size(i));
T = 168;
o = uint8(255*(i>T));
e = abs(i-o);
Y = zeros(size(i));
Ind     = [12 8 10 6; 4 16 2 14; 9 5 11 7; 1 13 3 15];
n       = size(Ind,1)*size(Ind,2);
T       = 255.*(Ind-0.5)./(n^2);

while(size(T,1)<512)
    T = [T T; T T];
end
Y = 255*(i>(T));
