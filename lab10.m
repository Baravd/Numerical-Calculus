A=[1 1 1 1; 2 3 1 5; -1 1 -5 3;3 1 7 -2]
b=[10 31 -2 18]';
n=length(b); 
for p=1:n-1
    x=zeros(n,n);
    [val,q]=max(abs(A(p:n,p)))
    q=q+p-1;
    
   
    if(val ==0)
       fprintf("message");
       break;
    end
    %interchange
    if(q ~= p)
        aux=A(q,1:n);
        A(q,1:n) =A(p,1:n);
        A(p:1:n) = aux;
        
        aux2=b(q);
        b(q)=b(p);
        b(p)=aux2;
    end
    for i=p+1:n
        mik=A(i,p)/A(p,p);
        for j=1:n
            A(i,j)=A(i,j)-mik*A(p,j);
            b(i)=b(i)-mik*b(p);
        end
    end
    if(A(n,n)==0)
        frpintf("Message");
        break;
    end
   
    
    
end
x=zeros(1,n);
x(n)=b(n)/A(n,n);

for i=1:n-1
    x(n-1)=(b(n-1)-sum(A(n-i,n-i+1:n).*x(n-i+1:n)))/A(n-i,n-i);
end
A
x


