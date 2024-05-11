function rdiss = rdiss(k)
%根据计算出的k再算r_diss_j+1/2
s = size(k,2);
rdiss=ones(1,s);
for i=1:s
    if k(i)>=0&&k(i)<=1
        rdiss(i)=0.001;
    else
        rdiss(i)=min([0.001+0.011*sqrt((k(i)-1)/(pi-1)),0.012]);
    end
end
end