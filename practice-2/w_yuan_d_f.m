clear
close all
clc

load d;load freq;load rho_xy;load rho_yx;load phi_xy;load phi_yx
m=(min(d)+max(d))/2;
x=d;
freq=log10(freq);
rho_xy=log10(rho_xy);
rho_yx=log10(rho_yx);
[d,freq]=meshgrid(d,freq);

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
% title('\rho_{xy}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'}); 

figure;
% set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,rho_yx,20);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
% title('\rho_{yx}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'}); 

figure;
% set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,phi_xy);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
% title('\phi_{xy}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\phi_{xy},\circ)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'}); 

figure;
% set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,phi_yx);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
% title('\phi_{yx}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\phi_{yx},\circ)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'}); 