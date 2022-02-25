%% Fresh start 
clear all; clc; close all; 

%% Loading Raw data
raw         = (imread("banana_slug.tiff"));
figure; imshow(im2uint16(raw))
raw         = double(raw);

%% Linearization 
black       = 2047; % For Canon 1100D
saturation  = 15000;
lin_bayer   = (raw-black)/(saturation-black);
lin_bayer   = max(0,min(lin_bayer,1));
figure; imshow(im2uint16(lin_bayer))

%% White Balancing
wb_multipliers  = [2.525858, 1, 1.265026];  % for test image
mask            = wbmask(size(lin_bayer,1),size(lin_bayer,2),wb_multipliers, 'rggb' );
balanced_bayer  = lin_bayer.*mask;
figure; imshow(im2uint16(balanced_bayer))

%% Demosaicing
temp            = uint16(balanced_bayer/max(balanced_bayer(:))*2^16);
lin_rgb         = double(demosaic(temp, 'rggb'))/2^16;
figure; imshow(im2uint16(lin_rgb))

%% Color Space Conversion
rgb2xyz         = [0.4124564    0.3575761    0.1804375; 
                   0.2126729    0.7151522    0.0721750; 
                   0.0193339    0.1191920    0.9503041];
xyz2cam         = [0.6653   -0.1486   -0.0611;
                  -0.4221   1.3303    0.0929;
                  -0.0881   0.2416    0.7226];
rgb2cam         = xyz2cam*rgb2xyz; % Assuming previously defined matrices
rgb2cam         = rgb2cam ./ repmat(sum(rgb2cam,2),1,3); % Normalize rows to 1
cam2rgb         = rgb2cam^-1;
lin_srgb        = apply_cmatrix(lin_rgb, cam2rgb);
lin_srgb        = max(0,min(lin_srgb,1)); % Always keep image clipped b/w 0-1
figure; imshow(im2uint16(lin_srgb))

%% Brightness and Gamma Correction
grayim          = rgb2gray(lin_srgb);
grayscale       = 0.25/mean(grayim(:));
bright_srgb     = min(1,lin_srgb*grayscale);
figure; imshow(im2uint16(bright_srgb))

nl_srgb = bright_srgb.^(1/2.2);
figure; imshow(im2uint16(nl_srgb))