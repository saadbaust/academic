clear;
clc;
img=imread('img/saad.png');
[r,c,b]=size(img);
R=img(:,:,1); % all row : all col : 1 number means red band
G=img(:,:,2);
B=img(:,:,3);


%original re color dekhar jonno black band use kora lagbe
% black band banailam
black=zeros(r,c);

%combine with red band
red=cat(3,R,black,black);
green=cat(3,black,G,black);
blue=cat(3,black,black,B);

grayimg=rgb2gray(img);
BW = im2bw(img);

%figure(1);
%imshow(grayimg);
%figure(2);
%imshow(img);

subplot(3,3,1);
imshow(R);
title('R');
subplot(3,3,2);
imshow(G);
title('G');
subplot(3,3,3);
imshow(B);
title('B');

subplot(3,3,4);
imshow(red);
title('red');
subplot(3,3,5);
imshow(green);
title('green');
subplot(3,3,6);
imshow(blue);
title('blue');

subplot(3,3,7);
imshow(grayimg);
title('gray');

subplot(3,3,8);
imshow(BW);
title('binary');


% color alada korbo
