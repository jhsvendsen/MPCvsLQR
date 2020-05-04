%% Getting ggv for the trajectory optimisation

%% Download track data
Track_Data = readtable('1_Lap.xlsx');

%% Reading peak data
max_xg_10 = max(Track_Data.AccelXaxis_G_);
max_yg_10 = max(Track_Data.AccelYaxis_G_);
min_xg_10 = min(Track_Data.AccelXaxis_G_);
min_yg_10 = min(Track_Data.AccelYaxis_G_);


%% PLotting results
figure
plot (Track_Data.AccelXaxis_G_,Track_Data.AccelYaxis_G_,'r.');
figure
title 'gg plot'
plot (Track_Data.gps_speed_km_h_*0.278,Track_Data.AccelXaxis_G_,'r.');
title 'long g vs speed'
plot (Track_Data.gps_speed_km_h_*0.278,Track_Data.AccelYaxis_G_,'r.');
title 'lat g vs speed'
% close all
% 
% figure
% ggv = meshgrid(Track_Data.AccelXaxis_G_,Track_Data.AccelYaxis_G_,...
%     Track_Data.gps_speed_km_h_);
% mesh(ggv)
% 
% title 'ggv diagram'