firstYear=1980;
lastYear=2024;

tempPDO=readmatrix("ClimateIndicators/ersst.v5.pdo.dat.txt","NumHeaderLines",2);
tc=tempPDO(:,1)>=firstYear & tempPDO(:,1)<=lastYear;
PDOsubset=tempPDO(tc,2:end);
PDOall=tempPDO(:,2:end);
PDOall=reshape(PDOall',[],1);
PDOall(PDOall>99)=[];
corrMonthlyPDO=reshape(PDOsubset',[],1);

tempNino=readmatrix("ClimateIndicators/nino4.long.anom.data.txt","NumHeaderLines",1);
tc=tempNino(:,1)>=firstYear & tempNino(:,1)<=lastYear;
Nino4subset=tempNino(tc,2:end);
NinoAll=tempNino(:,2:end);
NinoAll=reshape(NinoAll',[],1);
NinoAll(NinoAll<-99)=[];
NinoAll(isnan(NinoAll))=[];
corrMonthlyNino=reshape(Nino4subset',[],1);

tempNAO=readmatrix("ClimateIndicators/nao.long.data.txt","NumHeaderLines",1);
tc=tempNAO(:,1)>=firstYear & tempNAO(:,1)<=lastYear;
NAOsubset=tempNAO(tc,2:end);
NAOAll=tempNAO(:,2:end);
NAOAll=reshape(NAOAll',[],1);
NAOAll(NAOAll<-99)=[];
NAOAll(isnan(NAOAll))=[];
corrMonthlyNAO=reshape(NAOsubset',[],1);

clear tc tempPDO tempNino tempNAO firstYear lastYear
