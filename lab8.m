%ex1 a
fx =@(x) exp(-x.^2);
a=1;
b=1.5;
%rez=(b-a)*fx((a+b)/2);

%ex1 b
n=100;
x1=a+(b-a)/(2*n);
pas=(b-a)/n;
xn=x1+(n-1).*(b-a)/n;
xi=x1:pas:xn;

%rez= ((b-a)/n).* sum(fx(xi));

%ex2 romberg trapezium
% a=0;
% b=1;
% h=b-a;
% fx=@(x) 2/(1+x.^2);
% epsilon = 10^(-4);
% Qt0=(h/2).*(fx(a)+fx(b));
% Qt1=(1/2).*Qt0+h.*fx(a+h/2);
% er=abs(Qt1-Qt0);
% k=2;
% while er>epsilon
%     Qt0=Qt1;
%     k=k+1;
%     %j=1:1:2^(k-1);
%     sum=0;
%     for j=1:2^(k-1)
%         sum=sum+fx(a+((2.*j-1)./(2.^k)).*h);
%     end
%     Qt1=(1./2).*Qt0+(h./(2.^k)).*sum;
%     er=abs(Qt1-Qt0);
%    
% end
% 
% Qt1
% k
    

%ex2 simpson
a=0;
b=1;
h=b-a;
fx=@(x) 2/(1+x.^2);
epsilon = 10^(-5);
fx=@(x) 2/(1+x.^2);
epsilon = 10^(-4);
Qt0=(h/2).*(fx(a)+fx(b));
Qt1=(1/2).*Qt0+h.*fx(a+h/2);
Qs0=(h/6).*(fx(a)+4.*fx(a+h/2)+fx(b));
Qs1=(1/3).*(4*Qt1-Qt0);
er=abs(Qs1-Qs0);
k=2;
while er>epsilon
    Qt0=Qt1;
    k=k+1;
    %j=1:1:2^(k-1);
    sum=0;
    for j=1:2^(k-1)
        sum=sum+fx(a+((2.*j-1)./(2.^k)).*h);
    end
    Qt1=(1./2).*Qt0+(h./(2.^k)).*sum;
    Qs0=Qs1;
    Qs1=(1/3).*(4.*Qt1-Qt0);
    er=abs(Qs1-Qs0);
   
end
Qs1;
k;

%ex3
points=1:0.1:3;
fx =@(x)(100/(x^2)).*sin(10./x);
epsilon=10^(-4);
a=1;
b=3;
h=b-a;
n=50;

pas=(b-a)/n;
xk=a+pas:pas:b-pas;
xk1=a:pas:b-pas;
xk2=a+pas:pas:b;
simpsonRepeated=((b-a)./(6.*n)).*(f(a)+f(b)+4.*sum(f((xk1+xk2)/2))+2.*sum(f(xk)))



