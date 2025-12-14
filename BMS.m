% MATLAB Program: Efficiency and Performance of a Li-ion Battery
clc; clear; close all;

% User-defined Inputs
disp('Enter Battery Parameters:');
V_nominal = input('Nominal Voltage of the Battery (V): ');  % Nominal voltage (e.g., 3.7V)
Capacity = input('Battery Capacity (Ah): ');                % Battery capacity (e.g., 50Ah)
R_internal = input('Internal Resistance (Ohms): ');         % Internal resistance (e.g., 0.02Ω)

% Operating Parameters
V_load = input('Operating Voltage (V): ');                  % Load voltage (e.g., 3.5V)
I_load = input('Operating Current (A): ');                  % Load current (e.g., 10A)
Temperature = input('Operating Temperature (°C): ');        % Temperature in °C (e.g., 25°C)

% Calculations
% 1. Power Delivered to the Load
P_load = V_load * I_load;  % Power delivered to load (W)

% 2. Power Supplied by the Battery
P_battery = V_nominal * I_load;  % Total power supplied by the battery (W)

% 3. Power Loss in Internal Resistance
P_loss = I_load^2 * R_internal;  % Power loss in the battery's internal resistance (W)

% 4. Efficiency of the Battery
Efficiency = (P_load / P_battery) * 100;  % Efficiency in percentage

% 5. Heat Generation in Battery
% Heat is primarily due to power loss in the internal resistance.
Heat_generated = P_loss;  % Heat generated in the battery (W)

% 6. Temperature Impact on Efficiency
% Efficiency generally decreases as temperature increases. A simple linear model:
if Temperature > 25
    Temp_Eff_Impact = max(0, Efficiency - 0.5 * (Temperature - 25));  % Efficiency drops 0.5% per °C above 25°C
else
    Temp_Eff_Impact = Efficiency;  % No drop below 25°C
end

% Display Results
fprintf('\nBattery Performance Metrics:\n');
fprintf('1. Power Delivered to Load: %.2f W\n', P_load);
fprintf('2. Total Power Supplied by Battery: %.2f W\n', P_battery);
fprintf('3. Power Loss in Internal Resistance: %.2f W\n', P_loss);
fprintf('4. Efficiency (Ideal Conditions): %.2f %%\n', Efficiency);
fprintf('5. Efficiency (Considering Temperature Impact): %.2f %%\n', Temp_Eff_Impact);
fprintf('6. Heat Generated in Battery: %.2f W\n', Heat_generated);

% Plot Performance Metrics
figure;
x = categorical({'Power Delivered', 'Power Supplied', 'Power Loss'});
y = [P_load, P_battery, P_loss];
bar(x, y);
title('Battery Power Metrics');
ylabel('Power (W)');
xlabel('Metrics');
grid on;

figure;
Temperature_range = 20:50; % Range of temperatures (20°C to 50°C)
Efficiency_temp = Efficiency - 0.5 * max(0, Temperature_range - 25);
plot(Temperature_range, Efficiency_temp, 'LineWidth', 2);
title('Efficiency vs. Temperature');
xlabel('Temperature (°C)');
ylabel('Efficiency (%)');
grid on;

% Conclusion
disp('The program has calculated battery performance under specified conditions.');
disp('You can adjust inputs and re-run for different scenarios.');
