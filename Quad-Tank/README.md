All code relating to explicit MPC on the quad-tank.

# Tools Needed:
*PLC specific tools such as IDE, main unit, and I/O modules can vary. May need to alter minor syntax of generated structured text on case-by-case basis.*
#### MATLAB (2020b used)
> Model Predictive Control Toolbox (for generating explicit regions)
> 
#### Beckhoff TwinCAT 3 (IDE)
#### Beckhoff CX9020 
> EL3004 A/D Input Module  (4 channel)
> 
> EL4002 D/A Output Module (2 channel)
> > For quad-tank implementation, the EL4002 only outputs up to 10 V so for reasonable performance, an amplifier of at least 3x is needed

#### Quanser Coupled-Tanks (x2)


# How to use the files:

### MATLAB Portion
Run *main_EMPC_QuadTank.m* (Top Level) 
>*quad_tank_setup.m* to create the continuous time SS 
>Generate implicit controller object
>Convert to explicit formulation

Run *Sim_Main.slx* (Top simulation)
> Generate structured text from Explicit MPC Controller Block

### PLC Portion
Import generated structured text and update explicit controller function block accordingly

