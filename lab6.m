%ex1
times=1:1:7;
temperatures=[13, 15, 20,14, 15, 13, 10];
m = length(times)-1;
a = ((m+1)* sum(times.*temperatures) - sum(times) * sum(temperatures)) / ((m+1).*sum(times.^2)-(sum(times))^2);
b = (sum(times.^2) .*sum(temperatures) - sum(times .*temperatures) * sum(times))/((m+1)*sum(times.^2)-sum(times)^2);
fi =@(x) a*x+b;

fprintf("Time = 8:00 | Temperature = "+fi(8));

% plot(times,temperatures,'*');
% hold on;
% 
% plot(times, fi(times));
% title('Least Squares approx');
E = sum((temperatures-fi(times)).^2);
fprintf("E(a,b)= "+E);


%ex2
times = [0, 10, 20, 30, 40, 60, 80, 100];
temperatures = [0.0061, 0.0123, 0.0234, 0.0424, 0.0738, 0.1992, 0.4736, 1.0133];
m= length(times)-1;

%a


aux1= polyfit(times,temperatures,2);
aux2= polyfit(times,temperatures,6);

rez1 =polyval(aux1,45);
rez2 = polyval(aux2,45);
abs(rez1- 0.095848)
abs(rez2- 0.095848)
points=0:0.1:100;

% plot(times, temperatures,'*');
% hold on;
% plot(points, polyval(aux1,points));
% 
% plot(points, polyval(aux2,points));


y=zeros(1, length(points));
for i=1:length(points)
lmf = newtonForm(times, temperatures,points(i));
y(i)=lmf;

end

%plot(points, y);

%legend('points','aprox a','aprox b','lagrange');


%ex3

x=-3:0.4:3;
y=sin(x);

% plot(x,y,'*');
% hold on;

points=-3:0.01:3;
% plot(points, sin(points));

aux1= polyfit(x,y,4);
y=zeros(1, length(points));
for i=1:length(points)
    y(i) = polyval(aux1,points(i));

end
% plot(points, y);
% legend('points','function','polyval');


%ex4
[x,y] = ginput(10);
x= 3.*x;
y = 5.*y;
plot(x,y,'*');
hold on;

aux1= polyfit(x,y,2);
x1=linspace(0,3,100);
y = polyval(aux1,x1);


plot(x1,y);





function rez= newtonForm(xnodes, ynodes, x)
    sum = ynodes(1);
    m = length(xnodes)-1;
    firstRow= dividedDiff(xnodes,ynodes,length(xnodes));
    for i=1:m
        p=1;
        for j=1:i
            p=p*(x-xnodes(j));
        end
        sum=sum + p*firstRow(i);
    end
    rez= sum;
   
end

function rez = dividedDiff(x,y,n)
    tabel = zeros(n,n);
    tabel(:,1) = y;
    for j=2:n
        for i=1:n-j+1
            tabel(i,j)=(tabel(i+1,j-1)-tabel(i,j-1))/(x(i+j-1)-x(i));
        end
    end
    
    rez = tabel(1,2:n); %first row in table
end




 



