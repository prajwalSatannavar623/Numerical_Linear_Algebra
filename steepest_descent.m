n =6;
x = [4 -1 zeros(1,n-2)];
A = toeplitz(x);
b =[0;5;0;6;-2;6];
x0 = rand(n,1);
tol = 10^(-8);
MaxNumIter = input('enter the value of k:');
k=1;
r = zeros(n,1);
x = x0;
r = b-A*x;
p = A*r;

while (k<MaxNumIter)
    alpha = (transpose(r)*r)/(transpose(r)*p);
    x = x + alpha*(r);
    r = r - (alpha)*p;
    p = A*r;
    if(norm(r)<tol)
        break
    end
    k=k+1;
end

disp('Number of Iterations took for computing is :');
k
disp('Solution is :');
x
disp('SOlution from built-in function is:');
c = A\b


