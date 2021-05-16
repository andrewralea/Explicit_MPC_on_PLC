%% Michael Ralea
% Explicit MPC Search // Quad-Tank

%% Call explicit MPC formulation for double integrator
% main_EMPC_QuadTank; 

%% Define variables
state_min = mpcobjExplicitSimplified.Range.State.Min(1);
state_max = mpcobjExplicitSimplified.Range.State.Max(1);
x_in = [-10; -5; -8; -2; 0; 0; 0; 0; 0; 0];                 % ???
temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution);
num_regions = temp_array(2);
solution_found = 0;
v = zeros(num_regions, 1);  % violation matrix (Hx(k) - K)
v_min = 0;                  % temp variable for updating violation matrix
i_minViolation = 0;         % region with minimum inequality violation

%% State Estimation
x = x_in;       % for now

%% Search regions
for i = 1:num_regions
    temp_array2 = size(mpcobjExplicitSimplified.PiecewiseAffineSolution(i).H);   % Get size of H 
    h_depth = temp_array2(1);                                                    % Get num_rows of H
    H_xk = zeros(h_depth, 1); 
    
    % For each row of H, fill H_xk (H * x(k))
    for j = 1:h_depth   
        temp_H = mpcobjExplicitSimplified.PiecewiseAffineSolution(i).H;
        H_xk(j) = (temp_H(j, 1) * x(1)) + (temp_H(j, 2) * x(2)) + (temp_H(j, 3) * x(3)) + (temp_H(j, 4) * x(4)) + (temp_H(j, 5) * x(5)) + (temp_H(j, 6) * x(6)) + (temp_H(j, 7) * x(7)) + (temp_H(j, 8) * x(8)) + (temp_H(j, 9) * x(9)) + (temp_H(j, 10) * x(10));
    end
    
    % Check the region and count how many rows passed. If it's
    % h_depth, you are in the region
    num_passes = 0;
    v_temp = 0;
    K_Current = mpcobjExplicitSimplified.PiecewiseAffineSolution(i).K;    %
    for p = 1:h_depth
        if (H_xk(p) > K_Current(p))
            solution_found = 0;
            if (H_xk(p) - K_Current(p) > v_min)
                v_min = H_xk(p) - K_Current(p);
            end
        else
            num_passes = num_passes + 1;
        end
    end
    
    % Set v(i) to max
    v(i) = v_min;
    
    if (num_passes == h_depth) 
        solution_found = 1;
        break
    end
end

% Compute Control Output

if (solution_found)
    % Compute control output for region i
    u_k = (mpcobjExplicitSimplified.PiecewiseAffineSolution(i).F * x) + mpcobjExplicitSimplified.PiecewiseAffineSolution(i).G;
    if (u_k < 0)
        u_k = 0;
    end
    fprintf('<strong>Solution Found:</strong> Region %d\n', i);
    fprintf('<strong>Optimal Control Output:</strong> %g\n', u_k);
else
    % Find region with minimum violation (max Hx(k) - K)
    for k = 1:num_regions
        if (v(k) > i_minViolation)
            i_minViolation = k;
        end
    end
    u_k = (mpcobjExplicitSimplified.PiecewiseAffineSolution(i_minViolation).F * x) + mpcobjExplicitSimplified.PiecewiseAffineSolution(i_minViolation).G;
    if (u_k < 0)
        u_k = 0;
    end
    fprintf('<strong>Solution Not Found</strong> Region %d used for minimum violation\n', i)
    fprintf('<strong>Suboptimal Control Output:</strong> %g\n', u_k);
end