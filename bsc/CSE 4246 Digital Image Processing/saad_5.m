clc;clear;

img = rgb2gray(imread('img/sample.jpg'));

kernel_ver=[1 1 1
        0 0 0
        -1 -1 -1];
    
kernel_hor=[1 0 -1
             1 0 -1
            1 0 -1];    

[r,c]=size(img);

kernel_height=3;
kernel_widtht=3;

padded_img = padarray(double(img),[1,1], 'replicate', 'both');

ans1=zeros(r,c);
ans2=zeros(r,c);

for i=1:r
    for j=1:c
        neighbour=padded_img(i:i+kernel_height-1,j:j+kernel_widtht-1);
        value=sum(sum(neighbour.*kernel_ver));
        ans1(i,j)=value;
    end
end

for i=1:r
    for j=1:c
        neighbour=padded_img(i:i+kernel_height-1,j:j+kernel_widtht-1);
        value=sum(sum(neighbour.*kernel_hor));
        ans2(i,j)=value;
    end
end

subplot(1,2,1);imshow(ans1);
subplot(1,2,2);imshow(ans2);