figure('Position',[207, 369, 895, 420]);
hObj=nan(4,1);
firstYear=2001;
lastYear=2024;
minYear=1980;

scatter(firstYear:lastYear,tempStats10152025((firstYear-minYear+1):(lastYear-minYear+1),1),'k','filled');
hold on;
hObj(4)=plot(firstYear:lastYear,tempStats10152025((firstYear-minYear+1):(lastYear-minYear+1),1),'k','linewidth',1.5);
scatter(firstYear:lastYear,tempStats10152025((firstYear-minYear+1):(lastYear-minYear+1),2),'b','filled');
hObj(3)=plot(firstYear:lastYear,tempStats10152025((firstYear-minYear+1):(lastYear-minYear+1),2),'b','linewidth',1.5);
scatter(firstYear:lastYear,tempStats10152025((firstYear-minYear+1):(lastYear-minYear+1),3),'r','filled');
hObj(2)=plot(firstYear:lastYear,tempStats10152025((firstYear-minYear+1):(lastYear-minYear+1),3),'r','linewidth',1.5);
scatter(firstYear:lastYear,tempStats10152025((firstYear-minYear+1):(lastYear-minYear+1),4),'g','filled');
hObj(1)=plot(firstYear:lastYear,tempStats10152025((firstYear-minYear+1):(lastYear-minYear+1),4),'g','linewidth',1.5);
ylabel({'Day of Year "n"-th','Percentile Crossed'});
xlim([firstYear lastYear]);
ylim('auto');
legend(hObj,{'25%','20%','15%','10%'})

saveas(gcf,'./Figures/BATS_NthPercentileDay_Allpct.fig')
saveas(gcf,'./Figures/BATS_NthPercentileDay_Allpct.png')
clear hObj