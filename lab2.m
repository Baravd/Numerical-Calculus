%ex1
x=0:0.01:1;
subplot();
fx1= @(x) x;
fx2= @(x)3/2.* x.^2-1/2;
fx3= @(x)5/2.* x.^3-3/2.*x;
fx4= @(x)35/8.* x.^4-15/4.*x.^2+3/8;

%subplot(2,2,1);plot(x,fx1(x));
%subplot(2,2,2);plot(x,fx2(x));
%subplot(2,2,3);plot(x,fx3(x));
%subplot(2,2,4);plot(x,fx4(x));

%ex2
t=-1:0.01:1;
fx21=@(t)cos(1.*acos(t));
fx22=@(t)cos(2.*acos(t));
fx23=@(t)cos(3.*acos(t));
%plot(t,fx21(t),t,fx22(t),t,fx23(t));
taylor = @(x) cos(x * acos(t));
t0 = ones(1,length(t));
t1 =t;
vector=[t0, t];
%plot(t,t0,t,t1);
hold on;

%n= input('n=');
n=6;
for i =3:n
    vector=2.*t.*t1-t0;
    %plot(t,vector);
    hold on;
    t0=t1;
    t1=vector;
   
end

%ex3
x0=0;
sum=0;
prod=1;
x=-1:0.01:3;
for i= 0:5
    if i==0
        prod=1;
    else
        prod=prod.*i;
    end 
    sum=sum+((x-x0).^i)./prod*exp(0);
    
    plot(x,sum);
    hold on;

end
plot(x,exp(x),'+');
hold on;

%ex4
h=0.25;
a=1;


fx4 = @(x) sqrt(5.*x.^2+1);
linea= (a:h:a+6*h);
n=length(linea);
tabel = zeros(n,n);
%tabel(:,1)= linea';

    for i=0:n
        tabel(i+1,1)= fx4(a+i.*h); 
    end


for j=2:n
    for i=1:n-j+1
        tabel(i,j)=tabel(i+1,j-1)-tabel(i,j-1);
    end
end
tabel

%ex5 lab 2
x=[2,4,6,8];
fx=[4,8,14,16]';
n=length(x);
tabel = zeros(n,n);
tabel(:,1) = fx;
for j=2:n
    for i=1:n-j+1
        tabel(i,j)=(tabel(i+1,j-1)-tabel(i,j-1))/(x(i+j-1)-x(i));
    end
end
tabel

    






