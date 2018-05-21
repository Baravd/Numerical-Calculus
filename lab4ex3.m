xnodes=[81,100,121,144,169];
x=115;
%sort w.r to x
for i=1 : length(xnodes)-1
    for j=i+1:length(xnodes)
        if(abs(xnodes(i)-x)>(abs(xnodes(j)-x)))
            aux =xnodes(i);
            xnodes(i)=xnodes(j);
            xnodes(j)=aux;
        end
    end
end

ynodes=sqrt(xnodes);
m=length(xnodes);
f=aitkenTabel(xnodes,ynodes, x);
epsilon=0.001;

for i=2:m
    if(abs(f(i,i)-f(i-1,i-1))<epsilon)
        f(i,i)
        return;
    end
    fprintf('not enough values');
end
function rez =aitkenTabel(xnodes,ynodes, x)
    m=length(ynodes);
    tabel=zeros(m,m);
    tabel(:,1)=ynodes;
    for j=1:m
        for i=(j+1):m
            tabel(i,j+1) = (1/(xnodes(i)-xnodes(j)))*((tabel(j,j)*(xnodes(i)-x))-(tabel(i,j)*(xnodes(j)-x)));
        end
    end
    
   rez=tabel;
    
end