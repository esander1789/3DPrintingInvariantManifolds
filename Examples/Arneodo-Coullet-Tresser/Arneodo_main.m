clear all
format long

%Arneodo Parameters
beta = 0.4;
mu = 0.863;   

%Equilibrium Solns:
p0 = [1;0;0];


%Choose an equilibrium point to compute manifolds:
p = p0;

Dfp = ArneodoDifferential(p, beta, mu);
          
[Q, Lambda] = eigs(Dfp);
       
diag(Lambda)

 %The names of the eigenvalues have to be
 %set by hand:

 lambda_u = Lambda(3,3);
 xi_u = Q(:, 3);
 
 lambda_u1 = Lambda(1,1);
 lambda_u2 = Lambda(2,2);
 xi_u1 = Q(:, 1);
 xi_u2 = Q(:, 2);

 N = 35;
 scale = 0.75; %for mu=0.863
 %scale = 0.65; %for mu=0.8
 %scale = 0.55; %for mu=0.75
 %scale = 0.25; %for mu=0.5
 P = zeros(N+1, N+1, 3);

%Compute a two dimensional manifold:
SM = getCoeffsArneodo(p,Dfp,lambda_u1, lambda_u2, xi_u1, xi_u2, N, scale, beta, mu);

%% %plotting local
numR = 10;
numTheta = 50; %change this to increase # points on the circle

the_rs = linspace(0, 1, numR);
the_theta = linspace(0, 2*pi, numTheta);

 numPoints = numR*numTheta;
 
 Wu_loc = zeros(3, numPoints);
 
 pointNum = 1;
 for m = 1:numR
     for n = 1:numTheta
         
        this_r = the_rs(m);
        this_theta = the_theta(n);
        sigma11 = this_r*cos(this_theta);
        sigma22 = this_r*sin(this_theta);
        thisPoint = [0; 0; 0]; 
        for order = 0:N
            for vader = 0:order
                m1 = order-vader;
                m2 = vader;
                
                thisPoint = thisPoint + ...
                    reshape(SM(m1+1, m2+1, :), [3,1])*...  
                    ((sigma11 + 1i*sigma22)^m1)*((sigma11 - 1i*sigma22)^m2);
            end
        end
     
        Wu_loc(:, pointNum) = real(thisPoint);
        pointNum = pointNum + 1;
     end
     
 end

lastRow = Wu_loc(:, (numTheta*(numR-1)+1):end);
 
% Plotting
figure
hold on
plot3(Wu_loc(1, :)', Wu_loc(2, :)', Wu_loc(3, :)', 'r.')
plot3(lastRow(1, :)', lastRow(2, :)', lastRow(3, :)', 'b.','MarkerSize',10)
set(gcf,'color','w')
title('Local unstable manifold')

% Save last row of Wu_loc
itstartpoints = lastRow';

%% Export lastRow
save(sprintf('itstartpoints_arn0863.csv'), 'itstartpoints', '-ascii');