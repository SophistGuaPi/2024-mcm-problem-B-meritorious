function [f] = get_force(submarine,environment)
%
%   
f_inertial = (submarine.V.*environment.rho-submarine.mass).*[0 0 -9.8;0 0 0];
f_imu = -(environment.C.*environment.rho.*sign(submarine.velocity(1,:)).*submarine.velocity(1,:).^2)./2+(environment.A*environment.rho*(-submarine.velocity(1,:)+(submarine.get_R*environment.velocity')'));
x=(submarine.get_R*f_inertial')';
f=[f_imu+x(1,:);x(2,:)];
end

