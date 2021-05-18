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
[A_ct, B_ct, C_ct, D_ct, G] = quad_tank_setup();

% Create Final State-Space representation
plant = ss(A_ct, B_ct, C_ct, D_ct);

% Creating Controller
Ts = 0.1;       % sampling period
p = 3;          % prediction horizon
m = 2;          % control horizon

mpcobj = mpc(plant,Ts, p, m);

% Specify constraints of the manipulated variable (V)
mpcobj.MV = struct('Min', {0, 0},'Max', {22, 22});

% Create discrete model for simulation
plant_discrete = c2d(plant,Ts);

% Simulation
Tstop = 30;                             % simulation time
Nf = round(Tstop/Ts);                   % number of simulation steps
r = ones(Nf,2);                         % output reference signal

% sim(mpcobj,Nf,r)                      % simulate plant and controller in closed loop

%% Explicit MPC

% Generate Explicit MPC
range = generateExplicitRange(mpcobj);

% Set range of state variables 
% (state defined as x - x0, where x0 is the operating in cm)
range.State.Min(:) = [-10, -10, -14, -14, -100, -100];
range.State.Max(:) = [ 20,  20,  16,  16,  100,  100];

% Reference Bounds (cm)
range.Reference.Min = [0, 0];
range.Reference.Max = [20, 20];

% Range of manipulated variable must contain the constraints (V)
range.ManipulatedVariable.Min = [0; 0];
range.ManipulatedVariable.Max = [23; 23];

mpcobjExplicit = generateExplicitMPC(mpcobj, range);

% Join pairs of regions with corresponding gains are equal and whose union
% is a convex set to minimize memory footprint
mpcobjExplicitSimplified = simplify(mpcobjExplicit, 'exact');
