clear;
clc;

% Image read:
img=imread('onion.png');
subplot(3,3,1);
imshow(img);

% Gray image:
gray_img=rgb2gray(img);
subplot(3,3,2);
imshow(gray_img);

% Binary image:
bin_img=im2bw(img);
subplot(3,3,3);
imshow(bin_img);

% Specific color select:
green=img(:,:,2);
subplot(3,3,4);
imshow(green);

[r,c,b]=size(img);

% Black band:
black=zeros(r,c);

% Concatinate black band with green band:
color_green=cat(3,black,green,black);
subplot(3,3,5);
imshow(color_green);

% Image flip:
hor=gray_img(end:-1:1,:);
subplot(3,3,6);
imshow(hor);

ver=gray_img(:,end:-1:1);
subplot(3,3,7);
imshow(ver);