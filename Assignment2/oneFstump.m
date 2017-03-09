% STUMP Decision stump classifier
% X: a dataset with labels as input
% f_opt,the_opt,y_opt: optimal value for f, theta and y

function [f_opt,thea_opt,y_opt] = oneFstump(X,labels)
  feature1 = X;
  s = length(feature1);
  w = ones(s, 1); % weight
  [sort_x,I] = sort(feature1); 
  theta = zeros(1,s-1);
%% threshold calculation
  for i = 1: (s-1)
      theta(1,i) = ((sort_x(i)+sort_x(i+1))/2);
  end
%% classification (class 1 or 2)
L = zeros(s-1,s);
  for j = 1:s-1
      for i = 1:s
          if feature1(i)<theta(j)
                   % ith data point belones to w1
                  L(j,i) = 1;
          else
                  % ith data point belongs to w2
                  L(j,i) = 2;
          end
      end
  end
  
%% Error calculation
err = zeros(s-1,s);
temp  = zeros(1,s-1);
for i = 1:s-1
    err(i,:) = sign(L(i,:)-transpose(labels)); 
    temp(1,i) = sum(abs(err(i,:)));
end
  
%% Find the minimum error
   [m,I_min] = min(temp);
%% assign optimal value to parameters
  f_opt =feature1;
  thea_opt = theta(I_min);
  y_opt =sign(L(I_min,:)-transpose(labels));
  ID_mis = find(y_opt ~= 0);
    for i = 1:length(ID_mis)
        
    end


