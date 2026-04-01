clear;
clc;

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
for i=0:7
    count=0;
    for j=1:25
        if i==A(j)
            count=count+1;
        end
    end
    freq=[freq count];
end

cum=[];
temp=0;
for i=1:8
    temp=temp+freq(i);
    cum=[cum temp];
end

PDF=[];
for i=1:8
    PDF=[PDF cum(i)/cum(end)];
end

CDF=[];
for i=1:8
    CDF=[CDF PDF(i)*band(end)];
end

roundCDF=[];
for i=1:8
    roundCDF=[roundCDF round(CDF(i))];
end

result=[band;freq;cum;PDF;CDF;roundCDF];
result

% Mapping
eqhist=[];
temp=0;
sum=0;
for i=0:7
    index=find(roundCDF==i);
    index;
    len=length(index);
    if len==0
        eqhist=[eqhist 0];
    else
        sum=0;
        for j=1:len
            sum=sum+freq(index(j));
        end
        eqhist=[eqhist sum];
    end
end

final=[band;eqhist];
final
