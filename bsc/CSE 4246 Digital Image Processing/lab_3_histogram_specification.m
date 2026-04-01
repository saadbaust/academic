clear;clc;
band=[];
for i=0:7
   band=[band i];
 end
freq=[8 10 10 2 12 16 4 2];
freq2=[0 0 0 0 20 20 16 8];
%---------------------------------------------------------------
% Cumulative sum:
sum=0;
cum=[];
for i=1:8
   sum=sum+freq(i);
   cum=[cum sum];
end
% PDF probability density function:
ans=0;
PDF=[];
for i=1:8
   ans=cum(i)/cum(end);
   PDF=[PDF ans];
   ans=0;                                    
end
% PDF * Max gray value:
ans=0;
maxPDF=[];
for i=1:8
   ans=PDF(i)*band(end);
   maxPDF=[maxPDF ans];
   ans=0;
end
% ROUND(PDF * Max gray value):
ans=0;
roundMaxPDF1=[];
for i=1:8
   roundMaxPDF1=[roundMaxPDF1 round(maxPDF(i))];
   ans=0;
end
result=[band;freq;cum;PDF;maxPDF;roundMaxPDF1];
result
%---------------------------------------------------------------
% Cumulative sum:
sum=0;
cum=[];
for i=1:8
   sum=sum+freq2(i);
   cum=[cum sum];
end
% PDF probability density function:
ans=0;
PDF=[];
for i=1:8
   ans=cum(i)/cum(end);
   PDF=[PDF ans];
   ans=0;                                    
end
% PDF * Max gray value:
ans=0;
maxPDF=[];
for i=1:8
   ans=PDF(i)*band(end);
   maxPDF=[maxPDF ans];
   ans=0;
end
% ROUND(PDF * Max gray value):
ans=0;
roundMaxPDF2=[];
for i=1:8
   roundMaxPDF2=[roundMaxPDF2 round(maxPDF(i))];
   ans=0;
end
result2=[band;freq;cum;PDF;maxPDF;roundMaxPDF2];
result2
%---------------------------------------------------------------

% MAPPING FUNCTION:
temp=0;
map=[];
for i=1:8
    for j=1:8
        if roundMaxPDF1(i)<=roundMaxPDF2(j)
            temp=roundMaxPDF2(j);
            index = find(roundMaxPDF2==temp);
            map=[map band(index)];
            break
        end
    end
end
map

result3=[map;freq]
result3

%---------------------------------------------------------------

for i=0:7
    % Map porjonto pari ar pari nah
end
