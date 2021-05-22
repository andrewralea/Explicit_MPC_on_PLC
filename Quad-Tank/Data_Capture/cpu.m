%% cpu


Array = csvread('cpu.csv');
Num_regions = Array(:, 1);
Max = Array(:, 2);
Avg = Array(:, 3);
PID = Array(:, 4);
figure(1)
plot(Num_regions, Max, Num_regions, Avg, Num_regions, PID)
xlabel("Number of Regions");
ylabel("CPU USage (%)");