% Objective - to find a separating hyperplane given two sets of points -
% v1,v2,v3 and w1,w2,w3
% hyperplane H(a,b) where a'*v_i <= b and a'*w_i >=b 
% to find a suitable x = (a,b) by formulating as a Linear Feasibility
% problem of the form Bx = 0 and 1'Bx=1
% Problem 4.18

v1 = [1; 0];
v2 = [1; -1];
v3 = [0; 0.5];

w1 = [4 ; 5];
w2 = [3 ; 9];
w3 = [2.5 ; 2];
n=2;

B = [-v1' 1; -v2' 1; -v3' 1; -w1' -1; -w2' -1; -w3' -1];
one = [1;1;1;1;1;1];
sum=0;

%y = B*x;
 %   for i=1:6
 %  sum = sum + y(i);
 %  end

cvx_begin
    variable x(n+1)
    minimize (0)
    B*x >= 0
    one'*(B*x) == 1
    
    
cvx_end
    
B*x
fprintf(1,'Done! \n');

disp('------------------------------------------------------------------------');
disp('The computed optimal solution is: ');
disp(x);

    