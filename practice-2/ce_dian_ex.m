clear
close all
clc

c=4;
load rho_xy;load rho_yx;load freq;load zuo_biao;load phi_xy;load phi_yx;
T=freq.^(-1);
X=zuo_biao(:,1);
Y=zuo_biao(:,2);
rho_xy=rho_xy(:,c-3);
phi_xy=phi_xy(:,c-3);
rho_yx=rho_yx(:,c-3);
phi_yx=phi_yx(:,c-3);

figure;%set(gcf,'outerposition',get(0,'screensize'));
% subplot(2,3,1);
loglog(T,rho_xy);grid on;hold on;loglog(T,rho_yx);xlabel('T/s');ylabel('\rho_{xy}、\rho_{yx}(\Omega\bulletm)');
% title(['测点' num2str(c)]);
legend('\rho_{xy}','\rho_{yx}','Location','best');
axis([min(T) max(T) min(min(rho_xy),min(rho_yx)) max(max(rho_xy),max(rho_yx))])

% subplot(2,3,2);loglog(T,rho_xy);grid on;
% xlabel('T');ylabel('\rho_{xy}');title(['测点' num2str(c)]);axis([min(T) max(T) min(rho_xy) max(rho_xy)])

% subplot(2,3,3);loglog(T,rho_yx);grid on;
% xlabel('T');ylabel('\rho_{yx}');title(['测点' num2str(c)]);axis([min(T) max(T) min(rho_yx) max(rho_yx)])

figure;%subplot(2,3,4);
semilogy(freq);grid on;
% title(['测点' num2str(c)]);xlabel('n');
ylabel('freq/Hz');axis([1 length(freq) min(freq) max(freq)]);

figure;%subplot(2,3,5);
semilogx(T,phi_xy);grid on;
xlabel('T/s');ylabel('\phi_{xy}(\circ)');%title(['测点' num2str(c)]);
axis([min(T) max(T) min(phi_xy) max(phi_xy)])

figure;%subplot(2,3,6);
semilogx(T,phi_yx);grid on;
xlabel('T/s');ylabel('\phi_{yx}(\circ)');%title(['测点' num2str(c)]);
axis([min(T) max(T) min(phi_yx) max(phi_yx)])