%% Getting ggv for the trajectory optimisation
lap = readtable('1Lap.xlsx');

%% sorting data
acc_x_uf = lap.AccelXaxis_G_;
acc_y_uf = lap.AccelYaxis_G_;
acc_z = lap.AccelZaxis_G_;
Time = lap.xtime_S_;
Velocity = (lap.gps_speed_km_h_)*0.2778;

a = 0.7;
b = [1/6 1/6 1/6 1/6];

acc_x = filter(b,a,acc_x_uf);
acc_y = filter(b,a,acc_y_uf);

%% Plotting
figure
plot(acc_y)

figure
plot(acc_x)

figure
plot(acc_y,Velocity)
title 'y'

figure
plot(acc_x,Velocity)
title 'x'



