Updated scripts and outputs derived from /capecodnative/HawaiiDust for the region around Bermuda, focusing on Jan 2001 to Dec 2024.
Included figure outputs from several scripts, adjusted to show the region around Bermuda and relevant MERRA-2 dust data.
Matlab .fig files and .png outputs are included in the /Figures directory and its subdirectories.
Main directory has all updated scripts used to generate the data.
Region si 
.xlsx and .csv files in the main directory include daily outputs for 2001 to 2024 for the region.
Additional data from the Variable Descriptions file are below.

Variable name,Description,Units or format,Original MERRA2 Variable (if applicable)
Year,Year,Four digit number (YYYY),
Month,Month,Two digit number (DD),
Day,Day,Two digit number (DD),
Date,Date,Date format: DD-MMM-YYYY,
DayOfYear,Calendar day of year (1 through 366),Number 1 through 366,
DustSurfMedian,"Dust total, concentration in the atmosphere surface boundary layer, whole domain grand median",kg m-3,DUSMASS
DustSurf25Median,"Dust < 2.5 microns, concentration in the atmosphere surface boundary layer, whole domain grand median",kg m-3,DUSMASS25
DustMassMedian,"Dust total, mass per unit area in whole atmosphere column, whole domain grand median",kg m-2,DUCMASS
DustMass25Median,"Dust < 2.5 microns, mass per unit area in whole atmosphere column, whole domain grand median",kg m-2,DUCMASS25
BCMassMedian,"Black carbon, mass per unit area in whole atmosphere column, whole domain grand median",kg m-2,BCCMASS
BCSurfMedian,"Black carbon, concentration in the atmosphere surface boundary layer, whole domain grand median",kg m-3,BCSMASS
SO2MassMedian,"Sulfur dioxide, mass per unit area in whole atmosphere column, whole domain grand median",kg m-2,SO2CMASS
SO2SurfMedian,"Sulfur dioxide, concentration in the atmosphere surface boundary layer, whole domain grand median",kg m-3,SO2SMASS
SO4MassMedian,"Sulfate, mass per unit area in whole atmosphere column, whole domain grand median",kg m-2,SO4CMASS
SO4SurfMedian,"Sulfate, concentration in the atmosphere surface boundary layer, whole domain grand median",kg m-3,SO4SMASS
OCMassMedian,"Organic carbon, mass per unit area in whole atmosphere column, whole domain grand median",kg m-2,OCCMASS
OCSurfMedian,"Organic carbon, concentration in the atmosphere surface boundary layer, whole domain grand median",kg m-3,OCSMASS
DayRankInYear,Rank of each day in the calendar year in regards to dustiness (1 = dustiest day of year; 365 or 366 is least dusty),Number 1 through 366,

#Descriptive text follows:
#Data are from 2001 to 2024 (years that look ""good"" in the Atlantic; before 2001 many dust variables are generally too low b/c of older satellites and satellite algorithms. 
#The domain used is centered at Tudor Hill plus or minus 3 deg of Latitude and 3.125 deg of Lontitude. (I.e. from 29.5 to 35.5 deg N and -68.125 to -61.875 deg E). 
#The grid is 13 points in the N/S (spaced 0.5 deg) and 11 points in the W/E direction (spaced 0.625 deg).
#One can use a smaller grid but the noise gets larger and larger, and the possibility that local dust and anthropogenic signals from ships etc. begin to dominate over regional trends."
