N = 100;
x1 = randn(1,N);
x2 = 0.4*randn(1,N);
A = [x1;x2];
R = [cos(pi/3),-sin(pi/3);sin(pi/3),cos(pi/3)];
D = R*A;
Q = (D*D.')/(N-1);
[V,Dia] = eig(Q);
[r,r] = size(Dia);

[d,ind] = sort(diag(Dia),'descend');
Dia = Dia(ind,ind);
sigma = sqrt(Dia);
V = V(:,ind);
u = V(:,1);

xlim = ([-4,4]);
ylim = xlim;

scatter(D(1,:),D(2,:));
hold on
plot(u);







