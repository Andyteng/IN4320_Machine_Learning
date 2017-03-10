function [DS] = createDS(x0,x1) 

load data_x.mat
load data_y.mat
load optdigitsubset.mat

x = [x0;x1];
DS = prdataset(x,labels);

