%% Reading input data

Brunthingthorpe_Opt_read = readtable('minimum_curvature.csv');

% time in seconds
Time = [0.1190:0.1190:25.0017]';

% lateral position in m
Lateral_pos = Brunthingthorpe_Opt_read.y_m;

% distance in meters
Distance =Brunthingthorpe_Opt_read.x_S_m;

% Curvature in radians pr. m
Curvature = Brunthingthorpe_Opt_read.kappa_radpm;
Curvature_int = Curvature(1,1);

Long_acc = Brunthingthorpe_Opt_read.ax_mps2;

Velocity = Brunthingthorpe_Opt_read.vx_mps;
Velocityi = Velocity;
% Velocityi = interp(Velocity,2);

Velocity_int_start = Velocity(1,1);
Velocity_int = Velocity_int_start + cumtrapz(Time,Long_acc);
Vx = 15;

%% lateral acc
Lat_Accui = Velocity.^2.*Curvature;

% Lat_Acc = interp(Lat_Accui,2);
Lat_Acc = Lat_Accui;

ay = Velocity.^2./Curvature;

Lat_Acc_cvx = Vx.*Curvature;

LatAcc_int = interp(Lat_Acc,6);

%% Rest of values

Yawrateui = Lat_Accui./Velocity;
% Yawrate = interp(Yawrateui,2);
Yawrate = Yawrateui;

Yawrate_cvx = Lat_Acc./Vx;

Avg_Vel = mean(Velocity);

% Total_Distance = max(Distance);

% laptime = Total_Distance./Avg_Vel;

% ref_time = [Time,LatAcc,Yawrate];

ref = [Lat_Acc,Yawrate,Velocityi];

ref_yalmip = [Lat_Acc, Yawrate];

zero = zeros(210,1);
