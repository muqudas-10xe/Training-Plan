function [output]   =  gammaCorr(A,y)
output  = 255.*((A./255).^y);
figure
subplot(1,2,1)
image(A)
colormap(gray(256));
axis('image');
title('Original Image')
subplot(1,2,2)
image(output)
colormap(gray(256));
axis('image');
title('Gamma Corrected Image')
end