subplot(3,3,1);
plot3(p(:,1),p(:,2),p(:,3),'-b')
grid on %加网格
axis square %命令坐标为方形

subplot(3,3,2);
plot(t,v(:,1))
title("u-t");
subplot(3,3,3);
plot(t,v(:,2))
title("v-t");
subplot(3,3,4);
plot(t,v(:,3))
title("w-t");

subplot(3,3,5);
plot(t,p(:,1))
title("x-t");
subplot(3,3,6);
plot(t,p(:,2))
title("y-t");
subplot(3,3,7);
plot(t,p(:,3))
title("z-t");