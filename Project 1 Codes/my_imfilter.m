function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


out = zeros(size(image)); 
out = dim2Ch(image,filter,out);
output = out;

    %An inner function to compute if an image is color or grayscale and
    %send it to the fil_ch the appropriate number of times
    function out = dim2Ch(image,filter,out)
        dim = length(size(image));
        for dim=1:dim
            out(:,:,dim) = fil_ch(image(:,:,dim),filter);
        end 
    end 
    

    %Inner function that contains the linear filter function
    function a = fil_ch(image, filter)
        a = zeros(size(image));
        [m n] = size(image); %rows is height, cols is width
        [mf nf] = size(filter);
        prow = floor(nf/2); 
        pcol = floor(mf/2); 
        img_new = padarray(image,[pcol prow],'symmetric');
        [pad_rows pad_cols] = size(img_new);
        for i = 1:pad_rows-mf+1
            for j = 1:pad_cols-nf+1
                a(i,j) = sum(sum((img_new(i:i+mf-1, j:j+nf-1).*filter)));
            end          
        end
    end 
end 




