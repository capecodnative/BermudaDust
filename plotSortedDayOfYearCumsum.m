cmap=jet(256);
firstYear=2001;
lastYear=2024;

zmap=linspace(firstYear,lastYear,length(cmap));
figure('position',[207, 369,808,420]);
hLegend=nan(1,1);

for i=firstYear:lastYear
    tc=finalDustTableBATS.Year==i;
    %toPlotY=cumsum(finalDustTableBATS.DustSurfMedian(tc))./sum(finalDustTableBATS.DustSurfMedian(tc));
    %toPlotY=cumsum(finalDustTableBATS.DustSurfMedian(tc));
    toPlotY=dustDaysSortedNormCumSum(:,i-firstYear+1);
    tempLinewidth=1;
    tempColor=interp1(zmap,cmap,i);
    tempLineStyle='-';
    if i==2019
        tempLinewidth=2;
        tempColor='k';
    end
    hPlot=plot(1:size(toPlotY,1),toPlotY,'color',tempColor,'linestyle',tempLineStyle,'linewidth',tempLinewidth);
    if i==2019
        hLegend(1)=hPlot;
    end
    hold on;
end

xlim([1,366]);
xlabel('Rank-Sorted Days of Each Year (1 = Dustiest Day)');
%ylabel('% of Annual Cumulative Dust at Surface');
ylabel({'Cumulative Fraction of','Annual Dust at Surface'});
legend(hLegend,{'2019'},'Location','Northwest' );
colorbar;
colormap(jet);
clim([firstYear,lastYear])

hAx1=gca;
set(hAx1, 'Box', 'off');

xlim([0 100]);
xticks([0:10:90]);

hLine=hline(0.5);
hLine.LineWidth=2;
hLine.LineStyle='-';
vLine1=vline(64);
text(26,0.1,{'Day 26'});
text(64,0.1,{'Day 64'});
hLine.Color=[0.3,0.3,0.3];
box on;
vLine1.Color=[0.3,0.3,0.3];
vLine2=vline(26);
vLine2.Color=[0.3,0.3,0.3];
ylim([0 0.75]);
vLine2.LineWidth=1.75;
vLine1.LineWidth=1.75;

saveas(gcf,'./Figures/RankedDaysCumDust-LinearZoom.fig');
saveas(gcf,'./Figures/RankedDaysCumDust-LinearZoom.png');

clear hLine vLine1 vLine2
clear i tc tempSumDust toPlotY monthStarts tempLinewidth tempLineStyle tempColor hAx2 hAx1 zmap cmap hLegend hPlot