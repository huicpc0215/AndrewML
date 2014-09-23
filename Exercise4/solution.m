x = load('./ex4x.dat');
y = load('./ex4y.dat');
m = length(y);
n = length(x(1,:));
x = [ones(m,1),x];
theta=zeros(3,1);
pos=find(y==1);
nag=find(y==0);
g = inline('1.0 ./ (1.0 + exp(-z))'); 
figure(1);
subplot(1,2,1);
plot(x(pos,2),x(pos,3),'+');hold on;
plot(x(nag,2),x(nag,3),'o')
jv=zeros(1,6);
pre = zeros(m,1);
for i=1:6
    jv(i)=j_val(x,y,theta);
    H = zeros(n+1,n+1);
    pre = g(x*theta).*( ones(m,1) - g(x*theta) ) ;
    for j=1:m
        H = H + pre(j)*x(j,:)'*(x(j,:));
    end
    H = H ./ m;
    theta = theta - inv(H)*( x'*( g(x*theta)-y) )./m;
end
theta
subplot(1,2,2);
plot([0:5],jv);

