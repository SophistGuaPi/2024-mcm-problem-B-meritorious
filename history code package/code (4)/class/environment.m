classdef environment
    %ENVIRONMENT �˴���ʾ�йش����ժҪ
    %   �˴���ʾ��ϸ˵��
    
    properties
        rho=0;
        velocity=[];
        position=[];
        C=0;
        lenth=0
        height;
        A=1
    end
    
    methods
%         function obj = environment(A,rho,velocity,position,C,lenth)
%             %ENVIRONMENT 
%             %   
%             obj.A=A;
%             obj.rho=rho;
%             obj.lenth=lenth;
%             obj.velocity=velocity;
%             obj.position=position;
%             obj.C=C;
%         end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 �˴���ʾ�йش˷�����ժҪ
            %   �˴���ʾ��ϸ˵��
            outputArg = obj.Property1 + inputArg;
        end
    end
end

