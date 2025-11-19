USE universidade;

-- Views --

--Histórico de empréstimos
CREATE VIEW vw_HistoricoEmprestimos AS
SELECT 
    e.id_emprestimo,
    u.id_usuario,
    CASE 
        WHEN u.tipo_usuario = 'Aluno' THEN a.nome_aluno
        ELSE f.nome_funcionario
    END AS nome_usuario,
    l.titulo AS livro,
    e.data_emprestimo,
    e.data_prevista,
    e.data_devolucao,
    e.multa
FROM Emprestimos e
INNER JOIN Usuarios u ON e.id_usuario = u.id_usuario
LEFT JOIN Alunos a ON u.id_aluno = a.id_aluno
LEFT JOIN Funcionarios f ON u.id_funcionario = f.id_funcionario
INNER JOIN Livros l ON e.id_livro = l.id_livro;
GO


-- Empréstimos ainda não devolvidos
CREATE VIEW vw_EmprestimosAtivos AS
SELECT 
    e.id_emprestimo,
    u.id_usuario,
    COALESCE(a.nome_aluno, f.nome_funcionario) AS nome_usuario,
    l.titulo AS livro,
    e.data_emprestimo,
    e.data_prevista,
    DATEDIFF(DAY, e.data_prevista, GETDATE()) AS dias_atraso
FROM Emprestimos e
INNER JOIN Usuarios u ON e.id_usuario = u.id_usuario
LEFT JOIN Alunos a ON u.id_aluno = a.id_aluno
LEFT JOIN Funcionarios f ON u.id_funcionario = f.id_funcionario
INNER JOIN Livros l ON e.id_livro = l.id_livro
WHERE e.data_devolucao IS NULL;
GO

--Livros mais emprestados
CREATE VIEW vw_LivrosMaisEmprestados AS
SELECT 
    l.id_livro,
    l.titulo,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM Livros l
LEFT JOIN Emprestimos e ON l.id_livro = e.id_livro
GROUP BY l.id_livro, l.titulo;
GO


--Usuários com mais multas
CREATE VIEW vw_UsuariosComMaisMultas AS
SELECT 
    u.id_usuario,
    COALESCE(a.nome_aluno, f.nome_funcionario) AS nome_usuario,
    COUNT(e.id_emprestimo) AS qtd_multa,
    SUM(e.multa) AS total_multas
FROM Emprestimos e
INNER JOIN Usuarios u ON e.id_usuario = u.id_usuario
LEFT JOIN Alunos a ON u.id_aluno = a.id_aluno
LEFT JOIN Funcionarios f ON u.id_funcionario = f.id_funcionario
WHERE e.multa > 0
GROUP BY u.id_usuario, COALESCE(a.nome_aluno, f.nome_funcionario);
GO

--Livros emprestados e não devolvidos
CREATE VIEW vw_LivrosPendentes AS
SELECT 
    e.id_emprestimo,
    u.id_usuario,
    COALESCE(a.nome_aluno, f.nome_funcionario) AS nome_usuario,
    l.titulo AS livro,
    e.data_emprestimo,
    e.data_prevista,
    DATEDIFF(DAY, e.data_prevista, GETDATE()) AS dias_atraso,
    CASE 
        WHEN DATEDIFF(DAY, e.data_prevista, GETDATE()) > 0 THEN 'ATRASADO'
        ELSE 'DENTRO DO PRAZO'
    END AS situacao
FROM Emprestimos e
INNER JOIN Usuarios u ON e.id_usuario = u.id_usuario
LEFT JOIN Alunos a ON u.id_aluno = a.id_aluno
LEFT JOIN Funcionarios f ON u.id_funcionario = f.id_funcionario
INNER JOIN Livros l ON e.id_livro = l.id_livro
WHERE e.data_devolucao IS NULL;
GO
