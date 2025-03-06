format long
format compact
clear vars

%Lorenz Parameters
sigma = 10;
beta = 8/3;
rho = 28;   

%Equilibrium Solns:
p0 = [0;0;0];
%p0 = [-sqrt(beta*(rho-1));-sqrt(beta*(rho-1));rho-1];
%p0 = [-sqrt(beta*(rho-1));-sqrt(beta*(rho-1));rho-1];

%Choose an equilibrium point to compute manifolds:
p = p0;

Dfp = lorenzDifferential(p, sigma, rho, beta);
          
[Q, Lambda] = eigs(Dfp);
       
 %The names of the eigenvalues have to be
 %set by hand:

 lambda_u = Lambda(2,2);
 xi_u = Q(:, 1);
 
 lambda_s1 = Lambda(1,1);
 lambda_s2 = Lambda(3,3);
 xi_s1 = Q(:, 1);
 xi_s2 = Q(:, 3);

 N = 35;
 scale = 6.5;
 P = zeros(N+1, N+1, 3);

%Compute a two dimensional manifold:
SM = getCoeffsLorenz(p,Dfp,lambda_s1, lambda_s2, xi_s1, xi_s2, N, scale, sigma, rho, beta);

%Local for Disc
numRadial = 50;  % Number of points along the radius
numAngular = 100;  % Number of points around the circle
numPoints = numRadial * numAngular;
Ws_loc = zeros(3,numPoints);
pointNum = 1;

for r = linspace(0, 1, numRadial)
    for theta = linspace(0, 2*pi, numAngular)
        % Convert polar to Cartesian coordinates
        this_t = r * cos(theta);
        this_s = r * sin(theta);
        
        thisPoint = [0;0;0];
        for order = 0:N
            for vader = 0:order
                m1 = order-vader;
                m2 = vader;
                thisPoint = thisPoint + ...
                    reshape(SM(m1+1, m2+1, :), [3,1])*...
                    (this_t^m1)*(this_s^m2);
            end
        end
        Ws_loc(1:3, pointNum) = thisPoint;
        pointNum = pointNum + 1;
    end
end

border_indices = [numPoints-(numAngular-1)+1:numPoints];  

% Plotting
figure
hold on
plot3(Ws_loc(1, :)', Ws_loc(2, :)', Ws_loc(3, :)', 'r.')
plot3(Ws_loc(1, border_indices)', Ws_loc(2, border_indices)', Ws_loc(3, border_indices)', 'b.', 'MarkerSize', 10)
set(gcf,'color','w')
view(0,0)

lorenzwsloc =  Ws_loc(:,border_indices)'; 
save('lorenzdiscws.csv','lorenzwsloc', '-ascii');
