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
p0 = [0;0;r(3)];

%Choose an equilibrium point to compute manifolds:
p = p0;

Dfp = DifferentialF(p, ...
    epsilon, alpha, gamma, delta, beta, zeta);
          
[Q, Lambda] = eigs(Dfp);

 %The names of the eigenvalues have to be
 %set by hand:

 lambda_u = Lambda(3,3);
 xi_u = Q(:, 1);
 
 lambda_s1 = Lambda(1,1);
 lambda_s2 = Lambda(2,2);
 xi_s1 = Q(:, 1);
 xi_s2 = Q(:, 2);

 %return
 N = 35;
 scale = 0.65;
 P = zeros(N+1, N+1, 3);
 
%Compute a two dimensional manifold:
UM = getCoeffs(p,Dfp,lambda_s1, lambda_s2, xi_s1, xi_s2, N, scale,epsilon, alpha, gamma, delta, beta, zeta);

Au = UM(:, :, 1);
Bu = UM(:, :, 2);
Cu = UM(:, :, 3);

%% Building cross section

numR = 1;
numTheta = 300;
 
the_rs = 1;
the_theta = linspace(0, 2*pi, numTheta);

 numPoints = numR*numTheta;
 
 W_loc = zeros(3, numPoints);
 
 pointNum = 1;
 for m = 1:numR
     for n = 1:numTheta
         
        this_r = the_rs(m);
        this_theta = the_theta(n);
        sigma1 = this_r*cos(this_theta);
        sigma2 = this_r*sin(this_theta);
        thisPoint = [0; 0; 0]; 
        for order = 0:N
            for vader = 0:order
                m1 = order-vader;
                m2 = vader;
                
                thisPoint = thisPoint + ...
                    reshape(UM(m1+1, m2+1, :), [3,1])*...
                    ((sigma1 + i*sigma2)^m1)*((sigma1 - i*sigma2)^m2);
            end
        end
     
        W_loc(:, pointNum) = real(thisPoint);
        pointNum = pointNum + 1;
     end
     
 end

itstartpoints = W_loc';

figure; 
plot3(W_loc(1,:),W_loc(2,:),W_loc(3,:))
title('Edge of local manifold')

save(sprintf('itstartpoints11022s.csv'), 'itstartpoints', '-ascii');


