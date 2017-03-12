function [err_f] = AdaBoost(x,y,T)


N = length(y); % X training labels
w = 1/N * ones(N,1); %Weights initialization
h = zeros(N,T);
beta = zeros(1,T);
error = zeros(T,1);

for t=1:T
    p = w ./ sum(w);
    [f_opt,thea_opt,h(:,t)] = stump(x,p); % call weak learner
    error(t,1) = sum(p.*abs(sign(h(:,t)-y)));
    display(thea_opt);
    display(error(t,1));
    beta(1,t) = error(t,1)/(1-error(t,1));
    w = w.*(beta(1,t).^(ones(100,1)-abs(sign(h(:,t)-y))));
    

    % used to test threshold
    flag = 1;
    
    if flag == 1
    figure;
    scatterd(x,'legend');
    hold on;
    top = max(x.data(:,2));
    bottom = min(x.data(:,2));
    stem(thea_opt, top+1,'b');
    stem(thea_opt, bottom-1, 'b');
    title('Decision Stump');
    xlabel('feature 1');
    ylabel('feature 2');
    end
end

     showfigs;
    
     %output hf
     hf_left = sum(transpose(log(1./beta).*h));
     hf_right = 1/2*sum(log(1./beta));
     
     hf = zeros(N,1);
     for i = 1:N
         if hf_left(i) >= hf_right
             hf(i,1) = 1;
         else
             hf(i,1) = 0;
         end
     end
     err_f = abs(sum(sign(hf-y)))/N;
