%% Different_speeds
% clear
% clc

n = 0;
for Vx = 5:5:25
%% Vehicle parameters
n = n+1;
    m = 245; % Mass of the car (kg)
    Iz = 111.8; % Moment of inertia around z axis (kgm^2)
    lf = 0.783; % CoG distance to front axle (m)
    lr = 0.752; % CoG distance to rear axle (m)
    Cf = 30989; % Cornering stiffnes front (N/rad)
    Cr = 50154; % Cornering stiffnes rear (N/rad)

%% State space

    A = [-(Cf+Cr)/(m*Vx) (-lf*Cf+lr*Cr)/(m*Vx)-Vx 0;
         (-lf*Cf+lr*Cr)/(Iz*Vx) -(lf^2*Cf+lr^2*Cr)/(Iz*Vx) 0;
         0 -1 0];
    B = [Cf/m, (Cf*lf)/Iz 0]';

    
%% Weights on the control
Q = [1 0 0;
     0 1 0;
     0 0 10000];
 
R = 20 ;

%% Gains
[K S E]= lqr(A,B,Q,R);

%%
K1(n) = K(1,1);
K2(n) = K(1,2);
K3(n) = K(1,3);

end
%% Simulate
% mdl = 'LQR_vel';
% open(mdl)
% sim(mdl)