%% PLotting results from track
close all
%LQR
figure
subplot(2,1,1)
plot(tracknllqr(:,5),tracknllqr(:,1))
hold
plot(tracknllqr(:,5),tracknllqr(:,3))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('LQR','Ref')
subplot(2,1,2)
plot(tracknllqr(:,5),tracknllqr(:,2))
hold
plot(tracknllqr(:,5),tracknllqr(:,4))
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
legend ('LQR','Ref')

%MPC
figure
subplot(2,1,1)
plot(tracknlMPC(:,5),tracknlMPC(:,2))
hold
plot(tracknlgslqr(:,5),tracknlgslqr(:,3))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('MPC','Ref')
subplot(2,1,2)
plot(tracknlMPC(:,5),tracknlMPC(:,1))
hold
plot(tracknlgslqr(:,5),tracknlgslqr(:,4))
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
legend ('MPC','Ref')

%Gain LQR
figure
subplot(2,1,1)
plot(tracknlgslqr(:,5),tracknlgslqr(:,1))
hold
plot(tracknlgslqr(:,5),tracknlgslqr(:,3))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('LQRGS','Ref')
subplot(2,1,2)
plot(tracknlgslqr(:,5),tracknlgslqr(:,2))
hold
plot(tracknlgslqr(:,5),tracknlgslqr(:,4))
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
legend ('LQRGS','Ref')

% Comparrison
% Yawrate
figure
subplot(3,1,1)
plot(tracknllqr(:,5),tracknllqr(:,1))
hold
plot(tracknlMPC(:,5),tracknlMPC(:,2))
plot(tracknlgslqr(:,5),tracknlgslqr(:,1))
plot(tracknlgslqr(:,5),tracknlgslqr(:,3))
title 'Yaw rate'
legend ('LQR','MPC','LQRGS','Ref')
ylabel 'Yaw rate rad/s'
xlabel 'Time s'

%Lat Acc
subplot(3,1,2)
plot(tracknllqr(:,5),tracknllqr(:,2))
hold
plot(tracknlMPC(:,5),tracknlMPC(:,1))
plot(tracknlgslqr(:,5),tracknlgslqr(:,2))
plot(tracknlgslqr(:,5),tracknlgslqr(:,4))
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
legend ('LQR','MPC','LQRGS','Ref')
axis([0 24.9 -25 25])

%Lat Acc
figure
plot(tracknllqr(:,5),tracknllqr(:,6))
hold
plot(tracknlMPC(:,5),tracknlMPC(:,6))
plot(tracknlgslqr(:,5),tracknlgslqr(:,6))
title 'Steering output'
ylabel 'Steering angle rad'
xlabel 'Time s'
legend ('LQR','MPC','LQRGS')
%%
RMSE_LQR = sqrt(mean((tracknllqr(:,3)-tracknllqr(:,1)).^2));
RMSE_MPC = sqrt(mean((tracknlMPC(:,4)-tracknlMPC(:,2)).^2));
RMSE_LQRGS_Nl = sqrt(mean((tracknlgslqr(:,3)-tracknlgslqr(:,1)).^2));

MAE_LQR = mean(abs((tracknllqr(:,3) - tracknllqr(:,1))));  % Mean Squared Error
MAE_MPC = mean(abs((tracknlMPC(:,4) - tracknlMPC(:,2))));
MAE_LQRGS_Nl = mean(abs((tracknlgslqr(:,3) - tracknlgslqr(:,1))));


IACA_LQR = sqrt(abs(trapz(tracknllqr(:,6))));
IACA_MPC = sqrt(abs(trapz(tracknlMPC(:,6))));
IACA_LQRGS_Nl = sqrt(abs(trapz(tracknlgslqr(:,6))));

