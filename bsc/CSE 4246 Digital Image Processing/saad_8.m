clear; clc;

img = rgb2gray(imread('img/sample.jpg'));

noisy = imnoise(img, 'salt & pepper', 0.05);

[r, c] = size(noisy);

% Create a matrix to store the filtered image:
filtered_image = uint8(zeros(r, c));

% Loop through each pixel in the image
for i = 1:r
    for j = 1:c
       
        neighbour = noisy(max(1, i-1):min(r, i+1), max(1, j-1):min(c, j+1));
        
        % Find the minimum value in the neighborhood
        value = min(neighbour(:));
        
        % Assign the minimum value to the corresponding pixel in the filtered image
        filtered_image(i, j) = value;
    end
end

% Display the original image, noisy image, and filtered image
subplot(1, 3, 1); imshow(img); title('Original Image');
subplot(1, 3, 2); imshow(noisy); title('Noisy Image');
subplot(1, 3, 3); imshow(filtered_image); title('Filtered Image');
