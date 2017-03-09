%% Initialization
clear all; close all; clc
%% Assignment 1
% Question 1a
% parameter
m_nag = 1;
x1 = -1;
x2 = 1;
m_pos = -4:.02:4;
m_zero = -4:.02:4;
m_one = -16:.02:16;
lbd = [0 2 4 6];
m = zeros(1,4);
m_gra = zeros(1,4);
FX = zeros(4,401);
% FY = zeros(1,401);
co_x = zeros(1,4);
co_gra_x = zeros(1,4);
co_gra_y = zeros(1,4);
% calculation
for i = 1:1:4
L = (x1-m_pos).^2+ (x2-m_pos).^2+lbd(i)*abs(m_nag-m_pos);
FX(i,:) = gradient(L);
[m_gra(i),ind_gra] = min(abs(FX(i,:)));
co_gra_x(i) = m_pos(ind_gra);
co_gra_y(i) = L(ind_gra);
[m(i),ind] = min(L);
co_x(i) = m_pos(ind);
plot(m_pos,L);
hold on;
end

legend ('lbd=0','lbd=2','lbd=4', 'lbd=6');
xlabel ('m_+')
ylabel ('L(m_-,m_+)');
title ('Optima with only m_+ optimization');
%% ======================= Question 3: Experimenting =======================
data = load('optdigitsubset.txt');
num = length(data);
X = data((1:num),:);
class0 = X((1:554),:);
class1 = X((555:end),:);
mp = meanValue(class0);
mn = meanValue(class1);
for n = 1:3
    switch n
        case 1
            lambda = 0;
            L1 = lossFunction(mp,mn,X,lambda);
        case 2
            lambda = 10^3;
            L2 = lossFunction(mp,mn,X,lambda);
        otherwise
            lambda = 10^6;
            L3 = lossFunction(mp,m_nag,X,lambda);
    end
end

%% Question 3c
% mp
img = reshape(mp,[8,8]);
img=transpose(img);
img = mat2gray(img);
figure
imshow(img,'InitialMagnification','fit'); %fit the screen
% mn
img = reshape(mn,[8,8]);
img=transpose(img);
img = mat2gray(img);
figure
imshow(img,'InitialMagnification','fit'); %fit the screen