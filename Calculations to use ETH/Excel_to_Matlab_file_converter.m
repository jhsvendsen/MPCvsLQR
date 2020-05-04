%% Importing Excel data and converting it to a .m file
% clear
% clc

% Track name should be changed to correct place
BrunthingthorpeData = readtable('TrackData.xlsx');
save 'BrunthingthorpeData'

% Is the track closed? 1 if not 0
closedTrack = 1;
% Desired track witdh used in Optimization in python

% naming convention change
Time = BrunthingthorpeData.Time;
VelocityUF = BrunthingthorpeData.speedkmh;
LatAccUF = BrunthingthorpeData.LatAccg;


%% Filter Data
% Create the filter coefficient vectors.
a = 0.7;
b = [1/6 1/6 1/6 1/6];

LatAcc = filter(b,a,LatAccUF);

% t = 1:length(LatAccUF);
% figure
% plot(t,LatAccUF,'--',t,LatAcc,'-')
% legend('Original Data','Filtered Data')

av = 1;
bv = [1/4 1/4 1/4 1/4];
Velocity = filter(bv,av,VelocityUF);

% t = 1:length(LatAccUF);
% figure
% plot(t,VelocityUF,'--',t,Velocity,'-')
% legend('Original Data','Filtered Data')

%% Computing Lateral velocity using cumtrapz
lat_vel = cumtrapz(Time,LatAccUF);


%% Create the trackdata file neccesary
Brunthingthorpe = createTrackData(Time,LatAcc,Velocity,closedTrack);
save 'Brunthingthorpe'

%% Output files
% Track map
figure 
plot(Brunthingthorpe.X,Brunthingthorpe.Y)
title 'Trackmap'
% Curvature
figure
plot(Time,Brunthingthorpe.curvature)
title 'Curvature'

%% File for optimal trajectory
% Trackwitdh from centerline
t_witdh = 3; % in meters

% Amount of row needed
[rows_needed,coulums_needed]=size(Brunthingthorpe.X);
% Couloums for optimal
l_witdh = repmat(t_witdh,rows_needed,coulums_needed);
r_witdh = repmat(t_witdh,rows_needed,coulums_needed);

BrunthingthorpeOpt = [Brunthingthorpe.X,Brunthingthorpe.Y,l_witdh,r_witdh];
csvwrite('Brungthingthorpe.csv',BrunthingthorpeOpt)
