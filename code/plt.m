xb=x_0(:,1);yb=y_0(:,1);zb=z_0(:,1);
for i=2:num
    x=x_0(:,i);y=y_0(:,i);z=z_0(:,i);
    [h,a,ci,stats,all,value]=validation_0([xb yb zb],[x y z]);
    scatter(mass_amp(i),all,10,"b")
    hold on
end
xlabel('\Delta Mass(kg)')
ylabel('Average Distance(m)')
title('sensitivity')
grid on