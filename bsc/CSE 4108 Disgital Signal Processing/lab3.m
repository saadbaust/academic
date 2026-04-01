% Square CT Signal:
A=5;
omega=5*pi;
rho=1;
t=0:0.001:2;
X=A*square(omega*t*rho);
subplot(4,2,1);
plot(t,X)
xlabel('T','color','b');
ylabel('Amplitude (A)','color','b');
title('Square CT Signal')

% Square DT Signal:
A=5;
omega1=pi/8;
n=0:20;
Y=A*square(omega1*n);
subplot(4,2,2);
stem(n,Y);
xlabel('n','color','b');
ylabel('Amplitude (A)','color','b');
title('Square DT Signal')

% Triangle CT Signal
A=5;
omega2=10*pi;
t=0:0.001:1;
X2=A*sawtooth(omega2*t,1/2);
subplot(4,2,3);
plot(t,X2)
xlabel('T','color','b');
ylabel('Amplitude (A)','color','b');
title('Triangle CT Signal')

% Triangle DT Signal
A=5;
omega2=pi/4;
n=-10:0.5:10;
X3=A*sawtooth(omega2*n,1/2);
subplot(4,2,4);
stem(n,X3)
xlabel('n','color','b');
ylabel('Amplitude (A)','color','b');
title('Triangle DT Signal')

% Negetive Exponential Signal 
% CT Signal 
A=5;
t=0:0.01:1;
x=A*exp(-A*t);
subplot(4,2,5);
plot(t,x)
xlabel('T','color','b');
ylabel('Amplitude (A)','color','b');
title('Negetive Exponential CT Signal')

% DT Signal 
A=5;
t=-1:0.075:1;
x2=A*exp(-A*t);
subplot(4,2,6);
stem(t,x2)
xlabel('n','color','r');
ylabel('Amplitude (A)','color','b');
title('Negetive Exponential DT Signal')

% Positive Exponential Signal 
% CT Signal 
A=5;
t=0:0.01:1;
x=A*exp(A*t);
subplot(4,2,7);
plot(t,x)
xlabel('T','color','b');
ylabel('Amplitude (A)','color','b');
title('Negetive Exponential DT Signal')

% DT Signal 
A=5;
t=-1:0.075:1;
x2=A*exp(A*t);
subplot(4,2,8);
stem(t,x2)
xlabel('n','color','r');
ylabel('Amplitude (A)','color','b');
title('Positive Exponential DT Signal')
