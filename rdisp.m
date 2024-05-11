function rdisp = rdisp(k)
%根据计算出的k再算r_disp_j+1/2
s = size(k,2);
rdisp=ones(1,s);
for i=1:s
    if k(i)>=0&&k(i)<0.01
        rdisp(i)=1/30;
    elseif k(i)>=0.01&&k(i)<2.5
        rdisp(i)=(k(i)+1/6*sin(2*k(i))-4/3*sin(k(i)))/(sin(3*k(i))-4*sin(2*k(i))+5*sin(k(i)));
    else
        rdisp(i)=0.1985842;
    end
end
end