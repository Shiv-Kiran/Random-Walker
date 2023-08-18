%CS215 Assignment 1 Ques 1
%LAW OF LARGE NUMBERS 
%author: 200050019 Shiv Kiran Bagathi
%        200050064 Kumar Satyam

%NOTE: BOTH UNIFORM AND GAUSSIAN DISTRIBUTION CODE IS IN THIS FILE


N = [5,10,20,40,60,80,100,500,1000,10000]; %dataset sizes

%UNIFORM DISTRIUTION

true_uniform_mean = 0.5;
%for uniform distribution over [a,b] the theoretical mean is (a+b)/2 

errors_data_uniform = zeros(100,10); %10 is length of N
% errors_data is to store the error difference b/w computed mean and true mean
%for all 100 iterations of each of N instances of dataset sizes

for i = N
    rng(i);
    dataset_uniform = rand(100,i);
    %creating a random normal matrix containing all 100 iteration datasets
    mean_set_uniform = mean(dataset_uniform,2);
    %taking mean row wise
    errors_data_uniform(:,find(N==i)) = abs(mean_set_uniform - true_uniform_mean);
    %calculating error row wise
end

%UNIFORM DISTRIBUTION ERROR OF MEAN BOXPLOT
fig1 = figure;
boxplot(errors_data_uniform,"Labels",N);
xlabel("Values of N");
ylabel("Error for Uniform Distribution Mean");
saveas(fig1,"Uniform_Distribution.png");






%GAUSSIAN DISTRIUTION       with parameters mu = 0 and sigma^2 = 1

true_gaussian_mean = 0;
%for gaussian distribution the theoretical mean is mu 

errors_data_gaussian = zeros(100,10); %10 is length of N
% errors_data is to store the error difference b/w computed mean and true mean
%for all 100 iterations of each of N instances of dataset sizes

for i = N
    rng(i);
    dataset_gaussian = randn(100,i);
    %creating a normal random matrix containing all 100 iteration datasets
    mean_set_gaussian = mean(dataset_gaussian,2);
    %taking mean row wise
    errors_data_gaussian(:,find(N==i)) = abs(mean_set_gaussian - true_gaussian_mean);
    %calculating error row wise
end

%GAUSSIAN DISTRIBUTION ERROR OF MEAN BOXPLOT
fig2 = figure;
boxplot(errors_data_gaussian,"Labels",N);
xlabel("Values of N");
ylabel("Error for Gaussian Distribution Mean");
saveas(fig2,"Gaussian_Distribution.png");





%INTERPRETATION

%The above problem deals with the concept of "LAW OF LARGE NUMBERS"

%for initial experiments when the number of trials were less the epected
%mean was deviating significantly from the true mean but as we started
%using more number of trials the calculated mean from different experiments
%started approaching closer and closer to the true mean

%as the calculated average uses data from more and more number of
%experiments the event " calculated average being farther from u than a real
%number epsilon > 0 " tends to 0




