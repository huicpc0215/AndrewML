x = load('./ex2x.dat');
y = load('./ex2y.dat');
plot(x,y,'o');
ylabel('Height in meters')
xlabel('Age in years')
x = [ones(1,length(y)),x];
j_vals = zeros(100,100);
theta0_vals = linspace(-3,3,100);
theta1_vals = linspace(-1,1,100);
for i = 1 : length (theta0_vals)
    for j = 1 : length ( theta1_vals )
        t = [theta0_vals(i); theta1_vals(i)];
        j_vals(i,j)= 0.01 * sum( ( x * t - y ).* ( x * t -  y) );
    end
end
theta_val=[0,0];
a=0.07;
theta_val = theta_val - a *0.02 *( (x*theta_val')'-y')*x;
%for i = 1 : 2000

%plot the surface plot
j_vals = j_vals';
figure;
surf(theta0_vals,theta1_vals,j_vals);
xlabel('\theta0');
ylabel('\theta1');

