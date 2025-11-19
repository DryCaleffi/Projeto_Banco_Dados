-- Procedure --

USE universidade

CREATE PROCEDURE RealizarEmprestimo
    @id_usuario INT,
    @id_livro INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Bloqueia a linha do livro com UPDLOCK para evitar leituras sujas
        UPDATE Livros WITH (UPDLOCK, ROWLOCK) 
        SET quantidade_disponivel = quantidade_disponivel - 1 
        WHERE id_livro = @id_livro 
        AND quantidade_disponivel > 0;
        
        -- Verifica se conseguiu atualizar (se havia estoque)
        IF @@ROWCOUNT = 0
        BEGIN
            ROLLBACK;
            THROW 50001, 'Livro não disponível para empréstimo', 1;
        END
        
        -- Insere o empréstimo
        INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista)
        VALUES (@id_usuario, @id_livro, GETDATE(), DATEADD(day, 15, GETDATE()));
        
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END
        
-Registrar emprestimo 

CREATE PROCEDURE sp_RegistrarEmprestimo
    @id_usuario INT,
    @id_livro INT,
    @dias INT = 7
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @quantidade INT;

    SELECT @quantidade = quantidade_disponivel 
    FROM Livros 
    WHERE id_livro = @id_livro;

    IF @quantidade IS NULL
    BEGIN
        PRINT 'Livro não encontrado.';
        RETURN;
    END

    IF @quantidade <= 0
    BEGIN
        PRINT 'Livro indisponível para empréstimo.';
        RETURN;
    END

    INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista)
    VALUES (@id_usuario, @id_livro, GETDATE(), DATEADD(DAY, @dias, GETDATE()));

    UPDATE Livros
    SET quantidade_disponivel = quantidade_disponivel - 1
    WHERE id_livro = @id_livro;

    PRINT 'Empréstimo registrado com sucesso.';
END;
GO

--Devolver livro e aplicar multa
CREATE PROCEDURE sp_DevolverLivro
    @id_emprestimo INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_livro INT;
    DECLARE @data_prevista DATE;
    DECLARE @data_devolucao DATE = GETDATE();
    DECLARE @multa DECIMAL(10,2) = 0;

    SELECT 
        @id_livro = id_livro,
        @data_prevista = data_prevista
    FROM Emprestimos
    WHERE id_emprestimo = @id_emprestimo;

    IF @id_livro IS NULL
    BEGIN
        PRINT 'Empréstimo não encontrado.';
        RETURN;
    END

    IF @data_devolucao > @data_prevista
        SET @multa = DATEDIFF(DAY, @data_prevista, @data_devolucao) * 2.00;

    UPDATE Emprestimos
    SET data_devolucao = @data_devolucao,
        multa = @multa
    WHERE id_emprestimo = @id_emprestimo;

    PRINT CONCAT('Livro devolvido com sucesso. Multa: R$ ', @multa);
END;
GO
