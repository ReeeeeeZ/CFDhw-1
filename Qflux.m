function Q = Qflux(u)
%从数值通量算Q
Q = Uplus(fflux(u),-1)-fflux(u);
end