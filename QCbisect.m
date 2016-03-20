%solve the quasiconvex problem by convex feasibility and bisection
%   minimize       ciel(x)
%   subject to     3x > 5
%   over the interval (a,b) = (0,128) with tolerance - 1 
%   answer should be got in log_2 ( (b-a)/e) ) iterations 
%   last interval - (1,2)
%   optimal point estimate - 1.5
%   optimal value estimate - 2

a = 0;
b = 128;
n = 70;
e = 1;

for i = 1:n
    t = (a + b)/2; 
    cvx_begin
        variable x
        minimize (0)
        subject to
        x <= t
        3*x + 5 > 10 
    cvx_end
    
    if(strcmp(cvx_status,'Solved')==1)
        b = t;
    else
        a = t;
    end
    if((b-a)<=e)
        break;
    end        
end
    
% set the best estimate for x and the error bound
a
b
i
x = (a + b)/2
e = (b-a)/2