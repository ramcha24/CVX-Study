% the optimal activity problem as mentioned in the textbook.
%problem 4.17 in textbook


A = [1 2 0 1; 0 0 3 1; 0 3 1 1; 2 1 2 5; 1 0 3 2];
c_max = [100;100;100;100;100];
p = [3;2;7;6];
p_disc = [2;1;4;2];
q = [4;10;5;10];

n =  4;
m = 5;
o = [1;1;1;1]

cvx_begin
    variables u(n) x(n)
    maximize (o'*u)
    x >= 0
    A*x <= c_max
    for j=1:n
    p(j)*x(j) >= u(j)
    p(j)*q(j) + p_disc(j)*(x(j)-q(j)) >= u(j)
    end 
    cvx_end

    
disp('------------------------------------------------------------------------');
disp('The computed optimal solution is: ');
disp(x);
disp('The computed optimal revenues is: ');
disp(u);
    