A = [1,-6,9;6,2,3;9,3,2];
b = [0;5;0];
[n,m] = size(A);
x0 = rand(n,1);
tol = 10^(-8);
MaxNumIter = input('enter the value of k:');
k=1;
r = zeros(n,1);
x = x0;
r = b-A*x;
v = transpose(A)*r;

while (k<MaxNumIter)
    z = A*v;
    alpha = (transpose(v)*v)/(transpose(z)*z);
    x = x + alpha*(v);
    r = r - (alpha)*(z);
    v = transpose(A)*r;
    if(norm(r)<tol)
        break
    end
    k=k+1;
end

disp('Number of Iterations took by RNSD is :');
k
disp('Solution is :');
x
disp('SOlution from built-in function is:');
c = A\b

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

disp('Number of Iterations took by steepest descent is :');
k
disp('Solution is :');
x

k=1;
r = zeros(n,1);
x = x0;
r = b-A*x;
p = A*r;

while (k<MaxNumIter)
    alpha = (transpose(p)*r)/(transpose(p)*p);
    x = x + alpha*(r);
    r = r - (alpha)*p;
    p = A*r;
    if(norm(r)<tol)
        break
    end
    k=k+1;
end

disp('Number of Iterations took by minimal residual method is  is :');
k
disp('Solution is :');
x

