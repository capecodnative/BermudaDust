firstYear=2001;
lastYear=2024;
minYear=1980;

fprintf('\nCalculating day-of-year medians.\n');

dustSurfMedianDayOfYearBATS=nan(366,1);
%dustSurfMedianDayOfYearBATS_ALOHA=nan(366,1);
bcSurfMedianDayOfYearBATS=nan(366,1);
so2SurfMedianDayOfYearBATS=nan(366,1);
so4SurfMedianDayOfYearBATS=nan(366,1);
ocSurfMedianDayOfYearBATS=nan(366,1);

for i=1:366
    tc=finalDustTableBATS.DayOfYear==i & finalDustTableBATS.Year>=firstYear & finalDustTableBATS.Year<=lastYear;
    dustSurfMedianDayOfYearBATS(i)=median(finalDustTableBATS.DustSurfMedian(tc),'omitnan');
    %dustSurfMedianDayOfYearBATS_ALOHA(i)=median(finalDustTable.DustSurfMedian_ALOHA(tc),'omitnan');
    bcSurfMedianDayOfYearBATS(i)=median(finalDustTableBATS.BCSurfMedian(tc),'omitnan');
    so2SurfMedianDayOfYearBATS(i)=median(finalDustTableBATS.SO2SurfMedian(tc),'omitnan');
    so4SurfMedianDayOfYearBATS(i)=median(finalDustTableBATS.SO4SurfMedian(tc),'omitnan');
    ocSurfMedianDayOfYearBATS(i)=median(finalDustTableBATS.OCSurfMedian(tc),'omitnan');
end


dustSurfLogSTDDayOfYearBATS=nan(366,1);for i=1:366;tc=finalDustTableBATS.DayOfYear==i & finalDustTableBATS.Year>=firstYear & finalDustTableBATS.Year<=lastYear;dustSurfLogSTDDayOfYearBATS(i)=std(log10(finalDustTableBATS.DustSurfMedian(tc)),'omitmissing');end;
dustSurfRSDDayOfYearBATS=nan(366,1);for i=1:366;tc=finalDustTableBATS.DayOfYear==i & finalDustTableBATS.Year>=firstYear & finalDustTableBATS.Year<=lastYear;dustSurfRSDDayOfYearBATS(i)=std(finalDustTableBATS.DustSurfMedian(tc),'omitmissing')/median(finalDustTableBATS.DustSurfMedian(tc),'omitmissing');end;

sumSpringDust=nan(lastYear-firstYear-1,1);for i=firstYear:lastYear;tc=finalDustTableBATS.Year==i & finalDustTableBATS.Month>=2 & finalDustTableBATS.Month<=7;sumSpringDust(i-1979)=sum(finalDustTableBATS.DustSurfMedian(tc));end;
sumFallDust=nan(lastYear-firstYear-1,1);for i=firstYear:lastYear;tc=finalDustTableBATS.Year==i & (finalDustTableBATS.Month>=8 | finalDustTableBATS.Month<=1);sumFallDust(i-1979)=sum(finalDustTableBATS.DustSurfMedian(tc));end;

%make some dust mean and normalized variables
windowSize=5;
dustSurfMedianDayOfYearBATS10=[dustSurfMedianDayOfYearBATS(end-windowSize+1:end)', dustSurfMedianDayOfYearBATS', dustSurfMedianDayOfYearBATS(1:windowSize)']';
dustSurfMedianDayOfYearBATS10=movmean(dustSurfMedianDayOfYearBATS10,[windowSize,windowSize]);
dustSurfMedianDayOfYearBATS10=dustSurfMedianDayOfYearBATS10(windowSize+1:end-windowSize);

finalDustTableBATS.DayRankInYear=nan(size(finalDustTableBATS,1),1);
for i=firstYear:lastYear;tc=finalDustTableBATS.Year==i;[~,finalDustTableBATS.DayRankInYear(tc)]=sort(finalDustTableBATS.DustSurfMedian(tc),'Descend');end;
BATSDustSurfMedianDayNormed=finalDustTableBATS.DustSurfMedian;
for i=1:366;tc=finalDustTableBATS.DayOfYear==i;BATSDustSurfMedianDayNormed(tc)=BATSDustSurfMedianDayNormed(tc)-dustSurfMedianDayOfYearBATS10(i);end;
BATSDustSurfMedianDayNormedZscore=zscore(BATSDustSurfMedianDayNormed);
%corrMonthlyDust=nan(12*(lastYear-firstYear+1),1);
%for i=firstYear:lastYear;for j=1:12;tc=(finalDustTableBATS.Year==i & finalDustTableBATS.Month==j);corrMonthlyDust((i-firstYear)*12+j,1)=mean(BATSDustSurfMedianDayNormed(tc));end;end;
%corrMonthlyDustZ=nan(12*(lastYear-firstYear+1),1);
%for i=firstYear:lastYear;for j=1:12;tc=(j:12:528);corrMonthlyDustZ(tc)=zscore(corrMonthlyDust(tc));end;end;

%make some precipitation mean and normalized variables
%windowSize=15;
%precipSurfMeanDayOfYearALOHA30=[precipSurfMeanDayOfYearALOHA(end-windowSize+1:end)', precipSurfMeanDayOfYearALOHA', precipSurfMeanDayOfYearALOHA(1:windowSize)']';
%precipSurfMeanDayOfYearALOHA30=movmean(precipSurfMeanDayOfYearALOHA30,[windowSize,windowSize]);
%precipSurfMeanDayOfYearALOHA30=precipSurfMeanDayOfYearALOHA30(windowSize+1:end-windowSize);

%finalPrecipTableBATS.DayRankInYear=nan(size(finalPrecipTableBATS,1),1);
%for i=firstYear:lastYear;tc=finalPrecipTableBATS.Year==i;[~,finalPrecipTableBATS.DayRankInYear(tc)]=sort(finalPrecipTableBATS.PrecipMeanALOHA(tc),'Descend');end;
%ALOHAPrecipMeanDayNormed=finalPrecipTableBATS.PrecipMeanALOHA;
%for i=1:366;tc=finalPrecipTableBATS.DayOfYear==i;ALOHAPrecipMeanDayNormed(tc)=ALOHAPrecipMeanDayNormed(tc)-precipSurfMeanDayOfYearALOHA30(i);end;
%ALOHAPrecipMeanDayNormedZScore=zscore(ALOHAPrecipMeanDayNormed);
%corrMonthlyPrecip=nan(12*(lastYear-firstYear+1),1);
%for i=firstYear:lastYear;for j=1:12;tc=(finalPrecipTableBATS.Year==i & finalDustTableBATS.Month==j);corrMonthlyPrecip((i-firstYear)*12+j,1)=mean(ALOHAPrecipMeanDayNormed(tc));end;end;
%corrMonthlyPrecipZ=nan(12*(lastYear-firstYear+1),1);
%for i=firstYear:lastYear;for j=1:12;tc=(j:12:528);corrMonthlyPrecipZ(tc)=zscore(corrMonthlyPrecip(tc));end;end;

dustDaysRaw=nan(366,lastYear-firstYear);for i=firstYear:lastYear;tc=finalDustTableBATS.Year==i;dustDaysRaw(1:sum(tc),i-firstYear+1)=finalDustTableBATS.DustSurfMedian(tc);end;
dustDaysSorted=nan(366,lastYear-firstYear);for i=firstYear:lastYear;tc=finalDustTableBATS.Year==i;[dustDaysSorted(1:sum(tc),i-firstYear+1),finalDustTableBATS.DayRankInYear(tc)]=sort(finalDustTableBATS.DustSurfMedian(tc),'Descend');end;
dustDaysSortedNorm=dustDaysSorted./sum(dustDaysSorted,1,'omitnan');
dustDaysSortedNormCumSum=cumsum(dustDaysSortedNorm,1,'omitnan');

%make tempStats10152025 (thresholding tests for cumulative dust)
tempStats10152025=nan(lastYear-firstYear,4);
tempPositions=[0.1, 0.15, 0.2, 0.25];
for i=firstYear:lastYear;tc=finalDustTableBATS.Year==i;toPlotY=cumsum(finalDustTableBATS.DustSurfMedian(tc))./sum(finalDustTableBATS.DustSurfMedian(tc));for j=1:4;[~,tempStats10152025(i-1979,j)]=min(abs(toPlotY-tempPositions(j)));end;end;

%make variables for correlation analysis of dust pdo and precip
%numel=size(finalDustTableBATS,1);
%corrDailyPDO=nan(numel,1);for i=1:numel;corrDailyPDO(i)=PDOsubset(finalDustTableBATS.Year(i)-1979,finalDustTableBATS.Month(i));end;
%corrDailyNino=nan(numel,1);for i=1:numel;corrDailyNino(i)=Nino4subset(finalDustTableBATS.Year(i)-1979,finalDustTableBATS.Month(i));end;
%corrDailyDust30=movmean(BATSDustSurfMedianDayNormed,[15,15]);
%corrDailyDust30Z=movmean(BATSDustSurfMedianDayNormedZscore,[15,15]);
%corrDailyPrecip30=movmean(ALOHAPrecipMeanDayNormed,[15,15]);
%corrDailyPrecip30Z=movmean(ALOHAPrecipMeanDayNormedZScore,[15,15]);
%corrDailyMonthNoVolc=finalDustTableBATS.Month;
%corrDailyMonthNoVolc(ismember(finalDustTableBATS.Year,[1992,1993,1982,1983]))=NaN;

clear extendedData i j toPlotY tc tempPositions numel windowSize