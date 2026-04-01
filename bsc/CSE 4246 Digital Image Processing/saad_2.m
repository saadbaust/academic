clear; clc;

img = rgb2gray(imread('img/saad.png'));
subplot(1,3,1);imshow(img);


horizontal_flip = img(end:-1:1,:);
subplot(1,3,2);imshow(horizontal_flip);title("Horizontal Flip");

vertical_flip = img(:,end:-1:1);
subplot(1,3,3);imshow(vertical_flip);title("Vetical Flip");

