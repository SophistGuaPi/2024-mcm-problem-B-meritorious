% % draw
t=linspace(0,etime,2+etime./delta_t);
subplot(1,3,1);
plot3(data11(:,1),data11(:,2),data11(:,3),'-b')
hold on;
plot3(data12(:,1),data12(:,2),data12(:,3),'-b')
hold on;
plot3(data13(:,1),data13(:,2),data13(:,3),'-b')
hold on;
plot3(data14(:,1),data14(:,2),data14(:,3),'-b')
hold on;
plot3(data15(:,1),data15(:,2),data15(:,3),'-b')
grid on %加网格

subplot(1,3,2);
plot3(data21(:,1),data21(:,2),data21(:,3),'-b')
hold on;
plot3(data22(:,1),data22(:,2),data22(:,3),'-b')
hold on;
plot3(data23(:,1),data23(:,2),data23(:,3),'-b')
hold on;
plot3(data24(:,1),data24(:,2),data24(:,3),'-b')
hold on;
plot3(data25(:,1),data25(:,2),data25(:,3),'-b')
grid on %加网格

subplot(1,3,3);
plot3(data31(:,1),data31(:,2),data31(:,3),'-b')
hold on;
plot3(data32(:,1),data32(:,2),data32(:,3),'-b')
hold on;
plot3(data33(:,1),data33(:,2),data33(:,3),'-b')
hold on;
plot3(data34(:,1),data34(:,2),data34(:,3),'-b')
hold on;
plot3(data35(:,1),data35(:,2),data35(:,3),'-b')
grid on %加网格

[h,p,ci,stats,all,value]=validation_0(data11,data12);
plot(value)
% 
% subplot(3,3,2);
% plot(t,v(:,1))
% title("u-t");
% subplot(3,3,3);
% plot(t,v(:,2))
% title("v-t");
% subplot(3,3,4);
% plot(t,v(:,3))
% title("w-t");
% 
% subplot(3,3,5);
% plot(t,p(:,1))
% title("x-t");
% subplot(3,3,6);
% plot(t,p(:,2))
% title("y-t");
% subplot(3,3,7);
% plot(t,p(:,3))
% title("z-t");
