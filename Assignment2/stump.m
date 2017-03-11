function [f_opt,thea_opt,h] = stump(X,p)
x = X.data;
y = X.labels;
s = size(x);
T = zeros(s(2),1);

for i = 1: s(1)
     if y(i) == 2
         y(i) = -1; 
     else
         y(i) = 1;
     end
 end

for i=1:s(2)
    [f(:,i),thea(i),h(:,i)] = oneFstump(x(:,i),y,p);
    T(i)=sum(abs(sign(h(:,i)-y)));
end

[m, I] = min(T);
f_opt = I;
thea_opt = thea(I);
h = h(:,I);