

clc
clear
tic

fig=figure;

fig.Units='centimeters';
fig.Position=[0 0 13.125 6.3];

load dataN26_new_1.mat

T1=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T1(i)=find(I_set_0{i}>0,1,'last')-1;
end

index1=1;index2=28;index3=29;index4=30;index5=51;
index6=20;

ax1=axes('Units','centimeters',...
    'Position',[1.2 1.2 5.2 3.9],'PositionConstraint','innerposition');

plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index1)+sign(1-alpha_index(index1)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index1)+sign(1-alpha_index(index1))],[0 2000],...
    'LineStyle','--','LineWidth',1.0,'Color',[114,111,128]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2))],[0 500],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 29,191,151]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2))],[1840 2000],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 29,191,151]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3))],[0 500],...
    'LineStyle','--','LineWidth',1.0,'Color',[209, 73, 78]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3))],[1840 2000],...
    'LineStyle','--','LineWidth',1.0,'Color',[209, 73, 78]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4))],[0 500],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 36,169,225]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4))],[1840 2000],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 36,169,225]/255)
hold on
% plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index5)+sign(1-alpha_index(index5)),...
%     find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index5)+sign(1-alpha_index(index5))],[0 2000],...
%     'LineStyle','--','LineWidth',1.0,'Color',[ 89, 69, 61]/255)
% hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index6)+sign(1-alpha_index(index6)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index6)+sign(1-alpha_index(index6))],[0 500],...
    'LineStyle','--','LineWidth',1.0,'Color',[0 0 0])
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index6)+sign(1-alpha_index(index6)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index6)+sign(1-alpha_index(index6))],[1840 2000],...
    'LineStyle','--','LineWidth',1.0,'Color',[0 0 0])
hold on

P1=plot(0:T1(index1),I_set_0{index1}(1:T1(index1)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[114,111,128]/255);
hold on
P2=plot(0:T1(index2),I_set_0{index2}(1:T1(index2)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[ 29,191,151]/255);
hold on
P3=plot(0:T1(index3),I_set_0{index3}(1:T1(index3)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[209, 73, 78]/255);
hold on
P4=plot(0:T1(index4),I_set_0{index4}(1:T1(index4)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[ 36,169,225]/255);
hold on
P5=plot(0:T1(index5),I_set_0{index5}(1:T1(index5)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[0.7451 0.7451 0.7451]);
hold on
P6=plot(0:T1(index6),I_set_0{index6}(1:T1(index6)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[0 0 0]);
hold off

ax1.YLim=[0 2000];            % 鍧愭爣杞磋寖鍥?
% ax1.YTick=[0.0 0.4 0.8];
ax1.XLim=[0 200];            % 鍧愭爣杞磋寖鍥?
ax1.TickLength(1)=0.012;                             % 鍒诲害绾块暱搴? 榛樿 - 0.01
ax1.FontSize=10;                                         % 鍒诲害鏍囩瀛椾綋澶у皬
ax1.FontName='Times';

ax1.LineWidth=1.0;      % 绾挎潯瀹藉害 榛樿 - 0.5
ax1.Box='on';               % 妗嗚疆寤? 榛樿 - 'off'

ax1.YLabel.String='Number of infected';                   % 瑕佹樉绀虹殑鏂囨湰
ax1.YLabel.Interpreter='tex';
ax1.YLabel.FontSize=10;
ax1.YLabel.FontName='Arial';
ax1.YLabel.Color=[0 0 0];              % 鏂囨湰棰滆壊

ax1.XLabel.String='Time';                   % 瑕佹樉绀虹殑鏂囨湰
ax1.XLabel.Interpreter='tex';
ax1.XLabel.FontSize=10;
ax1.XLabel.FontName='Arial';
ax1.XLabel.Color=[0 0 0];              % 鏂囨湰棰滆壊

t=annotation('textbox');

t.String='A';
t.FontSize=14;
t.FontWeight='bold';
t.Interpreter='tex';
t.Units='centimeters';
t.Position=[0.0+0.1 3.9+1.2+0.2 0.5 0.5];
t.EdgeColor='none';

% lgd=legend(ax1,[P1,P2,P3,P4,P5],...
%     {'$\alpha_1$','$\alpha_2$','$\alpha_3$','$\alpha_4$','$\alpha_5$'});

lgd=legend(ax1,[P1,P6,P2,P3,P4,P5],...
    {'$\alpha_1$','$\alpha_2$','$\alpha_3$','$\alpha_4$','$\alpha_5$','$\alpha_6$'});

lgd.Location='northeast';                % 鐩稿浜庡潗鏍囧尯鐨勪綅缃?
% lgd.Units='normalized';
% lgd.Position=[0.2 0.85 0.05 0.05];
lgd.Orientation='vertical';           % 鏂瑰悜 榛樿 - 'vertical'
lgd.NumColumns=1;                      % 鍒楁暟 榛樿 - 1
lgd.Interpreter='latex';
lgd.FontSize=8;
lgd.FontName='Times';
lgd.TextColor=[0 0 0];                     % 鏂囨湰棰滆壊
lgd.Color=[1 1 1];                            % 鑳屾櫙鑹?
lgd.Box='on';
lgd.LineWidth=0.8;
lgd.ItemTokenSize=[20,12];

ax=gca;
ax.YAxis.Exponent=3;

ax10=axes('Units','centimeters','Position',[1.2+1.612 1.2+1.65 5.2*0.38 3.9*0.38]);

plot([0,100],[1,1],'LineStyle',':','LineWidth',0.8,'Color',[0.7451 0.7451 0.7451])
hold on

% plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index1)+sign(1-alpha_index(index1)),...
%     find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index1)+sign(1-alpha_index(index1))],[0 2000],...
%     'LineStyle','--','LineWidth',1.0,'Color',[114,111,128]/255)
% hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2))],[0 500],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 29,191,151]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2))],[1840 2000],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 29,191,151]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3))],[0 500],...
    'LineStyle','--','LineWidth',1.0,'Color',[209, 73, 78]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3))],[1840 2000],...
    'LineStyle','--','LineWidth',1.0,'Color',[209, 73, 78]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4))],[0 500],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 36,169,225]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4))],[1840 2000],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 36,169,225]/255)
hold on
% plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index5)+sign(1-alpha_index(index5)),...
%     find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index5)+sign(1-alpha_index(index5))],[0 2000],...
%     'LineStyle','--','LineWidth',1.0,'Color',[ 56, 13, 49]/255)
% hold on

% plot(0:T3(index1),I_set_0{index1}(1:T3(index1)+1),...
%     'LineStyle','-','LineWidth',1.5,'Color',[114,111,128]/255);
% hold on
plot(0:T1(index2),I_set_0{index2}(1:T1(index2)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[ 29,191,151]/255);
hold on
plot(0:T1(index3),I_set_0{index3}(1:T1(index3)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[209, 73, 78]/255);
hold on
plot(0:T1(index4),I_set_0{index4}(1:T1(index4)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[ 36,169,225]/255);
hold on
% plot(0:T3(index5),I_set_0{index5}(1:T3(index5)+1),...
%     'LineStyle','-','LineWidth',1.5,'Color',[ 56, 13, 49]/255);
hold off

ax10.YLim=[0 6];            % 鍧愭爣杞磋寖鍥?
ax10.YTick=[0 1 2 4 6];
ax10.XLim=[63 83];            % 鍧愭爣杞磋寖鍥?
ax10.XTick=[63 73 83];
ax10.TickLength(1)=0.010;                             % 鍒诲害绾块暱搴? 榛樿 - 0.01
ax10.FontSize=8;                                         % 鍒诲害鏍囩瀛椾綋澶у皬
ax10.FontName='Times';

ax10.LineWidth=0.8;      % 绾挎潯瀹藉害 榛樿 - 0.5
ax10.Box='on';               % 妗嗚疆寤? 榛樿 - 'off'

ax10.YLabel.String='Number of infected';                   % 瑕佹樉绀虹殑鏂囨湰
ax10.YLabel.Interpreter='tex';
ax10.YLabel.FontSize=8;
ax10.YLabel.FontName='Arial';
ax10.YLabel.Color=[0 0 0];              % 鏂囨湰棰滆壊

ax10.XLabel.String='Time';                   % 瑕佹樉绀虹殑鏂囨湰
ax10.XLabel.Interpreter='tex';
ax10.XLabel.FontSize=8;
ax10.XLabel.FontName='Arial';
ax10.XLabel.Color=[0 0 0];              % 鏂囨湰棰滆壊

load dataN26_new_1.mat

T1=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T1(i)=find(I_set_0{i}>0,1,'last')-1;
end

load dataN62_new_1.mat

T2=zeros(numel(alpha),1);
for i=1:numel(alpha)
    T2(i)=find(I_set_0{i}>0,1,'last')-1;
end

index1=1;index2=25;index3=26;index4=27;index5=51;

ax2=axes('Units','centimeters',...
    'Position',[5.2+1.2*2 1.2 5.2 3.9],'PositionConstraint','innerposition');

plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index1)+sign(1-alpha_index(index1)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index1)+sign(1-alpha_index(index1))],[0 200],...
    'LineStyle','--','LineWidth',1.0,'Color',[114,111,128]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2))],[0 50],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 29,191,151]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2))],[184 200],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 29,191,151]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3))],[0 50],...
    'LineStyle','--','LineWidth',1.0,'Color',[209, 73, 78]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3))],[184 200],...
    'LineStyle','--','LineWidth',1.0,'Color',[209, 73, 78]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4))],[0 50],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 36,169,225]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4))],[184 200],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 36,169,225]/255)
hold on
% plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index5)+sign(1-alpha_index(index5)),...
%     find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index5)+sign(1-alpha_index(index5))],[0 200],...
%     'LineStyle','--','LineWidth',1.0,'Color',[ 56, 13, 49]/255)
% hold on

P1=plot(0:T2(index1),I_set_0{index1}(1:T2(index1)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[114,111,128]/255);
hold on
P2=plot(0:T2(index2),I_set_0{index2}(1:T2(index2)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[ 29,191,151]/255);
hold on
P3=plot(0:T2(index3),I_set_0{index3}(1:T2(index3)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[209, 73, 78]/255);
hold on
P4=plot(0:T2(index4),I_set_0{index4}(1:T2(index4)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[ 36,169,225]/255);
hold on
P5=plot(0:T2(index5),I_set_0{index5}(1:T2(index5)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[0.7451 0.7451 0.7451]);
hold off

ax2.YLim=[0 200];            % 鍧愭爣杞磋寖鍥?
% ax2.YTick=[0.0 0.4 0.8];
ax2.XLim=[0 350];            % 鍧愭爣杞磋寖鍥?
ax2.TickLength(1)=0.012;                             % 鍒诲害绾块暱搴? 榛樿 - 0.01
ax2.FontSize=10;                                         % 鍒诲害鏍囩瀛椾綋澶у皬
ax2.FontName='Times';

ax2.LineWidth=1.0;      % 绾挎潯瀹藉害 榛樿 - 0.5
ax2.Box='on';               % 妗嗚疆寤? 榛樿 - 'off'

% ax2.YLabel.String='Number of infected';                   % 瑕佹樉绀虹殑鏂囨湰
% ax2.YLabel.Interpreter='latex';
% ax2.YLabel.FontSize=14;
% ax2.YLabel.Color=[0 0 0];              % 鏂囨湰棰滆壊

ax2.XLabel.String='Time';                   % 瑕佹樉绀虹殑鏂囨湰
ax2.XLabel.Interpreter='tex';
ax2.XLabel.FontSize=10;
ax2.XLabel.FontName='Arial';
ax2.XLabel.Color=[0 0 0];              % 鏂囨湰棰滆壊

t=annotation('textbox');

t.String='B';
t.FontSize=14;
t.FontWeight='bold';
t.Interpreter='tex';
t.Units='centimeters';
t.Position=[5.2+1.2+0.1 3.9+1.2+0.2 0.5 0.5];
t.EdgeColor='none';

ax=gca;
ax.YAxis.Exponent=2;

ax20=axes('Units','centimeters','Position',[5.2+1.2*2+1.612 1.2+1.65 5.2*0.38 3.9*0.38]);

plot([0,100],[1,1],'LineStyle',':','LineWidth',0.8,'Color',[0.7451 0.7451 0.7451])
hold on

% plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index1)+sign(1-alpha_index(index1)),...
%     find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index1)+sign(1-alpha_index(index1))],[0 200],...
%     'LineStyle','--','LineWidth',1.0,'Color',[114,111,128]/255)
% hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2))],[0 50],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 29,191,151]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index2)+sign(1-alpha_index(index2))],[184 200],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 29,191,151]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3))],[0 50],...
    'LineStyle','--','LineWidth',1.0,'Color',[209, 73, 78]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index3)+sign(1-alpha_index(index3))],[184 200],...
    'LineStyle','--','LineWidth',1.0,'Color',[209, 73, 78]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4))],[0 50],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 36,169,225]/255)
hold on
plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4)),...
    find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index4)+sign(1-alpha_index(index4))],[184 200],...
    'LineStyle','--','LineWidth',1.0,'Color',[ 36,169,225]/255)
hold on
% plot([find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index5)+sign(1-alpha_index(index5)),...
%     find(index_set_0{1}(:,2)<1,1,'first')-1+T_index(index5)+sign(1-alpha_index(index5))],[0 200],...
%     'LineStyle','--','LineWidth',1.0,'Color',[ 56, 13, 49]/255)
% hold on

% plot(0:T3(index1),I_set_0{index1}(1:T3(index1)+1),...
%     'LineStyle','-','LineWidth',1.5,'Color',[114,111,128]/255);
% hold on
plot(0:T2(index2),I_set_0{index2}(1:T2(index2)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[ 29,191,151]/255);
hold on
plot(0:T2(index3),I_set_0{index3}(1:T2(index3)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[209, 73, 78]/255);
hold on
plot(0:T2(index4),I_set_0{index4}(1:T2(index4)+1),...
    'LineStyle','-','LineWidth',1.5,'Color',[ 36,169,225]/255);
hold on
% plot(0:T3(index5),I_set_0{index5}(1:T3(index5)+1),...
%     'LineStyle','-','LineWidth',1.5,'Color',[ 56, 13, 49]/255);
hold off

ax20.YLim=[0.0 4];            % 鍧愭爣杞磋寖鍥?
ax20.YTick=[0.0 1.0 2.0 4.0];
ax20.XLim=[61 81];            % 鍧愭爣杞磋寖鍥?
ax20.XTick=[61 71 81];
ax20.TickLength(1)=0.010;                             % 鍒诲害绾块暱搴? 榛樿 - 0.01
ax20.FontSize=8;                                         % 鍒诲害鏍囩瀛椾綋澶у皬
ax20.FontName='Times';

ax20.LineWidth=0.8;      % 绾挎潯瀹藉害 榛樿 - 0.5
ax20.Box='on';               % 妗嗚疆寤? 榛樿 - 'off'

ax20.YLabel.String='Number of infected';                   % 瑕佹樉绀虹殑鏂囨湰
ax20.YLabel.Interpreter='tex';
ax20.YLabel.FontSize=8;
ax20.YLabel.FontName='Arial';
ax20.YLabel.Color=[0 0 0];              % 鏂囨湰棰滆壊

ax20.XLabel.String='Time';                   % 瑕佹樉绀虹殑鏂囨湰
ax20.XLabel.Interpreter='tex';
ax20.XLabel.FontSize=8;
ax20.XLabel.FontName='Arial';
ax20.XLabel.Color=[0 0 0];              % 鏂囨湰棰滆壊

lgd=legend(ax2,[P1,P2,P3,P4,P5],...
    {'$\alpha_1$','$\alpha_2$','$\alpha_3$','$\alpha_4$','$\alpha_5$'});

lgd.Location='northeast';                % 鐩稿浜庡潗鏍囧尯鐨勪綅缃?
% lgd.Units='normalized';
% lgd.Position=[0.2 0.85 0.05 0.05];
lgd.Orientation='vertical';           % 鏂瑰悜 榛樿 - 'vertical'
lgd.NumColumns=1;                      % 鍒楁暟 榛樿 - 1
lgd.Interpreter='latex';
lgd.FontSize=8;
lgd.FontName='Times';
lgd.TextColor=[0 0 0];                     % 鏂囨湰棰滆壊
lgd.Color=[1 1 1];                            % 鑳屾櫙鑹?
lgd.Box='on';
lgd.LineWidth=0.8;
lgd.ItemTokenSize=[20,12];

exportgraphics(fig,'Figure2.tiff','Resolution',300)

toc
