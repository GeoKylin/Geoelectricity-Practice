clear
close all
clc

load rho_xy;load rho_yx;load freq;
T=freq.^(-1);

figure;set(gcf,'outerposition',get(0,'screensize'));
for c=4:29
    r_xy=rho_xy(:,c-3);
    r_yx=rho_yx(:,c-3);
    subplot(4,7,c-3);
    loglog(T,r_xy);grid on;hold on;loglog(T,r_yx);xlabel('T/s');ylabel('\rho_{xy}(À¶)¡¢\rho_{yx}(\Omega\bulletm)');
    title(['²âµã' num2str(c)]);
    axis([min(T) max(T) min(min(r_xy),min(r_yx)) max(max(r_xy),max(r_yx))]);
end