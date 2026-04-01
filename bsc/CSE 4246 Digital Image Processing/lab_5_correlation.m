clear;clc;
image = imread('img/saad.png'); 
if size(image, 3) == 3
    image = rgb2gray(image);
end

kernel_x = [1 1 1; 
            0 0 0; 
            -1 -1 -1];
kernel_y = [-1 0 1; 
            -1 0 1; 
            -1 0 1];

[image_height, image_width] = size(image);
[kernel_height, kernel_width] = size(kernel_x);

pad_height = floor(kernel_height / 2);
pad_width = floor(kernel_width / 2);

padded_image = padarray(double(image), [pad_height, pad_width], 'replicate', 'both');

correlated_image_x = zeros(image_height, image_width);
correlated_image_y = zeros(image_height, image_width);

for i = 1:image_height
    for j = 1:image_width
        neighborhood = padded_image(i:i+kernel_height-1, j:j+kernel_width-1);
        
        correlation_value = sum(sum(neighborhood .* kernel_x));
        
        correlated_image_x(i, j) = correlation_value;
    end
end

for i = 1:image_height
    for j = 1:image_width
        neighborhood = padded_image(i:i+kernel_height-1, j:j+kernel_width-1);
        
        correlation_value = sum(sum(neighborhood .* kernel_y));
        
        correlated_image_y(i, j) = correlation_value;
    end
end

edge_magnitude = sqrt(correlated_image_x.^2 + correlated_image_y.^2);

figure;
subplot(1, 3, 1);
imshow(image);
title('Original Image');
subplot(1, 3, 2);
imshow(uint8(correlated_image_x));
title('Horizontal Edge Detection');
subplot(1, 3, 3);
imshow(uint8(correlated_image_y));
title('Vertical Edge Detection');

figure;
%imshow(uint8(edge_magnitude));
title('Edge Magnitude');
