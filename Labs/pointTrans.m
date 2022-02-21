function [output] = pointTrans(input,T1,T2)
A                   = (input);
[M,N]               = size(A);
input(input<=T1)    = 0;
input(input>T2)     = 255;
output              = input;
figure
subplot(1,2,1)
hist(reshape(A,1,M*N),0:255)
title('Histogram of Original Image')
subplot(1,2,2)
hist(reshape(output,1,M*N),0:255)
title('Histogram of Transformed Image')
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
title('Transformed Image')
end