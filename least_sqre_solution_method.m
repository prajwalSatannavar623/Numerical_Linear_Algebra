A = input('Enter the Matrix :');
b = input('Enter the vector b :');
Atranse = A.';

U = chol(Atranse*A);

disp('Atranse')
Atranse

disp('upper trianglular matrix obtained by chol decomposition is :')
U

L = U.';
bTelda = Atranse*b;

y = FdSubs(L,bTelda);

x = BdSubs(U,y);
disp('The solution x A')
x




function y = FdSubs(L,bTelda)
n = length(bTelda);
y(1,1) = bTelda(1)/L(1,1);
for i = 2:n
    y(i,1)=(bTelda(i)-L(i,1:i-1)*y(1:i-1,1))./L(i,i);
end
end

function x = BdSubs(U,y)
n = length(y);
x(n,1) = y(n)/U(n,n);
for i = n-1:-1:1
    x(i,1)=(y(i)-U(i,i+1:n)*x(i+1:n,1))./U(i,i);
end
end

