% minimize (  max{p(x),q(x)} )  by formulating as a GP
% p and q have to be posynomials
% here, p(x) = x + y^3
% q(x) = x^2y 
% Solution - 
%t =  10.000000002202405
%x =   2.000000002559305
%y =   2.000000000213355

cvx_begin gp
    variables t x y
    minimize( t )
    subject to
        (x+y^3)/t <= 1
        (x^2*y)/t <= 1
        x >= 2
        y >= 2
cvx_end




% if p(x) = x^2 + y^2 and q(x) = xy , then p(x) >= q(x) therefore we will
% be minimizing p(x) alone
% thus the solution will be x=2 and y=2 and optval = 8

cvx_begin gp
    variables t x y
    minimize( t )
    subject to
        (x^2+y^2)/t <= 1
        (2*x*y)/t <= 1
        x >= 2
        y >= 2
cvx_end


