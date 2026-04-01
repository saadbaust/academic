% Parameter:
t = -15:15;

% Unit Impulse:
y = [zeros(1,15),1,zeros(1,15)];
subplot(3,1,1);
stem(t,y,'red');
title('Unit Impulse')

% Unit Step:
y = [zeros(1,15),1,ones(1,15)];
subplot(3,1,2);
stem(t,y,'blue');
title('Unit Step')

% Ramp Signal:
y = [zeros(1,15),1,ones(1,15)].*t;
subplot(3,1,3);
stem(t,y,'m');
title('Ramp Signal')