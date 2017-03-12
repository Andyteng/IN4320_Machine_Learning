function [f_opt,thea_opt,y_opt] = stump(x)
data = x.data;
y = x.labels;
s = size(data);



% exaustive search for all features
T = zeros(s(2),1);
for i=1:s(2)
[f(:,i),thea(i),h(:,i)] = oneFstump(data(:,i),y);
T(i) = sum(abs(sign(h(:,i)-y)));
end

[m, I] = min(T);
f_opt = f(:,I);
thea_opt = thea(I);
y_opt = h(:,I);

