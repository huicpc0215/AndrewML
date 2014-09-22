x = load('./ex4x.dat');
y = load('./ex4y.dat');
m = length(y);
x = [ones(m,1),x];
theta=zeros(3,1);
pos=find(y==1);
nag=find(y==0);
g = inline('1.0 ./ (1.0 + exp(-z))'); 
plot(x(pos,2),x(pos,3),'+');hold on;
plot(x(nag,2),x(nag,3),'o')
jv=zeros(10,1);
for i=1:10
    jv(i)=j_val(x,y,theta);
    H = zeros(3,3);
    pre = g(x*theta).*( ones(m,1) - g(x*theta));
    for j=1:m
        H = H + pre(i)*x(i,:)'*(x(i,:));
    end
    H = H / m;
    theta = theta - pinv(H)*x'*( g(x*theta)-y)/m;
end
figure;
plot([0:9],jv);
