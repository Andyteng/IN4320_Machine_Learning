% STUMP Decision stump classifier
% X: a dataset with labels as input
% f_opt,the_opt,y_opt: optimal value for f, theta and y

function [f_opt,thea_opt,h] = oneFstump(x,y,p)
  feature1 = x;
  s = length(feature1);
  [sort_x,I] = sort(feature1); % from left to right
  Ir = I(end:-1:1); % from right to left 
  
  left = cumsum(p(I).*y(I));
  right = cumsum(p(Ir).*y(Ir));
  
  score = zeros(1,s-1);
  for i = 1:s-1
      score(1,i) = abs(left(i))+ abs(right(s-i));
  end
  [v,I_thre] = max(score);
  
  %% assign optimal value to parameters
  thea_opt = (sort_x(I_thre)+sort_x(I_thre+1))/2;
  f_opt = feature1;
  h = zeros(1,s);
  for i = 1:s
      if i< I_thre
          h(I(i)) = 1;
      else
          h(I(i)) = -1;
      end
          
  end
  
  
  
  
  
  
  
%   theta = zeros(1,s-1);
% 
% %% threshold calculation
%   for i = 1: (s-1)
%       theta(1,i) = ((sort_x(i)+sort_x(i+1))/2);
%   end
% %% classification (class 1 or 2)
% L = zeros(s-1,s);
%   for j = 1:s-1
%       for i = 1:s
%           if feature1(i)<theta(j)
%                    % ith data point belones to w1
%                   h(i,j) = 1;
%           else
%                   % ith data point belongs to w2
%                   h(i,j) = -1;
%           end
%       end
%   end
%   
% %% Error calculation
% err = zeros(s-1,s);
% temp  = zeros(1,s-1);
% for i = 1:s-1
%     err(i,:) = sign(h(:,i)-y); 
%     temp(1,i) = sum(abs(err(i,:)));
% end
%   
% %% Find the minimum error
%    [m,I_min] = min(temp);
% %% assign optimal value to parameters
%   f_opt =feature1;
%   thea_opt = theta(I_min);
%   y_opt =sign(h(:,I_min)-y);
%   h = h(:,I_min);

  
  


