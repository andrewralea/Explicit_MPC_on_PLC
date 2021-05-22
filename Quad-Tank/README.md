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
#### General Workflow
> Define inputs, outputs, variables, temporary variables, and constants (locally in function block, or in a GVL
> > When adding generated variables to TwinCAT 3, arrays will be missing brackets in their definition, you must add these yourself, or write a MATLAB script to do it for you but I was lazy
> Update search portion of code, state estimation and scaling stays the same but just copy and paste the whole thing because its easier


## My Tips
> If you are doing the MATLAB formulations on a separate computer from that which has the PLC program, and you need to change the generated regions regularly, set up GitHub accordingly and just push and pull when a new .st file is generated rather than email which is what I used to do. This is a must if you are working on a mac and cannot get your PLC software locally. If you are a TCNJ student / faculty, mount your H drive on your mac so you can git pull the new .st locally and still update your other computer

> Try to understand some math before you blindly jump in... the progress you think you're making? You're not lol

