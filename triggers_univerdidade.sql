
-- TRIGGERS --
USE universidade;

-- Trigger para garantir unicidade de alunos/funcionários na tabela Usuarios
CREATE TRIGGER TR_Usuarios_PreventDuplicates
ON Usuarios
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Verificar duplicação de alunos
    IF EXISTS (
        SELECT 1 FROM inserted i 
        WHERE i.id_aluno IS NOT NULL 
        AND EXISTS (SELECT 1 FROM Usuarios u WHERE u.id_aluno = i.id_aluno)
    )
    BEGIN
        THROW 50001, 'Este aluno já possui um usuário no sistema.', 1;
        RETURN;
    END
    
    -- Verificar duplicação de funcionários
    IF EXISTS (
        SELECT 1 FROM inserted i 
        WHERE i.id_funcionario IS NOT NULL 
        AND EXISTS (SELECT 1 FROM Usuarios u WHERE u.id_funcionario = i.id_funcionario)
    )
    BEGIN
        THROW 50002, 'Este funcionário já possui um usuário no sistema.', 1;
        RETURN;
    END
    
    -- Inserir se não houver duplicações
    INSERT INTO Usuarios (tipo_usuario, id_aluno, id_funcionario, data_cadastro)
    SELECT tipo_usuario, id_aluno, id_funcionario, COALESCE(data_cadastro, GETDATE())
    FROM inserted;
END

--calculo automático de multa

CREATE TRIGGER trg_CalculaMulta
ON Emprestimos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Atualiza a multa automaticamente quando data_devolucao for preenchida
    UPDATE e
    SET e.multa = 
        CASE 
            WHEN e.data_devolucao > e.data_prevista THEN DATEDIFF(DAY, e.data_prevista, e.data_devolucao) * 2.00
            ELSE 0 
        END
    FROM Emprestimos e
    INNER JOIN inserted i ON e.id_emprestimo = i.id_emprestimo
    WHERE i.data_devolucao IS NOT NULL;
END;
GO

--bloqueia empréstimo duplicado
CREATE TRIGGER trg_BloqueiaEmprestimoDuplicado
ON Emprestimos
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Emprestimos e 
            ON e.id_usuario = i.id_usuario
           AND e.id_livro = i.id_livro
           AND e.data_devolucao IS NULL
    )
    BEGIN
        RAISERROR('Este usuário já possui um empréstimo ativo deste livro.', 16, 1);
        RETURN;
    END;

    INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa)
    SELECT id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa
    FROM inserted;
END;
GO

--Auditar devoluções
CREATE TRIGGER trg_LogDevolucao
ON Emprestimos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LogDevolucoes (id_emprestimo, id_livro, id_usuario, data_devolucao, multa)
    SELECT 
        i.id_emprestimo,
        i.id_livro,
        i.id_usuario,
        i.data_devolucao,
        i.multa
    FROM inserted i
    JOIN deleted d ON i.id_emprestimo = d.id_emprestimo
    WHERE d.data_devolucao IS NULL AND i.data_devolucao IS NOT NULL;
END;
GO

--Atualiza estoque automaticamente
CREATE TRIGGER trg_AtualizaEstoque
ON Emprestimos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Repor estoque somente quando houver devolução
    UPDATE l
    SET l.quantidade_disponivel = l.quantidade_disponivel + 1
    FROM Livros l
    JOIN inserted i ON l.id_livro = i.id_livro
    JOIN deleted d ON i.id_emprestimo = d.id_emprestimo
    WHERE d.data_devolucao IS NULL 
      AND i.data_devolucao IS NOT NULL; -- Agora foi devolvido
END;
GO
