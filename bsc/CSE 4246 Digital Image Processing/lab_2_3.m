clear; clc;
img=imread('img/saad.png');
subplot(1,2,1);
imshow(img);

R = img(end : -1: 1, :,1);
G = img(end : -1: 1, :,2);
B = img(end : -1: 1, :,3);

new=cat(3,R,G,B);


subplot(1,2,2);
imshow(new);