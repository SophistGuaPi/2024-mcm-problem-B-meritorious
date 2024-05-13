function [x_index,y_index,z_index] = get_position(position,lenth)
%GET_POSITION 
% 
x_index=ceil(position(1)./lenth)+1;
y_index=ceil(position(2)./lenth)+1;
z_index=ceil(position(3)./lenth)+1;
end

