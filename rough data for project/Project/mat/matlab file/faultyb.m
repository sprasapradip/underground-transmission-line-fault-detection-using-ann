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
        % Set the fault type in the workspace
        faultType = faults{i};
        LL_value = LL; % Line length for the current case
        
        % Define the faultType and LL_value in the base workspace
        assignin('base', 'faultType', faultType);
        assignin('base', 'LL', LL_value);

        try
            % Run the simulation
            [tout, xout, yout] = sim('faultSimulation.slx', [0 0.5], simopt);

            % Debugging: Print the size of yout
            disp(['Size of yout for faultType: ' faultType ' and LL: ' num2str(LL_value) ' - ' num2str(size(yout))]);

            % Check if yout is in the expected array format
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

                % Store the simulation results
                xdata = [xdata; [Va Vb Vc Ia Ib Ic V0 I0]];

                % Create fault indication array based on the fault type
                switch faultType
                    case 'NORMAL'
                        t = [0 0 0 0 LL];
                    case 'AG'
                        t = [1 0 0 1 LL];
                    case 'BG'
                        t = [0 1 0 1 LL];
                    case 'CG'
                        t = [0 0 1 1 LL];
                    case 'ABG'
                        t = [1 1 0 1 LL];
                    case 'ACG'
                        t = [1 0 1 1 LL];
                    case 'BCG'
                        t = [0 1 1 1 LL];
                    case 'ABCG'
                        t = [1 1 1 1 LL];
                    case 'AB'
                        t = [1 1 0 0 LL];
                    case 'AC'
                        t = [1 0 1 0 LL];
                    case 'ABC'
                        t = [1 1 1 0 LL];
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

% Combine data into a single matrix
nftool_data = [xdata tdata];

% Save the data to a .mat file (optional)
save('nftool_data.mat', 'nftool_data');
