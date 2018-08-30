function Newtons_method()
    ap = input("\n Digite o a: \n"); %(1)
    f = @(x) ap*e^x - 4*x^2;
    dfdx = @(x) e^x-8*x;
    eps = input("\n Digite o erro: \n"); %(1e-4)
    x0 = 3.5; %Preciso disso
    
    [solution,no_iterations] = Newton(f, dfdx, x0, eps);
    if no_iterations > 0   % Solution found
        fprintf('Numero de iteracoes: %d\n', 1 + 2*no_iterations);
        fprintf('d =  %f\n', solution)
    else
        fprintf('Execucao abortada.\n')
    end
end

function [solution, no_iterations] = Newton(f, dfdx, x0, eps)
    x = x0;
    f_value = f(x);
    iteration_counter = 0;
    while abs(f_value) > eps && iteration_counter < 100
        try
            x = x - (f_value)/dfdx(x);
        catch
            fprintf('Erro! - derivada zero para x = \n', x)
            exit(1)
        end
        f_value = f(x);
        iteration_counter = iteration_counter + 1;
    end
    % Here, either a solution is found, or too many iterations
    if abs(f_value) > eps
        iteration_counter = -1;
    end
    solution = x;
    no_iterations = iteration_counter;
end
