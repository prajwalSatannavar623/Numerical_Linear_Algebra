%Jacobi:
%Giving matrix abd vector as user inputs:
A = [6,1,1,1,1;1,7,1,1,1;1,1,8,1,1;1,1,1,9,1;1,1,1,1,10];
b = [-10;-6;0;8;18];
maxiter = 150;
tol = 10^(-8);
[m, n]=size(A);
residual = zeros(maxiter,1);
x = zeros(n,maxiter+1);

for h=1:n
    x(h,2)=b(h,1)/A(h,h);
end

k=2;
residual(1,1)=norm(A*x(:,1)-b);
residual(2,1) = norm(A*x(:,2)-b);

while (norm(x(:,k)-x(:,k-1))/norm(x(:,k-1))>=tol)&& (k<maxiter)
    for i=1:n
        sum=0;
        for j=1:n
            if not(i==j)
                sum = sum + A(i,j)*x(j,k);
            end
        end
        x(i,k+1) = (-sum + b(i,1))/A(i,i);
    end
    residual(k+1,1) = norm(A*x(:,k+1)-b,inf);
    k=k+1;   
end

%solution is :
x(:,k)
%Updated solution after each iterations:
T1 = array2table(x(:,1:4))
T2 = array2table(x(:,5:8))
T3 = array2table(x(:,9:12))
T4 = array2table(x(:,13:16))
T5 = array2table(x(:,17:20))
T6 = array2table(x(:,21:24))
T7 = array2table(x(:,25:26))


%number of iterations taken are:
iter = k
%residual at end of each iterations:
residual(1:k,1)

%alloting the x and y points for plot
xplot = zeros(k,1);
for g=1:k
    xplot(g,1)=g;
end
yplot = residual(1:k,1);

%plotting graph
plot(xplot,yplot)
title('PLOT OF RESIDUAL V/S NUMBER OF ITERATIONS')
xlabel('NUMBER OF ITERATIONS')
ylabel('RESIDUAL AT END OF EACH ITERATIONS')

