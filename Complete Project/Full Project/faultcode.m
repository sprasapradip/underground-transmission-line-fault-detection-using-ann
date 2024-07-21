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
simopt = simset('solver', 'ode23tb', 'srcWorkspace', 'current', 'Dstworkspace', 'current');

for LL = LL_cases
    for i = 1:length(faults)
        % Set the fault type in the workspace
        faultType = faults{i};
        LL_value = LL; % Line length for the current case
        
        % Define the faultType and LL_value in the workspace
        assignin('base', 'faultType', faultType);
        assignin('base', 'LL', LL_value);

        % Run the simulation
        [tout, xout, yout] = sim('faultSimulation.slx', [0 0.5], simopt);

 

        % Extract the relevant output variables from the structure
        Va = yout.signals(1).values;
        Vb = yout.signals(2).values;
        Vc = yout.signals(3).values;
        Ia = yout.signals(4).values;
        Ib = yout.signals(5).values;
        Ic = yout.signals(6).values;
        V0 = yout.signals(7).values;
        I0 = yout.signals(8).values;

        % Store the simulation results
        xdata = [xdata; [Va(end) Vb(end) Vc(end) Ia(end) Ib(end) Ic(end) V0(end) I0(end)]];

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
    end
end

% Combine data into a single matrix
nftool_data = [xdata tdata];
