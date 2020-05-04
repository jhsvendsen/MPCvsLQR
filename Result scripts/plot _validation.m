%% Plotting validation
% splitting up
Yaw_ref = Validation(:,1);
Yaw = Validation(:,2);
Lat_ref = Validation(:,3);
Lat = Validation(:,4);
time = Validation(:,5);

% Plotting data
figure
subplot(2,1,1)
plot(time,Yaw_ref)
hold
plot(time,Yaw)
title 'Yawrate'
ylabel 'Yawrate rad/s'
xlabel 'Time s'
legend ('Ref','Model')
subplot(2,1,2)
plot(time,Lat_ref)
plot(time,Lat)
title 'Lateral g'
ylabel 'Lat acc. m/s'
xlabel 'Time s'
legend ('Ref','Model')

