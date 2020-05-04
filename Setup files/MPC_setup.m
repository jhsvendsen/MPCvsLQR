
% %Yalmip add to path
% addpath(genpath('C:\Users\Johan PC\Desktop\YalmipMPC'));

% TrackTrace = readtable('racetraj_cl.csv');
% %% write csv
% writetable(TrackTrace,'TrackTrace2.csv')

tau = 0.1;
Ts = 0.1;

%% System
% Choose which vehicle representation 1 = FS 0 = Fullcar
Car = 1;

if Car == 0
    m = 1575;
    Iz = 2875;
    lf = 1.2;
    lr = 1.6;
    Cf = 19000;
    Cr = 33000;
else
    m = 245; % Mass of the car (kg)
    Iz = 111.8; % Moment of inertia around z axis (kgm^2)
    lf = 0.783; % CoG distance to front axle (m)
    lr = 0.752; % CoG distance to rear axle (m)
    Cf = 30989; % Cornering stiffnes front (N/rad)
    Cr = 50154; % Cornering stiffnes rear (N/rad)
end
    
Vx = 15; % Assumed constant speed (m/s)

%% Statespace 1
ss_model = 0;
if ss_model == 1
    
    As = [...
        -(2*Cf+2*Cr)/m/Vx, -Vx-(2*Cf*lf-2*Cr*lr)/m/Vx;...
        -(2*Cf*lf-2*Cr*lr)/Iz/Vx, -(2*Cf*lf^2+2*Cr*lr^2)/Iz/Vx];
    Bs = [2*Cf/m, 2*Cf*lf/Iz]';
    Cs = eye(2);
    
else
    A = [...
        -(2*Cf+2*Cr)/m/Vx, 0, -Vx-(2*Cf*lf-2*Cr*lr)/m/Vx, 0;...
        0, 0, 1, 0;
        -(2*Cf*lf-2*Cr*lr)/Iz/Vx, 0, -(2*Cf*lf^2+2*Cr*lr^2)/Iz/Vx,0;
        1, Vx, 0, 0];

    B = [2*Cf/m 0 2*Cf*lf/Iz 0]';

    C = [0 0 0 1; 0 1 0 0];

    D = [0;0];

end 