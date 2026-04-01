clear; clc;
%a = input('Rows');
%b = input('Coloumns');
%for i=1:a
    %for j=1:b
      % q(i,j)=input('Elements');
   % end
%end
p=[1 2 3;
    4 5 6;
    7 8 9]; %matrix 
disp(p)
%q=reshape(p,a,b);
%disp(q)
horizontalp = p(end : -1: 1, :); 
disp(horizontalp)
verticalp = p( : , end: -1 : 1); 
disp(verticalp)