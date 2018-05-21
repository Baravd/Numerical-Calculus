%ex2
A=[10, 7, 8, 7;7 5 6 5; 8 6 10 9; 7 5 9 10];
b = [32 23 33 31]'
x = A \b;
cond(A);

b2=[32.1 22.9 33.1 30.9]';
x2=A \b2;

aux1=norm(b-b2)/norm(b);
aux2=norm(x-x2)/norm(x);
aux2/aux1;

%c
A3=[10 7 8.1 7.2; 7.08 5.04 6 5; 8 5.98 9.89 9; 6.99 4.99 9 9.98];
x3= A3\ b;
aux1=norm(A-A3)/norm(A);
aux2=norm(x-x3)/norm(x);
aux2/aux1;
%ex3
h=[];
for n=10:15
    h=zeros(n,n);
    for i=1:n
        for j=1:n
            h(i,j)=1/(i+j-1);
        end
    end
    cond(h);
end

%ex4
for n=10:15
  
    h=zeros(n,n);
    for i=1:n
        for j=1:n
            h(i,j)=(1/i)^(j-1);     
        end
    end
    h
    cond(h)
end


