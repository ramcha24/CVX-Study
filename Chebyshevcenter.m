% The goal is to find the largest inscribed Euclidean ball (i.e. its center and
% radius) that lies in a polyhedron described by P = {x : a_i'*x <= b_i, i=1,...,m} where x is in R^2
% modelling the problem as an LP and then solving it by cvx
% Generate the input data
a_1 = [ 3;  4];
a_2 = [ 2; -1];
a_3 = [-1;  3];
a_4 = [-1; -2];
b = ones(4,1)

cvx_begin
    variable r(1)
    variable x_c(2)
    maximize ( r )
    a_1'*x_c + r*norm(a_1,2) <= b(1);
    a_2'*x_c + r*norm(a_2,2) <= b(2);
    a_3'*x_c + r*norm(a_3,2) <= b(3);
    a_4'*x_c + r*norm(a_4,2) <= b(4);
cvx_end

% Plotting the figure to show the ball generated
x = linspace(-2,2);
theta = 0:pi/100:2*pi;
plot( x, -x*a_1(1)./a_1(2) + b(1)./a_1(2),'b-');
hold on
plot( x, -x*a_2(1)./a_2(2) + b(2)./a_2(2),'b-');
plot( x, -x*a_3(1)./a_3(2) + b(3)./a_3(2),'b-');
plot( x, -x*a_4(1)./a_4(2) + b(4)./a_4(2),'b-');
plot( x_c(1) + r*cos(theta), x_c(2) + r*sin(theta), 'r');
plot(x_c(1),x_c(2),'k+')
xlabel('x_1')
ylabel('x_2')
title('Chebyshev center and corresponding ball for 2D polyhedron');
axis([-1 1 -1 1])
axis equal