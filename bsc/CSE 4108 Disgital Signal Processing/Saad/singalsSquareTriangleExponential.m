%------------square wave CT--------
A=10;
t=0:100;
omega=0.3;
x=A.*square(omega.*t);
subplot(4,4,1);
plot(t,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Square CT Signal');
grid on;
%------------square wave DT--------
A=10;
n=-10:10;
omega=0.5;
x=A*square(omega.*n);
subplot(4,4,2);
stem(n,x);
xlabel('N','color','r');
ylabel('Amplitude','color','r');
title('Square DT Signal');
grid on;
%------------sawtooth wave CT--------
A=10;
t=0:100;
omega=0.3;
x=A*sawtooth(omega.*t,1/2);
subplot(4,4,3);
plot(t,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('SawTooth CT Signal');
grid on;
%------------sawtooth wave DT--------
A=10;
n=-10:10;
omega=0.5;
x=A*sawtooth(omega.*n,1/2);
subplot(4,4,4);
stem(n,x);
xlabel('N','color','r');
ylabel('Amplitude','color','r');
title('SawTooth DT Signal');
grid on;
%------------exp wave CT-------
A=3;
t=0:0.01:1;
x=A*exp(A.*t);
subplot(4,4,5);
plot(t,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('EXP CT wave pos');
%------------exp wave DT-------
A=3;
n=-1:0.075:1;
x=A*exp(A.*n);
subplot(4,4,6);
stem(n,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('EXP DT wave pos');
%------------exp wave CT-------
A=3;
t=0:0.01:1;
x=A*exp(-A.*t);
subplot(4,4,7);
plot(t,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('EXP CT wave neg');
%------------exp wave DT-------
A=3;
n=-1:0.075:1;
x=A*exp(-A.*n);
subplot(4,4,8);
stem(n,x);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('EXP DT wave neg');