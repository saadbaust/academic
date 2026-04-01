clear;
clc;

% Basic:
a=55;
b=5;

disp(a+b);
disp(a-b);
disp(a*b);
disp(a/b);

% MAtrix:
a=[1 2 3;
   4 5 6];
b=[9 8 7;
   9 8 7];

disp(a+b);
disp(a-b);

disp(a*2); % Single Matrix
disp(a/2); % Single Matrix

disp(a.*b); % Elementwise
disp(a./b); % Elementwise

% Matrix flip:
hor=a(end:-1:1,:);
disp(hor);

ver=a(:,end:-1:1);
disp(ver);

a=5;
b=6;

% Condition and loop:
if a>b
    for i=1:5
       disp('a>b');
    end
elseif a==b
    for i=1:5
       disp('a==b');
    end
else
    for i=1:5
       disp('a<b');
    end
end