clear;clc;

% Basic Image 

img = imread('img/sample.jpg');

subplot(3,3,1);
imshow(img);

gray = rgb2gray(img);

subplot(3,3,2);
imshow(gray);

bw = im2bw(img);

subplot(3,3,3);
imshow(bw);

R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

subplot(3,3,4);imshow(R);
subplot(3,3,5);imshow(G);
subplot(3,3,6);imshow(B);

[r,c,b]=size(img);
black=zeros(r,c);

red=cat(3,R,black,black);
green=cat(3,black,G,black);
blue=cat(3,black,black,B);

subplot(3,3,7);imshow(red);
subplot(3,3,8);imshow(green);
subplot(3,3,9);imshow(blue);