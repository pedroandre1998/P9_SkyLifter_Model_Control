function [A,B,C,W] = Forward_BackEuler(A_cont,B_cont,C_cont,W_cont,h)
    A = inv(eye(length(A_cont)) - h/2.*A_cont)*(eye(length(A_cont)) + h/2.*A_cont);
    B= h/2.*inv(eye(length(A_cont)) - h/2.*A_cont)*B_cont;
    W= h/2.*inv(eye(length(A_cont)) - h/2.*A_cont)*W_cont;
    C = C_cont;
end
