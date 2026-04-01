% Numeritor and Denominators:
num=[1.5,2,3];
den=[2,-1.5,5,6];

% Fucntion:
y=tf(num,den);
pzmap(y);

axis equal;
sgrid;