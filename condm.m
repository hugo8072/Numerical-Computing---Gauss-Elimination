function c = condm(A, p)
    % Verifica se p é igual a 1 ou infinito
    if ~(p == 1 || p == inf)
        % Se p não for 1 ou infinito, retorna uma matriz vazia
        c = [];
        return;
    end

    % Calcula a norma de A com base em p usando a função my_norm
    normA = my_norm(A, p);

    % Calcula a inversa de A
    A_inv = inv(A);

    % Calcula a norma da inversa de A com base em p usando a função my_norm
    normA_inv = my_norm(A_inv, p);

    % Calcula a matriz de condicionamento como o produto das duas normas
    c = normA * normA_inv;
end

function B = my_abs(A)
    % Obtém o número de linhas e colunas de A
    [rows, cols] = size(A);

    % Inicializa a matriz B com zeros
    B = zeros(rows, cols);

    % Percorre todos os elementos de A
    for i = 1:rows
        for j = 1:cols
            % Se o elemento de A for negativo, torna-o positivo em B
            if A(i, j) < 0
                B(i, j) = -A(i, j);
            else
                % Caso contrário, copia o valor para B
                B(i, j) = A(i, j);
            end
        end
    end
end

function s = my_sum(A, dim)
    % Obtém o número de linhas e colunas de A
    [rows, cols] = size(A);

    % Inicializa o vetor s com zeros
    if dim == 1
        % Se dim for 1, calcula a soma das colunas
        s = zeros(1, cols);
        for j = 1:cols
            for i = 1:rows
                % Soma os elementos da coluna j
                s(j) = s(j) + A(i, j);
            end
        end
    elseif dim == 2
        % Se dim for 2, calcula a soma das linhas
        s = zeros(rows, 1);
        for i = 1:rows
            for j = 1:cols
                % Soma os elementos da linha i
                s(i) = s(i) + A(i, j);
            end
        end
    else
        % Caso contrário, gera um erro indicando que a dimensão não é suportada
        error('Dimensão não suportada. Use 1 ou 2.');
    end
end

function n = my_norm(A, p)
    % Calcula a norma de A com base em p
    if p == 1
        % Se p for 1, calcula a norma de máximo de coluna usando my_sum e my_abs
        n = max(my_sum(my_abs(A), 1));
    elseif p == inf
        % Se p for infinito, calcula a norma de máximo de linha usando my_sum e my_abs
        n = max(my_sum(my_abs(A), 2));
    else
        % Caso contrário, gera um erro indicando que o valor de p não é suportado
        error('Valor de p não suportado. Use 1 ou inf.');
    end
end

