clc;clear;

% Read the image
originalImage = imread('img/r.jpg'); % Replace 'your_image.jpg' with your image file path

% Create a figure to display all outputs
figure;

% Display the original image
subplot(1, 3, 1);
imshow(originalImage);
title('Original Image');

% Add Gaussian noise to the image
noisyImage = imnoise(originalImage, 'gaussian', 0.05); % You can adjust the noise parameters as per your requirement

% Display the noisy image
subplot(1, 3, 2);
imshow(noisyImage);
title('Noisy Image (gaussian)');

% Define mean filter kernel size
kernelSize = 3; % Adjust as needed

% Create mean kernel
meanKernel = ones(kernelSize) / (kernelSize^2);

% Apply mean filtering to remove noise
filteredImage = imfilter(noisyImage, meanKernel);

% Display the filtered image
subplot(1, 3, 3);
imshow(filteredImage);
title('Filtered Image(Average/Mean Filter');
