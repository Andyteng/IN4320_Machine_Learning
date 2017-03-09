function[cost] = lossFunction_1(X,m_pos,m_nag,lambda)
        cost = 0;
        for i = 1:1:2
            cost = cost + (X(i)-m_pos).^2;
        end
        for j = 2:1:4
            cost = cost +(X(i)-m_nag).^2;
        end
        cost3 = lambda*abs(m_nag-m_pos);
        cost = cost+cost3;
end