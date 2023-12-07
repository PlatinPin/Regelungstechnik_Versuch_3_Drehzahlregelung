clear all;
K = 30e-3;
J = 4000e-7;
R = 6;
L = 120e-6;

%Berechnung von Kr
Umax=10;
emax=100;
Kr=Umax/emax;

opt=simset('MaxStep', 0.001);
simout=sim("Aufgabe2_sim.slx" , [0,20], opt);
time=simout.drehmoment.time;
drehmoment=simout.drehmoment.signals.values;
drehzahl=simout.drehzahl.signals.values;
regelgroesse=drehzahl;
strom=simout.strom.signals.values;
stellgroesse=simout.stellgroesse.signals.values;
fuehrungsgroesse=simout.fuehrungsgroesse.signals.values;

f = figure(1); clf;
title('Aufgabe 2');
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
exportgraphics(f,'./Schaubilder/Aufgabe2.png','Resolution',300);
