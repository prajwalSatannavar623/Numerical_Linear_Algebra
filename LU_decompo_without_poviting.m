n = 2;
A = ones(n, n);
A(1, 1) = (10)^-16;

[P, L, U] = luDecompositionWithPivoting(A);

disp('A is :')
A
disp('P is :')
P
disp('L is :')
L
disp('U is :')
U

B = [1;0];
b = inv(P)*B;

y = FdSubs(L,b);
x = BdSubs(U,b);

disp('Solution using back and forward substitution : ')
x

x1 = A\B;
disp('Solution using in-built backslash : ')
x1


function [P, L, U] = luDecompositionWithPivoting(A)
    [n,~] = size(A);
    P = eye(n);
    L = eye(n);
    U = A;
    for i = 1:n
        % find pivot row
        [~, pivot] = max(abs(U(i:end, i)));
        pivot = pivot + i - 1;
        if i ~= pivot
            % swap pivot row with current row
            P([i, pivot], :) = P([pivot, i], :);
            L([i, pivot], 1:i) = L([pivot, i], 1:i);
            U([i, pivot], :) = U([pivot, i], :);
        end
        for j = i+1:n
            L(j, i) = U(j, i) / U(i, i);
            U(j, i:end) = U(j, i:end) - L(j, i) * U(i, i:end);
        end
    end
end


function y = FdSubs(L,b)
n = length(b);
y(1,1) = b(1)/L(1,1);
for i = 2:n
    y(i,1)=(b(i)-L(i,1:i-1)*y(1:i-1,1))./L(i,i);
end
end

function x = BdSubs(U,b)
n = length(b);
x(n,1) = b(n)/U(n,n);
for i = n-1:-1:1
    x(i,1)=(b(i)-U(i,i+1:n)*x(i+1:n,1))./U(i,i);
end
end




