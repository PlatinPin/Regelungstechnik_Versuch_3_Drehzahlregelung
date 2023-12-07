clear all;
K = 30e-3;
J = 4000e-7;
R = 6;
L = 120e-6;

%Berechnung von Kr
Umax=10;
emax=100;
Kr=Umax/emax;
D_array = linspace(100, 300, 2);
TN=2.55;

for count=1:length(D_array)
D = D_array(count);

opt=simset('MaxStep', 0.001);
simout=sim("Aufgabe3b_sim.slx" , [0,40], opt);
time=simout.drehmoment.time;
drehmoment=simout.drehmoment.signals.values;
drehzahl=simout.drehzahl.signals.values;
regelgroesse=drehzahl;
strom=simout.strom.signals.values;
stellgroesse=simout.stellgroesse.signals.values;
fuehrungsgroesse=simout.fuehrungsgroesse.signals.values;

regelldeifferenz = simout.regeldifferenz.signals.values;

f=figure(count); clf;
title(strcat('Aufgabe 3b rad/s =', num2str(D)));
hold on;
yyaxis left;
plot(time, regelgroesse,'b', 'LineWidth', 2);
plot(time, fuehrungsgroesse, 'r', 'LineWidth', 2);
ylabel('Regelgröße [rad/s], Führungsgröße [rad/s]');
xlabel('Zeit[t]');
yyaxis right;
plot(time, stellgroesse, 'g', 'LineWidth', 2);
ylabel('Stellgröße [V]');

legend("Regelgröße [rad/s]", "Führungsgröße [rad/s]", "Stellgröße [V]");
hold off;


save_regel = strcat("simulation_regel_",num2str(D));
save_diff = strcat("simulation_diff_", num2str(D));
save_time = strcat("simulation_time_",num2str(D));
save(strcat(save_regel,".mat"), "regelgroesse");
save(strcat(save_diff,".mat"), "regelldeifferenz");
save(strcat(save_time,".mat"), "time");



end