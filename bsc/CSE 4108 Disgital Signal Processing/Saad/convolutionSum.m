% Signals:
x=[1,5,2,0,6,8,3,0,1];
xn=0:length(x)-1;

h=[1,1,1,1,1];
hn=0:length(h)-1;

% Convolution Sum:
y=conv(x,h);
yn=0:length(y)-1;

% Plotting Ans:
subplot(3,2,1);
stem(xn,x);

subplot(3,2,3);
stem(hn,h);

subplot(3,2,5);
stem(yn,y,'filled');

% User defined range:
xn=-4:4;
hn=-1:3;
yn=-5:7;

% Plotting Ans:
subplot(3,2,2);
stem(xn,x);

subplot(3,2,4);
stem(hn,h);

subplot(3,2,6);
stem(yn,y,'filled');