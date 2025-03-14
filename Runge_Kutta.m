%% Runge-Kutta 4th Order Method
% Author: Mohammad Mahdi Khaligh
% This function approximates the solution of a differential equation using RK4

function [t, y] = rungeKutta4(dy, t0, y0, h, tEnd)
    t = t0:h:tEnd;
    y = zeros(size(t));
    y(1) = y0;
    for i = 1:length(t)-1
        k1 = h * dy(t(i), y(i));
        k2 = h * dy(t(i) + h/2, y(i) + k1/2);
        k3 = h * dy(t(i) + h/2, y(i) + k2/2);
        k4 = h * dy(t(i) + h, y(i) + k3);
        y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end
end
