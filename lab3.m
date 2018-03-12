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
tabel;

%ex1
xnodes=1930:10:1980;
ynodes=[123203, 131669, 150697, 179323, 203212, 226505];
y=1930;
ux =@(x)x-xnodes;

rezultatEx1 = Lmf(xnodes,ynodes,1955);
fprintf("ex1 rez= %6.2f\n",rezultatEx1);
%ex2
xnodes=[100,121,144];
ynodes=[10,11,12];
rezultatEx2 = Lmf(xnodes,ynodes,115);
fprintf("ex2 rez= %6.2f\n",rezultatEx2);
fprintf("rezsqrt = %6.2f\n",sqrt(115));

%ex3

xnodes = linspace(0,10,21);
f3x = @(x) 1+cos(pi*x)./(1+x);
for i=1:21
    ynodes(i) = f3x(xnodes(i));
end
x=0:0.1:10;
y=zeros(1,length(x));
for i=1:length(x)
    if(ismember(x(i),xnodes))
        y(i) = f3x(x(i));
    else
     y(i) = Lmf(xnodes,ynodes,x(i));
    end
end

plot(xnodes,ynodes,'*');
hold on;
plot(x,y,'r');
hold on;
plot(x,f3x(x),'b');
hold on;
legend('Noduri','Lagrange','Function');






function z = AI(xnodes,x,i)
    p=1;
    for j=1:length(xnodes)
        if(j~=i)
            p=p*(x-xnodes(j));
        end
    end
    z=1/p;
end


function rez =  Lmf(xnodes,ynodes,x) 
    s1=0;
    s2=0;
    for i=1:length(xnodes)
        s1=s1+AI(xnodes,xnodes(i),i)*ynodes(i)/(x-xnodes(i));
    end
    for i=1:length(xnodes)
        s2=s2+AI(xnodes,xnodes(i),i)/(x-xnodes(i));
    end
    rez= s1/s2;
end



