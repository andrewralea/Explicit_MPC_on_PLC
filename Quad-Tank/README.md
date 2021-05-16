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


# How to use the files:

### MATLAB Portion
Run *main_EMPC_QuadTank.m* (Top Level) 
>*quad_tank_setup.m* to create the continuous time SS 
>
>*discretizer.m* to discretize the SS
>
>*observer_calc.m* is called to generate the observer matrices

Run *Sim_Main.slx* (Top simulation)

### PLC Portion
Copy and paste PWA_Solution.txt into a GVL in TwinCAT 3

