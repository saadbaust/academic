clear; clc;

img=rgb2gray(imread('img/sample.jpg'));

kernel=[1 1 1
        0 0 0
       -1 -1 -1];
   
kernel_hor=[1 0 -1
            1 0 -1
            1 0 -1];
        
flipped_kernel=kernel(end:-1:1,:);

padded_img=padarray(double(img),[1,1],'replicate','both');

[r,c]=size(img);
ans = zeros(r,c);

for i=1:r
    for j=1:c
        neighbour=padded_img(i:i+3-1,j:j+3-1);
        value=sum(sum(neighbour.*flipped_kernel));
        ans(i,j)=value;
    end
end
imshow(ans)