%heurestic suboptimal boolean LP
%problem 4.15 in textbook

rng(0,'v5uniform');
n=100;
m=300;
A=rand(m,n);
b=A*ones(n,1)/2;
c=-rand(n,1);

cvx_begin
    variable x(n);
    minimize (c'*x)
    subject to
        A*x <= b
        0 <= x
        x <= 1
cvx_end

xrl = x
L=cvx_optval

thres=0:0.01:1;
max_violation = zeros(length(thres),1);
objective = zeros(length(thres),1);
for i=1:length(thres)
xbool = (xrl>=thres(i));
max_violation(i) = max(A*xbool-b);
objective(i) = c'*xbool;
end

% find least upper bound and associated threshold
i_feasible=find(max_violation<=0)
U=min(objective(i_feasible))
%U=min(obj(find(maxviol <=0)))
t=min(i_feasible)
min_thresh=thres(t)
U-L

% plotting objective and max violation versus threshold
subplot(2,1,1)
plot(thres(1:t-1),max_violation(1:t-1),'r',thres(t:end), ...
max_violation(t:end),'b','linewidth',2);
xlabel('threshold');
ylabel('max violation');
subplot(2,1,2)
hold on; 
plot(thres,L*ones(size(thres)),'k','linewidth',2);
plot(thres(1:t-1),objective(1:t-1),'r',thres(t:end), ...
objective(t:end),'b','linewidth',2);
xlabel('threshold');
ylabel('objective');
