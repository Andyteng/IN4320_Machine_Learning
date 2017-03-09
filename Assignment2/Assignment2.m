%% Initialization Machine Learning Exercise 2
clear all; close all; clc
%% ======================= Question 1: Prove =======================
% % question 1
% x = linspace(-5,1);
% y1 = x;
% y2 = y1+log((1-x));
% figure;
% plot(x,y2);
% xlabel('x');
% ylabel('y');
% 
% % hold on;
% % plot(x,y2);
% % hold off;
% % legend('y1','y2');
% ======================= Question 2: weak learner =======================

load data_x.mat
load data_y.mat

input1 = prdataset(a,labels);
[f_opt,thea_opt,y_opt] = stump(input1);

% used to test threshold
figure;
scatterd(input1,'legend');
hold on;
stem(thea_opt, 4,'b');
stem(thea_opt, -4, 'b');
title('Decision Stump');
xlabel('feature 1');
ylabel('feature 2');

%% ===================== Question 3: Test with 'gendats' ==================
% input2 = gendats([40 40], 2 ,2);
% [f_opt,thea_opt,y_opt] = stump(input2);
% 
% % used to test threshold
% figure;
% scatterd(input2,'legend');
% hold on;
% stem(thea_opt, 4,'b');
% stem(thea_opt, -4, 'b');
% title('Generated Dataset');
%% ================ Question 4: Test with 'optdigitsubset' ================
data = load('optdigitsubset.txt');
load data_x.mat
load data_y.mat
num = length(data);
X = data((1:num),:);
class0 = X((1:554),:);
class1 = X((555:end),:);

train_0 = X((1:50),:);
train_1 = X((555:604),:);
a3 = [train_0; train_1];
input3 = prdataset(a3,labels);
% optimal value from training data
[f_opt,thea_opt,y_opt] = stump(input3);

% testing error
test_0 = X((51:554),:);
test_1 = X((605:end),:);
errorE = testing(test_0,test_1,f_opt,thea_opt);

%% Question 4b take random subset of 50 for training
data = load('optdigitsubset.txt');
load data_x.mat
load data_y.mat
num = length(data);
X = data((1:num),:);
class0 = X((1:554),:);
class1 = X((555:end),:);

error_r =[];
for i = 1:50
idx0 = randperm(size(class0,1),50);
idx1 = randperm(size(class1,1),50);

r0 = class0(idx0,:);
r1 = class1(idx1,:);
r = [r0;r1];
labels_r = [ones(50,1).*(-1);ones(50,1)];

input_r = prdataset(r,labels_r);
[f_opt,thea_opt,y_opt] = stump(input_r);

test_0 = X((51:554),:);
test_1 = X((605:end),:);
errorE = testing(test_0,test_1,f_opt,thea_opt);
error_r = [error_r;errorE];
end

error_mean = mean(error_r);
error_std = std(error_r);

%% Question e--adaboost

load data_x.mat
load data_y.mat

for i = 1:100
    if labels(i,:)==2
        labels(i,:)=0;
    end
end


load optdigitsubset.mat

x1 = ex1([1:50],:);
x2 = ex1([555:604],:);
x  = [x1;x2];
y  = [ones(50,1).*(-1);ones(50,1)];

N = 100; % X training labels
w = 1/N * ones(N,1); %Weights initialization
M = 100; % Number of boosting iterations 

for m=1:M
    p = w ./ sum(w);
    [stump,h] = build_stump(x,y,p);
    error = stump.werr;
    beta = error/(1-error);
    beta_1 = ones(size(w)) * beta;
   w = w.*(beta.^(ones(100,1)-abs(h-y)));
end




