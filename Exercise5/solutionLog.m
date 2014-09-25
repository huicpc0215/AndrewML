x=load('./ex5Logx.dat');
y=load('./ex5Logy.dat');
figure(1);
pos=find(y==1);
nag=find(y==0);
plot(x(pos,1),x(pos,2),'+')
hold on
plot(x(nag,1),x(nag,2),'o')
legend('y==1','y==0');

basex=x;
x=map_feature(x(:,1),x(:,2));
m=length(y);
n=27;
g = inline('1.0 ./ (1.0 + exp(-z))'); 

theta=zeros(n+1,1);
lambda=0;
for i=1:15
    delta_theta=( x'*( g(x*theta)-y ) - lambda*[0;theta(2:n+1,1)])/m;
    H=zeros(n+1,n+1);
    pre=g(x*theta).*(ones(m,1)-g(x*theta));
    for j=1:m
        H=H+pre(j)*x(j,:)'*x(j,:);
    end
    H=H+lambda*[0,zeros(1,n);zeros(n,1),eye(n,n)];
    H=H/m;
    theta = theta - pinv(H)*delta_theta;
end
u=linspace(-1,1.5,200);
v=linspace(-1,1.5,200);
z=zeros(length(u),length(v));
for i=1:length(u)
    for j=1:length(v)
        z(j,i)=map_feature(u(i),v(j))*theta;
    end
end
norm(theta)
figure();
plot(basex(pos,1),basex(pos,2),'+');hold on;
plot(basex(nag,1),basex(nag,2),'o');hold on;
contour(u,v,z,[0,0],'LineWidth',2);

theta=zeros(n+1,1);
lambda=1;
for i=1:15
    delta_theta=( x'*( g(x*theta)-y ) - lambda*[0;theta(2:n+1,1)])/m;
    H=zeros(n+1,n+1);
    pre=g(x*theta).*(ones(m,1)-g(x*theta));
    for j=1:m
        H=H+pre(j)*x(j,:)'*x(j,:);
    end
    H=H+lambda*[0,zeros(1,n);zeros(n,1),eye(n,n)];
    H=H/m;
    theta = theta - pinv(H)*delta_theta;
end
u=linspace(-1,1.5,200);
v=linspace(-1,1.5,200);
z=zeros(length(u),length(v));
for i=1:length(u)
    for j=1:length(v)
        z(j,i)=map_feature(u(i),v(j))*theta;
    end
end
norm(theta)
figure();
plot(basex(pos,1),basex(pos,2),'+');hold on;
plot(basex(nag,1),basex(nag,2),'o');hold on;
contour(u,v,z,[0,0],'LineWidth',2);

theta=zeros(n+1,1);
lambda=10;
for i=1:15
    delta_theta=( x'*( g(x*theta)-y ) - lambda*[0;theta(2:n+1,1)])/m;
    H=zeros(n+1,n+1);
    pre=g(x*theta).*(ones(m,1)-g(x*theta));
    for j=1:m
        H=H+pre(j)*x(j,:)'*x(j,:);
    end
    H=H+lambda*[0,zeros(1,n);zeros(n,1),eye(n,n)];
    H=H/m;
    theta = theta - pinv(H)*delta_theta;
end
u=linspace(-1,1.5,200);
v=linspace(-1,1.5,200);
z=zeros(length(u),length(v));
for i=1:length(u)
    for j=1:length(v)
        z(j,i)=map_feature(u(i),v(j))*theta;
    end
end
norm(theta)
figure();
plot(basex(pos,1),basex(pos,2),'+');hold on;
plot(basex(nag,1),basex(nag,2),'o');hold on;
contour(u,v,z,[0,0],'LineWidth',2);
