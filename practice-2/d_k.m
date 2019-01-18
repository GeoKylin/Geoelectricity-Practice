clear
close all
clc
format long

load d;
for i=2:26
    s(i-1)=d(i)-d(i-1);
end
for i=2:25
    k(i-1)=(d(i+1)-d(i))/(d(i)-d(i-1));
end
s
k