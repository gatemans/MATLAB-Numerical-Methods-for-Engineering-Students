%% Newton-Raphson Method
% Author: Mohammad Mahdi Khaligh
% This function finds the root of an equation using the Newton-Raphson method

function root = newtonRaphson(f, df, x0, tol, maxIter)
    for i = 1:maxIter
        x1 = x0 - f(x0) / df(x0);
        if abs(x1 - x0) < tol
            root = x1;
            return;
        end
        x0 = x1;
    end
    error('Newton-Raphson method did not converge.');
end
