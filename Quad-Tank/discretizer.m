%% Take the Original Continuous Time System and Convert to Discrete Time
% Written by Hussain Khajanchi

function [Ad,Bd,Cd,Dd] = discretizer(Ac,Bc,Cc,Dc,Ts)

J  = [Ac Bc; zeros(size(Cc,1),size(Ac,2)) zeros(size(Cc,1),size(Bc,2))];
Jd = expm(Ts*J);
Ad = Jd(1:size(Ac,1),1:size(Ac,2));
Bd = Jd(1:size(Ac,1),size(Ac,2)+1:end);
Cd = Cc;
Dd = Dc;
    
end 