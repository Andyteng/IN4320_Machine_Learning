function [f_opt,thea_opt,y_opt] = stump(X)
data = X.data;
labels = X.labels;
s = size(data);
for i=1:s(2)
    [f(:,i),thea(i),y(i,:)] = oneFstump(data(:,i),labels);
    T(i)=sum(abs(y(i,:)));
end

[m, I] = min(T);
f_opt = I;
thea_opt = thea(I);
y_opt = y(I,:);