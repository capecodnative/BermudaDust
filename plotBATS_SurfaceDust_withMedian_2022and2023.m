figure('position',[207, 369, 948, 420]);
tempColors={'b','r'};

cruiseDates=NaT(1,1);
cruiseDates(1)=datetime(2019,03,11);
cruiseDates(end+1)=datetime(2019,05,13);
cruiseDates(end+1)=datetime(2019,08,18);
cruiseDates(end+1)=datetime(2019,11,17);
firstYear=2019;
lastYear=2019;

hLines=[];
for i=firstYear:lastYear
    tc=finalDustTableBATS.Year==i;
    scatter(finalDustTableBATS.DayOfYear(tc),log10(finalDustTableBATS.DustSurfMedian(tc)),10,tempColors{i-firstYear+1});
    hold on;
    hLines(end+1)=plot(finalDustTableBATS.DayOfYear(tc),log10(finalDustTableBATS.DustSurfMedian(tc)),...
        'linewidth',1,'color',tempColors{i-firstYear+1});
end
for i=1:numel(cruiseDates)
    tc=finalDustTableBATS.Year==cruiseDates(i).Year & finalDustTableBATS.Month==cruiseDates(i).Month & finalDustTableBATS.Day==cruiseDates(i).Day;
    hScat=scatter(finalDustTableBATS.DayOfYear(tc),log10(finalDustTableBATS.DustSurfMedian(tc)),80,...
        tempColors{finalDustTableBATS.Year(tc)-firstYear+1},'filled','markeredgecolor','k','linewidth',2);
    if i==1
        hLines(end+1)=hScat;
    end        
end
hLines(end+1)=plot([1:366],log10(dustSurfMedianDayOfYearBATS10),'k-','linewidth',2);

xlim([0 367]);
xlabel('Day of Year');
ylabel({'log_{10} Daily Dust at Surface (kg/m^3)'});

legend(hLines,{'2019','BATS Cruises','Multiyear Median (±5d-smoothed), All Yrs'});
hAx1=gca;
set(hAx1, 'Box', 'off','position',[0.1300, 0.1257, 0.7750, 0.7576]);

monthStarts = [1, 32, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335];
hAx2=axes('Position',hAx1.Position,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
set(hAx2, 'XLim', [1, 366], 'XTick', monthStarts, 'XTickLabelRotation',45,'XTickLabel', ...
    {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'});
set(hAx2, 'YTick', []);
uistack(hAx1,'top');
set(hAx1,'color','none');
grid on;

saveas(gcf,'./Figures/BATS_DustSurf_WholeDomain_2019.fig');
saveas(gcf,'./Figures/BATS_DustSurf_WholeDomain_2019.png');

clear hAx1 hAx2 hLines i monthStarts tc tempColors cruiseDates hScat