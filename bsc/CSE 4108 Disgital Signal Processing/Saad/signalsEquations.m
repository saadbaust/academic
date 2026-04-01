%----------y=2t+3t^2-------
t=0:10;
y=2.*t+3.*t.^2;
subplot(3,3,1);
plot(t,y);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Equation 1');
grid on;
%----------y=3t^3-------
t=0:10;
y=3.*t.^3;
subplot(3,3,2);
plot(t,y);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Equation 2');
grid on;
%----------y=e^3t+e^-2t+3t-------
t=0:1;
y=exp(3.*t)+exp(-2.*t)+3.*t;
subplot(3,3,3);
plot(t,y);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Equation 3');
grid on;
%----------y1=sin2pift-------
t=0:100;
f=0.075;
y1=sin(2*pi*f.*t);
subplot(3,3,4);
plot(t,y1);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Sine');
grid on;
%----------y2=cos2pift-------
t=0:100;
f=0.075;
y2=cos(2*pi*f.*t);
subplot(3,3,5);
plot(t,y2);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Cosine');
grid on;
%----------y=y1+y2-------
y=y1+y2;
subplot(3,3,6);
plot(t,y);
xlabel('Time','color','r');
ylabel('Amplitude','color','r');
title('Cosine');
grid on;