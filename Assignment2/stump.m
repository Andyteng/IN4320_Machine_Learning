function [f_opt,thea_opt,h] = stump(X,p)
x = X.data;
y = X.labels;
s = size(x);
T = zeros(s(2),1);

for i=1:s(2)
    [f(:,i),thea(i),h_oneF(i,:)] = oneFstump(x(:,i),y,p);
    T(i)=sum(abs(sign(h_oneF(i,:)-y')));
end

[m, I] = min(T);
f_opt = I;
thea_opt = thea(I);
h = transpose(h_oneF(I,:));