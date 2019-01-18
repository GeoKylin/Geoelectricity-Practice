clear
close all
clc

load d;load freq;load rho_yx;
m=(min(d)+max(d))/2;
x=d;
freq=log10(freq);
rho_yx=log10(rho_yx);
[d,freq]=meshgrid(d,freq);

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,rho_yx,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,rho_yx);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
title('\rho_{yx}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

c=100; %滤波次数
l=26; %测点数
r_xy=rho_yx;
for f=1:72
    for k=1:c
        r_xy(f,1) = (69*r_xy(f,1) +4*(r_xy(f,2) +r_xy(f,4)) -6*r_xy(f,3) -r_xy(f,5)) /70;
        r_xy(f,2) = (2* (r_xy(f,1) +r_xy(f,5)) +27*r_xy(f,2) +12*r_xy(f,3) -8*r_xy(f,4)) /35;
        for j=3:l-2
            r_xy(f,j) = (-3*(r_xy(f,j-2) +r_xy(f,j+2)) +12*(r_xy(f,j-1) +r_xy(f,j+1)) +17*r_xy(f,j)) /35;
        end
        r_xy(f,l-1) = (2*(r_xy(f,l) +r_xy(f,l-4)) +27*r_xy(f,l-1) +12*r_xy(f,l-2) -8*r_xy(f,l-3)) /35;
        r_xy(f,l) = (69*r_xy(f,l) +4* (r_xy(f,l-1) +r_xy(f,l-3)) -6*r_xy(f,l-2) -r_xy(f,l-4)) /70;
    end
end

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,r_xy,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,r_xy);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
title(['\rho_{yx}5点3次' num2str(c) '次循环全局拟合平滑校正等值线图'],'position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

load d;load freq;load rho_xy;
m=(min(d)+max(d))/2;
x=d;
freq=log10(freq);
rho_xy=log10(rho_xy);
[d,freq]=meshgrid(d,freq);

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,rho_xy);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');title('\rho_{xy}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});


r_xy=rho_xy;
for f=1:72
    for k=1:c
        r_xy(f,1) = (69*r_xy(f,1) +4*(r_xy(f,2) +r_xy(f,4)) -6*r_xy(f,3) -r_xy(f,5)) /70;
        r_xy(f,2) = (2* (r_xy(f,1) +r_xy(f,5)) +27*r_xy(f,2) +12*r_xy(f,3) -8*r_xy(f,4)) /35;
        for j=3:l-2
            r_xy(f,j) = (-3*(r_xy(f,j-2) +r_xy(f,j+2)) +12*(r_xy(f,j-1) +r_xy(f,j+1)) +17*r_xy(f,j)) /35;
        end
        r_xy(f,l-1) = (2*(r_xy(f,l) +r_xy(f,l-4)) +27*r_xy(f,l-1) +12*r_xy(f,l-2) -8*r_xy(f,l-3)) /35;
        r_xy(f,l) = (69*r_xy(f,l) +4* (r_xy(f,l-1) +r_xy(f,l-3)) -6*r_xy(f,l-2) -r_xy(f,l-4)) /70;
    end
end

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,r_xy,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,r_xy);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
title(['\rho_{xy}5点3次' num2str(c) '次循环全局拟合平滑校正等值线图'],'position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});