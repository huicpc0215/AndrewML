x = load('./ex3x.dat');
y = load('./ex3y.dat');
m = length(y);

x = [ones(m,1),x];
sigma = std(x);
mu = mean(x);
x(:,2)=( x(:,2)-mu(2))./sigma(2);
x(:,3)=( x(:,3)-mu(3))./sigma(3);

theta_val=zeros(1,3);
j_val=zeros(100,1);
a = 0.5;
for i = 1:100
    t = theta_val';
    j_val(i)=0.5/m*sum( (x*t)-y .* (x*t-y) ) ;
    theta_val = theta_val - a/m * ( (x*theta_val')'-y')*x;
end
plot([1:100],j_val);
theta_val

nx=[1,(1650-mu(2))/sigma(2),(3-mu(3))/sigma(3)];
val=theta_val*nx'
