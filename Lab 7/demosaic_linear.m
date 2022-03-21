function I = demosaic_linear(x,s)
[r,c] = size(x);

if s == 'rggb'
    mas1            = repmat([1 0; 0 0],ceil(r/2),ceil(c/2));
    mas2            = repmat([0 1; 1 0],ceil(r/2),ceil(c/2));
    mas3            = repmat([0 0; 0 1],ceil(r/2),ceil(c/2));
elseif s == 'bggr'
    mas3            = repmat([1 0; 0 0],ceil(r/2),ceil(c/2));
    mas2            = repmat([0 1; 1 0],ceil(r/2),ceil(c/2));
    mas1            = repmat([0 0; 0 1],ceil(r/2),ceil(c/2));
elseif s == 'gbrg'
    mas1            = repmat([0 0; 1 0],ceil(r/2),ceil(c/2));
    mas2            = repmat([1 0; 0 1],ceil(r/2),ceil(c/2));
    mas3            = repmat([0 1; 0 0],ceil(r/2),ceil(c/2));
elseif s == 'grbg'
    mas1            = repmat([0 1; 0 0],ceil(r/2),ceil(c/2));
    mas2            = repmat([1 0; 0 1],ceil(r/2),ceil(c/2));
    mas3            = repmat([0 0; 1 0],ceil(r/2),ceil(c/2));
end
img(:,:,1)      = x.*mas1(1:size(x,1),1:size(x,2));
img(:,:,2)      = x.*mas2(1:size(x,1),1:size(x,2));
img(:,:,3)      = x.*mas3(1:size(x,1),1:size(x,2));
I               = zeros(size(img));
img             =  padarray(img,[1 1],0,'both');


for i = 2:r+1
    for j = 2:c+1
        temp  = img(i-1:i+1,j-1:j+1,1);
        temp3 = img(i-1:i+1,j-1:j+1,3);
        
        I(i-1,j-1,1) = sum(temp(:))/(numel(temp)-numel(find(temp==0)));
        I(i-1,j-1,3) = sum(temp3(:))/(numel(temp3)-numel(find(temp3==0)));

        if (img(i,j,2)==0)
            temp1 = img(i-1:i+1,j-1:j+1,2);
            I(i-1,j-1,2) = sum(temp1(:))/(numel(temp1)-numel(find(temp1==0)));
        else
            I(i-1,j-1,2) = img(i,j,2);
        end
end
end

end