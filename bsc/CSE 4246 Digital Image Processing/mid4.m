clear;
clc;

img=imread('img/saad.png');
subplot(3,3,1);
imshow(img);
title("Original RGB Image");


% Addition:
subplot(3,3,2);
imshow(img+100);
title("Added constant 100");

% Addition:
subplot(3,3,3);
imshow(img-100);
title("Subtracted constant 100");

% Addition:
subplot(3,3,4);
imshow(img*2);
title("Multiplied by constant 2");

% Addition:
subplot(3,3,5);
imshow(img/2);
title("Divided by constant 2");