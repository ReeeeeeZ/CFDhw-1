function output = Uplus(u,n)
%周期性边界条件下向量u向前向后取n位后输出移位后的新向量
s = size(u,2);
if n>0
    output = [u(1+n:end),u(2:1+n)];
elseif n<0
    output = [u(end+n:end-1),u(1:end+n)];
else
    output = u;
end
end