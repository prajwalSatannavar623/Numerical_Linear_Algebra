%Gauss-Siedal:
%Giving matrix abd vector as user inputs:
A = [6,1,1,1,1;1,7,1,1,1;1,1,8,1,1;1,1,1,9,1;1,1,1,1,10];
b = [-10;-6;0;8;18];
maxiter = 150;
tol = 10^(-8);
[m, n]=size(A);
residual = zeros(maxiter,1);
x = zeros(n,maxiter+1);

k=1;

while (1)
    for i=1:n
        sum1=0;
        sum2=0;
        for j=1:i-1
            sum1 = sum1 + A(i,j)*x(j,k+1);
        end
        for j=i+1:n
            sum2 = sum2 + A(i,j)*x(j,k);
        end
        x(i,k+1) = (-sum1-sum2+b(i,1))/A(i,i);
    end
    residual(k+1,1) = norm(A*x(:,k+1)-b,inf);
    k=k+1;
    if (norm(x(:,k)-x(:,k-1))/norm(x(:,k-1))<=tol) || (k>maxiter)
        break
    end
end

%solution is :
x(:,k)
%Updated solution after each iterations:
T1 = array2table(x(:,1:4))
T2 = array2table(x(:,5:8))
T3 = array2table(x(:,9:11))
%number of iterations taken are:
iter = k
%residual at end of each iterations:
residual(2:k+1,1)

%alloting the x and y points for plot
xplot = zeros(11,1);
for g=1:11
    xplot(g,1)=g;
end
yplot = residual(2:k+1,1);

%plotting graph
plot(xplot,yplot)
title('PLOT OF RESIDUAL V/S NUMBER OF ITERATIONS')
xlabel('NUMBER OF ITERATIONS')
ylabel('RESIDUAL AT END OF EACH ITERATIONS')
