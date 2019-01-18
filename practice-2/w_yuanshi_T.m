clear
close all
clc

load x;load T;load rho_xy;load rho_yx;load phi_xy;load phi_yx
T=log10(T);
rho_xy=log10(rho_xy);
rho_yx=log10(rho_yx);
[x,T]=meshgrid(x,T);

figure;set(gcf,'outerposition',get(0,'screensize'));
contourf(x,T,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;set(gca,'ydir','reverse');
ylabel('log(T)');xlabel('测点x');title('\rho_{xy}等值线图','position',[16.5,3.2]);
set(get(h,'title'),'string','log(\rho_{xy})');set(gca,'XTick',(4:1:29));

figure;set(gcf,'outerposition',get(0,'screensize'));
contourf(x,T,rho_yx,20);set(gca,'xaxislocation','top');h=colorbar;set(gca,'ydir','reverse');
ylabel('log(T)');xlabel('测点x');title('\rho_{yx}等值线图','position',[16.5,3.2]);
set(get(h,'title'),'string','log(\rho_{yx})');set(gca,'XTick',(4:1:29));

figure;set(gcf,'outerposition',get(0,'screensize'));
contourf(x,T,phi_xy);set(gca,'xaxislocation','top');h=colorbar;set(gca,'ydir','reverse');
ylabel('log(T)');xlabel('测点x');title('\phi_{xy}等值线图','position',[16.5,3.2]);
set(get(h,'title'),'string','log(\phi_{xy})');set(gca,'XTick',(4:1:29));

figure;set(gcf,'outerposition',get(0,'screensize'));
contourf(x,T,phi_yx);set(gca,'xaxislocation','top');h=colorbar;set(gca,'ydir','reverse');
ylabel('log(T)');xlabel('测点x');title('\phi_{yx}等值线图','position',[16.5,3.2]);
set(get(h,'title'),'string','log(\phi_{yx})');set(gca,'XTick',(4:1:29));