%% Trapezoidal Rule
% Author: Mohammad Mahdi Khaligh
% This function approximates the integral of a function using the Trapezoidal Rule

function I = trapezoidalRule(f, a, b, n)
    h = (b - a) / n;
    x = a:h:b;
    y = f(x);
    I = h * (sum(y) - 0.5 * (y(1) + y(end)));
end
