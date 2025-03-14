%% Euler Method
% Author: Mohammad Mahdi Khaligh
% This function approximates the solution of a differential equation using the Euler Method

function [t, y] = eulerMethod(dy, t0, y0, h, tEnd)
    t = t0:h:tEnd;
    y = zeros(size(t));
    y(1) = y0;
    for i = 1:length(t)-1
        y(i+1) = y(i) + h * dy(t(i), y(i));
    end
end
