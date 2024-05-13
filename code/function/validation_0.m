function [h,p,ci,stats,all,value]=validation_0(data1,data2)
value=[];
for i=1:size(data1)
    value=[value norm(data1(i,:)-data2(i,:))];
end
s=size(data1);
all=sum(value)./s(1);
[h,p,ci,stats]=ttest(data1,data2);
end