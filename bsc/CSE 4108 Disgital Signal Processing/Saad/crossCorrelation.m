% Data:
x=[0,0,2,-1,3,7,1,2,-3,0,0];
y=[0,0,1,-1,2,-2,4,1,-2,5,0];
n=-3:7;
list=[];
p=1;
% Left side:
for i=1:6
    sum=0;
    n=-3+i:7+i;
    subplot(4,4,p);
    stem(n,y);
    axis([-3 15 -inf inf]);
    p=p+1;
    for j=1:12-i
        sum=sum+x(j+i-1).*y(j);
    end
    list=[list,sum];
end
% Right side:
for i=1:6
    sum=0;
    n=-3-i:7-i;
    subplot(4,4,p);
    stem(n,y,'blue');
    axis([-10 8 -inf inf]);
    p=p+1;
    for j=1:12-i
        sum=sum+x(j).*y(j+i-1);
    end
    list=[list,sum];
end
disp(list);

subplot(4,4,p);
nlist=-3:8;
stem(nlist,list,'filled','red');
axis([-5 10 -inf inf]);