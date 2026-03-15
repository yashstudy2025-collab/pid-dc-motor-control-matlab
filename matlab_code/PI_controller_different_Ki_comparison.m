   clear; clc;    
   %%Motor Parameters
   L= 0.23e-3;     %[H]
   cm= 23.4e-3;    %[Nm/A]
   R=2.4;       %[ohm]
   J= 0.23e-6;     %[Nm^2]
   D=0.4191e-5;    %[N*sec/m]

   %%Reference Speed
   w_ref= 200;     %rad/s

   %%ki values 
   ki_values =[0.5 2 4 6];

   %%Prepare Results Table
   results= table('size',[numel(ki_values) 5], ...
   'VariableTypes',{'double','double','double','double','double'},...
   'VariableNames',{'ki','finalomega','overshoot','Risetime','settling_time'});
  
   figure

   %%loop through Ki value
   for i= 1:numel(ki_values)
       
       ki= ki_values(i);

   %%Run Simulink Model
   out=sim('Motorcontrol_PI');

   %%Extract Simulation Data
   t= out.omega_out.time;
   w= out.omega_out.signals.values;
  
   %%Plot Graph
   subplot(2,2,i)
   plot(t,w)
   hold on; grid on;
   yline(w_ref,'--m')
   xlabel('Time(s)')
   ylabel('\omega(rad/s)')
   title(['ki=',num2str(ki)])

   %%Automatically Calculate system metrices
   info= stepinfo(w,t,w_ref);

   %% Store Results
   results.ki(i) = ki;
   results.finalomega(i) = w(end);
   results.overshoot(i) = info.Overshoot;
   results.Risetime(i) = info.RiseTime;
   results.settling_time(i) = info.SettlingTime;
   end 
   disp('Control system performance for different ki values')
   disp(results)
 