%% Recieving optimal trajectory back
% Recieving track data
Brunthingthorpe_Opt_read = readtable('minimum_curvature.csv');

%% Recieving bounds
Bounds = readtable('Opt_Bounds.csv');
save 'Bounds'

%% Comparing results
% figure
% plot(Brunthingthorpe_Opt_read.x_m,Brunthingthorpe_Opt_read.y_m,'r')
% hold
% % plot(Brunthingthorpe.X,Brunthingthorpe.Y,'--')
% plot(Bounds.x_Bound1x,Bounds.bound1y,'k')
% plot(Bounds.bound2x,Bounds.bound2y,'k')
% title 'Comparrison Opt vs Ref'

%% Compare times
mc = readtable('minCurv.csv');
mco = readtable('minCurvIQP.csv');
sp = readtable('Shorpath.csv');

dmc = max(mc.x_S_m);
dmco = max(mco.x_S_m);
dsp = max(sp.x_S_m);

vmc = mean(mc.vx_mps);
vmco = mean(mco.vx_mps);
vsp = mean(sp.vx_mps);

lpmc = dmc/vmc;
lpmco = dmco/vmco;
lpsp = dsp/vsp;


