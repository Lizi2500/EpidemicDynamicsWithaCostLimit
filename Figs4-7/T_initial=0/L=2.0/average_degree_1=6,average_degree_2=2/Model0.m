
% clc
% clear
% tic

%% Input

% time=80;
% 
% lambda=0.8;
% gamma=1.0;
% 
% alpha0=0.5;
% beta0=0.5;
% 
% eta=0.5;
% 
% average_degree_1=3;
% average_degree_2=3;
% degree_min_1=0;
% degree_max_1=12;
% degree_min_2=0;
% degree_max_2=12;
% 
% N=10^4;
% epsilon=10^-3;

%%

%% Initialization

% P_k=zeros(numel(degree_min_1:degree_max_1),numel(degree_min_2:degree_max_2));
% for x2=1:numel(degree_min_1:degree_max_1)
%     for y2=1:numel(degree_min_2:degree_max_2)
%         P_k(x2,y2)=average_degree_1^(degree_min_1+x2-1)*exp(-average_degree_1)/factorial(degree_min_1+x2-1)...
%             *average_degree_2^(degree_min_2+y2-1)*exp(-average_degree_2)/factorial(degree_min_2+y2-1);
%     end
% end
% P_k=P_k./sum(sum(P_k));

% seq1=zeros(numel(0:degree_max_1),1);
% for t=1:numel(seq1)
%     seq1(t)=t;
% end
% seq_cum_1=cumsum(seq1);
% seq2=zeros(numel(0:degree_max_2),1);
% for t=1:numel(seq2)
%     seq2(t)=t;
% end
% seq_cum_2=cumsum(seq2);

% S_Y_set=cell(time+1,1);
% I_set=cell(time+1,1);
% R=zeros(time+1,1);
% V=zeros(time+1,1);

% S_Y=zeros(time+1,1);
% I=zeros(time+1,1);

% index_set_s1=zeros(sum(seq1),1);
% index_set_i1=zeros(sum(seq1),1);
% index_set_s2=zeros(sum(seq2),1);
% index_set_i2=zeros(sum(seq2),1);
% for i=1:numel(seq1)
%     for j=1:seq1(i)
%         index_set_s1(sum(seq1(1:i-1))+j)=i-1-j+1;
%         index_set_i1(sum(seq1(1:i-1))+j)=j-1;
%     end
% end
% for i=1:numel(seq2)
%     for j=1:seq2(i)
%         index_set_s2(sum(seq2(1:i-1))+j)=i-1-j+1;
%         index_set_i2(sum(seq2(1:i-1))+j)=j-1;
%     end
% end

% step=0;
% 
% S_Y_set{1}=zeros(sum(seq1),sum(seq2));
% I_set{1}=zeros(sum(seq1),sum(seq2));
% if(degree_min_1==0 && degree_min_2==0)
%     I_set{1}(1,1)=epsilon*N*P_k(1,1);
%     S_Y_set{1}(1,1)=(1-epsilon)*N*P_k(1,1);
%     for t1=2:numel(degree_min_1:degree_max_1)
%         I_set{1}(seq_cum_1(0+t1-1)+1,1)=epsilon*N*P_k(t1,1);
%         S_Y_set{1}(seq_cum_1(0+t1-1)+1,1)=(1-epsilon)*N*P_k(t1,1)*(1-epsilon);
%         S_Y_set{1}(seq_cum_1(0+t1-1)+1+1,1)=(1-epsilon)*N*P_k(t1,1)*epsilon;
%     end
%     for t2=2:numel(degree_min_2:degree_max_2)
%         I_set{1}(1,seq_cum_2(0+t2-1)+1)=epsilon*N*P_k(1,t2);
%         S_Y_set{1}(1,seq_cum_2(0+t2-1)+1)=(1-epsilon)*N*P_k(1,t2)*(1-epsilon);
%         S_Y_set{1}(1,seq_cum_2(0+t2-1)+1+1)=(1-epsilon)*N*P_k(1,t2)*epsilon;
%     end
%     for t1=2:numel(degree_min_1:degree_max_1)
%         for t2=2:numel(degree_min_2:degree_max_2)
%             I_set{1}(seq_cum_1(degree_min_1+t1-1)+1,seq_cum_2(degree_min_2+t2-1)+1)=...
%                 epsilon*N*P_k(t1,t2);
%             S_Y_set{1}(seq_cum_1(degree_min_1+t1-1)+1,seq_cum_2(degree_min_2+t2-1)+1)=...
%                 (1-epsilon)*N*P_k(t1,t2)*(1-epsilon)^2;
%             S_Y_set{1}(seq_cum_1(degree_min_1+t1-1)+1+1,seq_cum_2(degree_min_2+t2-1)+1)=...
%                 (1-epsilon)*N*P_k(t1,t2)*epsilon*(1-epsilon);
%             S_Y_set{1}(seq_cum_1(degree_min_1+t1-1)+1,seq_cum_2(degree_min_2+t2-1)+1+1)=...
%                 (1-epsilon)*N*P_k(t1,t2)*epsilon*(1-epsilon);
%             S_Y_set{1}(seq_cum_1(degree_min_1+t1-1)+1+1,seq_cum_2(degree_min_2+t2-1)+1+1)=...
%                 (1-epsilon)*N*P_k(t1,t2)*epsilon^2;
%         end
%     end
% else
%     for t1=1:numel(degree_min_1:degree_max_1)
%         for t2=1:numel(degree_min_2:degree_max_2)
%             I_set{1}(seq_cum_1(degree_min_1+t1-1)+1,seq_cum_2(degree_min_2+t2-1)+1)=...
%                 epsilon*N*P_k(t1,t2);
%             S_Y_set{1}(seq_cum_1(degree_min_1+t1-1)+1,seq_cum_2(degree_min_2+t2-1)+1)=...
%                 (1-epsilon)*N*P_k(t1,t2)*(1-epsilon)^2;
%             S_Y_set{1}(seq_cum_1(degree_min_1+t1-1)+1+1,seq_cum_2(degree_min_2+t2-1)+1)=...
%                 (1-epsilon)*N*P_k(t1,t2)*epsilon*(1-epsilon);
%             S_Y_set{1}(seq_cum_1(degree_min_1+t1-1)+1,seq_cum_2(degree_min_2+t2-1)+1+1)=...
%                 (1-epsilon)*N*P_k(t1,t2)*epsilon*(1-epsilon);
%             S_Y_set{1}(seq_cum_1(degree_min_1+t1-1)+1+1,seq_cum_2(degree_min_2+t2-1)+1+1)=...
%                 (1-epsilon)*N*P_k(t1,t2)*epsilon^2;
%         end
%     end
% end
% R(1)=0;
% V(1)=0;

% S_Y(1)=sum(sum(S_Y_set{1}));
% I(1)=sum(sum(I_set{1}));

%%

% index_set_1=zeros(sum(seq1),sum(seq2));
% index_set_2=zeros(sum(seq1),sum(seq2));
% index_set_3=zeros(sum(seq1),sum(seq2));
% index_set_4=zeros(sum(seq1),sum(seq2));
% for j=1:sum(seq1)
%     index_set_1(j,:)=index_set_s1(j);
%     index_set_3(j,:)=index_set_i1(j);
% end
% for j=1:sum(seq2)
%     index_set_2(:,j)=index_set_s2(j);
%     index_set_4(:,j)=index_set_i2(j);
% end

%%

while(step<=time)
    
    %% vaccination process
    
    S_new=zeros(sum(seq1),sum(seq2));
    I_new=zeros(sum(seq1),sum(seq2));
    
    % Q
    
    add_amount=sum(sum(S_Y_set{step+1}.*(1-(1-beta0*eta).^index_set_3)));
    num_Q_S_1=sum(sum(index_set_1.*S_Y_set{step+1}.*(1-(1-beta0*eta).^index_set_3)));
    den_Q_S_1=sum(sum(index_set_1.*S_Y_set{step+1}));
    num_Q_S_2=sum(sum(index_set_2.*S_Y_set{step+1}.*(1-(1-beta0*eta).^index_set_3)));
    den_Q_S_2=sum(sum(index_set_2.*S_Y_set{step+1}));
    num_Q_I_1=sum(sum(index_set_3.*S_Y_set{step+1}.*(1-(1-beta0*eta).^index_set_3)));
    den_Q_I_1=sum(sum(index_set_1.*I_set{step+1}));
    num_Q_I_2=sum(sum(index_set_4.*S_Y_set{step+1}.*(1-(1-beta0*eta).^index_set_3)));
    den_Q_I_2=sum(sum(index_set_2.*I_set{step+1}));
    
    Q_S_1=num_Q_S_1/den_Q_S_1;Q_S_2=num_Q_S_2/den_Q_S_2;
    Q_I_1=num_Q_I_1/den_Q_I_1;Q_I_2=num_Q_I_2/den_Q_I_2;
    
    %
    
    % S_Y_set & I_set
    
    for t1=1:sum(seq1)
        for t2=1:sum(seq2)
            s1=index_set_s1(t1);s2=index_set_s2(t2);
            i1=index_set_i1(t1);i2=index_set_i2(t2);
            C11=index_set_1>=s1;C12=index_set_2>=s2;
            C21=index_set_3==i1;C22=index_set_4==i2;
            index=C11+C12+C21+C22==4;
%             index_alt_1=find(index_set_s1>=s1 & index_set_i1==i1);
%             index_alt_2=find(index_set_s2>=s2 & index_set_i2==i2);
            m1=index_set_1(index);
            m2=index_set_2(index); % vector
            n1=index_set_3(index);
%             m1=index_set_1(index_alt_1,index_alt_2);
%             m2=index_set_2(index_alt_1,index_alt_2); % matrix
%             n1=index_set_3(index_alt_1,index_alt_2);
            p1=m1-s1;p2=m2-s2;
            H1=factorial(m1)./(factorial(p1).*factorial(m1-p1))...
                .*(Q_S_1.^p1).*((1-Q_S_1).^(m1-p1))...
                .*factorial(m2)./(factorial(p2).*factorial(m2-p2))...
                .*(Q_S_2.^p2).*((1-Q_S_2).^(m2-p2));
            H2=factorial(m1)./(factorial(p1).*factorial(m1-p1))...
                .*(Q_I_1.^p1).*((1-Q_I_1).^(m1-p1))...
                .*factorial(m2)./(factorial(p2).*factorial(m2-p2))...
                .*(Q_I_2.^p2).*((1-Q_I_2).^(m2-p2));
            S_new(t1,t2)=sum(sum(S_Y_set{step+1}(index)...
                .*((1-beta0*eta).^n1).*H1));
            I_new(t1,t2)=sum(sum(I_set{step+1}(index).*H2));
%             S_new(t1,t2)=sum(sum(S_Y_set{step+1}(index_alt_1,index_alt_2)...
%                 .*((1-beta*eta).^n1).*H1));
%             I_new(t1,t2)=sum(sum(I_set{step+1}(index_alt_1,index_alt_2).*H2));
        end
    end
    
    %
    
    S_Y_set{step+1}=S_new;
    I_set{step+1}=I_new;
    
    if(step)
        V(step+1)=V(step)+add_amount;
    else
        V(step+1)=add_amount;
    end
    
    %%
    
    step=step+1;
    
    %% disease transmission process
    
    S_Y_set{step+1}=zeros(sum(seq1),sum(seq2));
    I_set{step+1}=zeros(sum(seq1),sum(seq2));
    
    % P
    
    add_amount=sum(sum(I_set{step}.*gamma));
    num_P_S_1=sum(sum(index_set_1.*S_Y_set{step}.*(1-(1-alpha0*lambda).^(index_set_3+index_set_4))));
    den_P_S_1=sum(sum(index_set_1.*S_Y_set{step}));
    num_P_S_2=sum(sum(index_set_2.*S_Y_set{step}.*(1-(1-alpha0*lambda).^(index_set_3+index_set_4))));
    den_P_S_2=sum(sum(index_set_2.*S_Y_set{step}));
    num_P_I_1=sum(sum(index_set_3.*S_Y_set{step}.*(1-(1-alpha0*lambda).^(index_set_3+index_set_4))));
    den_P_I_1=sum(sum(index_set_1.*I_set{step}));
    num_P_I_2=sum(sum(index_set_4.*S_Y_set{step}.*(1-(1-alpha0*lambda).^(index_set_3+index_set_4))));
    den_P_I_2=sum(sum(index_set_2.*I_set{step}));
    
    P_S_1=num_P_S_1/den_P_S_1;P_S_2=num_P_S_2/den_P_S_2;
    P_I_1=num_P_I_1/den_P_I_1;P_I_2=num_P_I_2/den_P_I_2;
    
    %
    
    % S_Y_set  & I_set
    
    for t1=1:sum(seq1)
        for t2=1:sum(seq2)
            s1=index_set_s1(t1);s2=index_set_s2(t2);
            i1=index_set_i1(t1);i2=index_set_i2(t2);
            C11=index_set_1>=s1;C12=index_set_2>=s2;
            C21=index_set_1<=s1+i1;C22=index_set_2<=s2+i2;
            C31=index_set_1+index_set_3>=s1+i1;C32=index_set_2+index_set_4>=s2+i2;
            index=C11+C12+C21+C22+C31+C32==6;
%             index_alt_1=find(index_set_s1>=s1 & index_set_s1<=s1+i1 ...
%                 & index_set_s1+index_set_i1>=s1+i1);
%             index_alt_2=find(index_set_s2>=s2 & index_set_s2<=s2+i2 ...
%                 & index_set_s2+index_set_i2>=s2+i2);
            m1=index_set_1(index);m2=index_set_2(index); % vector
            n1=index_set_3(index);n2=index_set_4(index);
%             m1=index_set_1(index_alt_1,index_alt_2);m2=index_set_2(index_alt_1,index_alt_2); % matrix
%             n1=index_set_3(index_alt_1,index_alt_2);n2=index_set_4(index_alt_1,index_alt_2);
            p1=m1-s1;p2=m2-s2;q1=m1+n1-s1-i1;q2=m2+n2-s2-i2;
            G1=factorial(m1)./(factorial(p1).*factorial(m1-p1))...
                .*(P_S_1.^p1).*((1-P_S_1).^(m1-p1))...
                .*factorial(n1)./(factorial(q1).*factorial(n1-q1))...
                .*(gamma.^q1).*((1-gamma).^(n1-q1))...
                .*factorial(m2)./(factorial(p2).*factorial(m2-p2))...
                .*(P_S_2.^p2).*((1-P_S_2).^(m2-p2))...
                .*factorial(n2)./(factorial(q2).*factorial(n2-q2))...
                .*(gamma.^q2).*((1-gamma).^(n2-q2));
            G2=factorial(m1)./(factorial(p1).*factorial(m1-p1))...
                .*(P_I_1.^p1).*((1-P_I_1).^(m1-p1))...
                .*factorial(n1)./(factorial(q1).*factorial(n1-q1))...
                .*(gamma.^q1).*((1-gamma).^(n1-q1))...
                .*factorial(m2)./(factorial(p2).*factorial(m2-p2))...
                .*(P_I_2.^p2).*((1-P_I_2).^(m2-p2))...
                .*factorial(n2)./(factorial(q2).*factorial(n2-q2))...
                .*(gamma.^q2).*((1-gamma).^(n2-q2));
            S_Y_set{step+1}(t1,t2)=sum(S_Y_set{step}(index)...
                .*((1-alpha0*lambda).^(n1+n2)).*G1);
            I_set{step+1}(t1,t2)=sum(S_Y_set{step}(index)...
                .*(1-(1-alpha0*lambda).^(n1+n2)).*G1+I_set{step}(index).*(1-gamma).*G2);
%             S_Y_set{step+1}(t1,t2)=sum(sum(S_Y_set{step}(index_alt_1,index_alt_2)...
%                 .*((1-alpha*lambda).^(n1+n2)).*G1));
%             I_set{step+1}(t1,t2)=sum(sum(S_Y_set{step}(index_alt_1,index_alt_2)...
%                 .*(1-(1-alpha*lambda).^(n1+n2)).*G1+I_set{step}(index_alt_1,index_alt_2).*(1-gamma).*G2));
        end
    end
    
    %
    
    S_Y(step+1)=sum(sum(S_Y_set{step+1}));
    I(step+1)=sum(sum(I_set{step+1}));
    
    R(step+1)=R(step)+add_amount;
    
    index_set=[index_set;[step,alpha0]];
    
    %%
    
    if(isnan(I(step+1)) || I(step+1)<=10^0)
        break
    end
    
end

% save('data.mat','S_Y_set','I_set','S_Y','I','R','V')

% figure
% 
% plot(0:time,S_Y)
% hold on
% plot(0:time,I)
% hold on
% plot(0:time,R)
% hold on
% plot(0:time,V)
% hold off

% toc
