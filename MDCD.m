%% DRP-M
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
    u1 = u - dt/dx/4*fx(u);
    u2 = u - dt/dx/3*fx(u1);
    u3 = u - dt/dx/2*fx(u2);
    u = u - dt/dx*fx(u3);
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
legend('MDCD','EXACT')
xlabel x
ylabel u
title 'MDCD'
%% 函数
function fx = fx(u)
%根据算出来的rdiss和rdisp算数值通量
disp = 0.0463783;
diss = 0.001;
a = (-1/2*disp-1/2*diss).*Uplus(u,-3);
b = (2*disp+3*diss+1/12).*Uplus(u,-2);
c = (-5/2*disp-15/2*diss-2/3).*Uplus(u,-1);
d = 10*diss.*Uplus(u,0);
e = (5/2*disp-15/2*diss+2/3).*Uplus(u,1);
f = (-2*disp+3*diss-1/12).*Uplus(u,2);
g = (1/2*disp-1/2*diss).*Uplus(u,3);
fx = (a+b+c+d+e+f+g);
end