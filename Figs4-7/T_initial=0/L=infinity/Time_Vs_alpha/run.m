
clc
clear
tic

alpha=0.0:0.02:1.0;

C_D=0.1;

L1=0.5;

T_index_1=floor(L1./(C_D.*(alpha'-1).^2));
alpha_index_1=1-sqrt((L1-C_D.*(alpha'-1).^2.*T_index_1)./C_D);

total_time=500;
T_index_1(end)=total_time;
alpha_index_1(end)=1;

L3=2.0;

T_index_3=floor(L3./(C_D.*(alpha'-1).^2));
alpha_index_3=1-sqrt((L3-C_D.*(alpha'-1).^2.*T_index_3)./C_D);

total_time=500;
T_index_3(end)=total_time;
alpha_index_3(end)=1;

load dataN26_new.mat
% load dataN26_new.mat

R1=total_R_set_0/N;
V1=total_V_set_0/N;

T1=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T1(i)=find(I_set_0{i}>0,1,'last')-1;
end

tau1=average_degree_1;
tau2=average_degree_2;

% a=lambda^2*(1-eta)*(1-gamma)*((tau1+tau2)-(1-gamma));
% b=lambda*((1-eta)*tau1+tau2-(tau1+tau2)*(1-eta)*(1-gamma)-...
%     (1-eta)*(1-gamma)-(1-gamma)-2*(1-eta)*(1-gamma)^2);
% c=(1-eta)*(1-gamma)+(1-gamma)-(1-eta)*(1-gamma)^2-1;
% 
% alpha_c_1=(-b-sqrt(b^2-4*a*c))/(2*a);

load dataN62_new.mat
% load dataN62_new.mat

R3=total_R_set_0/N;
V3=total_V_set_0/N;

T3=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T3(i)=find(I_set_0{i}>0,1,'last')-1;
end

% tau1=average_degree_1;
% tau2=average_degree_2;
% 
% a=lambda^2*(1-eta)*(1-gamma)*((tau1+tau2)-(1-gamma));
% b=lambda*((1-eta)*tau1+tau2-(tau1+tau2)*(1-eta)*(1-gamma)-...
%     (1-eta)*(1-gamma)-(1-gamma)-2*(1-eta)*(1-gamma)^2);
% c=(1-eta)*(1-gamma)+(1-gamma)-(1-eta)*(1-gamma)^2-1;
% 
% alpha_c_3=(-b-sqrt(b^2-4*a*c))/(2*a);

figure

ax=gca;

ax.Units='centimeters';
ax.Position=[2 2 5.2 3.9];
ax.PositionConstraint='innerposition';

P1=plot(alpha,T1,...
    'LineStyle','-','Marker','^','Color',[206,60,79]/255,'MarkerSize',4.5,'MarkerEdgeColor',[206,60,79]/255);
hold on
P2=plot(alpha,T3,...
   'LineStyle','-','Marker','v','Color',[206,60,79]/255,'MarkerSize',4.5,'MarkerEdgeColor',[206,60,79]/255);
hold on
P3=plot(alpha(1:floor(0.90*numel(alpha))),...
    T_index_1(1:floor(0.90*numel(alpha)))+sign(1-alpha_index_1(1:floor(0.90*numel(alpha)))),...
    'LineStyle','-','Marker','+','Color',[64,116,52]/255,'MarkerSize',4.5,'MarkerEdgeColor',[64,116,52]/255);
hold on
P4=plot(alpha(1:floor(0.80*numel(alpha))),...
    T_index_3(1:floor(0.80*numel(alpha)))+sign(1-alpha_index_3(1:floor(0.80*numel(alpha)))),...
    'LineStyle','-','Marker','*','Color',[64,116,52]/255,'MarkerSize',4.5,'MarkerEdgeColor',[64,116,52]/255);

% hold on
% plot([alpha_c_1,alpha_c_1],[0,500],'-')
% 
% hold on
% plot([alpha_c_3,alpha_c_3],[0,500],'-')

hold off

ax.YLim=[0.0 650];            % 坐标轴范围
ax.YTick=[0 200 400 600];
ax.TickLength(1)=0.012;                             % 刻度线长度 默认 - 0.01
ax.FontSize=10;                                         % 刻度标签字体大小
ax.FontName='Times';

ax.LineWidth=1.0;      % 线条宽度 默认 - 0.5
ax.Box='on';               % 框轮廓 默认 - 'off'

ax.YLabel.String='Time';                   % 要显示的文本
ax.YLabel.Interpreter='tex';
ax.YLabel.FontSize=10;
ax.YLabel.FontName='Arial';
ax.YLabel.Color=[0 0 0];              % 文本颜色

ax.XLabel.String='$1-\alpha$';                   % 要显示的文本
ax.XLabel.Interpreter='latex';
ax.XLabel.FontSize=10;
ax.XLabel.Color=[0 0 0];              % 文本颜色

lgd=legend(ax,[P1,P2,P3,P4],...
    {'Case 1','Case 3','$L=0.5$','$L=2.0$'});

lgd.Location='north';                % 相对于坐标区的位置
% lgd.Units='centimeters';
% lgd.Position=[2.0+0.5 2.0+3.8 2.0 2.0];
lgd.Orientation='vertical';           % 方向 默认 - 'vertical'
lgd.NumColumns=2;                      % 列数 默认 - 1
lgd.Interpreter='latex';
lgd.FontSize=8;
% lgd.FontName='Times';
lgd.TextColor=[0 0 0];                     % 文本颜色
lgd.Color=[1 1 1];                            % 背景色
lgd.Box='on';                                  % 框轮廓的显示
lgd.LineWidth=0.8;
lgd.ItemTokenSize=[20,12];

exportgraphics(gca,'Figure.tiff','Resolution',300)

toc
