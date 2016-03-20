%helloworld in cvx, some simple examples
cvx_begin
    variable x1;
    variable x2;
    minimize (x1+x2)
    subject to
        2*x1+x2 >= 1
        x1+3*x2 >=1
        x1>=0
        x2>=0
cvx_end
    
cvx_status

cvx_optval

%2
cvx_begin
    variable x1;
    variable x2;
    minimize (x1^2+9*x2^2)
    subject to
        2*x1+x2 >= 1
        x1+3*x2 >=1
        x1>=0
        x2>=0
cvx_end
    
cvx_status
