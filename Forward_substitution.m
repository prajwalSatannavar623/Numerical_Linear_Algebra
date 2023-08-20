function x = FdSubs(L,b)
n = length(b);
x(1,1) = b(1)/L(1,1);
for i = 2:n
    x(i,1)=(b(i)-L(i,1:i-1)*x(1:i-1,1))./L(i,i);
end
