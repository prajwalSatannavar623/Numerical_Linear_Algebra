n = 6;
s = [4 -1 zeros(1,n-2)];
X = sparse(s);        
A = toeplitz(X);
x = sprand(n,1,0.25);
MaxNumIter = input('Enter MaxNumIter');
tol =10^(-8);

lambda = zeros(MaxNumIter,1);

k = 1;
while(k<MaxNumIter)
    x = x/norm(x);
    p = A*x;
    x =  p/norm(p);
    lambda(k,1) = transpose(x)*A*x;
    if k>1
        check = abs(lambda(k,1) - lambda(k-1,1));
        if check <=  tol*lambda(k-1,1)
            break
        end
    end
    k=k+1;
end

for i=k:MaxNumIter
    lambda(i,1) = lambda(k,1);
end

E = eig(A);
u = sort(E,'descend');
disp('Dominant eigen value from in buit function:');
u(1,1)

Iter = zeros(MaxNumIter,1);
for j =1:MaxNumIter
    Iter(j,1)=j;
end


disp('Number of iterations it took is :');
k
disp('Eigen value obtained is :');
x
Table = table(Iter,lambda)