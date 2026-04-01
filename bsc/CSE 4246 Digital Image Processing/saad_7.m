clear; clc;

img = imread('img/sample.jpg');

noisy=imnoise(img,'gaussian',0.05);

kernel=ones(3)/9;

filtered=imfilter(noisy,kernel);

subplot(1,3,1);imshow(img);
subplot(1,3,2);imshow(noisy);
subplot(1,3,3);imshow(filtered);