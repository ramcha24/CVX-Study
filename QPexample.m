% Solving a simple QP of the form
%           minimize    1/2x'*P*x + q'*x + r
%           subject to    -1 <= x_i <= 1      for i = 1,2,3
% Also shows that the given x_star is indeed optimal

% Manual input data , can be varied to get different problems.
P = [2 1; -1 2];
q = [-1 ; 1];
r = 0.5;
n = 2;

cvx_begin
    variable x(n)
    minimize ((1/2)*quad_form(x,P) + q'*x + r)
    x >= -1;
    x <=  1;
cvx_end

disp('------------------------------------------------------------------------');
disp('The optimal solution is: ');
disp(x);
