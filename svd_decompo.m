%Taking the matrix input;
A = [1 2; 3 4; 5 6; 7 8];
%Selfsvd(A)
%function [U,sigma,V] = Selfsvd(A) 
[m,n] = size(A);
tol = 10^(-8);

Atranse = transpose(A);
%obtaining eigen values and eigen vectors of Atranse *A
[V,D] = eig(Atranse*A);
[r,r] = size(D);
U = zeros(m,r);

%sorting the eigen values in decending order;
[d,ind] = sort(diag(D),'descend');
%obtaining the sorted eigen value diagonal matrix;
Ds = D(ind,ind);
%square rooting to obtain sigular values;
Ds = sqrt(Ds);
sigma = real(Ds);
%sorting the eigen vectors corresponding to their sorted eigen values;
Vs = V(:,ind);

%checking for tolerance;
count=0;
for j =1:r
    if sigma(j,j)<tol
        sigma(j,j)=0;
        count=count+1;
    end
end
rank = r-count;
%Building U;
for i=1:r
    U(:,i)=A*Vs(:,i)/sigma(i,i);
end

U = U(:,1:rank);
V = Vs(1:rank,:);
sigma = sigma(1:rank,1:rank);

%Calculating by inbuilt function;
[U_in,sigma_in,V_in]=svd(A,'econ');


disp('SVD by algorithm:')
U
sigma
V

disp('SVD by built-in function:')
U_in
sigma_in
V_in



