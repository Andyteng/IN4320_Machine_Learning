function[dF_mn,dF_mp] = derivative(X,mn,mp,lambda)
% mc: mean respect to; mn: mean nagtive; mp: mean positive
        dF_mn = 554*2*mn-sum(2*X((1:554),:))+lambda*sign(mn-mp);
        dF_mp = 571*2*mp-sum(2*X((555:end),:))+lambda*sign(mp-mn);
end