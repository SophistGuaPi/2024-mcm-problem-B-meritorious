function [all,value]=validation_0(data1,data2)
value=[];
for i=1:size(data1)
    value=[value norm(data1(i,:)-data2(i,:))];
end
all=sum(value);
end