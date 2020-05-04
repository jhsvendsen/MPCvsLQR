%% Different_speeds
clear
clc

addpath('E:\Finished For Dissertation\Controllers\LQR\Gain-Scheduled LQR\LQR_Gain_2017')

n = 0;
for Vx = 5:5:25
%% Vehicle parameters
n = n+1;
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
%% State space

    A = [-(2*Cf+2*Cr)/(m*Vx) (-lf*2*Cf+lr*2*Cr)/(m*Vx)-Vx 0;
         (-lf*2*Cf+lr*2*Cr)/(Iz*Vx) -(lf^2*2*Cf+lr^2*2*Cr)/(Iz*Vx) 0;
         0 -1 0];
    B = [Cf/m, (2*Cf*lf)/Iz 0]';

    
%% Weights on the control
Q = [5 0 0;
     0 5 0;
     0 0 700];
 
R = 0.1;

%% Gains
[K S E]= lqr(A,B,Q,R);

%%
K1(n) = K(1,1);
K2(n) = K(1,2);
K3(n) = K(1,3);

end
%% Simulate
mdl = 'LQR_Gain_Scheduled';
open(mdl)
sim(mdl)