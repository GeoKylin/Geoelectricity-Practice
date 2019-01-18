clear all
close all
clc

load R_M001; %载入模型电阻率参数
load H_M001; %载入模型地层厚度参数
C=15; %测点数
N=4; %最大层数

hm=10000; %最大测量深度
dx=0.01; %绘制坐标间隔
q=3; %曲线距离调整参数

figure
I=imread('model_001.jpg'); %载入模型图片
imshow(I)

figure
xm=fix(log10(hm)+0.5); %最大纵坐标
x=0:dx:xm; %采样点y坐标
for k=1:C
   for i=1:length(x)
        h(i)=10^x(i); %计算采样点深度
        Rs(k,i)=sdcs1dford(h(i),N,R(k,:),H(k,:)); %计算视电阻率
   end 
   plot(log10(h),log10(Rs(k,:))+k*q,'k') %绘制双对数坐标视电阻率曲线
   hold on
end
xlabel('log(H)')
ylabel('测点/x')
set(gca,'XDir','reverse'); %深度向下增加
set(gca,'yaxislocation','right') %测点置于上方
set(gca,'ytick',4.7:3:46.7)
set(gca,'yticklabel',{'1','2','3','4','5','6','7'...
    ,'8','9','10','11','12','13','14','15'}) %显示测点数
grid on
view(90,-90); %调整坐标系方向

h1=log10(h); %深度的对数
Rs1=log10(Rs); %视电阻率的对数
figure
[C,h]=contour(Rs1,20); %绘制视电阻率等值线图
clabel(C,h,'LabelSpacing',500); %等值线间隔
colormap(hsv) %调整颜色
colorbar %显示颜色图例
xlabel('log(H)')
ylabel('测点/x')
set(gca,'XDir','reverse'); %深度向下增加
set(gca,'xtick',0:50:400)
set(gca,'xticklabel',{'0','0.5','1','1.5','2','2.5','3','3.5','4'}); %显示深度的对数值
set(gca,'yaxislocation','right') %测点置于上方
set(gca,'ytick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]) %显示测点数
grid on
view(90,-90); %调整坐标系方向

%模型参数：
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