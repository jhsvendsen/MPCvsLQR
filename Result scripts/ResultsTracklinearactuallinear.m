%% PLotting results from track
close all
%LQR
figure
subplot(2,1,1)
plot(tracklqr(:,5),tracklqr(:,1))
hold
plot(tracklqr(:,5),tracklqr(:,3))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('LQR','Ref')
subplot(2,1,2)
plot(tracklqr(:,5),tracklqr(:,2))
hold
plot(tracklqr(:,5),tracklqr(:,4))
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
legend ('LQR','Ref')

%MPC
figure
subplot(2,1,1)
plot(trackMPC(:,5),trackMPC(:,2))
hold
plot(trackMPC(:,5),trackMPC(:,4))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('MPC','Ref')
subplot(2,1,2)
plot(trackMPC(:,5),trackMPC(:,1))
hold
plot(trackMPC(:,5),trackMPC(:,3))
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
legend ('MPC','Ref')

%Gain LQR
figure
subplot(2,1,1)
plot(trackgslqr(:,5),trackgslqr(:,1))
hold
plot(trackgslqr(:,5),trackgslqr(:,3))
title 'Yaw rate'
ylabel 'Yaw rate rad/s'
xlabel 'Time s'
legend ('LQRGS','Ref')
subplot(2,1,2)
plot(trackgslqr(:,5),trackgslqr(:,2))
hold
plot(trackgslqr(:,5),trackgslqr(:,4))
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
legend ('LQRGS','Ref')

% Comparrison
% Yawrate
figure
subplot(2,1,1)
plot(tracklqr(:,5),tracklqr(:,1))
hold
plot(trackMPC(:,5),trackMPC(:,2))
plot(trackgslqr(:,5),trackgslqr(:,1))
plot(trackgslqr(:,5),trackgslqr(:,3))
title 'Yaw rate'
legend ('LQR','MPC','LQRGS','Ref')
ylabel 'Yaw rate rad/s'
xlabel 'Time s'

%Lat Acc
subplot(2,1,2)
plot(tracklqr(:,5),tracklqr(:,2))
hold
plot(trackMPC(:,5),trackMPC(:,1))
plot(trackgslqr(:,5),trackgslqr(:,2))
plot(trackgslqr(:,5),trackgslqr(:,4))
title 'Lat acc.'
ylabel 'Lat acc. m/s^2'
xlabel 'Time s'
legend ('LQR','MPC','LQRGS','Ref')
axis([0 24.9 -25 25])
%%
% RMSE_LQR = sqrt(mean((tracknllqr(:,3)-tracknllqr(:,1)).^2));
% RMSE_MPC = sqrt(mean((tracknlMPC(:,4)-tracknlMPC(:,2)).^2));
% RMSE_LQRGS_Nl = sqrt(mean((tracknlgslqr(:,3)-tracknlgslqr(:,1)).^2));
% 
% MAE_LQR = mean(abs((tracknllqr(:,3) - tracknllqr(:,1))));  % Mean Squared Error
% MAE_MPC = mean(abs((tracknlMPC(:,4) - tracknlMPC(:,2))));
% MAE_LQRGS_Nl = mean(abs((tracknlgslqr(:,3) - tracknlgslqr(:,1))));
% 
% 
% IACA_LQR = sqrt(abs(trapz(tracknllqr(:,6))));
% IACA_MPC = sqrt(abs(trapz(tracknlMPC(:,6))));
% IACA_LQRGS_Nl = sqrt(abs(trapz(tracknlgslqr(:,6))));

