%CS215 Assignment 1 Ques 1
%POISSON SUM AND THINNING
%author: 200050019 Shiv Kiran Bagathi
%        200050064 Kumar Satyam

clear all;
rng(0);

%ANALYSIS OF SUM PMF Z = X + Y

x_instances = poissrnd(3,[1 1000000]); %lambda_X = 3
y_instances = poissrnd(4,[1 1000000]); %lambda_Y = 4
z_sum_result = x_instances + y_instances;

estimated_sum_PMF = round([hist(z_sum_result,0:25)]*(1/1000000),4)

%since X and Y are independent thus lamda_Z of Z = X + Y will be
%lambda_z = lambda_X + lambda_Y = 3 + 4 = 7
theoretical_sum_PMF = round(poisspdf(0:25,7),4)

%show and comparison
fig_sum=figure;
plot(0:25,estimated_sum_PMF,'r*',"DisplayName","Empirically Estimated sum PMF");
hold on;
plot(0:25,theoretical_sum_PMF,'b-o',"DisplayName","Theoretical sum PMF");
hold on;
plot(0:25,abs(estimated_sum_PMF-theoretical_sum_PMF),'g',"DisplayName","difference between both");
xlabel("Values of k");
ylabel("Values of sum PMF");
legend();
saveas(fig_sum,"Sum_PMF.png");




%ANALYSIS OF THINNING PMF Z = Y_THINNED

y_inst = poissrnd(4,[1 100000]); %lambda_Y = 4
thinned_z = binornd(y_inst,0.8); %probability parameter is 0.8

estimated_thinning_PMF = round([hist(thinned_z,0:25)]*(1/100000),4)

%since Y is being thinned by probability parameter 0.8 thus lamda_Z of Z = poison thinning(Y) will be
%lambda_z = lambda_Y * probability parameter = 4 * 0.8 = 3.2
theoretical_thinning_PMF = round(poisspdf(0:25,3.2),4)

%show and comparison
fig_thinning=figure;
plot(0:25,estimated_thinning_PMF,'r*',"DisplayName","Empirically Estimated thinning PMF");
hold on;
plot(0:25,theoretical_thinning_PMF,'b-o',"DisplayName","Theoretical thinning PMF");
hold on;
plot(0:25,abs(estimated_thinning_PMF-theoretical_thinning_PMF),'g',"DisplayName","difference between both");
xlabel("Values of k");
ylabel("Values of sum PMF");
legend();
saveas(fig_thinning,"Thinning_PMF.png");



















