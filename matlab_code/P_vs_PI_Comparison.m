clear;
clc;

%%Motor parameters
L = 0.23e-3;
cm = 23.4e-3;
R = 2.4;
J = 0.23e-6;
D = 0.4191e-5;

w_ref = 200;

%%P Controller
Kp = 0.2;
Ki = 0;

out = sim('P_vs_PI_Comparison_model');
tP = out.omega_out.time;
wP = out.omega_out.signals.values;

%%PI Controller
Kp = 0.2;
Ki = 4;

out = sim('P_vs_PI_Comparison_model');
tPI = out.omega_out.time;
wPI = out.omega_out.signals.values;

%%Plot comparison

figure

%%P Controller subplot
subplot(1,2,1)
plot(tP,wP,'b')
hold on
yline(w_ref,'m--')
grid on
title('P Controller Response')
xlabel('Time (s)')
ylabel('\omega (rad/s)')
legend('Speed','Reference')

%%PI Controller subplot
subplot(1,2,2)
plot(tPI,wPI,'c')
hold on
yline(w_ref,'m--')
grid on
title('PI Controller Response')
xlabel('Time (s)')
ylabel('\omega (rad/s)')
legend('Speed','Reference')

sgtitle('Comparison of P and PI Controllers')