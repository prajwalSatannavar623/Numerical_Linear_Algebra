A =[17,24,1,8,15;23,5,7,14,16;4,6,13,20,22;10,12,19,21,3;11,18,25,2,8];
MaxNumIter = input('Enter MaxNumIter');
n=5;
tol =10^(-8);
x = rand(n,1);

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
sort(A,'descend');
disp('Dominant eigen value from in buit function:');
E(1,1)

Iter = zeros(MaxNumIter,1);
for j =1:MaxNumIter
    Iter(j,1)=j;
end

disp('Number of iterations it took is :');
k
disp('Eigen value obtained is :');
x
Table = table(Iter,lambda)




