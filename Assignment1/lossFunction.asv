function[cost] = lossFunction(mp,mn,X,lambda)
        cost1 = sum((X((1:554),:)-mp).^2);
        cost2 = sum((X((555:end),:)-mn).^2);
        cost3 = lambda*abs(mn-mp);
        cost = cost1+cost2+cost3;
end