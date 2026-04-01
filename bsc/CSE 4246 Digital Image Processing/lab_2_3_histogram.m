clear;clc;
A = [0,0,0,2,0;
     2,1,1,1,1;
     3,6,5,2,3;
     3,7,7,4,5;
     2,5,6,6,7];
band=[];
for i=0:7
   band=[band i];
 end
freq=[];
count=0;
for i=0:7
     for j=1:25
         if i==A(j)
             count = count + 1;
         end
     end
     freq=[freq count];
     count=0;
end
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
roundMaxPDF=[];
for i=1:8
   roundMaxPDF=[roundMaxPDF round(maxPDF(i))];
   ans=0;
end

%figure();
%stem(band,freq);

% Equilized histogram:
eqHgram=[];
temp=0;
sum =0;
for i=0:7
    index = find(roundMaxPDF==i);
    index;
    lenIndex = length(index);
    lenIndex;
    if lenIndex == 0
        eqHgram=[eqHgram 0];
    else
        for j=1:lenIndex
            sum = sum + freq(index(j));
        end
        eqHgram=[eqHgram sum];
        sum = 0;
    end
end 

%figure();
%stem(band,eqHgram);

result=[band;freq;cum;PDF;maxPDF;roundMaxPDF;eqHgram];
result