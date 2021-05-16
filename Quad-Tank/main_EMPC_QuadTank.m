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

%% Generate continuous time state space matrices
[A_ct, B_ct, C_ct, D_ct, G] = quad_tank_setup();

%% Discretize with Ts = 5s using Zero-Order Hold
Ts = 5;
[A_d,B_d,C_d,D_d] = discretizer(A_ct, B_ct, C_ct, D_ct, Ts);

% Create Final State-Space representation
plant = ss(A_ct, B_ct, C_ct, D_ct);
plant_for_sim = ss(G);


%% Observer
[A_ob, B_ob, C_ob] = observer_calc(A_d, B_d, C_d, D_d);

%% Explicit MPC 

% Creating Controller
Ts = 0.1;       % sampling period
p = 3;          % prediction horizon
m = 2;          % control horizon

mpcobj = mpc(plant,Ts, p, m);

% Specify constraints of the manipulated variable (V)
mpcobj.MV = struct('Min', {0, 0},'Max', {21, 21});

% Generate Explicit MPC
range = generateExplicitRange(mpcobj);

% Set range of state variables 
% (state defined as x - x0, where x0 is the setpoint in cm)
range.State.Min(:) = [-10, -10, -10, -10, -12, -12];
range.State.Max(:) = [ 20,  20,  20,  20,  18,  18];

% Reference Bounds (cm)
range.Reference.Min = [0; 0];
range.Reference.Max = [20; 20];

% Range of manipulated variable must contain the constraints (V)
range.ManipulatedVariable.Min = [0; 0];
range.ManipulatedVariable.Max = [22; 22];

mpcobjExplicit = generateExplicitMPC(mpcobj, range);

% Join pairs of regions with corresponding gains are equal and whose union
% is a convex set to minimize memory footprint
mpcobjExplicitSimplified = simplify(mpcobjExplicit, 'exact')
