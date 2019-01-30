function z = twoDNewton(numIteration,x0,y0)

% Initialize x and y (components of the vector x_n) with initial values 
x = x0;
y = y0;

for i = 1:1:numIteration
    
    % DF matrix evaluated at vector x_n
    % The derivative matrix of the given vector-valued function
    DF = [2.*(x-1) 2.*(y-1);2.*(x-2) 2.*(y-3)];
    % The vector valued function F(x_n)
    Fx = [(x-1).^2+(y-1).^2-9; (x-2).^2+(y-3).^2-10];

    % temp = [x_(n+1)-x_n; y_(n+1)-y_n];
    temp = DF\((-1)*Fx);

    % result of Newton's Method
    result = temp + [x;y];
    fprintf('\nIteration %d: \n', i);
    disp(result);
    
    % update the value of x and y
    x=result(1);
    y=result(2);
end

end

