%CS215 Assignment 1 Ques 1
%PMF CDF PLOTS AND VARIANCE
%author: 200050019 Shiv Kiran Bagathi
%        200050064 Kumar Satyam

clear all;
syms x 


% Laplace Distribution \mu =2 b =2

x_l = linspace(-30,34,512); 
laplace_pdf = @(x) 1/(2*2)*(exp(-abs(2-x)/2)); % u =2,b=2
y_l_pdf = laplace_pdf(x_l);

%using riemann sum
y_l_cdf = cumsum(y_l_pdf*(64/512));
y_l_mean = sum(y_l_pdf.*x_l)*(64/512);
y_l_mean_square = sum((y_l_pdf.*x_l).*x_l)*(64/512);
y_l_var = y_l_mean_square - y_l_mean*y_l_mean
tolerance_l = abs(8-y_l_var) %true var = 2*(b^2)

%PDF PLOT
fig_l_pdf=figure;
plot(x_l,y_l_pdf,'r','DisplayName','u=2, b=2');
xline(2,'-',{'u=2'});
xlabel('x');
ylabel("Probability values of Laplace Distribution");
title("PDF of Laplace Distribution");
legend;
saveas(fig_l_pdf,"Laplace_PDF.png");

% CDF PLOT
fig_l_cdf=figure;
plot(x_l,y_l_cdf,"b","DisplayName",'u=2, b=2');
xline(2,'-',{'u=2'});
xlabel('x');
ylabel("CDF values of Laplace Distribution");
title("CDF of Laplace Distribution")
legend;
saveas(fig_l_cdf,"Laplace_CDF.png");




% Gumbel Distribution \mu =1 \beta =2

x_g = linspace(-10,30,400); 
gumbel_pdf = @(x) 1/2*(exp(-((x-1)/2)-exp(-(x-1)/2))); % u=1 beta=2
y_g_pdf = gumbel_pdf(x_g);

%using riemann sum
y_g_cdf = cumsum(y_g_pdf*(40/400));
y_g_mean = sum(y_g_pdf.*x_g)*(40/400);
y_g_mean_square = sum((y_g_pdf.*x_g).*x_g)*(40/400);
y_g_var = y_g_mean_square - y_g_mean*y_g_mean
tolerance_g = abs(pi*pi*2/3-y_g_var) %true var = (pi^2 * beta^2)/6
%PDF PLOT
fig_g_pdf=figure;
plot(x_g,y_g_pdf,'r','DisplayName','PDF of Gumbel Distribution');
xline(1,'-',{'u=1'});
xlabel('x');
ylabel("Probalities of Gumbel Distribution");
title("PDF of Gumbel Distribution");
legend;
saveas(fig_g_pdf,"Gumbel_PDF.png");

%CDF PLOT
fig_g_cdf=figure;
plot(x_g,y_g_cdf,"b","DisplayName","CDF");
xline(1,'-',{'u=1'});
xlabel('x');
ylabel("CDF values of Gumbel Distribution");
title("CDF of Gumbel Distribution");
legend;
saveas(fig_g_cdf,"Gumbel_CDF.png");




%Cauchy Distribution x_0 = 0, \gamma =1
x_c = linspace(-6,6,300);
cauchy_pdf = @(x) 1./(pi*(1 + x.^2));
y_c_pdf = cauchy_pdf(x_c);

%using riemann sum
y_c_cdf = cumsum(y_c_pdf*(12/300));

%PDF PLOt
fig_c_pdf=figure;
plot(x_c,y_c_pdf,'r','DisplayName','PDF of Cauchy Distribution');
xline(0,'-',{'x_0=0'});
xlabel('x');
ylabel("Probability values of Cauchy Distribution");
title("PDF of Cauchy Distribution");
legend;
saveas(fig_c_pdf,"Cauchy_PDF.png");

% CDF PLOT
fig_c_cdf=figure;
plot(x_c,y_c_cdf,'b','DisplayName','CDF of Cauchy Distribution');
xline(0,'-',{'x_0=0'});
xlabel('x');
ylabel("CDF values of Cauchy Distribution");
title("CDF of Cauchy Distribution");
legend;
saveas(fig_c_cdf,"Cauchy_CDF.png");