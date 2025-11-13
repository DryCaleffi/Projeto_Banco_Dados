USE universidade;

-- Inserção de Dados--

-- Inserir Cursos
INSERT INTO Cursos (nome_curso, duracao_anos) VALUES ('Engenharia de Software', 4);
INSERT INTO Cursos (nome_curso, duracao_anos) VALUES ('Administração', 4);
INSERT INTO Cursos (nome_curso, duracao_anos) VALUES ('Direito', 5);
INSERT INTO Cursos (nome_curso, duracao_anos) VALUES ('Medicina', 6);
INSERT INTO Cursos (nome_curso, duracao_anos) VALUES ('Biologia', 4);

-- Inserir Departamentos
INSERT INTO Departamentos (nome_departamento) VALUES ('Departamento de TI');
INSERT INTO Departamentos (nome_departamento) VALUES ('Departamento de Negócios');
INSERT INTO Departamentos (nome_departamento) VALUES ('Departamento de Direito');
INSERT INTO Departamentos (nome_departamento) VALUES ('Departamento de Saúde');
INSERT INTO Departamentos (nome_departamento) VALUES ('Departamento de Ciências');

-- Inserir Professores
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('João Silva', '1980-05-15', 1);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Maria Oliveira', '1975-03-20', 2);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Pedro Santos', '1982-07-10', 3);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Ana Costa', '1990-01-25', 4);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Carlos Pereira', '1978-11-05', 5);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Fernanda Lima', '1985-09-30', 1);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Ricardo Almeida', '1983-04-12', 2);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Juliana Mendes', '1992-06-18', 3);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Bruno Rodrigues', '1979-02-28', 4);
INSERT INTO Professores (nome_professor, data_nascimento, id_departamento) VALUES ('Patrícia Ferreira', '1987-08-22', 5);

-- Atualizar chefes nos departamentos
UPDATE Departamentos SET id_chefe = 1 WHERE id_departamento = 1;
UPDATE Departamentos SET id_chefe = 2 WHERE id_departamento = 2;
UPDATE Departamentos SET id_chefe = 3 WHERE id_departamento = 3;
UPDATE Departamentos SET id_chefe = 4 WHERE id_departamento = 4;
UPDATE Departamentos SET id_chefe = 5 WHERE id_departamento = 5;

-- Inserir Alunos
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Lucas Souza', '2000-01-01', 'Rua A, 123', 1);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Beatriz Gomes', '2001-02-02', 'Rua B, 456', 2);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Gabriel Barbosa', '2002-03-03', 'Rua C, 789', 3);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Sofia Ramos', '2003-04-04', 'Rua D, 101', 4);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Matheus Carvalho', '2004-05-05', 'Rua E, 112', 5);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Isabela Martins', '2000-06-06', 'Rua F, 131', 1);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Enzo Vieira', '2001-07-07', 'Rua G, 415', 2);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Valentina Cardoso', '2002-08-08', 'Rua H, 161', 3);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Miguel Araujo', '2003-09-09', 'Rua I, 718', 4);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Helena Nunes', '2004-10-10', 'Rua J, 192', 5);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Arthur Cunha', '2000-11-11', 'Rua K, 202', 1);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Alice Barbosa', '2001-12-12', 'Rua L, 213', 2);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Theo Moreira', '2002-01-13', 'Rua M, 224', 3);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Laura Pinto', '2003-02-14', 'Rua N, 235', 4);
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, id_curso) VALUES ('Heitor Lopes', '2004-03-15', 'Rua O, 246', 5);

-- Inserir Disciplinas
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Programação I', 60, 1);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Administração Geral', 45, 2);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Direito Constitucional', 50, 3);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Anatomia Humana', 80, 4);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Biologia Celular', 60, 5);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Banco de Dados', 60, 1);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Marketing', 45, 2);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Direito Penal', 50, 3);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Fisiologia', 80, 4);
INSERT INTO Disciplinas (nome_disciplina, carga_horaria, id_departamento) VALUES ('Genética', 60, 5);

-- Inserir Salas
INSERT INTO Salas (numero_sala, capacidade) VALUES ('Sala 101', 30);
INSERT INTO Salas (numero_sala, capacidade) VALUES ('Sala 102', 40);
INSERT INTO Salas (numero_sala, capacidade) VALUES ('Sala 201', 25);
INSERT INTO Salas (numero_sala, capacidade) VALUES ('Sala 202', 35);
INSERT INTO Salas (numero_sala, capacidade) VALUES ('Sala 301', 50);
INSERT INTO Salas (numero_sala, capacidade) VALUES ('Sala 302', 45);
INSERT INTO Salas (numero_sala, capacidade) VALUES ('Sala 401', 30);
INSERT INTO Salas (numero_sala, capacidade) VALUES ('Sala 402', 40);

-- Inserir Turmas
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 1, 1, 1, 1);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 1, 2, 2, 2);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 1, 3, 3, 3);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 1, 4, 4, 4);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 1, 5, 5, 5);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 2, 6, 6, 6);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 2, 7, 7, 7);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 2, 8, 8, 8);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 2, 9, 9, 1);
INSERT INTO Turmas (ano, semestre, id_disciplina, id_professor, id_sala) VALUES (2025, 2, 10, 10, 2);

-- Inserir Matriculas
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (1, 1, '2025-01-01');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (2, 2, '2025-01-02');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (3, 3, '2025-01-03');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (4, 4, '2025-01-04');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (5, 5, '2025-01-05');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (6, 1, '2025-01-06');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (7, 2, '2025-01-07');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (8, 3, '2025-01-08');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (9, 4, '2025-01-09');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (10, 5, '2025-01-10');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (11, 6, '2025-07-01');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (12, 7, '2025-07-02');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (13, 8, '2025-07-03');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (14, 9, '2025-07-04');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (15, 10, '2025-07-05');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (1, 6, '2025-07-06');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (2, 7, '2025-07-07');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (3, 8, '2025-07-08');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (4, 9, '2025-07-09');
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES (5, 10, '2025-07-10');

-- Inserir Notas
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (1, 8.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (1, 9.0, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (2, 7.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (2, 8.5, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (3, 9.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (3, 10.0, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (4, 6.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (4, 7.0, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (5, 8.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (5, 9.0, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (6, 7.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (6, 8.0, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (7, 9.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (7, 9.5, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (8, 8.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (8, 8.5, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (9, 7.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (9, 7.5, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (10, 9.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (10, 10.0, 'Prova 2');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (11, 8.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (12, 7.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (13, 9.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (14, 6.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (15, 8.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (16, 9.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (17, 7.0, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (18, 8.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (19, 9.5, 'Prova 1');
INSERT INTO Notas (id_matricula, valor_nota, tipo_avaliacao) VALUES (20, 10.0, 'Prova 1');

-- Inserir Funcionarios
INSERT INTO Funcionarios (nome_funcionario, cargo, data_contratacao) VALUES ('Roberto Dias', 'Secretário', '2020-01-01');
INSERT INTO Funcionarios (nome_funcionario, cargo, data_contratacao) VALUES ('Sandra Monteiro', 'Bibliotecário', '2019-05-15');
INSERT INTO Funcionarios (nome_funcionario, cargo, data_contratacao) VALUES ('Tiago Batista', 'Manutenção', '2021-03-10');
INSERT INTO Funcionarios (nome_funcionario, cargo, data_contratacao) VALUES ('Vanessa Reis', 'Coordenador', '2018-07-20');
INSERT INTO Funcionarios (nome_funcionario, cargo, data_contratacao) VALUES ('Wagner Souza', 'Segurança', '2022-02-05');
INSERT INTO Funcionarios (nome_funcionario, cargo, data_contratacao) VALUES ('Yasmin Oliveira', 'Assistente', '2023-04-25');
INSERT INTO Funcionarios (nome_funcionario, cargo, data_contratacao) VALUES ('Zé Carlos', 'Diretor', '2017-09-30');
INSERT INTO Funcionarios (nome_funcionario, cargo, data_contratacao) VALUES ('Amanda Lopes', 'Professor Auxiliar', '2024-06-18');

-- 1. Inserir Autores
INSERT INTO Autores (nome_autor, nacionalidade, data_nascimento) VALUES 
('Machado de Assis', 'Brasileiro', '1839-06-21'),
('George Orwell', 'Britânico', '1903-06-25'),
('Yuval Noah Harari', 'Israelense', '1976-02-24'),
('Grace Hopper', 'Americano', '1906-12-09'),
('Drauzio Varella', 'Brasileiro', '1943-05-14'),
('Lygia Fagundes Telles', 'Brasileira', '1923-04-19'),
('Stephen Hawking', 'Britânico', '1942-01-08'),
('Mário de Andrade', 'Brasileiro', '1893-04-09'),
('Vint Cerf', 'Americano', '1943-06-23'),
('Celso Furtado', 'Brasileiro', '1920-07-26');


-- 2. Inserir Categorias
INSERT INTO Categorias (nome_categoria, descricao) VALUES 
('Ficção Clássica', 'Obras literárias de grande importância histórica.'),
('Ciência da Computação', 'Livros sobre programação, bancos de dados e engenharia de software.'),
('História', 'Análise de eventos passados e sociedade.'),
('Medicina', 'Estudos sobre anatomia e saúde.'),
('Direito', 'Legislação e estudos jurídicos.'),
('Poesia', 'Versos e formas líricas.'),
('Economia', 'Estudos sobre sistemas econômicos e desenvolvimento.'),
('Ficção Científica', 'Narrativas especulativas sobre tecnologia e futuro.'),
('Psicologia', 'Estudos sobre comportamento e mente humana.'),
('Geografia', 'Estudos sobre o planeta e suas regiões.');


-- 3. Inserir Livros
INSERT INTO Livros (titulo, ano_publicacao, quantidade_disponivel, id_autor, id_categoria) VALUES 
('Dom Casmurro', 1899, 5, 1, 1),
('1984', 1949, 3, 2, 1),
('Sapiens: Uma Breve História da Humanidade', 2011, 7, 3, 3),
('Princípios de Banco de Dados Relacionais', 2018, 4, 4, 2),
('Manual de Primeiros Socorros', 2020, 6, 5, 4),
('O Conto da Aia', 1985, 2, 2, 1),
('Código Civil Brasileiro Comentado', 2023, 10, 3, 5), 
('Estruturas de Dados Avançadas', 2019, 3, 4, 2),
('Vidas Secas', 1938, 4, 1, 1), 
('Cosmos', 1980, 5, 7, 8), 
('O Capital no Século XXI', 2013, 3, 3, 7),
('O Ensaio', 2024, 2, 6, 6), 
('10 Anos de Medicina', 2020, 8, 5, 4), 
('Introdução à Sociologia', 2015, 4, 10, 3), 
('A Lei da Ação Civil Pública', 2022, 9, 3, 5), 
('Python para Data Science', 2020, 6, 4, 2), 
('Psicologia do Desenvolvimento', 2017, 5, 3, 9), 
('Atlas Geográfico Moderno', 2019, 7, 8, 10); 

-- 4. Inserir Usuários da Biblioteca (Criação de Registros para Alunos e Funcionários)

-- 4.1. Inserir Alunos (usando os IDs de 1 a 15 da tabela Alunos)
INSERT INTO Usuarios (tipo_usuario, id_aluno, id_funcionario)
SELECT 'Aluno', id_aluno, NULL FROM Alunos;


-- 4.2. Inserir Funcionários (usando os IDs de 1 a 8 da tabela Funcionarios)

INSERT INTO Usuarios (tipo_usuario, id_aluno, id_funcionario)
SELECT 'Funcionario', NULL, id_funcionario FROM Funcionarios;


-- 5. Inserir Empréstimos
-- O id_usuario aqui deve ser os IDs gerados na tabela Usuarios (1 a 23).

INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES (1, 1, '2025-10-20', '2025-11-03', NULL, 0);
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES (2, 2, '2025-10-10', '2025-10-24', '2025-10-28', 5.00);
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES (3, 3, '2025-11-01', '2025-11-15', NULL, 0);
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES (16, 8, '2025-10-25', '2025-11-08', NULL, 0);
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES (17, 5, '2025-09-01', '2025-09-15', '2025-09-15', 0); 
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES(4, 9, '2025-11-05', '2025-11-19', NULL, 0);
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES(5, 10, '2025-10-01', '2025-10-15', '2025-11-01', 15.00);
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES(10, 11, '2025-11-10', '2025-11-24', NULL, 0);
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES(18, 12, '2025-09-15', '2025-09-29', '2025-10-10', 10.00);
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, multa) VALUES(23, 14, '2025-11-05', '2025-11-19', NULL, 0);

