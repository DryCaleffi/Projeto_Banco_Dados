-- CRIAR BANCO DE DADOS Universidade
CREATE DATABASE universidade;

USE universidade;


-- TABELAS PARA GERENCIAMENTO UNIVERSIDADE --
-- Tabela de Cursos
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY IDENTITY(1,1),
    nome_curso VARCHAR(255) NOT NULL,
    duracao_anos INT NOT NULL,
    CONSTRAINT UQ_Cursos_Nome UNIQUE (nome_curso) -- Inclusão  no Banco de dados de refereência, com intuito de evitar duplicidade de informações
);

-- Tabela de Departamentos
CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY IDENTITY(1,1),
    nome_departamento VARCHAR(255) NOT NULL,
    id_chefe INT NULL, 
    CONSTRAINT UQ_Departamentos_Nome UNIQUE (nome_departamento) -- Evita departamentos com mesmo nome
);

-- Tabela de Professores
CREATE TABLE Professores (
    id_professor INT PRIMARY KEY IDENTITY(1,1),
    nome_professor VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    id_departamento INT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),

);
-- Adicionar a Chave Estrangeira para id_chefe APÓS a criação de Professores
ALTER TABLE Departamentos
ADD FOREIGN KEY (id_chefe) REFERENCES Professores(id_professor);



-- Tabela de Alunos
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY IDENTITY(1,1),
    nome_aluno VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(MAX),
    id_curso INT NULL,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Tabela de Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY IDENTITY(1,1),
    nome_disciplina VARCHAR(255) NOT NULL,
    carga_horaria INT NOT NULL,
    id_departamento INT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
    CONSTRAINT UQ_Disciplinas_Nome_Departamento UNIQUE (nome_disciplina, id_departamento) -- Evita disciplinas com mesmo nome no mesmo departamento
);

-- Tabela de Salas
CREATE TABLE Salas (
    id_sala INT PRIMARY KEY IDENTITY(1,1),
    numero_sala VARCHAR(50) NOT NULL,
    capacidade INT NOT NULL,
    CONSTRAINT UQ_Salas_Numero UNIQUE (numero_sala) -- Evita salas com mesmo número
);

-- Tabela de Turmas
CREATE TABLE Turmas (
    id_turma INT PRIMARY KEY IDENTITY(1,1),
    ano INT NOT NULL,
    semestre INT NOT NULL,
    id_disciplina INT NULL,
    id_professor INT NULL,
    id_sala INT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor),
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala),
    CONSTRAINT UQ_Turmas_Disciplina_Ano_Semestre UNIQUE (id_disciplina, ano, semestre) -- Evita turmas duplicadas
);

-- Tabela de Matriculas
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY IDENTITY(1,1),
    id_aluno INT NULL,
    id_turma INT NULL,
    data_matricula DATE DEFAULT GETDATE(),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma),
    CONSTRAINT UQ_Matriculas_Aluno_Turma UNIQUE (id_aluno, id_turma) -- Evita matrículas duplicadas
);

-- Tabela de Notas
CREATE TABLE Notas (
    id_nota INT PRIMARY KEY IDENTITY(1,1),
    id_matricula INT NULL,
    valor_nota DECIMAL(5,2) NOT NULL CHECK (valor_nota >= 0 AND valor_nota <= 10), -- Nota entre 0 e 10
    tipo_avaliacao VARCHAR(100) NOT NULL,
    data_avaliacao DATE DEFAULT GETDATE(),
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula),
    CONSTRAINT UQ_Notas_Matricula_Tipo UNIQUE (id_matricula, tipo_avaliacao) -- Evita notas duplicadas do mesmo tipo
);

-- Tabela de Funcionarios
CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY IDENTITY(1,1),
    nome_funcionario VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    data_contratacao DATE DEFAULT GETDATE(),
    CONSTRAINT UQ_Funcionarios_Nome UNIQUE (nome_funcionario) -- Evita funcionários com mesmo nome
);

-- TABELAS DA BIBLIOTECA ---

-- Tabela de Autores
CREATE TABLE Autores (
    id_autor INT IDENTITY(1,1) PRIMARY KEY,
    nome_autor NVARCHAR(100) NOT NULL,
    nacionalidade NVARCHAR(50),
    data_nascimento DATE,
    CONSTRAINT UQ_Autores_Nome UNIQUE (nome_autor) -- Evita autores com mesmo nome
);

-- Tabela de Categorias
CREATE TABLE Categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nome_categoria NVARCHAR(100) NOT NULL,
    descricao NVARCHAR(255),
    CONSTRAINT UQ_Categorias_Nome UNIQUE (nome_categoria) -- Evita categorias com mesmo nome
);

-- Tabela de Livros
CREATE TABLE Livros (
    id_livro INT IDENTITY(1,1) PRIMARY KEY,
    titulo NVARCHAR(200) NOT NULL,
    ano_publicacao INT CHECK (ano_publicacao <= YEAR(GETDATE())), -- Ano não pode ser futuro
    quantidade_disponivel INT DEFAULT 1 CHECK (quantidade_disponivel >= 0), -- Não permite quantidade negativa
    id_autor INT NULL,
    id_categoria INT NULL,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    CONSTRAINT UQ_Livros_Titulo_Autor UNIQUE (titulo, id_autor) -- Evita livros duplicados do mesmo autor
);

-- Tabela de Usuários (Alunos ou Funcionários)
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    tipo_usuario NVARCHAR(20) CHECK (tipo_usuario IN ('Aluno','Funcionario')),
    id_aluno INT NULL,
    id_funcionario INT NULL,
    data_cadastro DATE DEFAULT GETDATE(),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    -- Garante que um aluno/funcionário não tenha múltiplos usuários
    CONSTRAINT CHK_Usuarios_Aluno_Funcionario CHECK (
        (tipo_usuario = 'Aluno' AND id_aluno IS NOT NULL AND id_funcionario IS NULL) OR
        (tipo_usuario = 'Funcionario' AND id_funcionario IS NOT NULL AND id_aluno IS NULL)
    )
);

-- Tabela de Empréstimos
CREATE TABLE Emprestimos (
    id_emprestimo INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL DEFAULT GETDATE(),
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    multa DECIMAL(10,2) DEFAULT 0 CHECK (multa >= 0), -- Multa não pode ser negativa
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
    CONSTRAINT CHK_Emprestimos_Datas CHECK (data_prevista >= data_emprestimo AND (data_devolucao IS NULL OR data_devolucao >= data_emprestimo))
);

-- Índice único filtrado para empréstimos ativos (impede múltiplos empréstimos ativos do mesmo livro para mesmo usuário)
CREATE UNIQUE INDEX IX_Emprestimos_Usuario_Livro_Ativo 
ON Emprestimos (id_usuario, id_livro)
WHERE data_devolucao IS NULL;
