clear
close all
clc

load d;load freq;load rho_xy;load rho_yx;
r_xy=rho_xy(1,:);
r_yx=rho_yx(1,:);
rho=sqrt(r_xy.^2+r_yx.^2);
n=2;
Nx=1000;
dx=(max(d)-min(d))/(Nx-1);

c=100; %滤波次数
l=length(rho); %长度
rho_p=rho;
for k=1:c
    b(1) = (69*rho_p(1) +4*(rho_p(2) +rho_p(4)) -6*rho_p(3) -rho_p(5)) /70;
    b(2) = (2* (rho_p(1) +rho_p(5)) +27*rho_p(2) +12*rho_p(3) -8*rho_p(4)) /35;
    for j=3:l-2
        b(j) = (-3*(rho_p(j-2) +rho_p(j+2)) +12*(rho_p(j-1) +rho_p(j+1)) +17*rho_p(j)) /35;
    end
    b(l-1) = (2*(rho_p(l) +rho_p(l-4)) +27*rho_p(l-1) +12*rho_p(l-2) -8*rho_p(l-3)) /35;
    b(l) = (69*rho_p(l) +4* (rho_p(l-1) +rho_p(l-3)) -6*rho_p(l-2) -rho_p(l-4)) /70;
    rho_p=b;
end
rho_0_p=rho_p;

figure;plot(d,r_xy);grid on;axis([min(d) max(d) min(r_xy) max(r_xy)]);
title('首支频点\rho_{xy}');xlabel('测点x');ylabel('\rho_{xy}');set(gca,'XTick',d);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

figure;plot(d,r_yx);grid on;axis([min(d) max(d) min(r_yx) max(r_yx)]);
title('首支频点\rho_{yx}');xlabel('测点x');ylabel('\rho_{yx}');set(gca,'XTick',d);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

figure;plot(d,rho,'o',d,rho_p);grid on;
axis([min(d) max(d) min(min(rho),min(rho_p)) max(max(rho),max(rho_p))]);
title('首支参考频点\rho');xlabel('测点x');ylabel('\rho');set(gca,'XTick',d);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});


m=(min(d)+max(d))/2;
x=d;
freq=log10(freq);
[d,freq]=meshgrid(d,freq);
rho_xy=log10(rho_xy);
rho_yx=log10(rho_yx);

figure;set(gcf,'outerposition',get(0,'screensize'));
subplot(2,2,1);contourf(d,freq,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,rho_xy);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
title('\rho_{xy}等值线图','position',[m,-3.5]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'}); 

% figure;set(gcf,'outerposition',get(0,'screensize'));
subplot(2,2,2);contourf(d,freq,rho_yx,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,rho_yx);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
title('\rho_{yx}等值线图','position',[m,-3.5]);
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

for i=1:26
    drho_xy(i)=log(rho_0_p(i))-rho_xy(1,i);
    drho_yx(i)=log(rho_0_p(i))-rho_yx(1,i);
    for j=1:72
        rho_xy(j,i)=drho_xy(i)+rho_xy(j,i);
        rho_yx(j,i)=drho_yx(i)+rho_yx(j,i);
    end
end

% figure;set(gcf,'outerposition',get(0,'screensize'));
subplot(2,2,3);contourf(d,freq,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,rho_xy);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
title(['\rho_{xy}5点3次' num2str(c) '次循环首支拟合平移校正等值线图'],'position',[m,-3.5]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

% figure;set(gcf,'outerposition',get(0,'screensize'));
subplot(2,2,4);contourf(d,freq,rho_yx,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,rho_yx);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
title(['\rho_{yx}5点3次' num2str(c) '次循环首支拟合平移校正等值线图'],'position',[m,-3.5]);
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});