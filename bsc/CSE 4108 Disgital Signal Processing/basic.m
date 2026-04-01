% Normal variable declare and values:
a=5;
m=(3*a)+(2*a^3);

% Range variable declare:
b=0:100;

% Range variable declare with user defined step:
c=0:0.1:1;

% Range vairable in equation:
n=(3.*c)+(2.*c.^2);

% Plotting a points:
x=1:80;
y=1:80;
%plot(x,y)

% Diving output screen using subplot:
subplot(2,2,1);
plot(x,y);
grid;

m=0:60;
n=0:60;

subplot(2,2,2);
plot(m,n);
grid;

% END
