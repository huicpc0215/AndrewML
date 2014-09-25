x=load('./ex5Linx.dat');
y=load('./ex5Liny.dat');
m=length(y);
figure(1)
plot(x,y,'o');
basex=x;

x2=x.*x;
x3=x2.*x;
x=[ones(m,1),x,x.^2,x.^3,x.^4,x.^5];
n=5;

base=[-1:0.05:1];
xc=[-1:0.05:1]';
xl=length(xc);
xc=[ones(xl,1),xc,xc.^2,xc.^3,xc.^4,xc.^5];

figure(2)

lambda = 0;
theta = pinv(x'*x+lambda*[0,zeros(1,n);zeros(n,1),eye(n,n)])*x'*y;
yc=xc*theta;
subplot(1,3,1);
plot(basex,y,'bo'); hold on;
plot(base,yc,'r--');
legend('origin point','prediction');

%figure(3);
lambda = 1;
subplot(1,3,2);
theta = inv(x'*x+lambda*[0,zeros(1,n);zeros(n,1),eye(n,n)])*x'*y;
yc=xc*theta;
plot(basex,y,'bo'); hold on;
plot(base,yc,'r--');
legend('origin point','prediction');

%figure(4);
subplot(1,3,3);
lambda = 10;
theta = inv(x'*x+lambda*[0,zeros(1,n);zeros(n,1),eye(n,n)])*x'*y;
yc=xc*theta;
plot(basex,y,'bo');hold on;
plot(base,yc,'r--');
legend('origin point','prediction');
figure(5);
plot(basex,y,'o');
