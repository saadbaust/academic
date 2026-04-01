A=10;
%---------1--------
omega1=5*pi;
t=-1:0.01:1;
y=A.*sin(omega1.*t+pi);
subplot(3,2,1);
plot(t,y)
xlabel('T','color','g');
ylabel('Amplitute','color','r');
title('Figure 1');
%--------2---------
omega2=pi/10;
n=-20:20;
z=A.*sin(omega2.*n);
subplot(3,2,2);
stem(n,z)
xlabel('N','color','g');
ylabel('Amplitute','color','r');
title('Figure 2');
%--------3---------
omega3=pi/6;
t=-20:20;
m=A.*cos(omega3.*t+pi);
subplot(3,2,3);
plot(t,m)
xlabel('T','color','g');
ylabel('Amplitute','color','r');
title('Figure 3');
%--------4---------
omega4=pi/10;
n=-20:20;
o=A.*cos(omega4.*t+pi);
subplot(3,2,4);
stem(n,o)
xlabel('N','color','g');
ylabel('Amplitute','color','r');
title('Figure 4');
%--------5---------
omega=20*pi;
t=-1:0.01:1;
a=0.75;
exp_sine=A.*exp(-a.*t).*sin(omega.*t+pi);
subplot(3,2,5);
plot(t,exp_sine)
xlabel('T','color','g');
ylabel('Amplitute','color','r');
title('Figure 5');
%--------6---------
omega6=2*pi/10;
n=-20:20;
a=1;
r=0.90;
s=a*(r.^n).*A.*sin(omega6.*n);
subplot(3,2,6);
stem(n,s);
xlabel('N','color','g');
ylabel('Amplitute','color','r');
title('Figure 6');