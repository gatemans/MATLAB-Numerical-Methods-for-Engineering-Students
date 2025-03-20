
%% Author: Mohammad Mahdi Khaligh
function root = newton
    f = @(x) x - cos(x);
    df = @(x) 1 + sin(x);
    tol = 1e-6;
    x = 1;
    while true
        x_new = x - f(x)/df(x);
        if abs(x_new - x) < tol
            break;
        end
        x = x_new;
    end
    root = x_new;
    fprintf('Root found (Newton-Raphson): %.6f\n', root);
end
%%