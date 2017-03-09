%% Initialization
clear all; close all; clc
%% Question 3
fprintf('Running Gradient Descent ...\n')
%% Load file
data = load('optdigitsubset.txt');
num = length(data);
X = data((1:num),:);
% initialize fitting parameters
initial_mn = zeros(1,64); 
initial_mp = zeros(1,64);
lambda = [0 10^2 10^3 10^6];
for i = 1:1:4
    % Some gradient descent settings
iterations = 300;
alpha = 0.0000001;
% compute initial cost
L_initial = lossFunction(initial_mn,initial_mp,X,lambda(i));

% run gradient descent
[mn,mp] = gradientDescent(X, initial_mn, initial_mp, alpha, iterations,lambda(i));
fprintf('Mean found by gradient descent: \n');
% mp
img = reshape(mp,[8,8]);
img = transpose(img);
img = mat2gray(img);
figure
imshow(img,'InitialMagnification','fit'); %fit the screen
% mn
img = reshape(mn,[8,8]);
img = transpose(img);
img = mat2gray(img);
figure
imshow(img,'InitialMagnification','fit'); %fit the screen
%GDD = gradientdescent(initial_mn,initial_mp,);
end 

