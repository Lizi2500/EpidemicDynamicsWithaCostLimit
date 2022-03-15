
clc
clear
tic

%% Parameters

N=10^4;

average_degree_1=6.0;
average_degree_2=2.0;
d_min_1=0;
d_max_1=4*average_degree_1;
d_min_2=0;
d_max_2=4*average_degree_2;

%%

%% Network generation

trial_time=10;

network_set_1=cell(trial_time,1);
network_set_2=cell(trial_time,1);
edge_number_set=zeros(trial_time,1);
for k=1:trial_time
    Configuration_Model_1
    network_set_1{k}=adj_matrix_1;
    network_set_2{k}=adj_matrix_2;
    edge_number_set(k)=edge_number;
end

%%

save('network_set_62.mat','network_set_1','network_set_2','edge_number_set')

toc
