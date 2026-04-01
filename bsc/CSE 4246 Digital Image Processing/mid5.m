clear;
clc;
close all;

original=imread('img/r.jpg');
head=imread('img/razia_head.png');

body=original-head;
full=body+head;

subplot(2,2,1);
imshow(original);
title("Original Image");
subplot(2,2,2);
imshow(head);
title("Head");
subplot(2,2,3);
imshow(body);
title("Body");
subplot(2,2,4);
imshow(full);
title("Head with Body");