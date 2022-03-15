
clc
clear
tic

N=10^4;

alpha=0.8;
beta=1.0;

eta=0.8;

trial_time=10;
simulation_time=20;
total_time=trial_time*simulation_time;

lambda=0.0:0.01:1.0;
index_set=0.0:0.2:1.0;

h=cell(numel(index_set),1);
for i=1:numel(index_set)
    h{i}=repmat({i},total_time,1);
end
g=[h{1};h{2};h{3};h{4};h{5};h{6}];

index_set_0=zeros(numel(lambda),1);
for i=1:numel(lambda)
    index=find(lambda(i)>=index_set,1,'last');
    index_set_0(i)=index+(lambda(i)-index_set(index))*(1/(index_set(2)-index_set(1)));
end

load dataS26_new_2.mat

total_R_set=total_R_set';
total_V_set=total_V_set';
x1=[];y1=[];
for i=1:numel(index_set)
    index=find(lambda==index_set(i));
    x1=[x1;total_R_set(:,index)];
    y1=[y1;total_V_set(:,index)];
end
x1=x1/N;y1=y1/N;

load dataN26_new_2.mat

R1=total_R_set_0/N;
V1=total_V_set_0/N;

lambda_c_1=1/(alpha*((1-eta)*average_degree_1+average_degree_2));

load dataS44_new_2.mat

total_R_set=total_R_set';
total_V_set=total_V_set';
x2=[];y2=[];
for i=1:numel(index_set)
    index=find(lambda==index_set(i));
    x2=[x2;total_R_set(:,index)];
    y2=[y2;total_V_set(:,index)];
end
x2=x2/N;y2=y2/N;

load dataN44_new_2.mat

R2=total_R_set_0/N;
V2=total_V_set_0/N;

lambda_c_2=1/(alpha*((1-eta)*average_degree_1+average_degree_2));

load dataS62_new_2.mat

total_R_set=total_R_set';
total_V_set=total_V_set';
x3=[];y3=[];
for i=1:numel(index_set)
    index=find(lambda==index_set(i));
    x3=[x3;total_R_set(:,index)];
    y3=[y3;total_V_set(:,index)];
end
x3=x3/N;y3=y3/N;

load dataN62_new_2.mat

R3=total_R_set_0/N;
V3=total_V_set_0/N;

lambda_c_3=1/(alpha*((1-eta)*average_degree_1+average_degree_2));

fig=figure;

fig.Units='centimeters';
fig.Position=[0 0 8.0 11.4];

ax1=axes('Units','centimeters',...
    'Position',[1.2 3.9+1.2*2 5.2 3.9],'PositionConstraint','innerposition');

% ax1=gca;
% 
% ax1.Units='centimeters';
% ax1.Position=[2 2 8 6];
% ax1.PositionConstraint='innerposition';

boxplot(x1,g,'Colors',[220,120,120]/255,'MedianStyle','target')
hold on
boxplot(x2,g,'Colors',[206,60,79]/255,'MedianStyle','target')
hold on
boxplot(x3,g,'Colors',[117,36,35]/255,'MedianStyle','target')
hold on
P11=plot(index_set_0,R1,'Color',[220,120,120]/255,'LineWidth',1.5);
hold on
P12=plot(index_set_0,R2,'Color',[206,60,79]/255,'LineWidth',1.5);
hold on
P13=plot(index_set_0,R3,'Color',[117,36,35]/255,'LineWidth',1.5);
hold off

% 刻度 & 标尺

ax1.YLim=[-0.05 0.85];            % 坐标轴范围
% ax.YAxisLocation='left';        % y 轴位置 默认 - 'left'
% ax.YDir='normal';                 % y 轴方向 默认 - 'normal'
% ax.YScale='linear';                % 值沿坐标轴的标度 默认 - 'linear'

% ax1.YTick=[0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7];                      % 刻度值
ax1.XTickLabel={0.0 0.2 0.4 0.6 0.8 1.0};        % 刻度标签
ax1.TickLabelInterpreter='tex';                     % 刻度标签解释器 默认- 'tex'
% ax.TickDir='in';                                           % 刻度线方向 默认 - 'in'
ax1.TickLength(1)=0.012;                             % 刻度线长度 默认 - 0.01
ax1.FontSize=10;                                         % 刻度标签字体大小
ax1.FontName='Times';                               % 刻度标签字体名称
% ax.FontUnits='points';                                % 刻度标签字体单位 默认 - 'points'

% 网格

ax1.YGrid='on';                            % 网格线 默认 - 'off'
% ax.GridLineStyle='-';                   % 网格线的线型 默认 - '-'
% ax.GridColor=[0.15 0.15 0.15];    % 网格线的颜色 默认 - [0.15 0.15 0.15]
ax1.GridAlpha=0.20;                    % 网格线透明度 默认 - 0.15

% 框样式

% ax.Color=[1 1 1];        % 背景色 默认 - [1 1 1]
ax1.LineWidth=1.0;      % 线条宽度 默认 - 0.5
ax1.Box='off';               % 框轮廓 默认 - 'off'

% 标签

ax1.YLabel.String='$R_{\infty}$';                   % 要显示的文本
ax1.YLabel.Interpreter='latex';
ax1.YLabel.FontSize=10;
% ax.YLabel.FontName='Helvetica';
% ax.YLabel.FontUnits='points';
ax1.YLabel.Color=[0 0 0];              % 文本颜色

% ax1.XLabel.String='$\lambda$';
% ax1.XLabel.Interpreter='latex';
% ax1.XLabel.FontSize=10;
% % ax.XLabel.FontName='Helvetica';
% % ax.XLabel.FontUnits='points';
% ax1.XLabel.Color=[0 0 0];              % 文本颜色

lgd=legend(ax1,[P11,P12,P13],...
    {'1','2','3'});

% lgd.Location='eastoutside';                % 相对于坐标区的位置
lgd.Units='centimeters';
lgd.Position=[5.2+1.2 3.9+1.2*2+1.3 1.2 1.0];
% lgd.Orientation='horizontal';           % 方向 默认 - 'vertical'
% lgd.NumColumns=2;                      % 列数 默认 - 1
lgd.Interpreter='tex';
lgd.FontSize=8;
lgd.FontName='Times';
lgd.Title.String='Case';
lgd.Title.FontSize=8;
lgd.Title.Interpreter='tex';
lgd.Title.FontName='Arial';
lgd.Title.FontWeight='normal';
lgd.TextColor=[0 0 0];                     % 文本颜色
lgd.Color=[1 1 1];                            % 背景色
lgd.Box='on';                                  % 框轮廓的显示
ldg.EdgeColor=[1.0 1.0 1.0];       % 框轮廓颜色
lgd.LineWidth=0.8;                          % 框轮廓的宽度
lgd.ItemTokenSize=[20,12];

t=annotation('textbox');

t.String='A';
t.FontSize=14;
t.FontWeight='bold';
t.Interpreter='tex';
t.Units='centimeters';
t.Position=[0.0+0.1 3.9*2+1.2*2+0.2 0.5 0.5];
t.EdgeColor='none';

ax0=axes('Units','centimeters',...
    'Position',[1.2+0.3 3.9+1.2*2+2.5 5.2*0.38 3.9*0.38],'PositionConstraint','innerposition');

plot(lambda/lambda_c_1,R1,'Color',[220,120,120]/255,'LineWidth',1.0)
hold on
plot(lambda/lambda_c_2,R2,'Color',[206,60,79]/255,'LineWidth',1.0)
hold on
plot(lambda/lambda_c_3,R3,'Color',[117,36,35]/255,'LineWidth',1.0)
hold off

% 刻度 & 标尺

ax0.YLim=[-0.05 0.75];            % 坐标轴范围
ax0.YAxisLocation='right';        % y 轴位置 默认 - 'left'

ax0.YTick=[0.0 0.35 0.7];                      % 刻度值
ax0.XTick=[0.0 1.0 2.0 3.0 4.0 5.0];                      % 刻度值

ax0.TickLength(1)=0.010;                             % 刻度线长度 默认 - 0.01
ax0.FontSize=8;                                         % 刻度标签字体大小
ax0.FontName='Times';                               % 刻度标签字体名称

% 框样式

ax0.LineWidth=0.8;      % 线条宽度 默认 - 0.5
ax0.Box='on';               % 框轮廓 默认 - 'off'

% 标签

ax0.YLabel.String='$R_{\infty}$';                   % 要显示的文本
ax0.YLabel.Interpreter='latex';
ax0.YLabel.FontSize=8;
ax0.YLabel.Color=[0 0 0];              % 文本颜色

ax0.XLabel.String='$\lambda/\lambda_c$';
ax0.XLabel.Interpreter='latex';
ax0.XLabel.FontSize=8;
ax0.XLabel.Color=[0 0 0];              % 文本颜色

ax2=axes('Units','centimeters',...
    'Position',[1.2 1.2 5.2 3.9],'PositionConstraint','innerposition');

% figure
% 
% ax=gca;
% 
% ax.Units='centimeters';
% ax.Position=[2 2 8 6];
% ax.PositionConstraint='innerposition';
% 
boxplot(y1,g,'Colors',[160,191,124]/255,'MedianStyle','target')
hold on
boxplot(y2,g,'Colors',[64,116,52]/255,'MedianStyle','target')
hold on
boxplot(y3,g,'Colors',[3,35,14]/255,'MedianStyle','target')
hold on
P21=plot(index_set_0,V1,'Color',[160,191,124]/255,'LineWidth',1.5);
hold on
P22=plot(index_set_0,V2,'Color',[64,116,52]/255,'LineWidth',1.5);
hold on
P23=plot(index_set_0,V3,'Color',[3,35,14]/255,'LineWidth',1.5);
hold off

% 刻度 & 标尺

ax2.YLim=[-0.05 0.65];            % 坐标轴范围
% ax.YAxisLocation='left';        % y 轴位置 默认 - 'left'
% ax.YDir='normal';                 % y 轴方向 默认 - 'normal'
% ax.YScale='linear';                % 值沿坐标轴的标度 默认 - 'linear'

% ax2.YTick=[0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7];                      % 刻度值
ax2.XTickLabel={0.0 0.2 0.4 0.6 0.8 1.0};        % 刻度标签
ax2.TickLabelInterpreter='tex';                     % 刻度标签解释器 默认- 'tex'
% ax.TickDir='in';                                           % 刻度线方向 默认 - 'in'
ax2.TickLength(1)=0.012;                             % 刻度线长度 默认 - 0.01
ax2.FontSize=10;                                         % 刻度标签字体大小
ax2.FontName='Times';                               % 刻度标签字体名称
% ax.FontUnits='points';                                % 刻度标签字体单位 默认 - 'points'

% 网格

ax2.YGrid='on';                            % 网格线 默认 - 'off'
% ax.GridLineStyle='-';                   % 网格线的线型 默认 - '-'
% ax.GridColor=[0.15 0.15 0.15];    % 网格线的颜色 默认 - [0.15 0.15 0.15]
ax2.GridAlpha=0.20;                    % 网格线透明度 默认 - 0.15

% 框样式

% ax.Color=[1 1 1];        % 背景色 默认 - [1 1 1]
ax2.LineWidth=1.0;      % 线条宽度 默认 - 0.5
ax2.Box='off';               % 框轮廓 默认 - 'off'

% 标签

ax2.YLabel.String='$V_{\infty}$';                   % 要显示的文本
ax2.YLabel.Interpreter='latex';
ax2.YLabel.FontSize=10;
% ax.YLabel.FontName='Helvetica';
% ax.YLabel.FontUnits='points';
ax2.YLabel.Color=[0 0 0];              % 文本颜色

ax2.XLabel.String='$\lambda$';
ax2.XLabel.Interpreter='latex';
ax2.XLabel.FontSize=10;
% ax.XLabel.FontName='Helvetica';
% ax.XLabel.FontUnits='points';
ax2.XLabel.Color=[0 0 0];              % 文本颜色

lgd=legend([P21,P22,P23],...
    {'1','2','3'});

% lgd.Location='southeast';                % 相对于坐标区的位置
lgd.Units='centimeters';
lgd.Position=[5.2+1.2 1.2+1.3 1.2 1.0];
% lgd.Orientation='horizontal';           % 方向 默认 - 'vertical'
% lgd.NumColumns=2;                      % 列数 默认 - 1
lgd.Interpreter='latex';
lgd.FontSize=8;
lgd.FontName='Times';
lgd.Title.String='Case';
lgd.Title.FontSize=8;
lgd.Title.Interpreter='tex';
lgd.Title.FontName='Arial';
lgd.Title.FontWeight='normal';
lgd.TextColor=[0 0 0];                     % 文本颜色
lgd.Color=[1 1 1];                            % 背景色
lgd.Box='on';                                  % 框轮廓的显示
ldg.EdgeColor=[0.15 0.15 0.15];       % 框轮廓颜色
lgd.LineWidth=0.8;                          % 框轮廓的宽度
lgd.ItemTokenSize=[20,12];

t=annotation('textbox');

t.String='B';
t.FontSize=14;
t.FontWeight='bold';
t.Interpreter='tex';
t.Units='centimeters';
t.Position=[0.0+0.1 3.9+1.2+0.2 0.5 0.5];
t.EdgeColor='none';

exportgraphics(fig,'Figure.tiff','Resolution',300)

toc
