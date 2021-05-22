%% PID plotter


Array = csvread('PID_newMaxes.csv');
Time_s = Array(:, 1) * 0.001;
Tank_1_Height = Array(:, 2) * 6.536;
Tank_2_Height = Array(:, 3) * 6.536;
Tank_1_Setpoint = Array(:, 6) * 6.536;
Tank_2_Setpoint = Array(:, 7) * 6.536;
figure(1)
plot(Time_s, Tank_1_Height, Time_s, Tank_2_Height, Time_s, Tank_1_Setpoint, Time_s, Tank_2_Setpoint)
xlabel("Time (s)");
ylabel("Height (cm)");

figure(2)
Motor_1_Input = Array(:, 4);
Motor_2_Input = Array(:, 5);
plot(Time_s, Motor_1_Input, Time_s, Motor_2_Input)
xlabel("Time (s)");
ylabel("Voltage (V)");