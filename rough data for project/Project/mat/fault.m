clc;
clear all;
close all;

% Define the model file
model = 'simulation.slx'; % Replace with your actual model name
open_system(model);

% Simulate the model
simOut = sim(model);

% Check if data is exported to workspace
if exist('Va', 'var') && exist('Ia', 'var')
    % Extract data from workspace variables
    voltageA = Va.signals.values;
    currentA = Ia.signals.values;

    % Display a portion of the output to verify
    disp('Voltage A:');
    disp(voltageA(1:10));
    disp('Current A:');
    disp(currentA(1:10));

    % Fault classification based on current and voltage
    % This is a simple example, actual classification logic can be more complex
    thresholdCurrent = 100; % Example threshold value for current, adjust as needed
    thresholdVoltage = 400; % Example threshold value for voltage, adjust as needed
    faultDetectedCurrent = any(currentA > thresholdCurrent);
    faultDetectedVoltage = any(voltageA > thresholdVoltage);
    
    if any(faultDetectedCurrent) || any(faultDetectedVoltage)
        disp('Fault detected in the system.');
        if faultDetectedCurrent
            disp('Fault detected due to overcurrent.');
        end
        if faultDetectedVoltage
            disp('Fault detected due to overvoltage.');
        end
    else
        disp('No fault detected.');
    end

    % Compute RMS values of the currents and voltages
    rmsCurrentA = rms(currentA);
    rmsVoltageA = rms(voltageA);

    % Display RMS values
    disp(['RMS Current A: ', num2str(rmsCurrentA)]);
    disp(['RMS Voltage A: ', num2str(rmsVoltageA)]);
    
    % Create a table of the results
    resultsTable = table(rmsCurrentA, rmsVoltageA, ...
                         'VariableNames', {'RMS_Current_A', 'RMS_Voltage_A'});
    disp('Results Table:');
    disp(resultsTable);
    
    % Plot the signals and their RMS values
    figure;
    subplot(3,1,1);
    plot(currentA);
    title('Current A (Actual)');
    ylabel('Current (A)');
    
    subplot(3,1,2);
    plot(voltageA);
    title('Voltage A (Actual)');
    ylabel('Voltage (V)');
    
    subplot(3,1,3);
    bar([rmsCurrentA, rmsVoltageA]);
    title('RMS Values');
    ylabel('RMS');
    set(gca, 'XTickLabel', {'Current A', 'Voltage A'});
    
    % Save the figure
    saveas(gcf, 'output_results.png');
else
    disp('The required workspace variables do not exist.');
end
