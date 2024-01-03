function [ALift, BuLift, BduLift, Psi, Upsilon_B,Upsilon_W Theta] = MPCLift(A, B, C,W, Hp, Hu)
    n = length(A);
    p = size(B,2);
    ALift = zeros(Hp*n,n);
    BuLift = zeros(Hp*n,p);
    WuLift = zeros(Hp*n,1);
    BduLift = zeros(Hp*n,Hu*p);
    for i=1:Hp
        ALift((i-1)*n+1:i*n,:) = A^i;

        Asum = 0;
        for j=2:i
            Asum = Asum + ALift((j-2)*n+1:(j-1)*n,:);
        end
        % We add B, since the above loop doesnt go A^0*B = 1*B = B
        BuLift((i-1)*n+1:i*n,:) = Asum * B + B;
        WuLift((i-1)*n+1:i*n,:) = Asum * W + W;
    end

    for i=1:Hu
        BduLift((i-1)*n+1:end,(i-1)*p+1:i*p) = BuLift(1:(Hp-(i-1))*n,:);
    end

    C_vec = kron(eye(Hp), C);
    cal_C = blkdiag(C_vec);
    
    Psi = cal_C * ALift;
    Upsilon_B = cal_C * BuLift;
    Upsilon_W = cal_C * WuLift;
    Theta = cal_C * BduLift;
    fprintf("Condition of:\n Psi: %f\n Upsilon: %f \n Theta: %f",cond(Psi),cond(Upsilon_B),cond(Theta))
    
end

