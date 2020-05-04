%% Evaluating controllers
% importing data
close all
% load('step5mslqr.mat')
% load('step10mslqr.mat')
% load('step15mslqr.mat')
% load('step20mslqr.mat')
% load('mpcstep5ms')
% load('mpcstep5ms')
% load('mpcstep15ms')
% load('mpcstep20ms')
% load('mpcstep5ms.mat')

% plotting LQR results
figure
title 'LQR'
subplot(2,1,1)
plot(step20mslqr3(:,3),step5mslqr(:,1))
hold
plot(step20mslqr3(:,3),step10mslqr1(:,1))
plot(step20mslqr3(:,3),step15mslqr2(:,1))
plot(step20mslqr3(:,3),step20mslqr3(:,1))
plot(step20mslqr3(:,3),step20mslqr3(:,4))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('5','10','15','20','Ref')
axis([0.4 0.8 0.5 1.1])

subplot(2,1,2)
plot(step20mslqr3(:,3),step5mslqr(:,2))
hold
plot(step20mslqr3(:,3),step10mslqr1(:,2))
plot(step20mslqr3(:,3),step15mslqr2(:,2))
plot(step20mslqr3(:,3),step20mslqr3(:,2))
legend ('5','10','15','20')
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
axis([0.4 1.5 0 22])

% Plotting MPC
% Yawrate
figure
title 'MPC'
subplot(2,1,1)
plot(mpcstep20ms(:,4),mpcstep5ms(:,2))
hold
plot(mpcstep20ms(:,4),mpcstep10ms(:,2))
plot(mpcstep20ms(:,4),mpcstep15ms(:,2))
plot(mpcstep20ms(:,4),mpcstep20ms(:,2))
plot(mpcstep20ms(:,4),mpcstep20ms(:,5))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('5','10','15','20','Ref')
axis([0.4 0.8 0.5 1.1])
subplot(2,1,2)
plot(mpcstep20ms(:,4),mpcstep5ms(:,1))
hold
plot(mpcstep20ms(:,4),mpcstep10ms(:,1))
plot(mpcstep20ms(:,4),mpcstep15ms(:,1))
plot(mpcstep20ms(:,4),mpcstep20ms(:,1))
legend ('5','10','15','20')
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
axis([0.4 1.5 0 22])

% GS LQR
% Plotting MPC
% Yawrate
figure
title 'GS LQR'
subplot(2,1,1)
plot(step20msgslqr3(:,3),step5msgslqr(:,1))
hold
plot(step20msgslqr3(:,3),step10msgslqr1(:,1))
plot(step20msgslqr3(:,3),step15msgslqr2(:,1))
plot(step20msgslqr3(:,3),step20msgslqr3(:,1))
plot(step20msgslqr3(:,3),step20msgslqr3(:,4))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('5','10','15','20','Ref')
axis([0.4 0.8 0.5 1.1])
subplot(2,1,2)
plot(step20msgslqr3(:,3),step5msgslqr(:,2))
hold
plot(step20msgslqr3(:,3),step10msgslqr1(:,2))
plot(step20msgslqr3(:,3),step15msgslqr2(:,2))
plot(step20msgslqr3(:,3),step20msgslqr3(:,2))
legend ('5','10','15','20')
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
axis([0.4 1.5 0 22])

%% Comparrison
% 5 ms
figure
subplot(2,2,1)
plot(step20mslqr3(:,3),step5mslqr(:,1))
hold
plot(step20msgslqr3(:,3),step5msgslqr(:,1))
plot(mpcstep20ms(:,4),mpcstep5ms(:,2))
plot(step20msgslqr3(:,3),step20msgslqr3(:,4))
title 'Comparrison 5 ms'
legend ('Lqr','Lqrgs','MPC','Ref')
xlabel 'Time s'
ylabel 'Yaw rate rad/s'
axis([0.4 0.8 0.5 1.1])
% 10 ms
subplot(2,2,2)
plot(step20mslqr3(:,3),step10mslqr1(:,1))
hold
plot(step20msgslqr3(:,3),step10msgslqr1(:,1))
plot(mpcstep20ms(:,4),mpcstep10ms(:,2))
plot(step20msgslqr3(:,3),step20msgslqr3(:,4))
title 'Comparrison 10 ms'
legend ('Lqr','Lqrgs','MPC','Ref')
xlabel 'Time s'
ylabel 'Yaw rate rad/s'
axis([0.4 0.8 0.5 1.1])
% 15 ms
subplot(2,2,3)
plot(step20mslqr3(:,3),step15mslqr2(:,1))
hold
plot(step20msgslqr3(:,3),step15msgslqr2(:,1))
plot(mpcstep20ms(:,4),mpcstep15ms(:,2))
plot(step20msgslqr3(:,3),step20msgslqr3(:,4))
title 'Comparrison 15 ms'
legend ('Lqr','Lqrgs','MPC','Ref')
xlabel 'Time s'
ylabel 'Yaw rate rad/s'
axis([0.4 0.8 0.5 1.1])
% 20 ms
subplot(2,2,4)
plot(step20mslqr3(:,3),step10mslqr1(:,1))
hold
plot(step20msgslqr3(:,3),step10msgslqr1(:,1))
plot(mpcstep20ms(:,4),mpcstep20ms(:,2))
plot(step20msgslqr3(:,3),step20msgslqr3(:,4))
title 'Comparrison 20 ms'
legend ('Lqr','Lqrgs','MPC','Ref')
xlabel 'Time s'
ylabel 'Yaw rate rad/s'
axis([0.4 0.8 0.5 1.1])