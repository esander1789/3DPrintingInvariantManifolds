

%=================== Triangulate a fundemental domain

numBDpoints = 150;
numRadii = 32;
BDpoints = zeros(numBDpoints, 2);
tau = 0.25;
thetas = linspace(0, 2*pi, numBDpoints);

%%%%%%%%%%%%%%%%%

for k = 1:numBDpoints
   BDpoints(k, 1:2) =  [cos(thetas(k)), sin(thetas(k))];
end    

complexify_BDpoints = BDpoints(:,1) + i*BDpoints(:,2);
complexify_innerPoints = exp(-tau*lambda_u1)*complexify_BDpoints;
innerPoints = [real(complexify_innerPoints), imag(complexify_innerPoints)];

cloudPoints = BDpoints;
contractionRate = abs(exp(-tau*lambda_u1));

for k = 1:(numRadii-1)
    thisFactor = 1 - (k/numRadii)*(1 - contractionRate);
    thesePoints = 1/thisFactor*BDpoints;
    cloudPoints = [cloudPoints; thesePoints];
end

%cloudPoints = [cloudPoints; innerPoints];


xFD = cloudPoints(:, 1);
yFD = cloudPoints(:, 2);

% 
% figure
% hold on
 TRI_uFD = delaunay(xFD, yFD);
% triplot(TRI_uFD, xFD,  yFD, 'blue');


tempSizeVect = size(TRI_uFD);
sizeTri = tempSizeVect(1,1);

triTol = 0.2; %* 0.5;  % Change this;
goodTriangles = 0; 
TRI_corr = zeros(sizeTri, 3);

for k = 1:sizeTri
    v1 = [xFD(TRI_uFD(k,1)), yFD(TRI_uFD(k,1))];
    v2 = [xFD(TRI_uFD(k,2)), yFD(TRI_uFD(k,2))];
    v3 = [xFD(TRI_uFD(k,3)), yFD(TRI_uFD(k,3))];
    dist1 = norm(v1-v2);
    dist2 = norm(v1-v3);
    dist3 = norm(v2-v3);
    
    theDistances = [dist1, dist2, dist3];
    maxDistance = max(theDistances);
    if (maxDistance < triTol)
    	goodTriangles = goodTriangles+1; 
        TRI_corr(goodTriangles, 1:3) = TRI_uFD(k, 1:3);
    end    
end    


TRI_uFD = TRI_corr(1:goodTriangles, :);
tempSizeVect = size(TRI_uFD);
sizeTri = tempSizeVect(1,1);


%============================ Build FD ====================================

%Build a fundamental domain here
vertices_uFD = zeros(numBDpoints*numRadii, 3);


for k = 1:numBDpoints*numRadii

  vertices_uFD(k,:) = evaluate_complexCase(xFD(k), yFD(k), Au, Bu, Cu, N)';

end    


%trisurf(TRI_uFD,vertices_uFD(:,1),vertices_uFD(:,2),vertices_uFD(:,3));
