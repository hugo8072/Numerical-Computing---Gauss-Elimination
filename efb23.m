% Criação de Matriz e Vetor Aleatórios
A = rand(15) * 2 - 1;  % Elementos em [-1, 1]
b = rand(15, 1) * 2 - 1;  % Elementos em [-1, 1]
tol = 1e-13;

% Inicialização de vetores para armazenar dados para gráfico
erros = zeros(1, 50);
num_conds = zeros(1, 50);

% Função para calcular a Norma Euclidiana
function norma = normaEuclidiana(v)
    norma = sqrt(sum(v.^2));
end

% Ciclo de 50 Iterações
for i = 1:50
    k = (i - 1) * (0.9 / 49);
    A(1, :) = (1 - k) * A(1, :) + k * A(2, :);

    % Definindo p
    p = 1;  % ou p = Inf;

    % Calcula o número de condição
    num_cond = condm(A, p);

    % Resolve o sistema Ax = b
    x = elim_gausspt(A, b, tol);

    % Calcula a norma do erro
    if isempty(x)
        error_norm = Inf;
    else
        error_norm = normaEuclidiana(A * x - b);
    end

    % Armazenar dados para o gráfico
    erros(i) = error_norm;
    num_conds(i) = num_cond;

    % Exibindo resultados
    fprintf('Iteração %d: Número de Condição = %f, Norma do Erro = %f\n', i, num_cond, error_norm);
end

% Filtrar valores infinitos
indices_validos = isfinite(erros) & isfinite(num_conds);
erros_filtrados = erros(indices_validos);
num_conds_filtrados = num_conds(indices_validos);

% Gráfico log-log com linha contínua
loglog(num_conds_filtrados, erros_filtrados, 'b-');
title('norma do erro vs num. condição');
xlabel('log10(Número de Condição)');
ylabel('log10(Erro)');
grid on;

