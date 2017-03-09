%% Initialization
clear all; close all; clc
%% Question 2c
x1 = -1;
x2 = 1;
x3 = 3;
x4 = -1;
X = [x1,x2,x3,x4];
lbd = [0 2 4 4];
lbd_num = length(lbd);
m_pos = -8:.02:8;
m_nag = -8:.02:8;
%define the coordinates
%alone x and y
[mm_pos,mm_nag] = meshgrid(m_pos,m_nag);
L1 = lossFunction_1(X,mm_pos,mm_nag,lbd(1));
L2 = lossFunction_1(X,mm_pos,mm_nag,lbd(2));
L3 = lossFunction_1(X,mm_pos,mm_nag,lbd(3));
L4 = lossFunction_1(X,mm_pos,mm_nag,lbd(4));
figure;
surfc(mm_pos,mm_nag,L1);
colorbar;
xlabel('m_+');
ylabel('m_');
zlabel('L(m_-,m_+)');
shading interp;

min(L4);      % delivers a vector of the minimum in every column
MinV=min(min(L4)); % delivers the value we are looking for
[r,c] = find(L4==MinV); % gives two arguments
y= m_pos(c);
x= m_nag(r);


