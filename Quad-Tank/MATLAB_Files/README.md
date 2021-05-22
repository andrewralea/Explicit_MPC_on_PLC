# Files and Their Uses

## *main_EMPC_QuadTank.m*
> Calls *quad_tank_setup.m* to generate state-space representation, and creates implicit mpc object. Then creates 
> explicit object and simplifies (requires model predictive control toolbox)

## *quad_tank_setup.m*
> Function that generates all quad-tank related variables from measured values, and returns a 
> state space representation, transfer function, and variables corresponding to the linearzed operating point

