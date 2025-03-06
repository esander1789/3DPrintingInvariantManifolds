function SM = getCoeffsArneodo(p,Dfp,lambda_s1, lambda_s2, xi_s1, xi_s2, N, scale, beta, mu)
    P = zeros(N+1, N+1, 3);
    P(1, 1, :) = p;
    P(2, 1, :) = scale*xi_s1;
    P(1, 2, :) = scale*xi_s2;
    Id = eye(3);
    coeffDecay = zeros(1, N+1);
    coeffDecay(1) = norm(P(:, 1), inf);
    coeffDecay(2) = max([norm(reshape(P(1, 2, :), [3, 1]), inf), ...
        norm(reshape(P(2, 1, :),[3, 1]), inf)]);

    for  order = 2:N
     
     theseAbs = [];
     
     for vader = 0:order
        n1 = order - vader;
        n2 = vader;
         
        A = Dfp - (n1*lambda_s1 + n2*lambda_s2)*Id;
        
      sum1 = 0;

        for k1 = 0:n1
        for k2 = 0:n2 
   
        sum1 = sum1 + P(n1-k1+1, n2-k2+1, 1)* P(k1+1, k2+1, 1);
        
         end
         end
        
        sum1 = sum1 - 2*P(n1+1, n2+1, 1)*P(1, 1, 1);
         
        Rmn = [  0;
                 0;
                 mu*sum1];%This was just sum2 before %%CAREFUL
           
        P(n1+1, n2+1, :) = A\Rmn;   
        theseAbs = [theseAbs, ...
                    norm(reshape(P(n1+1, n2+1, :), [3 1]), inf)];
     end
     coeffDecay(order+1) = max(theseAbs);
     
 end
 
 SM = P;

 figure
 hold on
 plot([0:N], log(coeffDecay)/log(10))
