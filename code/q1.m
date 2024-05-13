clear;clc

parameters=[0.1 0.2 0.2 0.2 0.3];%权重

x=[36 702.83 0 12 10.5;130 2007.98 0 12 15;100 1099 2 2 100;91 139 0 12 8;60 772.43 0 12 22;60 111.2 0 4 30;25 799 3.5 2 164.6;100 1799 2.5 5 130;15 599 1.5 4 120];%矩阵
[n,m]=size(x);
%将3，4，7的低优指标去倒数转化为高优指标并且把所有指标换成接近的大小?
x(:,1)=x(:,1)./10;
x(:,2)=x(:,2)./100;
x(:,5)=x(:,5)./10;
zh=zeros(1,m);
d1=zeros(1,n); %最小值矩阵
d2=zeros(1,n); %最大值矩阵
c=zeros(1,n);  %接近程度

%归一化
for i=1:m
    for j=1:n
        zh(i)=zh(i)+x(j,i)^2;
    end
end
for i=1:m
    for j=1:n
       x(j,i)=x(j,i)/sqrt( zh(i));
    end
end
x=x.*parameters;
%计算距离
xx=min(x);
dd=max(x);
for i=1:n
    for j=1:m
        d1(i)=d1(i)+(x(i,j)-xx(j))^2;
    end
    d1(i)=sqrt(d1(i));
end
for i=1:n
    for j=1:m
        d2(i)=d2(i)+(x(i,j)-dd(j))^2;
    end
    d2(i)=sqrt(d2(i));
end
%计算接近程度
for i=1:n
    c(i)=d1(i)/(d2(i)+d1(i));
end
c