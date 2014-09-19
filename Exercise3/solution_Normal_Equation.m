x =load('./ex3x.dat');
y =load('./ex3y.dat');
m = length(y);
x = [ones(m,1),x];
theta_val=pinv(x'*x)*x'*y;
theta_val
nx=[1,1650,3];
%prediction
val=nx*theta_val



