A = input('Enter the Matrix :');
b = input('Enter the vector b :');
Atranse = A.';

U = chol(Atranse*A);

L = U.';
bTelda = Atranse*b;

y = FdSubs(L,bTelda);

x = BdSubs(U,y);
disp('The solution x for Ax = b using LSSNEqn.m function is :')
x

x1 = A\b;
disp('The solution of Ax = b by inbuilt backslash function is :')
x1