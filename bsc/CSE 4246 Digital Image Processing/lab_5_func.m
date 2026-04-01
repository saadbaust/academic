function corconvfunc(img)

    % Read the image
    image = imread(img); 

    if size(image, 3) == 3
        image = rgb2gray(image);
    end

    % Define Sobel kernels for horizontal and vertical edge detection
    kernel_x = [1 1 1; 0 0 0; -1 -1 -1];
    kernel_y = [-1 0 1; -1 0 1; -1 0 1];

    % Flip the kernels for convolution manually
    kernel_x_flipped = kernel_x(end:-1:1,:);
    kernel_y_flipped = kernel_y(:,end:-1:1);

    % Get the size of the image and flipped kernels
    [image_height, image_width] = size(image);
    [kernel_height, kernel_width] = size(kernel_x_flipped);

    % Pad the image to handle border pixels
    pad_height = floor(kernel_height / 2);
    pad_width = floor(kernel_width / 2);
    padded_image = padarray(double(image), [pad_height, pad_width], 'replicate', 'both');

    % Initialize arrays to store the convolved images for horizontal and vertical edge detection
    convolved_image_x = zeros(image_height, image_width);
    convolved_image_y = zeros(image_height, image_width);

    % Perform convolution for horizontal edge detection
    for i = 1:image_height
        for j = 1:image_width
            % Extract the neighborhood of the current pixel
            neighborhood = padded_image(i:i+kernel_height-1, j:j+kernel_width-1);

            % Compute the convolution
            convolution_value = sum(sum(neighborhood .* kernel_x_flipped));

            % Assign the convolution value to the corresponding pixel in the convolved image
            convolved_image_x(i, j) = convolution_value;
        end
    end

    % Perform convolution for vertical edge detection
    for i = 1:image_height
        for j = 1:image_width
            % Extract the neighborhood of the current pixel
            neighborhood = padded_image(i:i+kernel_height-1, j:j+kernel_width-1);

            % Compute the convolution
            convolution_value = sum(sum(neighborhood .* kernel_y_flipped));

            % Assign the convolution value to the corresponding pixel in the convolved image
            convolved_image_y(i, j) = convolution_value;
        end
    end

    % Compute the magnitude of gradients
    edge_magnitude = sqrt(convolved_image_x.^2 + convolved_image_y.^2);

    % Display the original image, convolved images for horizontal and vertical edge detection, and the magnitude of gradients
    figure;

    % Original Image
    subplot(2, 3, 1);
    imshow(image);
    title('Original Image');

    % Horizontal Edge Detection (Convolution)
    subplot(2, 3, 2);
    imshow(uint8(convolved_image_x));
    title('Horizontal Edge Detection (Convolution)');

    % Vertical Edge Detection (Convolution)
    subplot(2, 3, 3);
    imshow(uint8(convolved_image_y));
    title('Vertical Edge Detection (Convolution)');

    % Edge Magnitude
    subplot(2, 3, 4);
    imshow(uint8(edge_magnitude));
    title('Edge Magnitude');

    % Horizontal Edge Detection (Correlation)
    subplot(2, 3, 5);
    correlated_image_x = conv2(double(image), rot90(kernel_x, 2), 'same');
    imshow(uint8(correlated_image_x));
    title('Horizontal Edge Detection (Correlation)');

    % Vertical Edge Detection (Correlation)
    subplot(2, 3, 6);
    correlated_image_y = conv2(double(image), rot90(kernel_y, 2), 'same');
    imshow(uint8(correlated_image_y));
    title('Vertical Edge Detection (Correlation)');

end