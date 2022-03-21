function B = myBF(img,w,sig_d,sig_r)
dim = size(img);
if dim(3) ==2
    [X,Y]   = meshgrid(-w:w,-w:w);
    G       = exp(-(X.^2+Y.^2)/(2*sig_d^2));
    B   = zeros(dim);

    for i = 1:dim(1)
        for j = 1:dim(2)

            % Extract local region.
            iMin = max(i-w,1);
            iMax = min(i+w,dim(1));
            jMin = max(j-w,1);
            jMax = min(j+w,dim(2));
            I = img(iMin:iMax,jMin:jMax);

            H = exp(-(I-img(i,j)).^2/(2*sig_r^2));
            F = H.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
            B(i,j) = sum(F(:).*I(:))/sum(F(:));

        end
    end
elseif dim(3) == 3
    [X,Y]   = meshgrid(-w:w,-w:w);
    G       = exp(-(X.^2+Y.^2)/(2*sig_d^2));
    B   = zeros(dim);

    for i = 1:dim(1)
        for j = 1:dim(2)

            % Extract local region.
            iMin = max(i-w,1);
            iMax = min(i+w,dim(1));
            jMin = max(j-w,1);
            jMax = min(j+w,dim(2));
            I1 = img(iMin:iMax,jMin:jMax,1);
            I2 = img(iMin:iMax,jMin:jMax,2);
            I3 = img(iMin:iMax,jMin:jMax,3);
            

            H1 = exp(-(I1-img(i,j,1)).^2/(2*sig_r^2));
            H2 = exp(-(I2-img(i,j,2)).^2/(2*sig_r^2));
            H3 = exp(-(I3-img(i,j,3)).^2/(2*sig_r^2));
            
            F1 = H1.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
            F2 = H2.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
            F3 = H3.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
            
            B(i,j,1) = sum(F1(:).*I1(:))/sum(F1(:));
            B(i,j,2) = sum(F2(:).*I2(:))/sum(F2(:));
            B(i,j,3) = sum(F3(:).*I3(:))/sum(F3(:));

        end
    end
end
end
