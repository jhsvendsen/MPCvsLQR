%% Plotting validation
% splitting up
Lat = Validation(:,1);
Yaw = Validation(:,2);
Yaw_ref = Validation(:,3);
Lat_ref = Validation(:,4);
Yaw_bic = Validation(:,5);
Lat_bic = Validation(:,6);
time = Validation(:,7);

% Plotting data
figure
subplot(2,1,1)
plot(time,Yaw_ref)
hold
plot(time,Yaw)
plot(time,Yaw_bic)
title 'Yawrate'
ylabel 'Yawrate rad/s'
xlabel 'Time s'
legend ('Ref','NL model','Bicycle')
subplot(2,1,2)
plot(time,Lat_ref)
hold
plot(time,Lat)
plot(time,Lat_bic)
title 'Lateral g'
ylabel 'Lat acc. m/s'
xlabel 'Time s'
legend ('Ref','NL model','Bicycle')

