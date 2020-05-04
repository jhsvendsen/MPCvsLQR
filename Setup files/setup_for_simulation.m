clear
clc
% %Yalmip add to path
% addpath(genpath('C:\Users\Johan PC\Desktop\YalmipMPC'));

% TrackTrace = readtable('racetraj_cl.csv');
% %% write csv
% writetable(TrackTrace,'TrackTrace2.csv')

tau = 0.1;
Ts = 0.1;

%% System
% Choose which vehicle representation 1 = FS 0 = Fullcar
Car = 0;

if Car == 0
    m = 1575;
    Iz = 2875;
    lf = 1.2;
    lr = 1.6;
    Cf = 19000;
    Cr = 33000;
else
    m = 180; % Mass of the car (kg)
    Iz = 116; % Moment of inertia around z axis (kgm^2)
    lf = 0.79; % CoG distance to front axle (m)
    lr = 0.753; % CoG distance to rear axle (m)
    Cf = 31002.7; % Cornering stiffnes front (N/rad)
    Cr = 49745.9; % Cornering stiffnes rear (N/rad)
end
    
Vx = 15; % Assumed constant speed (m/s)

%% Statespace 1
ss_model = 1;
if ss_model == 1
    
    A = [-(2*Cf+2*Cr)/m/Vx, 0, -Vx-(2*Cf*lf-2*Cr*lr)/m/Vx, 0;...
    0, 0, 1, 0;...
    -(2*Cf*lr-2*Cr*lr)/Iz/Vx, 0, -(2*Cf*lf^2+2*Cr*lr^2)/Iz/Vx,0;...
    1, Vx, 0, 0];
    B = [2*Cf/m 0 2*Cf*lf/Iz 0]';
    C = [0 0 0 1; 0 1 0 0];
    D = [0;0];
    
else
    As = -[(Cf+Cr)/m/Vx Vx+((lf*Cf-lr*Cr)/m/Vx);...
        (lf*Cf-lr*Cr)/Iz/Vx (lf^2*Cf+lr^2*Cr)/Iz/Vx];
    Bs = [Cf/m, (Cf*lf)/Iz]';
    Cs = [(Cf+Cr)/m/Vx (lf*Cf-lr*Cr)/m/Vx;...
        0 -1];
    Ds = [Cf/m 0]';
    
end 

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
Velocity_int_start = Velocity(1,1);
Velocity_int = Velocity_int_start + cumtrapz(Time,Long_acc);


%% lateral acc
Lat_Acc = (Velocity.^2).*Curvature;

LatAcc = interp(Lat_Acc,6);

length = ones(210,1);

Latvel = cumtrapz(Time,(Velocity.^2).*Curvature);

%% Rest of values

Yaw_rate = Lat_Acc./Velocity;

Yawrate = interp(Yaw_rate,6);

Avg_Vel = mean(Velocity);

Total_Distance = max(Distance);

laptime = Total_Distance./Avg_Vel;

% ref_time = [Time,LatAcc,Yawrate];

% ref = [LatAcc,Yawrate,Velocity];

ref_yalmip = [LatAcc,Yawrate];

zero = zeros(210,1);

%% Set initial values
x0 = [0,0]';

%% Opening Simulink model
% Open simulink model
% mdl = 'EmbeddedMPC2';
% open_system(mdl)
% sim(mdl)