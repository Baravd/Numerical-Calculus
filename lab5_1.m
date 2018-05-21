%ex1
times = [0, 3, 5, 8, 13];
distances = [0, 225, 383, 623, 993];
speeds = [75, 77, 80, 74, 72];

n = 2* length(times);
t= 10;
doubleTimes = doubleElements(times);
doubleDistances = doubleElements(distances);
doubleSpeeds = doubleElements(speeds);

divFirstRow = dividedDiff(doubleTimes,doubleDistances,doubleSpeeds,n);
Hmf = hermiteForm(doubleTimes, doubleDistances,divFirstRow, t);

%ex2
times = [1,2];
distances = [0, 0.6931];
speeds =[1, 0.5];
doubleTimes = doubleElements(times);
doubleDistances = doubleElements(distances);
doubleSpeeds = doubleElements(speeds);
n=2*length(times);
t=1.5;

divFirstRow = dividedDiff(doubleTimes,doubleDistances,doubleSpeeds,n);
Hmf = hermiteForm(doubleTimes, doubleDistances,divFirstRow, t);

%ex3

times = linspace(-5,5,15);
distances = sin(2.*times);
speeds = 2*cos(2.*times);
plot(times,distances,'*');
hold on;

a_times = -5:0.01:5;
a_distances = sin(2.*a_times);
plot(a_times,a_distances,'r');



doubleTimes = doubleElements(times);
doubleDistances = doubleElements(distances);
doubleSpeeds = doubleElements(speeds);

n=2*length(times);
hmfRez=zeros(1,length(atimes));
divFirstRow = dividedDiff(doubleTimes,doubleDistances,doubleSpeeds,n);

for i=1:length(a_times)
    Hmf = hermiteForm(doubleTimes, doubleDistances,divFirstRow, a_times(i));
    hmfRez(i)=Hmf;
end
%pause;
plot(a_times,hmfRez);
title('Hermite interpolation');
legend('Points','Function','Hermite aproximation');







function rez = doubleElements(array)
        aux= length(array);
        rez= zeros(1,2*aux);
        counter=0;
        for i=1:2*aux
            if( mod(i,2)==1)
                counter=counter+1;
            end
            rez(i) =array(counter);
        end

end


function rez = dividedDiff(x,y,speed,n)

    tabel = zeros(n,n);
    tabel(:,1) = y;
    for j=2:n
        for i=1:n-j+1
            if (mod(i,2)==1 && j==2) 
                tabel(i,j) = speed(i);
            else
                tabel(i,j)=(tabel(i+1,j-1)-tabel(i,j-1))/(x(i+j-1)-x(i));
            end
        end
    end
    
   
    rez = tabel(1,2:n); %first row in table
end

function rez= hermiteForm(xnodes, ynodes,firstRow, x)
    sum = ynodes(1);
    m = length(xnodes)-1;
    
    for i=1:m
        p=1;
        for j=1:i
            p=p*(x-xnodes(j));
        end
        sum=sum + p*firstRow(i);
    end
    rez= sum;
   
end
