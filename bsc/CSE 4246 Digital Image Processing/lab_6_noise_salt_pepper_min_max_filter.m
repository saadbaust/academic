% Read the original image
originalImage = imread('img/r.jpg'); % Change 'lena.jpg' to your image filename
originalImage = rgb2gray(originalImage); % Convert to grayscale if it's a color image

% Add salt and pepper noise to the original image
noisyImage = imnoise(originalImage, 'salt & pepper', 0.02);

% Apply minimum filter
minFiltered = ordfilt2(noisyImage, 1, ones(3, 3));

% Apply maximum filter
maxFiltered = ordfilt2(minFiltered, 9, ones(3, 3));


% Display original image, noisy image, min-filtered image, and max-filtered image in subplots
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(2, 2, 2);
imshow(noisyImage);
title('Noisy Image (Salt(white) & Pepper(black)');

subplot(2, 2, 3);
imshow(minFiltered);
title('Min Filtered Image(white nosie remove)');

subplot(2, 2, 4);
imshow(maxFiltered);
title('Max Filtered Image(black nosie remove)');
