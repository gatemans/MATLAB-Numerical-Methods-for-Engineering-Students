clc; clear; close all;
syms x

% Inputs (user-defined)
x_values = [0, 1];              
f_values = [-1, 0];               
df_values = [-2, 10];           
d2f_values = [0, 40];            

% Call the function
[P, dd] = hermite_interpolation(x, x_values, f_values, df_values, d2f_values);

% Display the polynomial
P = simplify(P);
disp('Hermite Polynomial:');
disp(P);

% Plot the polynomial
fplot(P, [0, 1], '-.');
hold on;
title('Hermite Interpolation Polynomial')
xlabel('x')
ylabel('P(x)')




function [P, dd] = hermite_interpolation(x, x_values, f_values, df_values, d2f_values)

    % Number of points
    n = length(x_values);
    
    % Build Hermite table nodes (repeated points for Hermite)
    X = [];
    F = [];
    dF = [];

    for i = 1:n
        if i < n % Internal points (first point has f and f')
            X = [X, x_values(i), x_values(i)];
            F = [F, f_values(i), f_values(i)];
            dF = [dF, df_values(i), df_values(i)];
        else % Last point has f, f', and f''
            X = [X, x_values(i), x_values(i), x_values(i)];
            F = [F, f_values(i), f_values(i), f_values(i)];
            dF = [dF, df_values(i), df_values(i), d2f_values(i)];
        end
    end

    % Divided Difference Table
    m = length(X);
    dd = zeros(m, m);
    dd(:,1) = F';

    for j = 2:m
        for i = j:m
            if X(i) == X(i-j+1)
                if j == 2
                    dd(i,j) = dF(i); % f' for two repeated nodes
                else
                    dd(i,j) = d2f_values(end) / factorial(j-1); % f'' for 3 repeated nodes
                end
            else
                dd(i,j) = (dd(i,j-1) - dd(i-1,j-1)) / (X(i) - X(i-j+1));
            end
        end
    end

    % Construct Hermite Polynomial
    P = dd(1,1);
    term = 1;

    for j = 2:m
        term = term * (x - X(j-1));
        P = P + dd(j,j) * term;
    end

    % Print Divided Difference Table
    disp('Divided Difference Table:')
    disp(array2table(dd, 'VariableNames', compose("Order_%d", 0:m-1)))

end
