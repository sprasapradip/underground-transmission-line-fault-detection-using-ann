clc;
clear all;
close all;

% Open and simulate the modified Simulink model
model = 'modified_simulation.slx';
open(model);
simOut = sim(model);

% Check if 'simOut' contains the required fields
if isfield(simOut, 'logsout') && isa(simOut.logsout, 'Simulink.SimulationData.Dataset')
    % Extract the logged signals
    logsout = simOut.logsout;
    
    % Check if 'current', 'current1', 'current2', 'voltage', 'voltage1', and 'voltage2' are present in logsout
    currentExists = ~isempty(find(strcmp({logsout{:,1}.Name}, 'current'), 1));
    current1Exists = ~isempty(find(strcmp({logsout{:,1}.Name}, 'current1'), 1));
    current2Exists = ~isempty(find(strcmp({logsout{:,1}.Name}, 'current2'), 1));
    voltageExists = ~isempty(find(strcmp({logsout{:,1}.Name}, 'voltage'), 1));
    voltage1Exists = ~isempty(find(strcmp({logsout{:,1}.Name}, 'voltage1'), 1));
    voltage2Exists = ~isempty(find(strcmp({logsout{:,1}.Name}, 'voltage2'), 1));
    
    if currentExists && current1Exists && current2Exists && voltageExists && voltage1Exists && voltage2Exists
        % Extract the signals
        currentA = logsout.get('current').Values.Data;
        currentB = logsout.get('current1').Values.Data;
        currentC = logsout.get('current2').Values.Data;
        voltageA = logsout.get('voltage').Values.Data;
        voltageB = logsout.get('voltage1').Values.Data;
        voltageC = logsout.get('voltage2').Values.Data;

        % Display a portion of the output to verify
        disp('Current A:');
        disp(currentA(1:10));
        disp('Current B:');
        disp(currentB(1:10));
        disp('Current C:');
        disp(currentC(1:10));
        disp('Voltage A:');
        disp(voltageA(1:10));
        disp('Voltage B:');
        disp(voltageB(1:10));
        disp('Voltage C:');
        disp(voltageC(1:10));
        
        % Train RBFNN on the data
        inputs = [currentB, currentC]';
        targets = currentA';
        
        % Create and train the RBFNN
        spread = 1;  % Spread of the radial basis functions
        goal = 0.0;  % Mean squared error goal
        maxNeurons = 50;  % Maximum number of neurons
        displayAt = 10;  % Number of iterations between displays
        
        net = newrb(inputs, targets, goal, spread, maxNeurons, displayAt);

        % Simulate the RBFNN with the same inputs to get outputs
        outputs = net(inputs);
        
        % Compare outputs with actual data
        figure;
        subplot(4,1,1);
        plot(currentA);
        title('Current A (Actual)');
        subplot(4,1,2);
        plot(currentB);
        title('Current B');
        subplot(4,1,3);
        plot(currentC);
        title('Current C');
        subplot(4,1,4);
        plot(currentA, 'r');
        hold on;
        plot(outputs, 'b--');
        legend('Actual', 'RBFNN Output');
        title('Current A (Comparison)');
        
        % Fault classification based on current and voltage
        % This is a simple example, actual classification logic can be more complex
        faultDetected = any(currentA > threshold) || any(voltageA > threshold);
        if faultDetected
            disp('Fault detected in the system.');
        else
            disp('No fault detected.');
        end

        % Compute RMS values of the currents and voltages
        rmsCurrentA = rms(currentA);
        rmsCurrentB = rms(currentB);
        rmsCurrentC = rms(currentC);
        rmsVoltageA = rms(voltageA);
        rmsVoltageB = rms(voltageB);
        rmsVoltageC = rms(voltageC);

        % Display RMS values
        disp(['RMS Current A: ', num2str(rmsCurrentA)]);
        disp(['RMS Current B: ', num2str(rmsCurrentB)]);
        disp(['RMS Current C: ', num2str(rmsCurrentC)]);
        disp(['RMS Voltage A: ', num2str(rmsVoltageA)]);
        disp(['RMS Voltage B: ', num2str(rmsVoltageB)]);
        disp(['RMS Voltage C: ', num2str(rmsVoltageC)]);
        
        % Plot RMS values
        figure;
        subplot(2,1,1);
        bar([rmsCurrentA, rmsCurrentB, rmsCurrentC]);
        title('RMS Values of Currents');
        ylabel('RMS (A)');
        set(gca, 'XTickLabel', {'Current A', 'Current B', 'Current C'});
        
        subplot(2,1,2);
        bar([rmsVoltageA, rmsVoltageB, rmsVoltageC]);
        title('RMS Values of Voltages');
        ylabel('RMS (V)');
        set(gca, 'XTickLabel', {'Voltage A', 'Voltage B', 'Voltage C'});
    else
        disp('The required fields do not exist in the logsout structure.');
    end
else
    disp('The Simulink output structure is not valid.');
end
