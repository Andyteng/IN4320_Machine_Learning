% oneFstump Decision stump classifier for 1 feature
% X: data of 1 feature.
% f_opt,thea_opt,y_opt: optimal value for f, theta and y

function [f_opt,thea_opt,y_opt] = oneFstump(x,y)
% select x coordinate as the feature
feature1 = x;
s = length(feature1);

[sort_x,I] = sort(feature1); 

%% threshold calculation
theta = zeros(1,s-1);
for i = 1: (s-1)
  theta(1,i) = ((sort_x(i)+sort_x(i+1))/2);
end

%% classification (class 1 or 2)
h = zeros(s-1,s);
  for j = 1:s-1
      for i = 1:s
          if feature1(i)<theta(j)
                   % ith data point belones to w1
                  h(j,i) = 1;
          else
                  % ith data point belongs to w2
                  h(j,i) = -1;
          end
      end
  end
  
%% Error calculation
err = zeros(s-1,s);
temp  = zeros(1,s-1);
for i = 1:s-1
    err(i,:) = sign(h(i,:)-transpose(y)); 
    temp(1,i) = sum(abs(err(i,:)));
end

%% Find the minimum error
[m,I_min] = min(temp);
display(I_min);
    
%% assign optimal value to parameters
f_opt = feature1;
thea_opt = theta(I_min);
y_opt =h(I_min,:);
  
  


