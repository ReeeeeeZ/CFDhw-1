%% DRP
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
%% 时间推进
while t<10
    u1 = u + dt/dx/4*fdrpflux(u);
    u2 = u + dt/dx/3*fdrpflux(u1);
    u3 = u + dt/dx/2*fdrpflux(u2);
    u = u + dt/dx*fdrpflux(u3);
    t = t+dt;
end
%% 绘图
ue = zeros(1,256);
for l=1:20
    ue = ue+1/m*sin(2*pi*l*(x-t));
end
plot(x,u,'LineWidth',2)
hold on
plot(x,ue,'LineStyle','none','Marker','o')
grid on
legend('DRP','EXACT')
xlabel x
ylabel u
title 'DRP'
%% 函数
function fflux = fdrpflux(u)
%数值通量计算
a0=0;
a1 = 0.79926643;
a_1 = -a1;
a2 = -0.18941314;
a_2 = -a2;
a3 = 0.02651995;
a_3 = -a3;
fflux = a_3*Uplus(u,-3)+a_2*Uplus(u,-2)+a_1*Uplus(u,-1)+a0*Uplus(u,0)+a1*Uplus(u,1)+a2*Uplus(u,2)+a3*Uplus(u,3);
end