# Explicit MPC on PLC
[Michael Ralea - Email](mailto:raleam1@tcnj.edu)

[Dr. Adegbege- Email](mailto:adegbega@tcnj.edu)

## What is Explicit MPC?
Implicit MPC performs an online optimization problem at every sample time to compute an optimal control action, using the current state of the plant as well as predicted state behaviour. Explicit MPC is similar in that it predicts, but differs in that the computation is done offline. Rather than compute a time-consuming quadratic program online, explicit MPC precomputes all possible state regions where the optimal control action is a linear function of the states *x*. 

### Where to start?
[MATLAB Explicit MPC](https://www.mathworks.com/help/mpc/ug/explicit-mpc.html)

## What is a PLC?
<img src="https://github.com/andrewralea/Explicit_MPC_on_PLC/blob/master/PLC_Documentation/Figures/CX9020.png" width="400">

### Where to start?


### Quad Tank Specific
[MATLAB Files](https://github.com/andrewralea/Explicit_MPC_on_PLC/tree/master/Quad-Tank/MATLAB_Files)

[PLC Files](https://github.com/andrewralea/Explicit_MPC_on_PLC/tree/master/Quad-Tank/PLC_Files)

[Control Derivations](https://github.com/andrewralea/Explicit_MPC_on_PLC/tree/master/Quad-Tank/Derivations)


### Related works
- J. Velagić and B. Šabić, "Design, implementation and experimental validation of explicit MPC in programmable logic controller," 2014 IEEE 23rd International Symposium on Industrial Electronics (ISIE), 2014, pp. 93-98, doi: 10.1109/ISIE.2014.6864592.
