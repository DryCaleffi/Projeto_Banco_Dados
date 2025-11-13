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