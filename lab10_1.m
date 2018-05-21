a=[1 1 1 1; 2 3 1 5; -1 1 -5 3; 3 1 7 -2];
b=[10 31 -2 18];
n=4;

for p=1:n-1
    [m,idx]=max(abs(a(p:n,p)));
    idx=idx+p-1;
    if abs(a(idx,p))==0
        break
    end
    if idx~=p
        aux=a(idx,1:n);
        a(idx,1:n)=a(p,1:n);
        a(p,1:n)=aux;
        
        aux=b(idx);
        b(idx)=b(p);
        b(p)=aux;
    end
    
    
    for i=p+1:n
        mik=a(i,p)/a(p,p);
        for j=p:n
            a(i,j)=a(i,j)-mik*a(p,j);
            
        end
        b(i)=b(i)-mik*b(p);
    end
    
end
a
b

x=zeros(1,n);
x(n)=b(n)/a(n,n);

for i=1:n-1
    x(n-i)=(b(n-i)-sum(a(n-i,n-i+1:n).*x(n-i+1:n)))/a(n-i,n-i);
end
x