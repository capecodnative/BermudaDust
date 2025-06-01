hLeg=nan(3,1);
hFig=figure('position',[207, 369, 1426, 420]);
for i=firstYear:lastYear
    tc=finalDustTableBATS.Year==i;
    tempY=finalDustTableBATS.DustSurfMedian(tc);
    hLeg(1)=plot(finalDustTableBATS.Date(tc),tempY,'k','linewidth',1);
    hold on;
    scatter(finalDustTableBATS.Date(tc),tempY,5,'k');
    hLeg(2)=plot(finalDustTableBATS.Date(tc),movmean(tempY,[10 0]),'color','b','linewidth',1.5);
    tempX=datetime(i,1,1):caldays(1):datetime(i+1,1,1);
    hLeg(3)=plot(tempX(1:size(tempY,1)),dustSurfMedianDayOfYearBATS(1:size(tempY,1)),'color','r','linewidth',1);
    legend(hLeg,{sprintf('Median Daily Surface Dust %d',i),'10 Day Lagging Mean',sprintf('Multi-year Median (%d-%d)',firstYear,lastYear)});
    tempName=sprintf('./Figures/AnnualDust/AnnualDustAtSurf_BATS_WholeDomain_%4d.',i);
    xticks([datetime(i,1,1):calmonths(1):datetime(i+1,1,1)])
    title(sprintf('Daily Dust at Surface, Whole Domain, %4d',i));
    savefig(hFig,strcat(tempName,'fig'));
    saveas(hFig,strcat(tempName,'png'));
    clf;
end
close(hFig);

clear hFig hLeg i tc tempName tempX tempY
