
%% Author: Mohammad Mahdi Khaligh
function root = falseposition
    f = @(x) x - cos(x);
    tol = 1e-6;
    a = 0;
    b = 1;
    if f(a)*f(b) >= 0
        error('f(a) and f(b) must have opposite signs.');
    end
    c_old = a;
    while true
        c = b - f(b)*(a - b)/(f(a) - f(b));
        if abs(c - c_old) < tol
            break;
        end
        if f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
        c_old = c;
    end
    root = c;
    fprintf('Root found (False Position): %.6f\n', root);
end
%%