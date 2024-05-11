function k = kESW(u)
%对一个向量u，根据模板点计算scale sensor
%再根据scale sensor计算出对应的k_ESW_j+1/2
S1 = Uplus(u,1)-2*u+Uplus(u,-1);
S2 = (Uplus(u,2)-2*u+Uplus(u,-2))/4;
S3 = Uplus(u,2)-2*Uplus(u,1)+Uplus(u,0);
S4 = (Uplus(u,3)-2*Uplus(u,1)+Uplus(u,-1))/4;
C1 = Uplus(u,1)-u;
C2 = (Uplus(u,2)-Uplus(u,-1))/3;
e = 1E-8;
s = size(u,2);
a=abs(abs(S1+S2)-abs(S1-S2))+abs(abs(S3+S4)-abs(S3-S4))+abs(abs(C1+C2)-abs(C1-C2)/2)+2*e;
b=abs(S1+S2)+abs(S1-S2)+abs(S3+S4)+abs(S3-S4)+abs(C1+C2)+abs(C1-C2)+e;
c = a./b;
d = [c;ones(1,s)];
m = 2*min(d)-ones(1,s);
k = acos(m);
end