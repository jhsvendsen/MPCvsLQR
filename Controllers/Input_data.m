
%% Reading input data

Brunthingthorpe_Opt_read = readtable('C:\Users\Johan PC\Desktop\Optimal Trajectory\ETH code\outputs\minimum_curvature.csv');

% time in seconds
Time = [0.1190:0.1190:25.0017]';
% lateral position in m
Lateral_pos = Brunthingthorpe_Opt_read.y_m;
% distance in meters
Distance =Brunthingthorpe_Opt_read.x_S_m;
% Curvature in radians pr. m
Curvature = Brunthingthorpe_Opt_read.kappa_radpm;
Curvature_int = Curvature(1,1);
% Long acc in m/s^2
Long_acc = Brunthingthorpe_Opt_read.ax_mps2;
% Velocity in m/s
Velocityi = Brunthingthorpe_Opt_read.vx_mps;

%% Calculated values
Lat_Acc = Velocityi.^2.*Curvature;

LatAcc_int = interp(Lat_Acc,6);

Latvel = cumtrapz(Time,(Velocityi.^2).*Curvature);

Yawrate = Lat_Acc./Velocityi;

Avg_Vel = mean(Velocityi);

Vy = Lat_Acc+Velocityi./Yawrate;

%% Reference values
l = size(Distance);

Total_Distance = max(Distance);

laptime = Total_Distance./Avg_Vel;

time_interval = laptime/l(1,1);

%% Initial values
Yawrate_ini = Yawrate(1,1);

Vy_ini = Vy(1,1);

Velocity_int_start = Velocityi(1,1);
Velocity_int = Velocity_int_start + cumtrapz(Time,Long_acc);

%% Interpelated data


%% Collected data
ref = [Lat_Acc,Yawrate,Velocityi];

ref_yalmip = [Lat_Acc, Yawrate];
