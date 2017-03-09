function [ErrorM] = testing(X0,X1,f_opt,thea_opt)

% Test the rest data
t0_feature = X0(:,f_opt);
t1_feature = X1(:,f_opt);
t_feature = [t0_feature;t1_feature];
t_labels = [ones(length(X0),1).*(-1);ones(length(X1),1)];

result=[];
for i = 1:length(t_feature)
    if t_feature(i) > thea_opt
        class = 1;
    else
        class = -1;
    end
    result = [result;class]; 
end
ErrorM  = sum(t_labels ~= result) / length(t_labels);

