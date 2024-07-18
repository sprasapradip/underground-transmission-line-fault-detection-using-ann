clc;
clear all;
close all;
warning off;

% Define the fault conditions as parameters
faults = {'NORMAL', 'AG', 'BG', 'CG', 'ABG', 'ACG', 'BCG', 'ABCG', 'AB', 'AC', 'ABC'};
LL_cases = [10, 15]; % Line lengths for the two cases

% Initialize containers for the simulation results
xdata = [];
tdata = [];

% Initialize sim options
simopt = simset('solver', 'ode23tb', 'SrcWorkspace', 'current', 'DstWorkspace', 'current');

for LL = LL_cases
    for i = 1:length(faults)
        try
            % Run the simulation with current faultType and LL
            faultType = faults{i};
            LL_value = LL;

            % Simulate with dynamic parameters from Simulink model
            simData = sim('faultSimulation.slx', [0 0.5], simopt);

            % Extract simulation outputs
            yout = simData.yout;

            % Check if yout is in the expected numeric array format
            if isnumeric(yout) && size(yout, 2) >= 8
                % Extract the relevant output variables from yout
                Va = yout(:, 1);
                Vb = yout(:, 2);
                Vc = yout(:, 3);
                Ia = yout(:, 4);
                Ib = yout(:, 5);
                Ic = yout(:, 6);
                V0 = yout(:, 7);
                I0 = yout(:, 8);

                % Store only selected variables in xdata
                xdata = [xdata; Ia Ib Ic I0 V0 Va Vb Vc]; % Concatenate columns

                % Create fault indication array based on the fault type and LL
                switch faultType
                    case 'NORMAL'
                        t = [0 0 0 0 LL_value];
                    case 'AG'
                        t = [1 0 0 1 LL_value];
                    case 'BG'
                        t = [0 1 0 1 LL_value];
                    case 'CG'
                        t = [0 0 1 1 LL_value];
                    case 'ABG'
                        t = [1 1 0 1 LL_value];
                    case 'ACG'
                        t = [1 0 1 1 LL_value];
                    case 'BCG'
                        t = [0 1 1 1 LL_value];
                    case 'ABCG'
                        t = [1 1 1 1 LL_value];
                    case 'AB'
                        t = [1 1 0 0 LL_value];
                    case 'AC'
                        t = [1 0 1 0 LL_value];
                    case 'ABC'
                        t = [1 1 1 0 LL_value];
                end
                tdata = [tdata; t];
            else
                disp(['Unexpected format for yout for faultType: ' faultType ' and LL: ' num2str(LL_value)]);
            end
        catch ex
            disp(['Error running simulation for faultType: ' faultType ' and LL: ' num2str(LL_value)]);
            disp(['Error message: ' ex.message]);
            continue; % Skip to the next iteration
        end
    end
end

% Display xdata and tdata in semicolon-separated format
disp('xdata:');
disp([num2str(xdata, '%f; '), repmat(' ', size(xdata, 1), 1)]);

disp('tdata:');
disp([num2str(tdata, '%d; '), repmat(' ', size(tdata, 1), 1)]);
