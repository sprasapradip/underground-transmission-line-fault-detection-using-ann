clc;
clear all;
open('simulation.slx');
simOut = sim('simulation.slx');

% Check if 'simOut' exists and contains the required fields
if exist('simOut', 'var') && isstruct(simOut)
    % Check if the required fields are present in the Simulink output
    if isfield(simOut, 'current1') && isfield(simOut, 'current2') && isfield(simOut, 'current3')
        currentA = simOut.current1.signals.values;
        currentB = simOut.current2.signals.values;
        currentC = simOut.current3.signals.values;

        % Train RBFNN on the data
        % Assuming currentA is the target and currentB, currentC are inputs
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
        plot(outputs, 'b--')
        legend('Actual', 'RBFNN Output');
        title('Current A (Comparison)');
        
        % Wavelet Decomposition and Extraction of Coefficients
        [cA, LA] = wavedec(currentA, 1, 'db4');
        [cB, LB] = wavedec(currentB, 1, 'db4');
        [cC, LC] = wavedec(currentC, 1, 'db4');

        coefA = detcoef(cA, LA, 1);
        coefB = detcoef(cB, LB, 1);
        coefC = detcoef(cC, LC, 1);

        m = max(coefA);
        n = max(coefB);
        p = max(coefC);
        
        % Display maximum coefficients
        disp(['Max coefficient for currentA: ', num2str(m)]);
        disp(['Max coefficient for currentB: ', num2str(n)]);
        disp(['Max coefficient for currentC: ', num2str(p)]);
    else
        disp('The required fields do not exist in the output structure.');
    end
else
    disp('The Simulink output structure is not valid.');
end
