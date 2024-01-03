function [A,B,C] = Forward_BackEuler(A_cont,B_cont,C_cont,h)
    A = inv(eye(length(A_cont)) - h/2.*A_cont)*(eye(length(A_cont)) + h/2.*A_cont);
    B= h.*inv(eye(length(A_cont)) - h/2.*A_cont)*B_cont;
    C =  C_cont;
end

