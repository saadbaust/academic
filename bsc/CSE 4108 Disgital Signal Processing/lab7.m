n=-6:4;
x=[0,0,2,-1,3,7,1,2,-3,0,0];
y=[0,0,1,-1,2,-2,4,1,-2,5,0];
array=[];
for i=1:6
    n = -6+i:4+i;
    subplot(3,4,i);
    stem(n,y,'r','filled');
    xlabel('n','Color','r');
    ylabel('y[n]','Color','r');
    title(sprintf(' y[n-%d]',i-1),'color','b');
    axis([-10 15 -2 7]);
    grid ;
    sum=0;
    for cc=1:12-i
        sum=sum+x(cc+i-1).*y(cc);
    end
    disp((sprintf('x[n]*y[n-%d] = %d',i-1,sum)));
    array=[array,sum];
end
for i=1:6 
    n = -6-i:4-i; 
    subplot(3,4,i+6); 
    stem(n,y,'m','filled'); 
    xlabel('n','Color','r');
    ylabel('y[n]','Color','r'); 
    title(sprintf(' y[n+%d]',i),'color','b'); 
    axis([-10 15 -2 7]); 
    grid ; 
    sum=0; 
    for cc=1:12-i 
        sum=sum+x(cc).*y(cc+i-1); 
    end 
    disp((sprintf('x[n]*y[n+%d] = %d',i-1,sum))); 
    array=[array,sum];
end 
disp(array) 
p=-6:5; 
stem(p,array,'k','filled'); 
xlabel('n','Color','r'); 
ylabel('y[n]','Color','r'); 
title('CrossCorrelation','color','b') 
axis([-8 8 -inf inf]); 
grid;