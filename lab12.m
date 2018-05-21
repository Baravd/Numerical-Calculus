%ex1
x0=pi/4;

epsilon=10^(-4);
n=100;
precision=1;
f= @(x)cos(x)-x;
fd=@(x)-sin(x)-1;
i=0;
for i=0:n
    x1=x0-f(x0)/fd(x0);
    precision=abs(x1-x0);
    if(precision<=epsilon)
        fprintf("rez="+ x1+"\n");
    
        break;
    end
    if(i==n)
        fprintf("not good guess");
    end
        

    x0=x1;
end

%ex2
%ex2
x1=1;
x2=2;
f= @(x)x^3-x^2-1;
for i=0:n
    x3=x2-((x2-x1).*f(x2))/(f(x2)-f(x1));
     precision=abs(x3-x2);
    if(precision<=epsilon)
        fprintf("rez="+ x3+" "+i+"\n");
    
        break;
    end
    if(i==n)
        fprintf("not good guess");
    end
    x1=x2;
    x2=x3;
end

%ex3
f=@(x)(x-2)^2-log(x);
a0=1;
b0=2;
a=a0;
b=b0;
for i=0:n
    c=(a+b)/2;
    precision=abs(a-b)/a;
    if(precision<epsilon)
        fprintf("rez "+c+" it "+i+"\n");
        break;
    end
    aux=f(a)*f(c);
    if(aux<0)
        b=c;
    else
        a=c;
    end
    
    
end

%ex4
f= @(x)cos(x)-x;
a=0.5;
b=pi/4;
for i=0:n
    c=b-((b-a)*f(b))/(f(b)-f(a));
    precision=abs(f(a));
    if(precision<epsilon)
        fprintf("rez "+c+" it "+i+"\n");
        break;
    end
    if(f(a)*f(c)<0)
        b=c;
    else
        a=c;
    end
    
end




