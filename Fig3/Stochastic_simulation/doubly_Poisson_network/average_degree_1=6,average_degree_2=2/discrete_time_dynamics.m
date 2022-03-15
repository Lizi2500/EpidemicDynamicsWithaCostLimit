%%%              discrete time epidemic dynamics           %%%

% clc
% clear
% tic

%% Input

% lambda0=0.8;
% gamma=1.0;
% 
% alpha=0.5;
% beta=0.5;
% 
% eta=0.5;
% 
% load network_set_2.mat
% 
% net1=adj_matrix_1;
% net2=adj_matrix_2;
% 
% N=10^4;
% epsilon=10^-3;
% I0=N*epsilon;

%%

%% Initialization

time=0;

S_Y=N-I0;I=I0;R=0;V=0;
X=[time,S_Y];Y=[time,I];Z=[time,R];U=[time,V];

initial_infecteds=randsample(N,I0);

status=ones(N,1);  % S_Y-1

status(initial_infecteds)=0;  % I-0

%%

%% ÍøÂçÑÝ»¯

while(I)
    
    %% Vaccination process
    
    infected_set=find(status==0);
    
    for j=1:numel(infected_set)
        
        neighbor_set_1=find(net1(:,infected_set(j)));
        Y_neighbor_set_1=neighbor_set_1(status(neighbor_set_1)==1);
        
        for k=1:numel(Y_neighbor_set_1)
            if(rand(1)<=beta*eta)
                S_Y=S_Y-1;
                V=V+1;
                status(Y_neighbor_set_1(k))=4;  % V-4
            end
        end
        
    end
    
    %%
    
    time=time+1;
    
    %% Transmission process
    
    infected_set=find(status==0);
    
    for j=1:numel(infected_set)
        
        neighbor_set_1=find(net1(:,infected_set(j)));
        neighbor_set_2=find(net2(:,infected_set(j)));
        Y_neighbor_set_1=neighbor_set_1(status(neighbor_set_1)==1);
        Y_neighbor_set_2=neighbor_set_2(status(neighbor_set_2)==1);
        Y_neighbor_set=unique([Y_neighbor_set_1;Y_neighbor_set_2]);
        
        for k=1:numel(Y_neighbor_set)
            if(rand(1)<=alpha*lambda0)
                S_Y=S_Y-1;
                I=I+1;
                status(Y_neighbor_set(k))=0;
            end
        end
        
        if(rand(1)<=gamma)
            I=I-1;
            R=R+1;
            status(infected_set(j))=3;  % R-3
        end
        
    end
    
    %%
    
    X=[X;time,sum(status==1)];
    Y=[Y;time,sum(status==0)];
    Z=[Z;time,sum(status==3)];
    U=[U;time,sum(status==4)];
    
end

%%

%% Output

% X
% Y
% Z

% figure
% 
% plot(X(:,1),X(:,2))
% hold on
% plot(Y(:,1),Y(:,2))
% hold on
% plot(Z(:,1),Z(:,2))
% hold on
% plot(U(:,1),U(:,2))
% hold off

%%

% toc
