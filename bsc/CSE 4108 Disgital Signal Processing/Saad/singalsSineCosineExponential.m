%----------Sine CT------
A=10;
t=0:100;
omega=0.1;
x=A*sin(omega.*t);
subplot(4,4,1);
plot(t,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Sine CT');
grid on;
%----------Cosine CT------
A=10;
t=0:100;
omega=0.1;
x=A*cos(omega.*t);
subplot(4,4,2);
plot(t,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Cosine CT');
grid on;
%----------Sine DT------
A=10;
n=-10:10;
omega=0.3;
x=A*sin(omega.*n+pi);
subplot(4,4,3);
stem(n,x);
xlabel('N','color','r');
ylabel('Amplitude','color','r');
title('Sine DT');
grid on;
%----------Cosine DT------
A=10;
n=-10:10;
omega=0.3;
x=A*cos(omega.*n+pi);
subplot(4,4,4);
stem(n,x);
xlabel('N','color','r');
ylabel('Amplitude','color','r');
title('Cosine DT');
grid on;
%----------Exp Sine CT------
A=10;
t=0:0.01:10;
omega=10;
a=0.50;
x=A.*exp(-a.*t).*sin(omega.*t+pi);
subplot(4,4,5);
plot(t,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('EXP Sine CT');
grid on;
%----------Exp Sine DT------
A=10;
n=-1:0.025:1;
omega=10;
a=0.50;
x=A.*exp(-a.*n).*sin(omega.*n+pi);
subplot(4,4,6);
stem(n,x);
xlabel('N','color','r');
ylabel('Amplitude','color','r');
title('EXP Sine DT');
grid on;