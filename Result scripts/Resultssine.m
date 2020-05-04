%% Evaluating controllers
% importing data
close all

% plotting LQR results
figure
title 'LQR'
subplot(2,1,1)
plot(sine20mslqr3(:,3),sine5mslqr(:,1))
hold
plot(sine20mslqr3(:,3),sine10mslqr1(:,1))
plot(sine20mslqr3(:,3),sine15mslqr2(:,1))
plot(sine20mslqr3(:,3),sine20mslqr3(:,1))
plot(sine20mslqr3(:,3),sine20mslqr3(:,4))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('5','10','15','20','Ref')

subplot(2,1,2)
plot(sine20mslqr3(:,3),sine5mslqr(:,2))
hold
plot(sine20mslqr3(:,3),sine10mslqr1(:,2))
plot(sine20mslqr3(:,3),sine15mslqr2(:,2))
plot(sine20mslqr3(:,3),sine20mslqr3(:,2))
legend ('5','10','15','20')
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'

% Plotting MPC
% Yawrate
figure
title 'MPC'
subplot(2,1,1)
plot(mpcsine20ms(:,4),mpcsine5ms(:,2))
hold
plot(mpcsine20ms(:,4),mpcsine10ms(:,2))
plot(mpcsine20ms(:,4),mpcsine15ms(:,2))
plot(mpcsine20ms(:,4),mpcsine20ms(:,2))
plot(mpcsine20ms(:,4),mpcsine20ms(:,5))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('5','10','15','20','Ref')

subplot(2,1,2)
plot(mpcsine20ms(:,4),mpcsine5ms(:,1))
hold
plot(mpcsine20ms(:,4),mpcsine10ms(:,1))
plot(mpcsine20ms(:,4),mpcsine15ms(:,1))
plot(mpcsine20ms(:,4),mpcsine20ms(:,1))
legend ('5','10','15','20')
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'


% GS LQR
% Plotting MPC
% Yawrate
figure
title 'GS LQR'
subplot(2,1,1)
plot(sine20msgslqr3(:,3),sine5msgslqr(:,1))
hold
plot(sine20msgslqr3(:,3),sine10msgslqr1(:,1))
plot(sine20msgslqr3(:,3),sine15msgslqr2(:,1))
plot(sine20msgslqr3(:,3),sine20msgslqr3(:,1))
plot(sine20msgslqr3(:,3),sine20msgslqr3(:,4))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('5','10','15','20','Ref')

subplot(2,1,2)
plot(sine20msgslqr3(:,3),sine5msgslqr(:,2))
hold
plot(sine20msgslqr3(:,3),sine10msgslqr1(:,2))
plot(sine20msgslqr3(:,3),sine15msgslqr2(:,2))
plot(sine20msgslqr3(:,3),sine20msgslqr3(:,2))
legend ('5','10','15','20')
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'


%% Comparrison
% 5 ms
figure
subplot(2,2,1)
plot(sine20mslqr3(:,3),sine5mslqr(:,1))
hold
plot(sine20msgslqr3(:,3),sine5msgslqr(:,1))
plot(mpcsine20ms(:,4),mpcsine5ms(:,2))
plot(sine20msgslqr3(:,3),sine20msgslqr3(:,4))
title 'Comparrison 5 ms'
legend ('Lqr','Lqrgs','MPC','Ref')
xlabel 'Time s'
ylabel 'Yaw rate rad/s'

% 10 ms
subplot(2,2,2)
plot(sine20mslqr3(:,3),sine10mslqr1(:,1))
hold
plot(sine20msgslqr3(:,3),sine10msgslqr1(:,1))
plot(mpcsine20ms(:,4),mpcsine10ms(:,2))
plot(sine20msgslqr3(:,3),sine20msgslqr3(:,4))
title 'Comparrison 10 ms'
legend ('Lqr','Lqrgs','MPC','Ref')
xlabel 'Time s'
ylabel 'Yaw rate rad/s'

% 15 ms
subplot(2,2,3)
plot(sine20mslqr3(:,3),sine15mslqr2(:,1))
hold
plot(sine20msgslqr3(:,3),sine15msgslqr2(:,1))
plot(mpcsine20ms(:,4),mpcsine15ms(:,2))
plot(sine20msgslqr3(:,3),sine20msgslqr3(:,4))
title 'Comparrison 15 ms'
legend ('Lqr','Lqrgs','MPC','Ref')
xlabel 'Time s'
ylabel 'Yaw rate rad/s'

% 20 ms
subplot(2,2,4)
plot(sine20mslqr3(:,3),sine10mslqr1(:,1))
hold
plot(sine20msgslqr3(:,3),sine10msgslqr1(:,1))
plot(mpcsine20ms(:,4),mpcsine20ms(:,2))
plot(sine20msgslqr3(:,3),sine20msgslqr3(:,4))
title 'Comparrison 20 ms'
legend ('Lqr','Lqrgs','MPC','Ref')
xlabel 'Time s'
ylabel 'Yaw rate rad/s'
