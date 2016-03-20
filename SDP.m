%SDP simple example
randn('state',0);
n = 4;
A = randn(n); 
%to make it symmetric
A = 0.5*(A'+A); %A = A'*A; 
B = randn(n); B = B'*B;

c = -1;

cvx_begin sdp
    variable t
    minimize ( c*t )
    A >= t * B;
cvx_end

disp('------------------------------------------------------------------------');
disp('The optimal t obtained is');
disp(t);