opcao = input("\n Digite o numero de acordo com a opcao desejada: \n 1) Bisseção.\n 2) Newton Raphson.\n 3) Secante.\n");
%METODO DA BISSECAO---------------------   
if( opcao == 1 )
    n = input("\n Digite o numero de movimentos: \n"); % entra com o numero de movimentos
    for j = 1:n % executa para cada movimento
    ap = input("\n Digite o a: \n"); % recebe o 'a' da funcao
    eps = input("\n Digite a precisao: \n"); % recebe a precisao
    f = @(x) ap*e^x - 4*x^2; % funcao
    a=-10; % intervalo inicial a esquerda
    b=-9; % intervalo inicial a direita
    
 % funcao que realiza o calculo da bissecao
function [result1, result2] = bisection(f, x_L, x_R, eps)
    % verifica se os pontos do intervalo sao validos
    if f(x_L)*f(x_R) > 0
        fprintf('Erro! A funcao não tem oposto\n');
        fprintf('sinais nos pontos finais do intervalo!')
        exit(1)
    end
    % se forem faz a divisao ao meio dos pontos
    x_M = (x_L + x_R)/2.0;
    % calcula o f(x) do resultado 
    f_M = f(x_M);
    % inicializa o contador
    iteration_counter = 1;
    % realiza o laço ate a precisao desejada
    while abs(f_M) > eps
        left_f = f(x_L);
        right_f = f(x_R);
        % identifica o ponto trocado pelo novo valor
        if left_f*f_M > 0   
            x_L = x_M;
        else
            x_R = x_M;
        end
        % realiza a divisao ao meio
        x_M = (x_L + x_R)/2;
        % calcula o f(x) do resultado
        f_M = f(x_M);
        % incrementa o contador
        iteration_counter = iteration_counter + 1;
        % printa a iteracao
        fprintf(' K=%d A=%f F(A)=%f B=%f F(B)=%f  X=%f F(X)=%f  B-A=%f ER=%f \n', iteration_counter, x_L, f(x_L), x_R, f(x_R), x_M, f(x_M),x_L-x_R,(x_L-x_R)/x_L);
    end
    result1 = x_M;
    result2 = iteration_counter;
end
 %ISOLAMENTO DA BISSECAO----------------
 while (a <= 100 && b<=100)
    % procura o intervalo pela regra dos sinais
   if (f(a)*f(b)<0)
    % quando acha adiciona a funcao bissection como parametro
    [solution, no_iterations] = bisection(f, a, b, eps);
    break;
   endif
 a++;   
 b++;
 endwhile
 % verifica se o resultado e valido e printa o resumo dos dados
 if solution <= b   
        fprintf('\n-------------------RESUMO------------------\n')
        fprintf('(Isolamento) entre %f e %f\n', a, b)
        fprintf('Numero de iteracoes: %d\n', no_iterations);
        fprintf('d = %f\n', solution);
        % verifica se houve deslocamento
        if (solution != 0)
        fprintf('Para A = %d existe deslocamento\n', ap)
        endif
    else
        fprintf('Execucao abortada.\n');
    end 
endfor

%METODO DE NEWTON----------------------------    
elseif( opcao == 2 )
    n = input("\n Digite o numero de movimentos: \n"); % entra com o numero de movimentos
    for j = 1:n % executa para cada movimento
    ap = input("\n Digite o a: \n"); % recebe o 'a' da funcao
    f = @(x) ap*e^x - 4*x^2; % funcao
    dfdx = @(x) e^x-8*x; % derivada da funcao
    eps = input("\n Digite a precisao: \n"); % recebe a precisao
    a=-4; % intervalo inicial a esquerda
    b=-3; % intervalo inicial a direita
    
    %ISOLAMENTO DE NEWTON----------------
     while (a <= 100 && b<=100)
   % procura o intervalo pela regra dos sinais  
   if (f(a)*f(b)<0)
     % define x como ponto medio do intervalo encontrado
     x = (a+b)/2; 
   endif
 a++;   
 b++;
 endwhile
  
 % funcao que realiza o calculo de newton
 function [solution, no_iterations] = Newton(f, dfdx, x0, eps)
    % armazena o x0 
    xantigo = x0;
    % define x como valor de x0    
    x = x0;
    % funcao de x
    f_value = f(x);
    % inicializa o contador
    iteration_counter = 0;
     % realiza o laço ate a precisao desejada 
    while abs(f_value) > eps && iteration_counter < 100
        try
            % calcula pela formula de newton raphson
            % verifica se a derivada é menor que o erro, se for usa-se FL = f'(x0) normal
            if dfdx(x) > eps 
            x = x - (f_value)/dfdx(x);
            else 
            % senao for, usa-se FL = f'(xw)
            x = x - (f_value)/dfdx(x0);
            endif
        catch
            % retorna erro se a derivada for zero
            fprintf('Erro! - derivada zero para x = \n', x)
            exit(1)
        end
        % calcula o f(x) de x
        f_value = f(x);
        % incrementa o contador
        iteration_counter = iteration_counter + 1;
        % printa a iteracao
        fprintf(' K=%d  X=%f F(X)=%f  Xn-Xn-1=%f ER=%f\n', iteration_counter, x0, f(x), x-x0,(x-x0)/x);
        % atualiza o x0
        x0 = x;
    end
    % verifica se atingiu a precisao
    if abs(f_value) > eps
        iteration_counter = -1;
    end
    solution = x;
    no_iterations = iteration_counter;
end
    x0 = x-1;
    % chama a funcao newton
    [solution,no_iterations] = Newton(f, dfdx, x0, eps);
    % verifica se o resultado e valido e printa o resumo dos dados
    if no_iterations > 0   
        fprintf('\n-------------------RESUMO------------------\n')
        fprintf('(Isolamento) x0 =  %f\n', x0)
        fprintf('Numero de iteracoes: %d\n', no_iterations);
        fprintf('d =  %f\n', solution)
        % verifica se houve deslocamento
         if (solution != 0)
        fprintf('Para A = %d existe deslocamento\n', ap)
        endif
    else
        fprintf('Execucao abortada.\n')
    end
endfor

%METODO DA SECANTE----------------------------  
elseif( opcao == 3 )
    n = input("\n Digite o numero de movimentos: \n"); % entra com o numero de movimentos
    for j = 1:n % executa para cada movimento
    ap = input("\n Digite o a: \n"); % recebe o 'a' da funcao
    f = @(x) ap*e^x - 4*x^2; % funcao
    eps = input("\n Digite a precisao: \n"); % recebe precisao
     a=-10; % intervalo inicial a esquerda
    b=-9; % intervalo inicial a direita
 
%ISOLAMENTO DA SECANTE---------------- 
 while (a <= 100 && b<=100)
  % procura o intervalo pela regra dos sinais  
   if (f(a)*f(b)<0)
   % define x0 como ponto medio do intervalo encontrado
     x0 = (a+b)/2; 
   endif
 a++;   
 b++;
 endwhile

% funcao que realiza o calculo da secante 
function [solution,no_iterations] = secant(f, x0, x1, eps)
    % calcula o f(x) de x0
    f_x0 = f(x0);
    % calcula o f(x) de x1
    f_x1 = f(x1);
    % inicializa o contador
    iteration_counter = 0;
     % realiza o laço ate a precisao desejada 
    while abs(f_x1) > eps && iteration_counter < 100
        try
            % calcula o denominador
            denominator = (f_x1 - f_x0)/(x1 - x0);
            % calcula pela formula da secante
            x = x1 - (f_x1)/denominator;
        catch
            % se o denominador for zero retorna erro
            fprintf('Erro! - denominador zero para x = \n', x1)
            break
        end
        % atualiza x0
        x0 = x1;
        % atualiza x1
        x1 = x;
        % atualiza f(x0)
        f_x0 = f_x1;
        % atualiza f(x1)
        f_x1 = f(x1);
        % incrementa o contador
        iteration_counter = iteration_counter + 1;
        % printa a iteracao
        fprintf(' K=%d  X=%f F(X)=%f  Xn-Xn-1=%f ER=%f\n', iteration_counter, x0, f(x0), x1-x0, (x1-x0)/x1);
    end
    % verifica se atingiu a precisao
    if abs(f_x1) > eps
        iteration_counter = -1;
    end
    solution = x1;
    no_iterations = iteration_counter;
end
 % atualiza x1
 x1 = x0 - 1;
    % chama a funcao secant
    [solution,no_iterations] = secant(f, x0, x1, eps);
    % verifica se o resultado e valido e printa o resumo dos dados
    if no_iterations > 0   
        fprintf('\n-------------------RESUMO------------------\n')
        fprintf('(Isolamento) x0 =  %f\n', x0)
        fprintf('Numero de iteracoes: %d\n', no_iterations);
        fprintf('d = %f\n', solution)
        % verifica se houve deslocamento
         if (solution != 0)
        fprintf('Para A = %d existe deslocamento\n', ap)
        endif
    else
        fprintf('Execucao abortada.\n')
    end
 endfor   
else 
disp("Opcao invalida\n");
endif
