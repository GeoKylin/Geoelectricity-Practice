clear
close all
clc

load d;load freq;load rho_xy;load rho_yx;
m=(min(d)+max(d))/2; %标题横坐标
x=d; %横坐标
freq=log10(freq);
rho_xy=log10(rho_xy);
rho_yx=log10(rho_yx);

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,rho_xy);set(gca,'xaxislocation','top');h=colorbar;shading interp
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
% title('\rho_{xy}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d,freq,rho_yx,20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d,freq,rho_xy);set(gca,'xaxislocation','top');h=colorbar;shading interp
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
% title('\rho_{xy}等值线图','position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

c=10;
for k=1:c
    r_xy=rho_xy;
    r_yx=rho_yx;
    for i=2:71
        for j=2:25
            w=[r_xy(i-1,j),r_xy(i,j-1:j+1),r_xy(i+1,j)];
            w1=[r_yx(i-1,j),r_yx(i,j-1:j+1),r_yx(i+1,j)];
            rho_xy(i,j)=mean(w);
            rho_yx(i,j)=mean(w1);
        end
    end
end

[d,freq]=meshgrid(d,freq);
figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d(2:71,:),freq(2:71,:),rho_xy(2:71,:),20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d(2:71,:),freq(2:71,:),rho_xy(2:71,:));set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
% title(['\rho_{xy}5点' num2str(c) '次均值滤波校正等值线图'],'position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});

figure;%set(gcf,'outerposition',get(0,'screensize'));
contourf(d(2:71,:),freq(2:71,:),rho_yx(2:71,:),20);set(gca,'xaxislocation','top');h=colorbar;
% surfc(d(2:71,:),freq(2:71,:),rho_xy(2:71,:));set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('测点x（d\approx1.952\times10^7m）');
% title(['\rho_{xy}5点' num2str(c) '次均值滤波校正等值线图'],'position',[m,-3.2]);
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});