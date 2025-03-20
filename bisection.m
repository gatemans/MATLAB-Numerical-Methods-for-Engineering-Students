
%% Author: Mohammad Mahdi Khaligh
function root = bisection
    f = @(x) x - cos(x);
    tol = 1e-6;
    a = 0;
    b = 1;
    if f(a)*f(b) >= 0
        error('f(a) and f(b) must have opposite signs.');
    end
    while (b - a)/2 > tol
        c = (a + b)/2;
        if f(c) == 0
            a = c;
            b = c;
            break;
        end
        if f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
    end
    root = (a + b)/2;
    fprintf('Root found (Bisection): %.6f\n', root);
end
%%