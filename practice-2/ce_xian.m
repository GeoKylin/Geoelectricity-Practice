clear
close all
clc

load zuo_biao %导入坐标数据
x=zuo_biao(:,1);y=zuo_biao(:,2);h=zuo_biao(:,3); %获得X、Y、H分量
X=min(x):0.1:max(x);Hx=spline(x,h,X); %插值
Y=min(y):0.1:max(y);Hy=spline(y,h,Y); %插值
%绘制测线三维立体图
figure;set(gcf,'outerposition',get(0,'screensize'));
subplot(2,2,1);plot3(x,y,h,'o-');grid on;
xlabel('X/m');ylabel('Y/m');zlabel('H/m');axis([min(x) max(x) min(y) max(y) min(h) max(h)])
%绘制测线XH平面地势图
subplot(2,2,2);plot(x,h,'o');grid on;legend('测点1-29','Location','best');
hold on;plot(X,Hx,'b-');
title('测线b5正视图，XH平面');axis([min(X) max(X) min(Hx) max(Hx)]);xlabel('X/m');ylabel('H/m');
%绘制测线水平投影图
subplot(2,2,3);plot(x,y,'o-');grid on;legend('测点1-29','Location','best');
title('测线b5俯视图，XY平面');axis([min(X) max(X) min(Y) max(Y)]);xlabel('X/m');ylabel('Y/m');
%绘制测线YH平面地势图
subplot(2,2,4);plot(y,h,'o');grid on;legend('测点1-29','Location','best');
hold on;plot(Y,Hy,'b-');
title('测线b5左视图，YH平面');axis([min(Y) max(Y) min(Hy) max(Hy)]);xlabel('Y/m');ylabel('H/m');
set(gca,'xdir','reverse');