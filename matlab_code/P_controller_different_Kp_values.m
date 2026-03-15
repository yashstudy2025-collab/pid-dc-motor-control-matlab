clear; clc; 

%%Motor Parameters
L= 0.23e-3;     %[H]
cm= 23.4e-3;    %[Nm/A]
R=2.4;       %[ohm]
J= 0.23e-6;     %[Nm^2]
D=0.4191e-5;    %[N*sec/m]

%%Reference Speed
w_ref= 200;     %rad/s

%%kp values
kp_values= [0.05 0.1 0.2 0.5 1 2];

%%Prepare results Table
results= table( 'size',[numel(kp_values) 5], ...
    'VariableTypes',{'double','double','double','double','double'}, ...
    'VariableNames',{'kp','finalomega','overshoot','Risetime','Settling_Time'});
figure

%%loop through Kp value
for i = 1:numel(kp_values)

    kp = kp_values(i);

    %Run Simulink model
   out=sim('Motorcontrol');

   %%Extract Simulation Data
   t= out.omega_out.time;
   w= out.omega_out.signals.values;
  
   %%Plot Graph
   subplot(3,2,i)
   plot(t,w)
   hold on; grid on;
   yline(w_ref,'--m')
   xlabel('Time(s)')
   ylabel('\omega(rad/s)')
   title(['kp=',num2str(kp)])
  
   %%Automatically Calculate System Metrices
    info= stepinfo(w,t,w_ref);
    
    %%Store Results in Table
    results.kp(i) = kp;
    results.finalomega(i)= w(end);
    results.overshoot(i) = info.Overshoot;
    results.Risetime(i) = info.RiseTime;
    results.Settling_Time(i) = info.SettlingTime;
end
%%Displaying Results Table
disp('Control system Performance for different kp Values');
disp(results);
