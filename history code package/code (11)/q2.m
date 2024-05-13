%假定搜索海域
clear;clc;
l=8000;w=6000;h=4000;
lenth=100;

ln=ceil(l./lenth);wn=ceil(w./lenth);hn=ceil(h./lenth);
e(ln,wn,hn+1)=environment;
[x,y,depth]=get_depth([ln wn]);
depth=depth.*20;
ae_velocity=[0.12 -0.19 0.02];v_amp=0.2;
atemp=30;temp_amp=3;

for i=1:ln
    for j=1:wn
        for k=1:hn+1
%             if isnan(e(i,j,k).position)
%                 continue
%             end
            position=[(i-1).*lenth (j-1).*lenth (k-1).*lenth];
%             if depth(i,j)<=position(3) || isnan(depth(i,j))
% %                 e(i,j,k+1).position=NaN;
%                 continue
%             end
            
%             temp=0;e_velocity=[0 0 0];
            e_velocity=ae_velocity+v_amp.*randn([1,3]);
            temp=atemp+temp_amp.*randn();
            e(i,j,k).position=position;
            [rho,C]=environment_parameters(temp,(k-1).*lenth);
            e(i,j,k).rho=rho;
            e(i,j,k).C=C;
            e(i,j,k).lenth=lenth;
            e(i,j,k).velocity=e_velocity;
        end
    end
end

V=14.8;
position=[5000 3000 30;10 20 40];
velocity=[2 -3 3;0 0 0];
mass=6.519e3+8.6e3;
I=[15.451e3 6.712e3 15.451e3];
delta_t=1;
num=10;
s(num)=Submarine;

mass_amp=500;l_amp=20;h_amp=10;ang_amp=10;velocity_amp=1;
for i=1:num
    s(i).V=V;s(i).I=I;s(i).delta_t=delta_t;
    s(i).mass=mass+mass_amp.*randn();
    s(i).position(1,1:2)=position(1,1:2)+l_amp.*randn([1,2]);s(i).position(1,3)=position(1,3)+h_amp.*randn();
    s(i).position(2,:)=position(2,:)+ang_amp.*randn([1,3]);
    s(i).velocity(1,:)=velocity(1,:)+velocity_amp.*randn([1,3]);
    s(i).velocity(2,:)=[0 0 0];
    s(i).start_position=s(i).position;
end


etime=2000;
x_0=[];y_0=[];z_0=[];
for i=1:num
    x=[];y=[];z=[];p=s(i).position(1,:);
    for t=0:delta_t:etime
        [x_index,y_index,z_index]=get_position(s(i).position(1,:),lenth);
        if s(i).position(1,3)<=0
            s(i).position(1,3)=0;s(i).position(2,1)=0;
            s(i).velocity(1,3)=0;
        end
        if depth(x_index,y_index)<=s(i).position(1,3)
            s(i).position(1,3)=depth(x_index,y_index);s(i).position(2,1)=0;
            s(i).velocity(1,3)=-0.001.*s(i).velocity(1,3);
    %         break
        end
        s(i).update_position();
        s(i).Force(get_force(s(i),e(x_index,y_index,z_index)));
        x=vertcat(x,s(i).position(1,1));
        y=vertcat(y,s(i).position(1,2));
        z=vertcat(z,s(i).position(1,3));
    end
    x_0=horzcat(x_0,x);y_0=horzcat(y_0,y);z_0=horzcat(z_0,z);
end
t=linspace(0,etime,2+etime./delta_t);
plot3(x_0,y_0,z_0,'-b')
grid on %加网格
axis square %命令坐标为方形