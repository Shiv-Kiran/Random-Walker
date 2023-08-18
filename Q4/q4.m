%CS215 Assignment 1 Ques 1
%CENTRAL LI
%author: 200050019 Shiv Kiran Bagathi
%        200050064 Kumar Satyam

clear all
close all

% TASK 1 detailed FUNCTION X_draw BELOW CODE SCRIPT

rng(1.618034); %to reproduce the good looking X_histogram 
M = X_draw(100000,1); % 10^5 draws of Px(.)

% TASK 2 PLOTTING HISTOGRAM AND CDF of X
h = figure;
bins = 200;
histogram(M,bins); %histogram of X
xlabel('x');
ylabel('number of draws');
title('X histogram');
saveas(h,"X_histogram.png")

x_line = linspace(-2,2,800);
X_cdf = zeros(1,800);
for i = 1:800
    X_cdf(i) = sum(M < x_line(i))/100000;
end
fig_X_cdf = figure;
plot(x_line,X_cdf,"r"); %plot of CDF of X
xline(0,'-',{'x=0'});
xlabel('x');
ylabel("CDF values");
title("CDF of continuous peicewise Distribution X using independent draws");
saveas(fig_X_cdf,"X_CDF.png")

% TASK 3 detailed FUNCTION YN_draw BELOW CODE SCRIPT

% TASK 4 PLOTTING PYn(.) HISTOGRAMS AND COMBINED CDF FOR DIFFERENT N's
N = [1,2,4,8,16,32,64];
y_line = linspace(-1,1,800);
Y_cdf = zeros(7,800);
Q = zeros(1,10000,7);
for i = 1:7
   Q(:,:,i) = YN_draw(N(i),1,10000);
   if (N(i) ~= 1)
      his = figure;
      histogram(Q(:,:,i),200);
      xlabel('y');
      ylabel('number of draws');
      title(strcat('Y',num2str(N(i)),' histogram'));
      saveas(his,strcat('Y_',num2str(N(i)),'_histogram.png')) 
   end
   for j = 1:800
      Y_cdf(i,j) = sum(Q(:,:,i) < y_line(j))/10000;
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
histgm = figure;
tiledlayout(2,3);
for i = 2:7
    nexttile;
    histogram(Q(:,:,i),200);
    xlabel('y');
    ylabel('number of draws');
    title(strcat('Y',num2str(N(i)),' histogram'));
end
saveas(histgm,'Y_histogram.png')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
fig_Y_cdf = figure;
for i = 1:7
    plot(y_line,Y_cdf(i,:),'DisplayName',strcat('Y',num2str(N(i))));
    hold on;
end
xline(0,'-','y=0','DisplayName','y=0');
xlim([-1.2,1.2]);
xlabel('y');
ylabel("CDF values");
title("CDF of Yn with different N using independent draws");
legend('Location','southeast');
saveas(fig_Y_cdf,"Y_CDF.png")




function output = pdf_x(x) %the M PDF given in question
  if(abs(x) > 1)
      output = 0;
  else
      output = abs(x);
  end
end




% TASK 1   GENERATE INDEPENDENT DRAWS FROM Px(.)
function output = X_draw(m,n) 
  %m,n are necessary final output 2D matrix size values to be given as arguments
  %basic idea here is to create a dataset of x's which follows the M PDF
  %and then choosing random element from this dataset for any draw demand
  
  x_values = [];  %dataset collection
  x_line = linspace(-1,1,400);
  for i = x_line
     pr = pdf_x(i)*(2/400)*(10000);
     %floor(pr) is the number of datapoints this interval should get accd
     %to M
     %10000 is total number of datapoints to be generated in the dataset
     x_values = [x_values (i+rand(1,floor(pr))*(2/400))]; 
     %concatenating the data points generated to the dataset
  end
  
  % taking permutation of dataset 
  new_index = randperm(length(x_values));
  x_perm_values = zeros(1,length(x_values));
  for i = 1:length(x_values)
      x_perm_values(new_index(i)) = x_values(i);
  end
  
  % choosing m*n datpoints randomly to make the m*n output draw matrix
  index_matrix = randi(length(x_values),m,n);
  output = x_perm_values(index_matrix);
end




% TASK 3   GENERATE INDEPENDENT DRAWS FROM PYn(.)
function output = YN_draw(N,m,n)
  %m,n are necessary final output 2D matrix size values to be given as arguments
  %basic idea here is to take m*n*N random draws of P(x) as dataset
  %and then taking their mean across third dimension
  %this will give a m*n matrix of the means which is th reqd Y draws matrix 
  
  X_values = zeros(m,n,N); 
  % X values matrix for m*n*N draws for m*n yN's
  
  % N iterations of Xi's for each draw whose average will be taken to get yN 
  for i = 1:N
      rng(i); % to avoid giving same draws for PYn(.) when later used
      X_values(:,:,i) = X_draw(m,n); 
  end
 
  output = mean(X_values,3); % the m*n output matrix of yN's
end












