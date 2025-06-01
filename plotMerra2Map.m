% Assuming fLat and fLon are the latitudes and longitudes of the MERRA-2 product grid
% Example grid (for demonstration, replace these with actual MERRA-2 grid variables)
fLat=DustLatBATS;
fLon=DustLonBATS;

figure;

% Define the region of interest for Hawaii and the surrounding ocean
latLimits = [min(fLat)-.5/2, max(fLat)+.5/2]; % Latitude limits from 15ºN to 28ºN
lonLimits = [min(fLon)-.625/2, max(fLon)+.625/2]; % Longitude limits from 165ºW to 150ºW (note the sign for west)

% Latitude and Longitude for Ocean Station ALOHA
tudor_lat = 32.2646;
tudor_lon = -64.8791;
BATSlat=31.66666;
BATSlon=-64.16666;

% Generate a map of the specified region
worldmap(latLimits, lonLimits);
geoshow('landareas.shp', 'FaceColor', [0.5 0.7 0.5]); % Show land areas

% Overlay the MERRA-2 grid on the map
% Convert grid points to a meshgrid for plotting
[lonMesh, latMesh] = meshgrid(fLon, fLat);

% Plot the grid
tempGrid = plotm(latMesh, lonMesh, 'r.');

%tLat = [fLat(1)-0.25 fLat(end)+0.25];
%tLon = [fLon(1)-.625/2 fLon(end)+.625/2];
%latCorners = [tLat(1), tLat(1), tLat(2), tLat(2), tLat(1)];
%lonCorners = [tLon(1), tLon(2), tLon(2), tLon(1), tLon(1)];

%geoshow(latCorners, lonCorners, 'DisplayType', 'line', 'Color', 'b', 'LineWidth', 2);
hold on;

% Plotting Tudor Hill with a star marker
hTudor=plotm(tudor_lat, tudor_lon, 'p', 'MarkerSize', 10, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');

% Adding a blue circle to represent the 8-mile radius at BATS
tempCircle = scircle1(BATSlat, BATSlon, 8, [], wgs84Ellipsoid("mile"));
hBATS=plotm(tempCircle(:,1), tempCircle(:,2), 'b');


title({'Study Region with MERRA-2 Grid Overlay,';'Bermuda, and Surrounding N. Atlantic Ocean'});
uistack(tempGrid,'top');
legend([hTudor,hBATS],{'Tudor Hill','BATS Region'});
set(get(gca,'Title'),'fontsize',20)
set(findobj('type','line'),'linewidth',1.5)
set(findobj('type','text'),'fontsize',15)
saveas(gcf,'./Figures/Figure1_map.fig');
saveas(gcf,'./Figures/Figure1_map.png');

clear tudor_lon tudor_lat fLat fLon latCorners latLimits lonCorners lonLimits lonMesh latMesh tempCircle tempGrid tLat tLon hBATS hTudor hMarker BATSlon BATSlon ans
