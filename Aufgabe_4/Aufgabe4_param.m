clear all;
K = 30e-3;
J = 4000e-7;
R = 6;
L = 120e-6;
D = 100;
LM = 0.01;
T_LAST = 10;

%Berechnung von Kr
Umax=10;
emax=100;
Kr=Umax/emax;

TN=2.55;

opt=simset('MaxStep', 0.001);
simout=sim("Aufgabe4_sim.slx" , [0,20], opt);
time=simout.drehmoment.time;
drehmoment=simout.drehmoment.signals.values;
drehzahl=simout.drehzahl.signals.values;
regelgroesse=drehzahl;
strom=simout.strom.signals.values;
stellgroesse=simout.stellgroesse.signals.values;
fuehrungsgroesse=simout.fuehrungsgroesse.signals.values;

f=figure(1); clf;
title(strcat('Aufgabe4 Tn =', num2str(TN)));
hold on;
yyaxis left;
plot(time, regelgroesse,'b', 'LineWidth', 2);
plot(time, fuehrungsgroesse, 'r', 'LineWidth', 2);
ylabel('Regelgröße [rad/s], Führungsgröße [rad/s]');
xlabel('Zeit[t]');
yyaxis right;
plot(time, stellgroesse, 'g', 'LineWidth', 2);
plot(time, drehmoment*1000, 'm', 'LineWidth', 2);
ylabel('Stellgröße [V], Drehmoment*1000 [Nm]');

legend("Regelgröße [rad/s]", "Führungsgröße [rad/s]", "Stellgröße [V]", "Drehmoment*1000 [Nm]");
exportgraphics(f,strcat(strcat('./Schaubilder/Aufgabe4Tn=', num2str(TN)), '.png'),'Resolution',300);
hold off;

