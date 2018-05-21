%ex1
xnodes=linspace(0,6,13);
ynodes=exp((sin(xnodes)));
n=length(xnodes);

rez = dividedDiff(xnodes, ynodes, n);

plot(xnodes,ynodes,'*');
hold on;



plotx=0:0.01:6;
ploty = exp((sin(plotx)));
plot(plotx,ploty); 
hold on;


newtonPoly=zeros(1,length(plotx));
for i=1:length(plotx)
   newtonPoly(i) = newtonForm(xnodes, ynodes, plotx(i));
   
end
%pause;
plot(plotx,newtonPoly);
legend('punctele ','functia data','newton form');
title('LMF using newton form (lab4 ex2)');

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


