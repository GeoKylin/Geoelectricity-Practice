clear all
close all
clc

load R_M001; %����ģ�͵����ʲ���
load H_M001; %����ģ�͵ز��Ȳ���
C=15; %�����
N=4; %������

hm=10000; %���������
dx=0.01; %����������
q=3; %���߾����������

figure
I=imread('model_001.jpg'); %����ģ��ͼƬ
imshow(I)

figure
xm=fix(log10(hm)+0.5); %���������
x=0:dx:xm; %������y����
for k=1:C
   for i=1:length(x)
        h(i)=10^x(i); %������������
        Rs(k,i)=sdcs1dford(h(i),N,R(k,:),H(k,:)); %�����ӵ�����
   end 
   plot(log10(h),log10(Rs(k,:))+k*q,'k') %����˫���������ӵ���������
   hold on
end
xlabel('log(H)')
ylabel('���/x')
set(gca,'XDir','reverse'); %�����������
set(gca,'yaxislocation','right') %��������Ϸ�
set(gca,'ytick',4.7:3:46.7)
set(gca,'yticklabel',{'1','2','3','4','5','6','7'...
    ,'8','9','10','11','12','13','14','15'}) %��ʾ�����
grid on
view(90,-90); %��������ϵ����

h1=log10(h); %��ȵĶ���
Rs1=log10(Rs); %�ӵ����ʵĶ���
figure
[C,h]=contour(Rs1,20); %�����ӵ����ʵ�ֵ��ͼ
clabel(C,h,'LabelSpacing',500); %��ֵ�߼��
colormap(hsv) %������ɫ
colorbar %��ʾ��ɫͼ��
xlabel('log(H)')
ylabel('���/x')
set(gca,'XDir','reverse'); %�����������
set(gca,'xtick',0:50:400)
set(gca,'xticklabel',{'0','0.5','1','1.5','2','2.5','3','3.5','4'}); %��ʾ��ȵĶ���ֵ
set(gca,'yaxislocation','right') %��������Ϸ�
set(gca,'ytick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]) %��ʾ�����
grid on
view(90,-90); %��������ϵ����

%ģ�Ͳ�����
% R =
%           50          50          20        2000
%           50          50          20        2000
%           50          50          20        2000
%           50          50          20        2000
%           50          50          20        2000
%           50          50          50        2000
%           50          10          50        2000
%           50          10          50        2000
%           50          10          50        2000
%           50          50          50        2000
%           50          50          20          20
%           50          50          20          20
%           50          50          20          20
%           50          50          20          20
%           50          50          20          20
% H =
%      5     5    25
%      5     5    19
%      5     5    13
%      5     5     7
%      5     5     1
%      3     2     5
%      3     2     5
%      3     2     5
%      3     2     5
%      3     2     5
%      5     5    30
%      5     5    30
%      5     5    30
%      5     5    30
%      5     5    30