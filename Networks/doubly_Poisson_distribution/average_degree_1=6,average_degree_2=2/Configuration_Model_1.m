%%%               Configuration Model               %%%

% clc
% clear
% tic

% format long

%% Input

% N=10^4;  % network size
% 
% average_degree_1=3;  % average degree
% average_degree_2=3;
% d_min_1=0;d_max_1=12;
% d_min_2=0;d_max_2=12;

%%

%% Initialization

adj_matrix_1=sparse(N,N);
adj_matrix_2=sparse(N,N);

degree_list_1=(d_min_1:d_max_1)';
degree_list_2=(d_min_2:d_max_2)';
degree_distribution=zeros(numel(d_min_1:d_max_1),numel(d_min_2:d_max_2));  % matrix
for i=d_min_1:d_max_1
    for j=d_min_2:d_max_2
        degree_distribution(i-d_min_1+1,j-d_min_2+1)=...
            average_degree_1^i*exp(-average_degree_1)/factorial(i)*...
            average_degree_2^j*exp(-average_degree_2)/factorial(j);
    end
end
degree_distribution=degree_distribution./sum(sum(degree_distribution));
cumulate_degree_distribution=cumsum(degree_distribution(:));  % vector

degree_sequence_0=zeros(N,2);

% while(1)
%     random_sequence=rand(N,1);
%     for j=1:N
%         degree_sequence_0(j)=degree_list(find(cumulate_degree_distribution>=random_sequence(j),1,'first'));
%     end
%     if(mod(sum(degree_sequence_0),2)==1)  % Ensure that the total degree is even. If not, generate the degree sequence again
%         continue
%     else
%         break
%     end
% end

for i=1:N
    index=find(cumulate_degree_distribution>=rand(1),1,'first');
    degree_sequence_0(i,1)=degree_list_1(index-numel(degree_list_1)*(ceil(index/numel(degree_list_1))-1));
    degree_sequence_0(i,2)=degree_list_2(ceil(index/numel(degree_list_1)));
end
total_degree_0=sum(degree_sequence_0);
if(mod(total_degree_0(1),2)==1 || mod(total_degree_0(2),2)==1)
    node_alt=randsample(N,1);
    degree_old=degree_sequence_0(node_alt,:);
    while(1)
        index=find(cumulate_degree_distribution>=rand(1),1,'first');
        degree1=degree_list_1(index-numel(degree_list_1)*(ceil(index/numel(degree_list_1))-1));
        degree2=degree_list_2(ceil(index/numel(degree_list_1)));
        degree_new=[degree1,degree2];
        if(mod(total_degree_0(1)-degree_old(1)+degree_new(1),2)==0 ...
            && mod(total_degree_0(2)-degree_old(2)+degree_new(2),2)==0)
            degree_sequence_0(node_alt,:)=degree_new;
            break
        end
    end
end

degree_sequence_0=sortrows(degree_sequence_0);

%  stubs

total_degree_0=sum(degree_sequence_0);
stubs1=zeros(total_degree_0(1),1);
stubs2=zeros(total_degree_0(2),1);
tem_set_1=cumsum(degree_sequence_0(:,1));
tem_set_2=cumsum(degree_sequence_0(:,2));
stubs1(1:tem_set_1(1))=1;
stubs2(1:tem_set_2(1))=1;
for i=2:N
    stubs1((tem_set_1(i-1)+1):tem_set_1(i))=i;
    stubs2((tem_set_2(i-1)+1):tem_set_2(i))=i;
end

%

%%

%% Network generation

while(numel(stubs1)>1)
    index_set=randsample(stubs1,2);
    adj_matrix_1(index_set(1),index_set(2))=1;
    adj_matrix_1(index_set(2),index_set(1))=1;
    for j=1:2
        index=find(stubs1==index_set(j),1,'first');
        stubs1(index)=[];
    end
end

while(numel(stubs2)>1)
    index_set=randsample(stubs2,2);
    adj_matrix_2(index_set(1),index_set(2))=1;
    adj_matrix_2(index_set(2),index_set(1))=1;
    for j=1:2
        index=find(stubs2==index_set(j),1,'first');
        stubs2(index)=[];
    end
end

%%

for i=1:N
    adj_matrix_1(i,i)=0;
    adj_matrix_2(i,i)=0;
end

% degree_sequence_1=full(sum(adj_matrix)');
% total_degree_1=sum(degree_sequence_1);

edge_number=sum(sum(((adj_matrix_1==1)+(adj_matrix_2==1))==2))/2;

% save('network_set_2.mat','adj_matrix_1','adj_matrix_2')

% toc
