x=[1,1,2,-3,5];
y=[2,-2,3,-4,5];
ls=[];
for i=1:3
    sum=0;
    for j=1:6-i
        sum=sum+x(j+i-1).*y(j);
    end
    ls=[ls,sum];
end
for i=1:3
    sum=0;
    for j=1:6-i
        sum=sum+x(j).*y(j+i-1);
    end
    ls=[ls,sum];
end
disp(ls);
p=-3:2; 
stem(p,ls,'k','filled');
axis([-10 10 -inf inf]);
