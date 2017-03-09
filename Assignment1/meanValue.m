function[result] = meanValue(class)
    result = [];
    for i = 1:64
        temp = sum(class(:,i)/length(class));
        result = [result;temp];
    end
end