clear
format long
tic

%% Getting the Coefficients

%Langford Parameters:
alpha = 1.1022;
beta = 0.7;
delta = 3.5;
gamma = 0.6;
zeta = 0.1;
epsilon = 0.25;

p = [-1/3 0 alpha gamma];

r = roots(p);

%Equilibria:
p0 = [0;0;r(1)];

%Choose an equilibrium point to compute manifolds:
p = p0;

Dfp = DifferentialF(p, ...
    epsilon, alpha, gamma, delta, beta, zeta);
          
[Q, Lambda] = eigs(Dfp);
       
 %The names of the eigenvalues have to be
 %set by hand:

 lambda_s = Lambda(3,3);
 xi_s = Q(:, 1);
 
 lambda_u1 = Lambda(1,1);
 lambda_u2 = Lambda(2,2);
 xi_u1 = Q(:, 1);
 xi_u2 = Q(:, 2);

 N = 35;
 scale = 0.75;
 P = zeros(N+1, N+1, 3);
 
%Compute a two dimensional manifold:
UM = getCoeffs(p,Dfp,lambda_u1, lambda_u2, xi_u1, xi_u2, N, scale,epsilon, alpha, gamma, delta, beta, zeta);

Au = UM(:, :, 1);
Bu = UM(:, :, 2);
Cu = UM(:, :, 3);

%% Building cross section

TriFundDomES

vertices_u = vertices_uFD;

itstartpoints = vertices_u(1:numBDpoints,:);

figure; 
plot3(itstartpoints(:,1),itstartpoints(:,2),itstartpoints(:,3))
title('edge of local manifold')
 
save(sprintf('itstartpoints11022u.csv'), 'itstartpoints', '-ascii');

