clear;clc;

img = rgb2gray(imread('img/sample.jpg'));

band=[];
freq=[];
for i=0:255
    band=[band i];
    count =0;
    for j=1:273280
        if(i==img(j))
            count = count + 1;
        end
    end
    freq=[freq count];
end

cumsum=[];
sum=0;
for i=1:256
    sum=sum+freq(i);
    cumsum=[cumsum sum];
end

pdf=[];
cdf=[];
roundcdf=[];

for i=1:256
    pdf=[pdf cumsum(i)/cumsum(end)];
    cdf=[cdf pdf(i)*band(end)];
    roundcdf=[roundcdf round(cdf(i))];
end

result=[band;freq;cumsum;pdf;cdf;roundcdf]

eq=[];
for i=0:255
    index = find (i==roundcdf);
    len = length(index);
    if len==0
        eq=[eq 0];
    else
        sum=0;
        for j=1:len
            sum=sum+freq(index(j));
        end
        eq=[eq sum];
    end
end

new=[band;eq]

% using functoion
eqimg=imhist(histeq(img));


% PLotting
subplot(3,1,1);stem(band,freq);
subplot(3,1,2);stem(band,eq);
subplot(3,1,3);stem(band,eqimg);