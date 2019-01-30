function x = bisection_method (a, b, p)

% a and b are the initial values of the bisection, we find a mid point c
% between a and b 
% p is the decimal accuracy that we want (Let p = 10^(-1) when running the
% function)

fa=function_f(a);
fb=function_f(b);
c=(a+b)/2;
fc=function_f(c);

if (fa)*(fb) >= 0
    if fa == 0
       x = a;
    elseif fb == 0
       x = b;
    else 
       fprintf('Sorry, bisection method cannot be used.\n');
    end   
elseif (abs(a-b) < p && (abs(fc)<p)) 
    x = c;
    fprintf('The root obtained by bisection method is: %8.4f\n', x);
else 
    if fa*fc<0
        x = bisection_method (a, c, p);
        % Do a recursion to let the fuciton keep calling bisection method
    elseif fb*fc<0
        x = bisection_method (b, c, p);
        % Do a recursion to let the fuciton keep calling bisection method
    else
        if fc == 0
           x = c;
           fprintf('The root obtained by bisection method is: %8.4f\n', x);
        end
    end
end




function output_y = function_f(input_x)
output_y = 3 - input_x.^2 + input_x;
% output_y = 2*(input_x > sqrt(2)) - 1;


