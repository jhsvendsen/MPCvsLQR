%% Dissertation pictures
close all
%% Velocity trace
% Velocity trace
maxspeed = max(Velocity);
index = find(Velocity==maxspeed);
maxdistance = Distance(index);
plot(Distance,Velocity)
hold
plot(maxspeed,maxdistance)
title 'Velocity trace around Brunthinthorpe'
ylabel 'Velocity m/s'
xlabel 'Distance m'
maxd = max(Distance);

axis([0 maxd 10 25])

%% Filtered vs. Unfiltered data
figure
subplot(2,1,1)
plot(Time,VelocityUF)
hold
plot(Time,Velocity)
title 'Velocity data'
ylabel 'Velocity m/s'
xlabel 'Time s'
legend('Unfiltered','Filtered');
subplot(2,1,2)
plot(Time,LatAccUF)
hold
plot(Time,LatAcc)
title 'LatAcc data'
ylabel 'LatAcc m/s^2'
xlabel 'Time s'
legend('Unfiltered','Filtered');