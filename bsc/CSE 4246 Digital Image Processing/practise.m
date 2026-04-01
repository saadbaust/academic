clc;clear;
img=rgb2gray(imread('img/sample.jpg'));

noisy=imnoise(img, 'salt & pepper', 0.05);

[r,c,b]=size(img);
ans=uint8(zeros(r,c));

for i=1:r
    for j=1:c
        nei=noisy(max(1, i-1):min(r, i+1), max(1, j-1):min(c, j+1));
        value=min(nei(:));
        ans(i,j)=value;
    end
end

subplot(1,3,1);imshow(img);
subplot(1,3,2);imshow(noisy);
subplot(1,3,3);imshow(ans);