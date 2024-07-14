function x = elim_gausspt(A, b, tol)
    % elim_gausspt realiza a eliminação de Gauss com pivot parcial.
    % A é a matriz de coeficientes, b é o vetor de termos independentes, e
    % tol é a tolerância para verificar singularidade da matriz.

    n = size(A, 1); % Obtém o número de linhas da matriz A.
    x = zeros(n, 1); % Inicializa o vetor solução x com zeros.

    for k = 1:n-1
        % Loop sobre as colunas da matriz A para aplicar a eliminação.

        % Escolha parcial de pivot
        [max_val, i_max] = max_custom(abs_custom(A(k:n, k)));
        % Encontra o maior valor em módulo na coluna atual e sua posição.
        i_max = i_max + k - 1;
        % Ajusta o índice do pivô máximo para a posição correta na matriz total.
        if abs_custom(A(i_max, k)) < tol
            % Verifica se o elemento pivô é menor que a tolerância.
            fprintf('Matriz A singular!\n'); % Imprime mensagem de erro.
            x = []; % Retorna vetor vazio.
            return; % Encerra a função.
        end

        % Troca de linhas
        if i_max ~= k
            % Se o pivô não está na posição correta, troca as linhas.
            A([k, i_max], :) = A([i_max, k], :);
            b([k, i_max]) = b([i_max, k]);
        end

        % Eliminação
        for i = k+1:n
            % Loop para aplicar a eliminação de Gauss nas linhas abaixo do pivô.
            factor = A(i, k) / A(k, k); % Calcula o fator de multiplicação.
            A(i, k:n) = A(i, k:n) - factor * A(k, k:n); % Atualiza a linha i da matriz A.
            b(i) = b(i) - factor * b(k); % Atualiza o vetor b na posição i.
        end
    end

    % Substituição inversa
    for i = n:-1:1
        % Loop para resolver o sistema triangular superior resultante.
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i); % Calcula a solução para cada variável.
    end
end

% Funções auxiliares
function y = abs_custom(x)
    % abs_custom retorna o valor absoluto de x.
    if x < 0
        y = -x;
    else
        y = x;
    end
end

function [max_val, max_index] = max_custom(v)
    % max_custom retorna o valor máximo e o índice do valor máximo em um vetor v.
    max_val = v(1);
    max_index = 1;
    for i = 2:length(v)
        % Loop para encontrar o valor máximo e seu índice.
        if v(i) > max_val
            max_val = v(i);
            max_index = i;
        end
    end
end

