
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
