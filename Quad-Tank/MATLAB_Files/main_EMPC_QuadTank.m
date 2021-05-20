%% Main EMPC for Quad-Tank (Michael Ralea)
% The College of New Jersey
% Department of Electrical and Computer Engineering

% 1. Generate continuous time state space matrices
% 2. Discretize
% 3. Initialize Observer and Compute Gains
% 4. Generate Explicit MPC Regions
% 5. Implement state observer and simulate search

clear
clc

%% Implicit MPC
% Generate continuous time state space matrices
[A_ct, B_ct, C_ct, D_ct, G, L10, L20, L30, L40, Vp10, Vp20] = quad_tank_setup();

% Create Final State-Space representation
plant = ss(A_ct, B_ct, C_ct, D_ct);

% Creating Controller
Ts = 0.1;       % sampling period
p = 6;          % prediction horizon
m = 2;          % control horizon

mpcobj = mpc(plant,Ts, p, m);

% Specify constraints of the manipulated variable (V)
mpcobj.MV = struct('Min', {0 - (L10/6.536), 0 - (L20/6.536)},'Max', {22 - (L10/6.536), 22 - (L20/6.536)});

% Create discrete model for simulation
plant_discrete = c2d(plant,Ts);

%% Explicit MPC

% Generate Explicit MPC
range = generateExplicitRange(mpcobj);

% Set range of state variables 
% (state defined as x - x0, where x0 is the operating in cm)
range.State.Min(:) = [0 - L10,  0 - L20,    0 - L30,    0 - L40,    -1,   -1];
range.State.Max(:) = [30 - L10, 30 - L20,   30 - L30,   30 - L40,    1,   1];

% Reference Bounds (cm), slightly broader than practical range
range.Reference.Min = [0 - L10, 0 - L20] * 1.25;
range.Reference.Max = [30 - L10, 30 - L20] * 1.25;

% Range of manipulated variable must contain the constraints (V)
range.ManipulatedVariable.Min = [-1 - Vp10; -1 - Vp20];
range.ManipulatedVariable.Max = [23 - Vp10; 23 - Vp20];

mpcobjExplicit = generateExplicitMPC(mpcobj, range);

% Join pairs of regions with corresponding gains are equal and whose union
% is a convex set to minimize memory footprint
mpcobjExplicitSimplified = simplify(mpcobjExplicit, 'exact');
