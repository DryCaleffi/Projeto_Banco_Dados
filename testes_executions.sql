USE universidade;

-- Teste de inclusão de dados repetidos
-- TESTE 1-- DADOS REPETIDOS NA TABELA DE CURSOS 
-- Executa o primeiro valores e espera ele inserir na tabela.
INSERT INTO Cursos (nome_curso, duracao_anos) VALUES ('Veterinária', 7);

-- Executa o segundo e deve dar erro
INSERT INTO Cursos (nome_curso, duracao_anos) VALUES ('Veterinária', 7);

SELECT c.nome_curso, COUNT(*) as total
FROM Cursos c
GROUP BY nome_curso


-- Teste de Concorrência 
-- TESTE 1 --
-- primeira transação para realizar empréstimo
BEGIN TRANSACTION;
EXEC RealizarEmprestimo @id_usuario = 1, @id_livro = 1;
-- Espera 20 segundos para simular processamento, esse processo deve ser travado 
WAITFOR DELAY '00:00:20';
COMMIT;
SELECT 'Sessão 1 - Transação completada' AS Resultado;

-- segunda transação que deve tentar ser executada durante a primeira 
-- Esta deve ficar bloqueada
SELECT GETDATE() AS 'Tentativa Sessão 2 Inicio';
EXEC RealizarEmprestimo @id_usuario = 2, @id_livro = 1;
SELECT GETDATE() AS 'Tentativa Sessão 2 Fim';-- 
SELECT GETDATE() AS 'Tentativa Sessão 2 Inicio';
EXEC RealizarEmprestimo @id_usuario = 2, @id_livro = 1;
SELECT GETDATE() AS 'Tentativa Sessão 2 Fim';


-- TESTE 2 -- Mesmo livro para mesmo usuário ativo
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista) 
VALUES (1, 1, GETDATE(), DATEADD(day, 15, GETDATE()));

-- Esta deve ser bloqueada (livro já emprestado para usuário ativo)
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista) 
VALUES (1, 1, GETDATE(), DATEADD(day, 15, GETDATE()));

-- Verificar empréstimos ativos duplicados
SELECT id_usuario, id_livro, COUNT(*) as total_emprestimos_ativos
FROM Emprestimos
WHERE data_devolucao IS NULL
GROUP BY id_usuario, id_livro
HAVING COUNT(*) > 1;