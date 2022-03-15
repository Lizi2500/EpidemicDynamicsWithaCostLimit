
clc
clear
tic

%% Parameters

lambda=0.0:0.2:1.0;
gamma=1.0;

alpha=0.8;
beta=1.0;

eta=0.8;

N=10^4;
epsilon=10^-3;
I0=N*epsilon;

%%

%% Stochastic simulations

load network_set_26.mat

trial_time=10;
simulation_time=20;
total_time=trial_time*simulation_time;

X_set=cell(numel(lambda),total_time);
Y_set=cell(numel(lambda),total_time);
Z_set=cell(numel(lambda),total_time);
total_R_set=zeros(numel(lambda),total_time);
U_set=cell(numel(lambda),total_time);
total_V_set=zeros(numel(lambda),total_time);
for l=1:numel(lambda)
    for m=1:trial_time
        net1=network_set_1{m};
        net2=network_set_2{m};
        for n=1:simulation_time
            lambda0=lambda(l);
            discrete_time_dynamics
            X_set{l,(m-1)*simulation_time+n}=X;
            Y_set{l,(m-1)*simulation_time+n}=Y;
            Z_set{l,(m-1)*simulation_time+n}=Z;
            total_R_set(l,(m-1)*simulation_time+n)=Z(end,2);
            U_set{l,(m-1)*simulation_time+n}=U;
            total_V_set(l,(m-1)*simulation_time+n)=U(end,2);
        end
    end
end
R_ave_set=mean(total_R_set,2);
V_ave_set=mean(total_V_set,2);

%%

save('dataS26_new_2.mat','lambda','gamma','alpha','beta','eta','N',...
    'X_set','Y_set','Z_set','U_set','total_R_set','total_V_set','R_ave_set','V_ave_set')

toc
