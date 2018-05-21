%ex 1
x=0:0.01:1;
y=exp(10.*x.*(x-1)).*sin(12.*pi.*x);
% plot(x,y);
y2=exp(5.*x.^2-1).*sqrt(3.*cos(12.*pi.*x));
%plot(x,y2);

%ex1 ca y functie

x=0:0.01:1;
f1=@(x) exp(10.*x.*(x-1)).*sin(12.*pi.*x);
y3=f1(x);
plot(x,y3,'red');
title('My title');


%ex2
a=12;
b=1;
fx = @(t) (a+b).*cos(t)-b.*cos((a./b+1).*t);
fy =  @(t) (a+b).*sin(t)-b.*sin((a./b+1).*t);
t=0:0.1:10*pi;
plot(fx(t),fy(t));

%ex3
x=0:0.01:2*pi;
f31 = @(x)cos(x);
f32 = @(x)sin(x);
f33 = @(x)cos(2.*x);
plot(x,f31(x),x,f32(x),x,f33(x));

%ex4
x1=0:2:50;
x2=1:2:49;
f1x= @(x) x./2;
f2x =@(x) 3.*x+1;
plot(x1,f1x(x1),'*',x2,f2x(x2),'o');

%ex5
n=6;
s=1;
for i=1:n
    
    s=1+1./s;
end
s

%ex6
x=-2:0.1:2;
y=-4:0.1:4;
[X,Y] = meshgrid(x,y);
[X,Y]
g= exp(-1*((X-1/2).^2+(Y-1/2).^2));
mesh(X,Y,g);




