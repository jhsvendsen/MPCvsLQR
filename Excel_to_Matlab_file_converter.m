%% Importing Excel data and converting it to a .m file

% Track name should be changed to correct place
BrunthingthorpeData = readtable('TrackData.xlsx');
save 'BrunthingthorpeData'

% Is the track closed? 1 if not 0
closedTrack = 1;
% Desired track witdh used in Optimization in python

% naming convention change
Time = BrunthingthorpeData.Time;
Velocity = BrunthingthorpeData.speedkmh;
LatAcc = BrunthingthorpeData.LatAccg;

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
BrunthingthorpeOpt = [Brunthingthorpe.X,Brunthingthorpe.Y];
csvwrite('BTOp.csv',BrunthingthorpeOpt)

