%% 一阶迎风
%% 网格划分
nx = 55000;dx = 1/(nx-1);
x = 0:dx:1;
t = 0; dt = dx*0.2;
%% 初始条件
m = 20;
u = ones(1,nx);
ue = ones(1,nx);
for k=1:64
    phi = rand(1);
    u = u+0.1*(sqrt((k/12).^4.*exp(-2*(k/12).^2)).*sin(2*pi*k*(x+phi)));
    ue = ue+0.1*(sqrt((k/12).^4.*exp(-2*(k/12).^2)).*sin(2*pi*k*(x-1.0008+phi)));
end
u0 = u;
u1 = u;
u2 = u;
u3 = u;
%% 时间推进
while t<1
    u1 = u + dt/dx/4*f1flux(u);
    u2 = u + dt/dx/3*f1flux(u1);
    u3 = u + dt/dx/2*f1flux(u2);
    u = u + dt/dx*f1flux(u3);
    t = t+dt;
end
%% 绘图
error = 1/nx*sum(abs(u-ue));
%% 函数
function fflux = f1flux(u)
%数值通量计算
a0=-1;
a_1 = 1;
fflux = a_1*Uplus(u,-1)+a0*Uplus(u,0);
end