clear
close all
clc

load d;load freq;load rho_xy;
m=(min(d)+max(d))/2; %标题横坐标
x=d; %横坐标
freq=log10(freq);
rho_xy=log10(rho_xy);

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');title('\rho_{xy}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

c=14;
for k=1:c
    r_xy=rho_xy;
    for i=2:71
        for j=2:25
            w=[r_xy(i-1,j-1:j+1),r_xy(i,j-1:j+1),r_xy(i+1,j-1:j+1)];
            w=sort(w);
            rho_xy(i,j)=w(5);
        end
    end
end
[d,freq]=meshgrid(d,freq);

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
title(['\rho_{xy}9点' num2str(c) '次中值滤波校正等值线图'],'position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});