function [mn,mp,J_history] =gradientDescent(X,mn,mp,alpha,num_iters,lambda)
%GRADIENTDESCENTMULTI Performs gradient descent to learn both mean values
%[mn,mp] = GRADIENTDESCENTMULTI(mn, mp, alpha, num_iters) updates mn,mp by
%taking num_iters gradient steps with learning rate alpha

for iter = 1:num_iters
    [dF_mn,dF_mp] = derivative(X,mn,mp,lambda);
    
    mn = mn - alpha*dF_mn;
    mp = mp - alpha*dF_mp;
end
end

