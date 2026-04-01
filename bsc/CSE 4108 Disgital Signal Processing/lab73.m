% AUTO CORELATION
%Data:
x=[0,0,2,-1,3,7,1,2,-3,0,0];
y=[0,0,1,-1,2,-2,4,1,-2,5,0];
%Length:
n=-6:4; %Calculated from arrow above
%Array for result:
array=[];
%Loop for positive side:
for i=1:6
    n = -6+i:4+i;
    subplot(3,4,i);
    stem(n,y,'red','filled');
    xlabel('n','Color','r');
    ylabel('y[n]','Color','r');
    title(sprintf(' y[n-%d]',i-1),'color','b');
    axis([-15 15 -5 7]);
    grid;
    sum=0;
    for cc=1:12-i
        sum=sum+x(cc+i-1).*x(cc);
    end
    array=[array,sum];
end
%Loop for negetive side:
for i=1:6
    n = -6-i:4-i;
    subplot(3,4,i+6); 
    stem(n,y,'green','filled');
    xlabel('n','Color','r');
    ylabel('y[n]','Color','r'); 
    title(sprintf(' y[n+%d]',i),'color','b'); 
    axis([-15 15 -5 7]); 
    grid;
    sum=0; 
    for cc=1:12-i 
        sum=sum+x(cc).*x(cc+i-1);
    end 
    array=[array,sum];
end 
p=-6:5; 
stem(p,array,'k','filled'); 
xlabel('n','Color','r'); 
ylabel('y[n]','Color','r'); 
title('CrossCorrelation','color','b') 
axis([-10 10 -inf inf]);
grid;