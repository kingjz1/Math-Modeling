%{
% fix lambda = 0.5, change s
mlist=[];
slist=[];
for s=0.05:0.001:0.1; 
    [S,lambda,m]=IF_Poisson(s,0.5);
    mlist=[mlist,m];
    slist=[slist,s];
end
hold on
plot(slist,mlist,'k*');
xlabel('Value for S (input-strength)');
ylabel('Firing rate m (times per unit time)');
title('Fix the value of lambda to be 0.5');
hold off
%}

% fix s = 1/15, change lambda
mlist=[];
lambdalist=[];
for l=0.4:0.01:0.75; 
    [S,lambda,m]=IF_Poisson(1/15,l);
    mlist=[mlist,m];
    lambdalist=[lambdalist,lambda];
end
hold on
plot(lambdalist,mlist,'k*');
xlabel('Value for lambda (Poisson-process rate)');
ylabel('Firing rate m (times per unit time)');
title('Fix the value of S to be 1/15');
hold off

