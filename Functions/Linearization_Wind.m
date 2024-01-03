function [A,B] = Linearization_Wind(valB,beta,tau,valW,w,muWind)
%   Detailed explanation goes here
load("Jac_nobeta.mat")

JA_1 = subs(Jac_FinalA,beta,valB);
JA_2 = subs(JA_1,w,muWind);
JA =  vpa(subs(JA_2,tau,valW));

JB_1 = subs(Jac_FinalB,beta,valB);
JB_2 = subs(JB_1,w,muWind);
JB =  vpa(subs(JB_2,tau,valW));

% 
% JW_1 = subs(Jac_FinalW,beta,valB);
% JW_2 = subs(JW_1,w,muWind);
% JW =  vpa(subs(JW_2,tau,valW));


A = [0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
   0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
   double(JA);
   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
% 
B = [0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    double(JB);
    0 0 0 0 0 0 0 0];
 
 % W = [0;
 %     0;
 %     0;
 %     0;
 %     0
 %     0;
 %     0;
 %     0; 
 %     double(JW);];
end
