
clc
clear
tic

fig=figure;

fig.Units='centimeters';
fig.Position=[0 0 13.125 11.4];

ax1=axes('Units','centimeters',...
    'Position',[1.2 3.9+1.2*2 5.2 3.9],'PositionConstraint','innerposition');

load dataN26_new_05.mat

R1=total_R_set_0/N;
V1=total_V_set_0/N;

T1=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T1(i)=find(I_set_0{i}>0,1,'last')-1;
end

index1=zeros(numel(alpha),1);
index1(T_index+sign(1-alpha_index)<=T1)=1;  % there is no enough source
index1(end)=0;  % T_index(end)=0 & alpha_index(end)=1

tem_set_1=index1;
index_set_1=[];
while(sum(tem_set_1==1))
    l=find(tem_set_1==1,1,'first');
    if(tem_set_1(l+1)==1)
        index=find(tem_set_1(l+1:end)==0,1,'first');
        r=l+index-1;
        index_set_1=[index_set_1;[l,r]];
        tem_set_1(l:r)=0;
    else
        tem_set_1(l)=0;
    end
end

C_R=4.0;
C_V=C_R*(1-eta);
C_D=0.1;

C_total_R_1=C_R.*R1;
C_total_V_1=C_V.*V1;
C_total_D_1=C_D.*(alpha'-1).^2.*min(T_index,T1)+C_D.*(alpha_index-1).^2.*sign(max(T1-T_index,0));

C_total_1=C_total_R_1+C_total_V_1+C_total_D_1;

for i=1:size(index_set_1,1)
    plot(alpha(index_set_1(i,1)).*ones(1,2),[0,max(C_total_1)],...
        '-','Color',[0.7451 0.7451 0.7451],'LineWidth',1.5);
    hold on
    plot(alpha(index_set_1(i,2)).*ones(1,2),[0,max(C_total_1)],...
        '-','Color',[0.7451 0.7451 0.7451],'LineWidth',1.5);
    hold on
end

P1=plot(alpha,C_total_1,...
    '-','Color',[ 13, 12, 12]/255,'Marker','o','MarkerSize',4.5,'MarkerEdgeColor',[ 13, 12, 12]/255);
hold on
P2=plot(alpha,C_total_R_1,...
    '-','Color',[209, 73, 78]/255,'Marker','s','MarkerSize',4.5,'MarkerEdgeColor',[209, 73, 78]/255);
hold on
P3=plot(alpha,C_total_V_1,...
    '-','Color',[ 29,191,151]/255,'Marker','d','MarkerSize',4.5,'MarkerEdgeColor',[ 29,191,151]/255);
hold on
P4=plot(alpha,C_total_D_1,...
    '-','Color',[ 36,169,225]/255,'Marker','^','MarkerSize',4.5,'MarkerEdgeColor',[ 36,169,225]/255);
hold off

ax1.YLim=[0.0 6.0];            % 坐标轴范围
% ax1.YTick=[0.0 0.4 0.8];
ax1.TickLength(1)=0.012;                             % 刻度线长度 默认 - 0.01
ax1.FontSize=10;                                         % 刻度标签字体大小
ax1.FontName='Times';

ax1.LineWidth=1.0;      % 线条宽度 默认 - 0.5
ax1.Box='on';               % 框轮廓 默认 - 'off'

ax1.YLabel.String='Cost';                   % 要显示的文本
ax1.YLabel.Interpreter='tex';
ax1.YLabel.FontSize=10;
ax1.YLabel.FontName='Arial';
ax1.YLabel.Color=[0 0 0];              % 文本颜色

% ax1.XLabel.String='$1-\alpha$';                   % 要显示的文本
% ax1.XLabel.Interpreter='latex';
% ax1.XLabel.FontSize=10;
% ax1.XLabel.FontName='Arial';
% ax1.XLabel.Color=[0 0 0];              % 文本颜色

lgd=legend(ax1,[P1,P2,P3,P4],...
    {'$C_{total}$','$C_R$','$C_V$','$C_D$'});

lgd.Location='northeast';                % 相对于坐标区的位置
% lgd.Units='normalized';
% lgd.Position=[0.2 0.85 0.05 0.05];
lgd.Orientation='horizontal';           % 方向 默认 - 'vertical'
lgd.NumColumns=1;                      % 列数 默认 - 1
lgd.Interpreter='latex';
lgd.FontSize=8;
% lgd.FontName='Times';
lgd.TextColor=[0 0 0];                     % 文本颜色
lgd.Color=[1 1 1];                            % 背景色
lgd.Box='on';                                  % 框轮廓的显示
lgd.LineWidth=0.8;                         % 框轮廓的宽度
lgd.ItemTokenSize=[20 12];

t=annotation('textbox');

t.String='A';
t.FontSize=14;
t.FontWeight='bold';
t.Interpreter='tex';
t.Units='centimeters';
t.Position=[0.0+0.1 3.9*2+1.2*2+0.2 0.5 0.5];
t.EdgeColor='none';

ax2=axes('Units','centimeters',...
    'Position',[5.2+1.2*2 3.9+1.2*2 5.2 3.9],'PositionConstraint','innerposition');

load dataN62_new_05.mat

R2=total_R_set_0/N;
V2=total_V_set_0/N;

T2=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T2(i)=find(I_set_0{i}>0,1,'last')-1;
end

index2=zeros(numel(alpha),1);
index2(T_index+sign(1-alpha_index)<=T2)=1;
index2(end)=0;

tem_set_2=index2;
index_set_2=[];
while(sum(tem_set_2==1))
    l=find(tem_set_2==1,1,'first');
    if(tem_set_2(l+1)==1)
        index=find(tem_set_2(l+1:end)==0,1,'first');
        r=l+index-1;
        index_set_2=[index_set_2;[l,r]];
        tem_set_2(l:r)=0;
    else
        tem_set_2(l)=0;
    end
end

C_R=4.0;
C_V=C_R*(1-eta);
C_D=0.1;

C_total_R_2=C_R.*R2;
C_total_V_2=C_V.*V2;
C_total_D_2=C_D.*(alpha'-1).^2.*min(T_index,T2)+C_D.*(alpha_index-1).^2.*sign(max(T2-T_index,0));

C_total_2=C_total_R_2+C_total_V_2+C_total_D_2;

for i=1:size(index_set_2,1)
    plot(alpha(index_set_2(i,1)).*ones(1,2),[0,max(C_total_2)],...
        '-','Color',[0.7451 0.7451 0.7451],'LineWidth',1.5);
    hold on
    plot(alpha(index_set_2(i,2)).*ones(1,2),[0,max(C_total_2)],...
        '-','Color',[0.7451 0.7451 0.7451],'LineWidth',1.5);
    hold on
end

P1=plot(alpha,C_total_2,...
    '-','Color',[ 13, 12, 12]/255,'Marker','o','MarkerSize',4.5,'MarkerEdgeColor',[ 13, 12, 12]/255);
hold on
P2=plot(alpha,C_total_R_2,...
    '-','Color',[209, 73, 78]/255,'Marker','s','MarkerSize',4.5,'MarkerEdgeColor',[209, 73, 78]/255);
hold on
P3=plot(alpha,C_total_V_2,...
    '-','Color',[ 29,191,151]/255,'Marker','d','MarkerSize',4.5,'MarkerEdgeColor',[ 29,191,151]/255);
hold on
P4=plot(alpha,C_total_D_2,...
    '-','Color',[ 36,169,225]/255,'Marker','^','MarkerSize',4.5,'MarkerEdgeColor',[ 36,169,225]/255);
hold off

ax2.YLim=[0.0 4.0];            % 坐标轴范围
% ax2.YTick=[0.0 0.5 1.0];
ax2.TickLength(1)=0.012;                             % 刻度线长度 默认 - 0.01
ax2.FontSize=10;                                         % 刻度标签字体大小
ax2.FontName='Times';

ax2.LineWidth=1.0;      % 线条宽度 默认 - 0.5
ax2.Box='on';               % 框轮廓 默认 - 'off'

% ax2.XLabel.String='$1-\alpha$';                   % 要显示的文本
% ax2.XLabel.Interpreter='latex';
% ax2.XLabel.FontSize=10;
% ax2.XLabel.Color=[0 0 0];              % 文本颜色

lgd=legend(ax2,[P1,P2,P3,P4],...
    {'$C_{total}$','$C_R$','$C_V$','$C_D$'});

lgd.Location='northeast';                % 相对于坐标区的位置
% lgd.Units='normalized';
% lgd.Position=[0.2 0.85 0.05 0.05];
lgd.Orientation='horizontal';           % 方向 默认 - 'vertical'
lgd.NumColumns=1;                      % 列数 默认 - 1
lgd.Interpreter='latex';
lgd.FontSize=8;
% lgd.FontName='Times';
lgd.TextColor=[0 0 0];                     % 文本颜色
lgd.Color=[1 1 1];                            % 背景色
lgd.Box='on';                                  % 框轮廓的显示
lgd.LineWidth=0.8;                         % 框轮廓的宽度
lgd.ItemTokenSize=[20 12];

t=annotation('textbox');

t.String='B';
t.FontSize=14;
t.FontWeight='bold';
t.Interpreter='tex';
t.Units='centimeters';
t.Position=[5.2+1.2+0.1 3.9*2+1.2*2+0.2 0.5 0.5];
t.EdgeColor='none';

ax3=axes('Units','centimeters',...
    'Position',[1.2 1.2 5.2 3.9],'PositionConstraint','innerposition');

load dataN26_new_20.mat

R3=total_R_set_0/N;
V3=total_V_set_0/N;

T3=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T3(i)=find(I_set_0{i}>0,1,'last')-1;
end

index3=zeros(numel(alpha),1);
index3(T_index+sign(1-alpha_index)<=T3)=1;  % there is no enough source
index3(end)=0;  % T_index(end)=0 & alpha_index(end)=1

tem_set_3=index3;
index_set_3=[];
while(sum(tem_set_3==1))
    l=find(tem_set_3==1,1,'first');
    if(tem_set_3(l+1)==1)
        index=find(tem_set_3(l+1:end)==0,1,'first');
        r=l+index-1;
        index_set_3=[index_set_3;[l,r]];
        tem_set_3(l:r)=0;
    else
        tem_set_3(l)=0;
    end
end

C_R=4.0;
C_V=C_R*(1-eta);
C_D=0.1;

C_total_R_3=C_R.*R3;
C_total_V_3=C_V.*V3;
C_total_D_3=C_D.*(alpha'-1).^2.*min(T_index,T3)+C_D.*(alpha_index-1).^2.*sign(max(T3-T_index,0));

C_total_3=C_total_R_3+C_total_V_3+C_total_D_3;

for i=1:size(index_set_3,1)
    plot(alpha(index_set_3(i,1)).*ones(1,2),[0,max(C_total_3)],...
        '-','Color',[0.7451 0.7451 0.7451],'LineWidth',1.5);
    hold on
    plot(alpha(index_set_3(i,2)).*ones(1,2),[0,max(C_total_3)],...
        '-','Color',[0.7451 0.7451 0.7451],'LineWidth',1.5);
    hold on
end

P1=plot(alpha,C_total_3,...
    '-','Color',[ 13, 12, 12]/255,'Marker','o','MarkerSize',4.5,'MarkerEdgeColor',[ 13, 12, 12]/255);
hold on
P2=plot(alpha,C_total_R_3,...
    '-','Color',[209, 73, 78]/255,'Marker','s','MarkerSize',4.5,'MarkerEdgeColor',[209, 73, 78]/255);
hold on
P3=plot(alpha,C_total_V_3,...
    '-','Color',[ 29,191,151]/255,'Marker','d','MarkerSize',4.5,'MarkerEdgeColor',[ 29,191,151]/255);
hold on
P4=plot(alpha,C_total_D_3,...
    '-','Color',[ 36,169,225]/255,'Marker','^','MarkerSize',4.5,'MarkerEdgeColor',[ 36,169,225]/255);
hold off

ax3.YLim=[0.0 7.0];            % 坐标轴范围
% ax3.YTick=[0.0 0.6 1.2];
% ax3.XTick=[0 1 2 4 6];
ax3.TickLength(1)=0.012;                             % 刻度线长度 默认 - 0.01
ax3.FontSize=10;                                         % 刻度标签字体大小
ax3.FontName='Times';

ax3.LineWidth=1.0;      % 线条宽度 默认 - 0.5
ax3.Box='on';               % 框轮廓 默认 - 'off'

ax3.YLabel.String='Cost';                   % 要显示的文本
ax3.YLabel.Interpreter='tex';
ax3.YLabel.FontSize=10;
ax3.YLabel.FontName='Arial';
ax3.YLabel.Color=[0 0 0];              % 文本颜色

ax3.XLabel.String='$1-\alpha$';                   % 要显示的文本
ax3.XLabel.Interpreter='latex';
ax3.XLabel.FontSize=10;
ax3.XLabel.Color=[0 0 0];              % 文本颜色

lgd=legend(ax3,[P1,P2,P3,P4],...
    {'$C_{total}$','$C_R$','$C_V$','$C_D$'});

lgd.Location='northeast';                % 相对于坐标区的位置
% lgd.Units='normalized';
% lgd.Position=[0.2 0.85 0.05 0.05];
lgd.Orientation='horizontal';           % 方向 默认 - 'vertical'
lgd.NumColumns=1;                      % 列数 默认 - 1
lgd.Interpreter='latex';
lgd.FontSize=8;
lgd.FontName='Times';
lgd.TextColor=[0 0 0];                     % 文本颜色
lgd.Color=[1 1 1];                            % 背景色
lgd.Box='on';                                  % 框轮廓的显示
lgd.LineWidth=0.8;                         % 框轮廓的宽度
lgd.ItemTokenSize=[20 12];

t=annotation('textbox');

t.String='C';
t.FontSize=14;
t.FontWeight='bold';
t.Interpreter='tex';
t.Units='centimeters';
t.Position=[0.0+0.1 3.9+1.2+0.2 0.5 0.5];
t.EdgeColor='none';

ax4=axes('Units','centimeters',...
    'Position',[5.2+1.2*2 1.2 5.2 3.9],'PositionConstraint','innerposition');

load dataN62_new_20.mat

R4=total_R_set_0/N;
V4=total_V_set_0/N;

T4=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T4(i)=find(I_set_0{i}>0,1,'last')-1;
end

index4=zeros(numel(alpha),1);
index4(T_index+sign(1-alpha_index)<=T4)=1;
index4(end)=0;

tem_set_4=index4;
index_set_4=[];
while(sum(tem_set_4==1))
    l=find(tem_set_4==1,1,'first');
    if(tem_set_4(l+1)==1)
        index=find(tem_set_4(l+1:end)==0,1,'first');
        r=l+index-1;
        index_set_4=[index_set_4;[l,r]];
        tem_set_4(l:r)=0;
    else
        tem_set_4(l)=0;
    end
end

C_R=4.0;
C_V=C_R*(1-eta);
C_D=0.1;

C_total_R_4=C_R.*R4;
C_total_V_4=C_V.*V4;
C_total_D_4=C_D.*(alpha'-1).^2.*min(T_index,T4)+C_D.*(alpha_index-1).^2.*sign(max(T4-T_index,0));

C_total_4=C_total_R_4+C_total_V_4+C_total_D_4;

for i=1:size(index_set_4,1)
    plot(alpha(index_set_4(i,1)).*ones(1,2),[0,max(C_total_4)],...
        '-','Color',[0.7451 0.7451 0.7451],'LineWidth',1.5);
    hold on
    plot(alpha(index_set_4(i,2)).*ones(1,2),[0,max(C_total_4)],...
        '-','Color',[0.7451 0.7451 0.7451],'LineWidth',1.5);
    hold on
end

P1=plot(alpha,C_total_4,...
    '-','Color',[ 13, 12, 12]/255,'Marker','o','MarkerSize',4.5,'MarkerEdgeColor',[ 13, 12, 12]/255);
hold on
P2=plot(alpha,C_total_R_4,...
    '-','Color',[209, 73, 78]/255,'Marker','s','MarkerSize',4.5,'MarkerEdgeColor',[209, 73, 78]/255);
hold on
P3=plot(alpha,C_total_V_4,...
    '-','Color',[ 29,191,151]/255,'Marker','d','MarkerSize',4.5,'MarkerEdgeColor',[ 29,191,151]/255);
hold on
P4=plot(alpha,C_total_D_4,...
    '-','Color',[ 36,169,225]/255,'Marker','^','MarkerSize',4.5,'MarkerEdgeColor',[ 36,169,225]/255);
hold off

ax4.YLim=[0.0 5.0];            % 坐标轴范围
% ax4.YTick=[0.0 0.4 0.8];
ax4.TickLength(1)=0.012;                             % 刻度线长度 默认 - 0.01
ax4.FontSize=10;                                         % 刻度标签字体大小
ax4.FontName='Times';

ax4.LineWidth=1.0;      % 线条宽度 默认 - 0.5
ax4.Box='on';               % 框轮廓 默认 - 'off'

ax4.XLabel.String='$1-\alpha$';                   % 要显示的文本
ax4.XLabel.Interpreter='latex';
ax4.XLabel.FontSize=10;
ax4.XLabel.Color=[0 0 0];              % 文本颜色

lgd=legend(ax4,[P1,P2,P3,P4],...
    {'$C_{total}$','$C_R$','$C_V$','$C_D$'});

lgd.Location='northeast';                % 相对于坐标区的位置
% lgd.Units='normalized';
% lgd.Position=[0.6 0.85 0.2 0.2];
lgd.Orientation='horizontal';           % 方向 默认 - 'vertical'
lgd.NumColumns=1;                      % 列数 默认 - 1
lgd.Interpreter='latex';
lgd.FontSize=8;
lgd.FontName='Times';
lgd.TextColor=[0 0 0];                     % 文本颜色
lgd.Color=[1 1 1];                            % 背景色
lgd.Box='on';                                  % 框轮廓的显示
lgd.LineWidth=0.8;                         % 框轮廓的宽度
lgd.ItemTokenSize=[20 12];

t=annotation('textbox');

t.String='D';
t.FontSize=14;
t.FontWeight='bold';
t.Interpreter='tex';
t.Units='centimeters';
t.Position=[5.2+1.2+0.1 3.9+1.2+0.2 0.5 0.5];
t.EdgeColor='none';

exportgraphics(fig,'Figure.tiff','Resolution',300)

toc
