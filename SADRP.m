%%SA-DRP
clear
clc
%% 网格划分
nx = 256;dx = 1/(nx-1);
x = 0:dx:1;
t = 0; dt = dx*0.3;
%% 初始条件
m = 20;
u = zeros(1,256);
for l=1:20
    u = u+1/m*sin(2*pi*l*x);
end
u0 = u;
u1 = u;
u2 = u;
u3 = u;

while t<10
    u1 = u + dt/dx/4*Qflux(u);
    u2 = u + dt/dx/3*Qflux(u1);
    u3 = u + dt/dx/2*Qflux(u2);
    u = u + dt/dx*Qflux(u3);
    t = t+dt;
end

ue = zeros(1,256);
for l=1:20
    ue = ue+1/m*sin(2*pi*l*(x-t));
end
plot(x,u,'LineWidth',2)
hold on
plot(x,ue,'LineStyle','none','Marker','o')
grid on
legend('SA-DRP','EXACT')
xlabel x
ylabel u
title 'SA-DRP'