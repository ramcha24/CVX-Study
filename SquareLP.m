% To solve the square LP problem -
%           minimize        c'x
%           subject to      A'x <= b    
%       where A is square and non-singular
%
%  Theoretically, the optimum value is given by -
%   y* = c'A^(-1)b      if   c'A^(-1) <=0 
%      = -infinity      otherwise     

n = 2;
c1 = [-1 ;-2];
A1 = [1 0; 0 1];
%A2 = [1 9;13 4];
b = [2 ; 3];

x_theory = [2 ; 3]
%c1'*x
fprintf(1,'Computing the optimal solution ...');
cvx_begin
    variable x(n);
    minimize (0)
    A1*x <= b
cvx_end
fprintf(1,'Done! \n');

disp('------------------------------------------------------------------------');
disp('The computed optimal solution is: ');
disp(x);
disp('The given optimal solution is: ');
disp(x_theory);





