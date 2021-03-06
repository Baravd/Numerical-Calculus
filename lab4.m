%ex1
xnodes=1:1:5;
ynodes=[22 ,23 ,25 ,30 ,28]; 
x0=2.5;
n=length(ynodes);

rez = dividedDiff(xnodes, ynodes, n);

lmf = newtonForm(xnodes, ynodes, 2.5)

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


