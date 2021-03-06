%ex1
a = 0;
b = 1;
points = -1:0.1:2;
n = length(points);
f= @(x) 2./(1+x.^2);
trapez = (b-a)/2 *(f(a)+f(b))
simpson = ((b-a)/6).*(f(a)+f(b)+4.*f((a+b)/2))

xnodes=[0,0,1,1];
ynodes = [0,f(0),f(1),0];

plot(points,f(points));
hold on;
plot(xnodes,ynodes);

legend('function','trapez');

%ex2
a=1.4;
b=2;
c=1;
d=1.5;
f= @(x, y) log(x+2.*y);
doubleTrapez = (((b-a)*(d-c))/16)*(f(a,c)+f(a,d)+f(b,c)+f(b,d)+2*f((a+b)/2,c)+2*f((a+b)/2,d)+2*f(a,(c+d)/2)+2*f(b,(c+d)/2)+4*f((a+b)/2,(c+d)/2));

%ex3
r=110;
p=75;
f =@(x)(1-((p/r).^2).*sin(x)).^(1/2);
a=0;
b=2*pi;
n=10;
pas=(b-a)/n;
xk=a+pas:pas:b-pas;


repeatedTrapez = ((b-a)/(2*n)).*(f(a)+f(b)+2.*sum(f(xk)));
h=((60*r)/(r^2-p^2))*repeatedTrapez

%ex4
f=@(x)x.*log(x);
a=1;
b=2;
n=10;%precizia 10 -3 calculat pe hartie
pas=(b-a)/n;
xk=a+pas:pas:b-pas;

repeatedTrapez = ((b-a)/(2*n)).*(f(a)+f(b)+2.*sum(f(xk)))

%ex5
f =@(x) 1./(4+sin(20.*x));
n=30;
a=0;
b=pi;
pas=(b-a)/n;
xk=a+pas:pas:b-pas;
xk1=a:pas:b-pas;
xk2=a+pas:pas:b;
simpsonRepeated=((b-a)./(6.*n)).*(f(a)+f(b)+4.*sum(f((xk1+xk2)/2))+2.*sum(f(xk)))

%ex6
n=10;
f= @(t) exp(-1.*(t.^2));
x=0.5;
a=0;
b=x;

pas=(b-a)/n;
xk=a+pas:pas:b-pas;
xk1=a:pas:b-pas;
xk2=a+pas:pas:b;

simpsonRepeated=((b-a)./(6.*n)).*(f(a)+f(b)+4.*sum(f((xk1+xk2)/2))+2.*sum(f(xk)))
erf=(2/sqrt(pi)).*simpsonRepeated

%ex7
f=@(x,y) exp(y/x);
a=0.1;
b=0.5;
c=0.01;
d=0.25;
n=10;
pas=(b-a)/(2*n);
j1=0;
j2=0;
j3=0;
m=10;

for i=0:2*n
    x=a+i*pas;
  
    h1=(d-c)/(2*m);
    k1=f(x,c)+f(x,d);
    k2=0;
    k3=0;
    for j=1:2*(m-1)
        y=c+j*h1;
        z=f(x,y);
        if(mod(j,2)==0)
            k2=k2+z;
        else
            k3=k3+z;
        end
        
    end
    
    l=(k1+2*k2+4*k3)*h1/3;

    if ((i==0 || i==2*n))
        j1=j1+1;
    else
        if(mod(i,2)==0)
            j2=j2+1;
        else
            j3=j3+1;
        end
    end
    

end

J=(j1+2*j2+4*j3)*(pas/3)


