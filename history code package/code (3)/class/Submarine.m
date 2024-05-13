classdef Submarine < handle
    %SUB 
    %   
    
    properties
        mass=0;
        I=[];
        
        start_position=[];
        position=[];%Inertial coordinate system
        V=0;
        
        imu_position=[0 0 0;0 0 0];%IMU coordinate system
        
        velocity=[];%natural coordinate system
        delta_t=0
    end
    
    methods
        
        function obj = Submarine(V,mass,I,position,velocity,delta_t)
            %SUB
            %  
            obj.V=V;
            obj.mass=mass;
            obj.start_position=position;
            obj.imu_position(2,:)=position(2,:);
            obj.position=position;
            obj.velocity=velocity;
            obj.delta_t=delta_t;
            obj.I=I;
        end
        
        function obj=Force(obj,f)
            %Force 
            %   
            new_v=[0 0 0;0 0 0];
            new_v(1,1)=obj.velocity(1,1)+(f(1,1).*obj.delta_t)./obj.mass+obj.velocity(2,3).*obj.velocity(1,2).*obj.delta_t-obj.velocity(2,2).*obj.velocity(1,3).*obj.delta_t;
            new_v(1,2)=obj.velocity(1,2)+(f(1,2).*obj.delta_t)./obj.mass+obj.velocity(2,1).*obj.velocity(1,3).*obj.delta_t-obj.velocity(2,3).*obj.velocity(1,1).*obj.delta_t;
            new_v(1,3)=obj.velocity(1,3)+(f(1,3).*obj.delta_t)./obj.mass+obj.velocity(2,2).*obj.velocity(1,1).*obj.delta_t-obj.velocity(2,1).*obj.velocity(1,2).*obj.delta_t;
            new_v(2,1)=obj.velocity(2,1)+(f(2,1).*obj.delta_t-(obj.I(3)-obj.I(2)).*obj.velocity(2,2).*obj.velocity(2,3).*obj.delta_t)./obj.I(1);
            new_v(2,2)=obj.velocity(2,2)+(f(2,2).*obj.delta_t-(obj.I(1)-obj.I(3)).*obj.velocity(2,3).*obj.velocity(2,1).*obj.delta_t)./obj.I(2);
            new_v(2,3)=obj.velocity(2,3)+(f(2,3).*obj.delta_t-(obj.I(2)-obj.I(1)).*obj.velocity(2,1).*obj.velocity(2,2).*obj.delta_t)./obj.I(3);
            obj.velocity=new_v;
        end
        
        function obj=update_position(obj)
            R=obj.get_R();
            
            %update Inertial
            obj.position(1,:)=obj.position(1,:)+(R*obj.velocity(1,:)')'.*obj.delta_t;
            obj.position(2,:)=obj.position(2,:)+(R*obj.velocity(2,:)')'.*obj.delta_t;
            
            %update IMU
            obj.imu_position(2,:)=obj.imu_position(2,:)+obj.velocity(2,:).*obj.delta_t;
            
        end
        
        function R=get_R(obj)
            roll=obj.imu_position(2,2);pitch=obj.imu_position(2,1);yaw=obj.imu_position(2,3);
            Rx=rotx(pitch);Ry=roty(roll);Rz=rotz(yaw);
            R=Ry*Rx*Rz;
        end
        
        
    end
end

