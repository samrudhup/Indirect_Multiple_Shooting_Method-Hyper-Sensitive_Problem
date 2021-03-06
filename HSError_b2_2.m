function [E,t,P] = HSError_b2_2(z,x_0,t_0,x_f,t_f,nx, K, tau)

lambda_0=z(1);
P_0guess=z(2:end);
P_0guess=reshape(P_0guess,nx*2,K-1);
E=[];
t=[];
P=[];
options=odeset('RelTol',1e-8);
for k=1:K
    if k==1
        P_0=[ x_0; lambda_0];
    else
        P_0=P_0guess(:,k-1);
    end
    
    tspan=[tau(k),tau(k+1)];
    [tout,Pout]=ode113(@HSode113_b2,tspan,P_0,options,t_0,t_f);
    Pth =Pout(end,:).';
    
    if k<K
        E=[E;Pth-P_0guess(:,k)];
    end
    t=[t;tout];
    P=[P;Pout];
end
E=[E;Pth(1)-x_f];

