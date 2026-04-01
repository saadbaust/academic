% Clear All:
clear;
clc;
% Read image from folder:
imgRGB=imread('img/saad.png');

% Show image:
% subplot(3,3,1);
figure(); 
imshow(imgRGB);
title('RGB image');

% Convert to grayscale:
imgGRAY=rgb2gray(imgRGB);
% Show image:
% subplot(3,3,2);
figure();
imshow(imgGRAY);
title('GRAY image');

% Convert to binary:
imgBIN=im2bw(imgRGB);
% Show image:
% subplot(3,3,3);
figure();
imshow(imgBIN);
title('Binary image');

% Image Bands:
imgRED=imgRGB(:,:,1);
imgGREEN=imgRGB(:,:,2);
imgBLUE=imgRGB(:,:,3);

% Show image:
% subplot(3,3,4);
figure();
imshow(imgRED);
title('Red Band');
% subplot(3,3,5);
figure();
imshow(imgGREEN);
title('GREEN Band');
% subplot(3,3,6);
figure();
imshow(imgBLUE);
title('BLUE Band');

% Specific color:
% Image size:
[r, c, b]=size(imgRGB)
% Make a black band:
BLACK=zeros(r,c);
% True single color:
imgTRED=cat(3,imgRED,BLACK,BLACK);
imgTGREEN=cat(3,BLACK,imgGREEN,BLACK);
imgTBLUE=cat(3,BLACK,BLACK,imgBLUE);

% Show image:
% subplot(3,3,7);
figure();
imshow(imgTRED);
title('True Red Band');
% subplot(3,3,8);
figure();
imshow(imgTGREEN);
title('True Green Band');
% subplot(3,3,9);
figure();
imshow(imgTBLUE);
title('True Blue Band');