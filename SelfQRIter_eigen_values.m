A =[17,24,1,8,15;23,5,7,14,16;4,6,13,20,22;10,12,19,21,3;11,18,25,2,8];
MaxNumIter = input('Enter MaxNumIter');
n=size(A);
tol =10^(-8);
k =1;
while (k<MaxNumIter)
    A1 = A;
    [Q,R] = qr(A1);
    A = R*Q;
    M = tril(A1);
    N = tril(A);
    check = norm((N-M),'fro');
  
    if check <= tol*norm(A,'fro')
        break
    end
    k=k+1;
end

spectra = zeros(n:1);
for i=1:n
    spectra(i,1)=A(i,i);
end

disp('Spectrum of A using QR-Iterations :');
spectra
disp('Eigen values using in-built function: ');
e = eig(A)
disp('Number of iterations took :');
k



