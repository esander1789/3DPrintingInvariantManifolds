function DF=ArneodoDifferential(p, beta, mu)

x = p(1);
y = p(2);
z = p(3);

DF=[  0, 1, 0;
      0, 0, 1;
     mu*(1-2*x),-1,-beta];