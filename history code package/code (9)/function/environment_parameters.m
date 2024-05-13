function [rho,C] = environment_parameters(temp,depth)
%ENVIRONMENT_FORCE 
% 
rho = (1.0234-0.2e-3.*(temp-(3.*depth)./2000)).*1000;
C = rho.*(4.28e-5+1./(0.157.*(temp+64.993).^2-91.296)).*(1.242+0.027.*temp);
end

