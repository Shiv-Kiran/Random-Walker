%CS215 Assignment 1 Ques 1
%RANDOM WALKERS 
%author: 200050019 Shiv Kiran Bagathi
%        200050064 Kumar Satyam

clear all;
close all;

N = 10000; %no. of random walkers
step_count = 1000; %no. of steps

rng(13);
 
step_decisions = binornd(1,0.5,[10000 1000]) ;
   %since random walker makes decision right or left with equal probability
   % 0 represents left and 1 represents right on number line
   % 10000 rows for 10000 walkers 
   % 1000 columns for 1000 steps
step_decisions(step_decisions == 0) = -1 ;
   % changing all 0's to -1 for clarity and ease in meaning in calculations
step_values = step_decisions*0.001 ;
   % given step length is 0.001 
cum_displacement = cumsum(step_values(1:1000,:),2);
   % cumulative displacement of first 1000 walkers wrt no. of steps for the
   % space-time plot
displacement_data = sum(step_values,2) ;
   % final displacement of all walkers after 1000 steps

   
   
%histogram plot 
histgm = figure;
hist(displacement_data,200);
xlabel('displacement');
ylabel('No. of random walkers');
title('final location of all random walkers');
saveas(histgm,'final_loc_rand_walkers.png')
 

%space-time plot
space_time = figure;
for i = 1:1000   %loop for plotting first 100 walkers displacement vs steps count graph
   plot(cum_displacement(i,:));
   hold on;
end
xlabel('time in units of steps');
ylabel('displacement of random walker');
title('space-time curve of random walker paths');
saveas(space_time,'space_time.png')

format longG;
% empirical mean and variance
empirical_mean = mean(displacement_data)
deviation_data = abs(displacement_data - empirical_mean) ;
empirical_variance = mean(deviation_data.*deviation_data)

%the random distribution with random variables modelling the location of
%the random walkers follows gaussian distribution

%with n = no. of steps and s = step_length then the P(x) of location of
%random walker to be x is given by gaussian PDF with 
% mu = 0 and sigma^2 = n*(s^2)
% P(x) = (1/sqrt(2*pi*sigma^2))exp{(-1/2)*((x-mu)^2/sigma^2)}
% P(x) = (1/sqrt(2*pi*n*s^2))exp{(-1/2)*(x^2/n*s^2)}

% any gaussian distribution have 
% mu as its true mean and
% sigma^2 as its true variance

% true mean and variance
true_mean = 0 %as mu is 0 for P(x)
true_variance = 1000*(0.001).^2 %as sigma^2 is n*s^2 with n=1000 and s=0.001

% errors in mean and variance
error_mean = abs(true_mean-empirical_mean)
error_variance = abs(true_variance-empirical_variance)

format shortG;
 
 
 
 
 
 
 
 
 
 
 
 