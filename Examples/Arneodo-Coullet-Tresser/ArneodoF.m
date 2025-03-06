function F = ArneodoF(t, Y, options, flag, beta, mu)

x = Y(1);
y = Y(2);
z = Y(3);


F = [y; 
     z;
     -y-beta*z+mu*x*(1-x)];