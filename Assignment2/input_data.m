function [x,y] = input_data(source)

load data_x.mat
load data_y.mat
data = load ('optdigitsubset.txt');

case_condition = source;

switch case_condition
    case 1
        x = a;
        y =labels;
        for i = 1: size(x,1)
             if y(i) == 2
                 y(i) = -1; 
             else
                 y(i) = 1;
             end
        end
                x = prdataset(a,labels);
        
    case 2
        test = gendats(100);
        x = test;
      y = test.labels;
        for i = 1: size(test,1)
             if y(i) == 2
                 y(i) = -1; 
             else
                 y(i) = 1;
             end
        end
    case 3
        % complicated dataset
        % labels are type 'char'
          test = gendatb(100);
          x = test;
          y = test.labels;
          yy = zeros(100,1);
            for i = 1: size(test,1)
                 if y(i) == '2'
                     yy(i,1) = -1; 
                 else
                     yy(i,1) = 1;
                 end
            end
            x = prdataset(x.data,yy);
            y = yy;
    otherwise
        class0 = data((1:554),:);
        class1 = data((555:end),:);
        idx0 = randperm(size(class0,1),50);
        idx1 = randperm(size(class1,1),50);
        r0 = class0(idx0,:);
        r1 = class1(idx1,:);
        r = [r0;r1];
        y = [ones(50,1).*(-1);ones(50,1)];
        input1 = prdataset(r,y);

x = a;
y = labels;
for i = 1: length(y)
    if y(i) == 2
        y(i) = -1; 
    end
end
input1 = prdataset(x,y);
end