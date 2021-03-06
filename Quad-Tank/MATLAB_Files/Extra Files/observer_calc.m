%% Generate Observer Matrices (Michael Ralea)
% The College of New Jersey
% Department of Electrical and Computer Engineering

function [A_ob, B_ob, C_ob] = observer_calc(A_d, B_d, C_d)

% -------------------------------------------------------
% x(k+1) = {A_ob * x(k)} + {B_ob * u(k)} - {C_ob * y(k)}
% x(k) = current estimated state
% u(k) = current control input in V
% y(k) = current measured output of plant in V
% -------------------------------------------------------

% Size Parameters
m = size(B_d, 2); 
n = size(A_d, 1); 

% Initialize observer
A_temp =    [A_d        zeros(n,m);     % Augmented system matrix
            zeros(m,n)  eye(m)];  
    
B_temp =    [B_d;                       % Augmented Input Matrix
            zeros(m,m)];     
    
C_temp =    [C_d    eye(m)];            % Augmented Output Matrix

% D_temp  =   D_d;                        % Augmented Feedthrough Matrix

% New Size Parameters
m = size(B_temp, 2); 
n = size(A_temp, 1); 

% Now add disturbance and noise model
A_oc =  [A_temp     zeros(n, m)     zeros(n, m);
        zeros(m, n) eye(m)          zeros(m, m);
        zeros(m, n) zeros(m, m)     eye(m)];
    
B_oc =  [B_temp;
        zeros(m, m);
        zeros(m, m)];

C_oc =  [C_temp  eye(m)  eye(m)];

Ltemp = place(A_oc',C_oc',[-0.7 -0.5 -0.9 -0.7 -0.9 -0.5 -0.3 -0.1 -0.3 -0.4]');
Ltemp = Ltemp'; % observer gain with Ld = [Lx ; Ldd]
Lx = Ltemp(1:n,:);
Ld = Ltemp(n+1:end,:);

% Perform final calculations
A_ob = [(A_oc + (Lx * C_oc))    Lx;
        (Ld * C_oc)             Ld];
    
B_ob = B_oc;

C_ob = [Lx;
        Ld];

end