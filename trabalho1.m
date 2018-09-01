opcao = input("\n Digite o numero de acordo com a opcao desejada: \n 1) Bisseção.\n 2) Newton Raphson.\n 3) Secante.\n");
   
if( opcao == 1 )
    n = input("\n Digite o numero de movimentos: \n"); %(5)
    for j = 1:n
    ap = input("\n Digite o a: \n"); %(1)
    eps = input("\n Digite a precisao: \n"); %(1e-4)
    f = @(x) ap*e^x - 4*x^2;
    a=-10;
    b=-9;
    
 
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
        iteration_counter = iteration_counter + 1;
        fprintf(' K=%f A=%f F(A)=%f B=%f F(B)=%f  X=%f F(X)=%f  B-A=%f\n', iteration_counter, x_L, f(x_L), x_R, f(x_R), x_M, f(x_M),x_L-x_R);
    end
    result1 = x_M;
    result2 = iteration_counter;
end
 
 while (a <= 100 && b<=100)
   if (f(a)*f(b)<0)
    [solution, no_iterations] = bisection(f, a, b, eps);
    break;
   endif
 a++;   
 b++;
 endwhile
 
 if solution <= b   % Solution found
        fprintf('\n-------------------RESUMO------------------\n')
        fprintf('(Isolamento) entre %f e %f\n', a, b)
        fprintf('Numero de iteracoes: %d\n', no_iterations);
        fprintf('d = %f\n', solution);
    else
        fprintf('Execucao abortada.\n');
    end 
endfor
%METODO DE NEWTON----------------------------    
elseif( opcao == 2 )
    n = input("\n Digite o numero de movimentos: \n"); %(5)
    for j = 1:n
    ap = input("\n Digite o a: \n"); %(1)
    f = @(x) ap*e^x - 4*x^2;
    dfdx = @(x) e^x-8*x;
    eps = input("\n Digite a precisao: \n"); %(1e-4)
    a=-10;
    b=-9;
 
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
        fprintf(' K=%f  X=%f F(X)=%f  X1-X0=%f\n', iteration_counter, x, f(x), x-x0);
    end
    % Here, either a solution is found, or too many iterations
    if abs(f_value) > eps
        iteration_counter = -1;
    end
    solution = x;
    no_iterations = iteration_counter;
end
  
 while (a <= 100 && b<=100)
   if (f(a)*f(b)<0)
     x0 = b; %Preciso disso
   endif
 a++;   
 b++;
 endwhile
    
    [solution,no_iterations] = Newton(f, dfdx, x0, eps);
    if no_iterations > 0   % Solution found
        fprintf('\n-------------------RESUMO------------------\n')
        fprintf('(Isolamento) x0 =  %f\n', x0)
        fprintf('Numero de iteracoes: %d\n', no_iterations);
        fprintf('d =  %f\n', solution)
    else
        fprintf('Execucao abortada.\n')
    end
endfor
%METODO DA SECANTE----------------------------  
elseif( opcao == 3 )
    n = input("\n Digite o numero de movimentos: \n"); %(5)
    for j = 1:n
    ap = input("\n Digite o a: \n"); %(1)
    f = @(x) ap*e^x - 4*x^2;
    eps = input("\n Digite a precisao: \n"); %(1e-4)
     a=-10;
    b=-9;
     
 while (a <= 100 && b<=100)
   if (f(a)*f(b)<0)
     x0 = b; %Preciso disso
   endif
 a++;   
 b++;
 endwhile

function [solution,no_iterations] = secant(f, x0, x1, eps)
    f_x0 = f(x0);
    f_x1 = f(x1);
    iteration_counter = 0;
    while abs(f_x1) > eps && iteration_counter < 100
        try
            denominator = (f_x1 - f_x0)/(x1 - x0);
            x = x1 - (f_x1)/denominator;
        catch
            fprintf('Erro! - denominador zero para x = \n', x1)
            break
        end
        x0 = x1;
        x1 = x;
        f_x0 = f_x1;
        f_x1 = f(x1);
        iteration_counter = iteration_counter + 1;
        fprintf(' K=%f  X=%f F(X)=%f  X1-X0=%f\n', iteration_counter, x0, f(x0), x1-x0);
    end
    % Here, either a solution is found, or too many iterations
    if abs(f_x1) > eps
        iteration_counter = -1;
    end
    solution = x1;
    no_iterations = iteration_counter;
end
 x1 = x0 - 1;
    
    [solution,no_iterations] = secant(f, x0, x1, eps);
    if no_iterations > 0   % Solution found
        fprintf('\n-------------------RESUMO------------------\n')
        fprintf('(Isolamento) x0 =  %f\n', x0)
        fprintf('Numero de iteracoes: %d\n', no_iterations);
        fprintf('d = %f\n', solution)
    else
        fprintf('Execucao abortada.\n')
    end
 endfor   
else 
disp("Opcao invalida\n");
endif
