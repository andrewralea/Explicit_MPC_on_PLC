%% Michael Ralea
% storage data


Array = csvread('Storage_Data_2.csv');
Num_regions = Array(:, 1);
Predicted = Array(:, 2);
Actual = Array(:, 3);
ratio = Array(:, 4);
figure(1)
yyaxis left;
plot(Num_regions, Predicted, Num_regions, Actual)
xlabel("Number of Regions");
ylabel("Kilobytes");

yyaxis right;
plot(Num_regions, ratio)