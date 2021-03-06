clc;clear all;
x_0=1;
x_f=1;
t_0=0;
t_f=50;
K=20;
nx=1;
lambda_0=0;
P_0guess=zeros(nx*2,K-1);
z_guess=[lambda_0;P_0guess(:)]; %state guesses
tau=linspace(-1,1,K+1);
options=optimset('Display','Iter','Tolx', 1e-8, 'TolFun', 1e-8);

for ii=(10:10:t_f)
    
    z=fsolve(@HSError_b2_2,z_guess,options,x_0,t_0,x_f,ii,nx,K,tau);
    [E,t,P]=HSError_b2_2(z,x_0,t_0,x_f,t_f,nx,K,tau);
   
    figure(ii)
    plot(t,P(:,1),'b',t,P(:,2),'r');
    title('Hyper Sensitivity Problem');
    xlabel('time');
    ylabel('state x and CoState lambda');
    legend('x','lambda','Location','northeast');
    grid on
    hold on
end
