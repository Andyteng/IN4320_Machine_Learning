% STUMP Decision stump classifier
% X: a dataset with labels as input
% f_opt,the_opt,y_opt: optimal value for f, theta and y

function [f_opt,thea_opt,h] = oneFstump(x,y,p)
  feature1 = x;
  s = length(feature1);
  [sort_x,I] = sort(feature1); % from left to right
  Ir = I(end:-1:1); % from right to left 
  
% %   left = cumsum(p(I).*y(I));
% %   right = cumsum(p(Ir).*y(Ir));
%     left = cumsum(y(I));
%     right = cumsum(y(Ir));
%   score = zeros(1,s-1);
%   for i = 1:s-1
%       score(1,i) = abs(left(i))+ abs(right(s-i));
%   end
%   [v,I_thre] = max(score);
%   
%   %% assign optimal value to parameters
%   thea_opt = (sort_x(I_thre)+sort_x(I_thre+1))/2;
%   f_opt = feature1;
%   h = zeros(s,1);
%   for i = 1:s
%       if i<= I_thre
%           h(I(i),1) = 1;
%       else
%           h(I(i),1) = -1;
%       end
%           
%   end
  

  theta = zeros(1,s-1);

% threshold calculation
  for i = 1: (s-1)
      theta(1,i) = ((sort_x(i)+sort_x(i+1))/2);
  end
  
% classification (class 1 or 2)
h = zeros(s-1,s);
left = zeros(1,s-1);
right = zeros(1,s-1);
  for j = 1:s-1
      for i = 1:s
          if sort_x(i)<theta(j)
                   % ith data point belones to w1
                  h(i,j) = 1;
                  score_left(i,j) = y(I(i))*p(i);
                  left(1,j) = left(1,j)+score_left(i,j);
                  %score(j) = score(j) +score_left(i,j);
          else
                  % ith data point belongs to w2
                  h(i,j) = -1;
                  score_right(i,j) = y(I(i))*p(i);
                  right(1,j) = right(1,j)+score_right(i,j);
                  
          end  
      end
      score(j) = abs(left(1,j)) +abs(right(1,j));
  end
  
% Find the maximum score
   [m,I_max] = max(score);
   
% assign optimal value to parameters
  f_opt =feature1;
  thea_opt = theta(I_max);
  y_opt =sign(h(:,I_max)-y);
  h = h(:,I_max);
  


