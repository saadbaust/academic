% Figure 1 unit impulse signal
t=-10:10;
v=[zeros(1,10),1,zeros(1,10)];
subplot(2,2,1);
stem(t,v);
xlabel('Time','color','r');
ylabel('Amplitute','color','r');
title('Unit Impulse Signal');
% Figure 2 unit step signal
t=-10:10;
v=[zeros(1,10),1,ones(1,10)];
subplot(2,2,2);
stem(t,v);
xlabel('Time','color','r');
ylabel('Amplitute','color','r');
title('Unit Step Signal');
% Figure 3 unit step signal
t=-10:10;
v=2*[zeros(1,10),1,ones(1,10)];
subplot(2,2,3);
stem(t,v);
xlabel('Time','color','r');
ylabel('Amplitute','color','r');
title('Unit Step Signal');
% Figure 4 unit ramp signal
t=-10:10;
v=[zeros(1,10),1,ones(1,10)].*t;
subplot(2,2,4);
stem(t,v);
xlabel('Time','color','r');
ylabel('Amplitute','color','r');
title('Unit Ramp Signal');