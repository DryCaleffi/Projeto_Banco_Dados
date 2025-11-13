USE universidade;

-- 1. Listar todos os alunos do curso de 'Engenharia de Software'
SELECT A.nome_aluno, A.data_nascimento, C.nome_curso
FROM Alunos A
JOIN Cursos C ON A.id_curso = C.id_curso
WHERE C.nome_curso = 'Engenharia de Software';

-- 2.  Encontrar o chefe (professor) do 'Departamento de Saúde
SELECT P.nome_professor, D.nome_departamento
FROM Departamentos D
JOIN Professores P ON D.id_chefe = P.id_professor
WHERE D.nome_departamento = 'Departamento de Saúde';

--3. Listar todos os livros disponíveis com mais de 5 unidades em estoque
SELECT L.titulo,L.quantidade_disponivel
FROM Livros L
WHERE quantidade_disponivel > 5
ORDER BY quantidade_disponivel DESC;

--4. Contar quantos alunos estão matriculados em cada curso
SELECT C.nome_curso,
    COUNT(A.id_aluno) AS total_alunos
FROM Cursos C
JOIN Alunos A ON C.id_curso = A.id_curso
GROUP BY C.nome_curso
ORDER BY total_alunos DESC;


--5.  Médias da Prova 1 por curso
SELECT AVG(valor_nota) AS media_prova_1 
FROM  Notas N
WHERE tipo_avaliacao = 'Prova 1';

--6. Contar o número de turmas atribuídas a cada professor
SELECT P.nome_professor, COUNT(T.id_turma) AS total_turmas
FROM Professores P
JOIN Turmas T ON P.id_professor = T.id_professor
GROUP BY P.nome_professor
ORDER BY total_turmas DESC;

--7.  Encontrar o autor e a categoria de um livro específico ('1984')
SELECT L.titulo, A.nome_autor, C.nome_categoria
FROM Livros L
JOIN Autores A ON L.id_autor = A.id_autor
JOIN Categorias C ON L.id_categoria = C.id_categoria
WHERE L.titulo = '1984';


-- 8.  Listar empréstimos ativos, mostrando nome do usuário (aluno ou funcionário) e título do livro
SELECT E.data_emprestimo,
    CASE
        WHEN U.tipo_usuario = 'Aluno' THEN (SELECT nome_aluno FROM Alunos WHERE id_aluno = U.id_aluno)                                      -- Valida dentro da tabela de usuários os  alunos e compara essa informação com a tabela de aluno
        WHEN U.tipo_usuario = 'Funcionario' THEN (SELECT nome_funcionario FROM Funcionarios WHERE id_funcionario = U.id_funcionario)         -- valida o usuários funcionário com a tabela de funcionários 
    END AS nome_usuario,
    L.titulo AS titulo_livro
FROM Emprestimos E
JOIN Usuarios U ON E.id_usuario = U.id_usuario
JOIN Livros L ON E.id_livro = L.id_livro
WHERE E.data_devolucao IS NULL; -- Empréstimos ativos (data de devolução é NULL, ou seja , ainda não foram devolvidos 


-- 9. Encontrar o total de multas arrecadadas em empréstimos já devolvidos
SELECT SUM(multa) AS total_multas_arrecadadas
FROM Emprestimos
WHERE data_devolucao IS NOT NULL;

--10. Encontrar o(s) professor(es) que não estão chefiando nenhum departamento

SELECT P.nome_professor
FROM Professores P
LEFT JOIN Departamentos D ON P.id_professor = D.id_chefe
WHERE D.id_chefe IS NULL;


-- 11. Listar categorias que têm exatamente 5 livros registrados
SELECT C.nome_categoria, COUNT(L.id_livro) AS total_livros
FROM Categorias C
JOIN  Livros L ON C.id_categoria = L.id_categoria
GROUP BY  C.nome_categoria
HAVING COUNT(L.id_livro) >= 3;


-- 12. Número de alunos em cada semestre
SELECT T.ano, T.semestre, COUNT(DISTINCT M.id_aluno) AS total_alunos
FROM Turmas T
JOIN Matriculas M ON T.id_turma = M.id_turma
GROUP BY  T.ano,  T.semestre
ORDER BY T.ano,  T.semestre;


--13. Contar o número de livros por categoria
SELECT C.nome_categoria, COUNT(L.id_livro) AS total_livros
FROM Categorias C
JOIN  Livros L ON C.id_categoria = L.id_categoria
GROUP BY C.nome_categoria
ORDER BY total_livros DESC, C.nome_categoria ASC;

