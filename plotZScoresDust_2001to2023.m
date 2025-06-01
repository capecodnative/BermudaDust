figure('position',[207, 369, 1326, 493]);
hScat=scatter(finalDustTableBATS.Date,BATSDustSurfMedianDayNormedZscore,15);
hline([-2,2],'b');
hline([-1,1],'r');
hline(0,'k');
hold on;
hDust30=plot(finalDustTableBATS.Date,movmean(BATSDustSurfMedianDayNormedZscore,[15,15]),'k','linewidth',1.5);
h2Year=plot(finalDustTableBATS.Date,movmean(BATSDustSurfMedianDayNormedZscore,[365,365]),'r','linewidth',2.5);

ylabel({'Daily Z-score of Median-centered','Dust at Surface'});

xticks([datetime(2001,1,1):calmonths(12):datetime(2025,1,1)]);
xlim([datetime(2001,1,1) datetime(2025,1,1)]);
xtickformat('MMM yyyy');
ylim([-3 3]);
legend([hScat,hDust30,h2Year],{'Daily Data','30-day moving mean','2-year moving mean'});

saveas(gcf,'./Figures/ZscoresDust_2001to2024_Zoom.fig');
saveas(gcf,'./Figures/ZscoresDust_2001to2024_Zoom.png');

clear h2Year hDust30 hScat