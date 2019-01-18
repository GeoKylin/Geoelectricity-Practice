function  [rho] = sdcs1dford(ab2,nlayer,res,thick)
% sdcs1dford
%   电测深一维正演函数
% 输入参数：
%   极距：ab2--AB/2(m)
%   模型层数：nlayer
%   每层的电阻率：res(r*m)
%   除最后一层外的每层厚度：thick(m)
% 输出参数：
%   极距 ab2 对应深度处的视电阻率：rho(r*m)

%
% c--滤波系数，与电极装置类型有关
%
c=[0.003042,-0.001198,0.01284,0.0235,0.08688,0.2374,0.6194,1.1817,0.4248,-3.4507...
    2.7044,-1.1324,0.393,-0.1436,0.05812,-0.02521,0.01125,-0.004978,0.002072,-0.000318];
%
% 计算电阻率转换函数 T(j)
%
for j = 1:20
    T = res(nlayer);
    m = exp(j*log(10)/6-2.1719)/ab2;
    for i = (nlayer-1):(-1):1
        tt1 = 1 - exp(-2*m*thick(i));
        tt2 = 1 + exp(-2*m*thick(i));
          T = res(i)*(res(i)*tt1+T*tt2)/(res(i)*tt2+T*tt1);
    end
    B(j) = T;
end
%
% 计算视电阻率 rho
%
rho = 0;
for j=1:20     
    rho = rho + B(j)*c(j);
end
return