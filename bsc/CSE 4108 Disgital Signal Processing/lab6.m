% Convulation sum 1:
x=[2,3,1,2,3,4];
nx=0:length(x)-1;

h=[1,1,1,1,1,1];
nh=0:length(h)-1;

y=conv(x,h);
ny=0:length(y)-1;

subplot(3,2,1)
stem(nx,x)
xlabel('x[n]','color','r');
ylabel('x','color','r');
title('Signal 1');

subplot(3,2,3)
stem(nh,h)
xlabel('h[n]','color','r');
ylabel('h','color','r');
title('Signal 2');

subplot(3,2,5)
stem(ny,y,'filled')
xlabel('y[n]','color','r');
ylabel('y','color','r');
title('Convulation Sum of signal 1 and signal 2');

% Convulation sum 2:
x=[2,3,1,2,3,4];
nx=-2:3;

h=[1,1,1,1,1,1];
nh=-1:4;

y=conv(x,h);
ny=-8:2;

subplot(3,2,2)
stem(nx,x)
xlabel('x[n]','color','r');
ylabel('x','color','r');
title('Signal 3');

subplot(3,2,4)
stem(nh,h)
xlabel('h[n]','color','r');
ylabel('h','color','r');
title('Signal 4');

subplot(3,2,6)
stem(ny,y,'filled')
xlabel('y[n]','color','r');
ylabel('y','color','r');
title('Convulation Sum of signal 3 and signal 4');