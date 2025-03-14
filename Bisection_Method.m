%% Bisection Method
% Author: Mohammad Mahdi Khaligh
% This function finds the root of an equation using the Bisection Method

function root = bisectionMethod(f, a, b, tol, maxIter)
    if f(a) * f(b) > 0
        error('Function must have opposite signs at endpoints.');
    end
    for i = 1:maxIter
        c = (a + b) / 2;
        if abs(f(c)) < tol
            root = c;
            return;
        elseif f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
    end
    error('Bisection method did not converge.');
end
