A = input('Enter the coefficient matrix :');
b = input('Enter the y vector : ');
R=A; %Start with R=A
Q=eye(m); %Set Q as the identity matrix

for k=1:m-1
x=zeros(m,1);
x(k:m,1)=R(k:m,k);
g=norm(x);
v=x; v(k)=x(k)+g;

s=norm(v);
if s~=0, w=v/s; u=2*R'*w;
R=R-w*u'; 
Q=Q-2*Q*(w*w');
end
end


disp('')
A
disp('')
Q
disp('')
R
k = Q*R;
disp('')
k
j = Q*(Q.');
disp('')
j