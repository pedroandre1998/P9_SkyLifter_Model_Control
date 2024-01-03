function [A,B] = Linearization(val,beta)
%   Detailed explanation goes here
load("Jac_nobeta.mat")

JA = vpa(subs(Jac_FinalA,beta,val));
JB = vpa(subs(Jac_FinalB,beta,val));

A = [0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ;
   0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
   0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
   double(JA);];
% 
B = [0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    double(JB);];
 
end

