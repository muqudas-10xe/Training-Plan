function I = demosaicmedian(R,s)
[r,c,d]  = size(R);
ycc    = rgb2ycbcr(R);
I      = zeros(size(R));

I(:,:,2) =  medfilt2(ycc(:,:,2),[5 5]);
I(:,:,3) =  medfilt2(ycc(:,:,3),[5 5]);


if s == 'rggb'
    mas1            = repmat([1 0; 0 0],ceil(r/2),ceil(c/2));
elseif s == 'bggr'
    mas1            = repmat([0 0; 0 1],ceil(r/2),ceil(c/2));
elseif s == 'gbrg'
    mas1            = repmat([0 0; 1 0],ceil(r/2),ceil(c/2));
elseif s == 'grbg'
    mas1            = repmat([0 1; 0 0],ceil(r/2),ceil(c/2));
end
img      = ycc(:,:,1).*mas1(1:size(R,1),1:size(R,2));
img      =  padarray(img,[1 1],0,'both');


for i = 2:r+1
    for j = 2:c+1
        temp  = img(i-1:i+1,j-1:j+1,1);
        I(i-1,j-1,1) = sum(temp(:))/(numel(temp)-numel(find(temp==0)));
end
end
 
I = ycbcr2rgb(I);
end