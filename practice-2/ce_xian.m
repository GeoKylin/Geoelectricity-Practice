clear
close all
clc

load zuo_biao %������������
x=zuo_biao(:,1);y=zuo_biao(:,2);h=zuo_biao(:,3); %���X��Y��H����
X=min(x):0.1:max(x);Hx=spline(x,h,X); %��ֵ
Y=min(y):0.1:max(y);Hy=spline(y,h,Y); %��ֵ
%���Ʋ�����ά����ͼ
figure;set(gcf,'outerposition',get(0,'screensize'));
subplot(2,2,1);plot3(x,y,h,'o-');grid on;
xlabel('X/m');ylabel('Y/m');zlabel('H/m');axis([min(x) max(x) min(y) max(y) min(h) max(h)])
%���Ʋ���XHƽ�����ͼ
subplot(2,2,2);plot(x,h,'o');grid on;legend('���1-29','Location','best');
hold on;plot(X,Hx,'b-');
title('����b5����ͼ��XHƽ��');axis([min(X) max(X) min(Hx) max(Hx)]);xlabel('X/m');ylabel('H/m');
%���Ʋ���ˮƽͶӰͼ
subplot(2,2,3);plot(x,y,'o-');grid on;legend('���1-29','Location','best');
title('����b5����ͼ��XYƽ��');axis([min(X) max(X) min(Y) max(Y)]);xlabel('X/m');ylabel('Y/m');
%���Ʋ���YHƽ�����ͼ
subplot(2,2,4);plot(y,h,'o');grid on;legend('���1-29','Location','best');
hold on;plot(Y,Hy,'b-');
title('����b5����ͼ��YHƽ��');axis([min(Y) max(Y) min(Hy) max(Hy)]);xlabel('Y/m');ylabel('H/m');
set(gca,'xdir','reverse');