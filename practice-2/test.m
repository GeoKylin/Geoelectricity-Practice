clear
close all
clc

load d;load freq;load rho_xy;load rho_yx;%��������
x=d; %��������λ��
freq=log10(freq);%Ƶ��ȡ����
rho_xy=log10(rho_xy);%rho_xyȡ����
rho_yx=log10(rho_yx);%rho_yxȡ����
[d,freq]=meshgrid(d,freq);%���������
%����У��ǰrho_xy����ͼ
figure;
contourf(d,freq,rho_xy,20);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('���x��d\approx1.952\times10^7m��');
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});
%����У��ǰrho_yx����ͼ
figure;
contourf(d,freq,rho_yx,20);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('���x��d\approx1.952\times10^7m��');
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});
%�������ƽ���˲�
c=100; %�˲�����
l=26; %�����
r_xy=rho_xy;
r_yx=rho_yx;
for f=1:72
    for k=1:c
        r_xy(f,1) = (69*r_xy(f,1) +4*(r_xy(f,2) +r_xy(f,4)) -6*r_xy(f,3) -r_xy(f,5)) /70;
        r_xy(f,2) = (2* (r_xy(f,1) +r_xy(f,5)) +27*r_xy(f,2) +12*r_xy(f,3) -8*r_xy(f,4)) /35;
        r_yx(f,1) = (69*r_yx(f,1) +4*(r_yx(f,2) +r_yx(f,4)) -6*r_yx(f,3) -r_yx(f,5)) /70;
        r_yx(f,2) = (2* (r_yx(f,1) +r_yx(f,5)) +27*r_yx(f,2) +12*r_yx(f,3) -8*r_yx(f,4)) /35;
        for j=3:l-2
            r_xy(f,j) = (-3*(r_xy(f,j-2) +r_xy(f,j+2)) +12*(r_xy(f,j-1) +r_xy(f,j+1)) +17*r_xy(f,j)) /35;
            r_yx(f,j) = (-3*(r_yx(f,j-2) +r_yx(f,j+2)) +12*(r_yx(f,j-1) +r_yx(f,j+1)) +17*r_yx(f,j)) /35;
        end
        r_xy(f,l-1) = (2*(r_xy(f,l) +r_xy(f,l-4)) +27*r_xy(f,l-1) +12*r_xy(f,l-2) -8*r_xy(f,l-3)) /35;
        r_xy(f,l) = (69*r_xy(f,l) +4* (r_xy(f,l-1) +r_xy(f,l-3)) -6*r_xy(f,l-2) -r_xy(f,l-4)) /70;
        r_yx(f,l-1) = (2*(r_yx(f,l) +r_yx(f,l-4)) +27*r_yx(f,l-1) +12*r_yx(f,l-2) -8*r_yx(f,l-3)) /35;
        r_yx(f,l) = (69*r_yx(f,l) +4* (r_yx(f,l-1) +r_yx(f,l-3)) -6*r_yx(f,l-2) -r_yx(f,l-4)) /70;
    end
end
%����У����rho_xy����ͼ
figure;
contourf(d,freq,r_xy,20);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('���x��d\approx1.952\times10^7m��');
set(get(h,'title'),'string',{'log(\rho_{xy},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});
%����У����rho_yx����ͼ
figure;
contourf(d,freq,r_yx,20);set(gca,'xaxislocation','top');h=colorbar;
ylabel('log(freq,Hz)');xlabel('���x��d\approx1.952\times10^7m��');
set(get(h,'title'),'string',{'log(\rho_{yx},\Omega\bulletm)',''});set(gca,'XTick',x);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12','13','14','15','16'...
    ,'17','18','19','20','21','22','23','24','25','26','27','28','29'});