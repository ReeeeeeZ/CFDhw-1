function fflux = fflux(u)
%根据算出来的rdiss和rdisp算数值通量
disp = rdisp(kESW(u));
diss = rdiss(kESW(u));
a = (1/2*disp+1/2*diss).*Uplus(u,-2);
b = (-3/2*disp-5/2*diss-1/12).*Uplus(u,-1);
c = (disp+5*diss+7/12).*Uplus(u,0);
d = (disp-5*diss+7/12).*Uplus(u,1);
e = (-3/2*disp+5/2*diss-1/12).*Uplus(u,2);
f = (1/2*disp-1/2*diss).*Uplus(u,3);
fflux = (a+b+c+d+e+f);
end