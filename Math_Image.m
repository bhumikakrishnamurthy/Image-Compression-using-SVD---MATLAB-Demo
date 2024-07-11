function Math_Image()
    fprintf('* Image Compression using SVD - a demo\n');
    [aRed, aGreen, aBlue, originalImage] = openImage('ImageProcessed.png');

    imageWidth = 800;
    imageHeight = 1280;

    singularValuesLimit = 15000;

    aRedCompressed = compressSingleChannel(aRed, singularValuesLimit);
    aGreenCompressed = compressSingleChannel(aGreen, singularValuesLimit);
    aBlueCompressed = compressSingleChannel(aBlue, singularValuesLimit);

    imr = uint8(aRedCompressed);
    img = uint8(aGreenCompressed);
    imb = uint8(aBlueCompressed);

    newImage = cat(3, imr, img, imb);

    imshow(originalImage);
    title('Original Image');

    figure;
    imshow(newImage);
    title('Compressed Image');

    mr = imageHeight;
    mc = imageWidth;

     compressedSize= mr * mc;
     originalSize= singularValuesLimit*(mr+mc+1);
    


    fprintf('Original size: %d\n', originalSize);
    fprintf('Compressed size: %d\n', compressedSize);

   
    ratio=(mr*mc)/(singularValuesLimit*(mr+mc+1));
    fprintf('Ratio compressed size / original size: %.2f\n', ratio);
    fprintf('Compressed image size is %.2f%% of the original image\n', ratio * 100);
    fprintf('Compressed the image! \n');
end

function [aRed, aGreen, aBlue, originalImage] = openImage(imagePath)
    imOrig = imread(imagePath);
    aRed = imOrig(:,:,1);
    aGreen = imOrig(:,:,2);
    aBlue = imOrig(:,:,3);
    originalImage = imOrig;
end

function aChannelCompressed = compressSingleChannel(channelDataMatrix, singularValuesLimit)
    [uChannel, sChannel, vhChannel] = svd(double(channelDataMatrix));
    k = singularValuesLimit;
    % Set singular values beyond the limit to zero
    sChannelCompressed = sChannel;
    sChannelCompressed(k+1:end) = 0;
    % Reconstruct the compressed matrix
    aChannelCompressed = uChannel * sChannelCompressed * vhChannel';
    % Clip values to ensure they are within the valid range for image data
    aChannelCompressed = max(0, min(aChannelCompressed, 255));
end