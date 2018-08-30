function bisection_method()
    ap = 1;
    f = @(x) ap*e^x - 4*x^2;
    eps = 1e-4;
    a = 0;   
    b = 3;
    
    [solution, no_iterations] = bisection(f, a, b, eps);
    if solution <= b   % Solution found
        fprintf('Numero de iteracoes: %d\n', 1+2*no_iterations);
        fprintf('Solucao: %f\n', solution);
    else
        fprintf('Execucao abortada.\n');
    end
end

function [result1, result2] = bisection(f, x_L, x_R, eps)
    if f(x_L)*f(x_R) > 0
        fprintf('Erro! A funcao não tem oposto\n');
        fprintf('sinais nos pontos finais do intervalo!')
        exit(1)
    end
    x_M = (x_L + x_R)/2.0;
    f_M = f(x_M);
    iteration_counter = 1;
    while abs(f_M) > eps
        left_f = f(x_L);
        right_f = f(x_R);
        if left_f*f_M > 0   % i.e., same sign
            x_L = x_M;
        else
            x_R = x_M;
        end
        x_M = (x_L + x_R)/2;
        f_M = f(x_M);
        iteration_counter = iteration_counter + 2;
    end
    result1 = x_M;
    result2 = iteration_counter;
end
