CREATE TABLE Instrutor (
    instrutor_id INT IDENTITY(1,1) PRIMARY KEY,
    nome         NVARCHAR(120) NOT NULL,
    email        NVARCHAR(160) NOT NULL UNIQUE
);

CREATE TABLE Curso (
    curso_id      INT IDENTITY(1,1) PRIMARY KEY,
    titulo        NVARCHAR(160) NOT NULL,
    categoria     NVARCHAR(80)  NOT NULL,
    carga_horaria INT NOT NULL CHECK (carga_horaria > 0),
    instrutor_id  INT NULL REFERENCES Instrutor(instrutor_id)
);

CREATE TABLE Inscricao (
    inscricao_id   INT IDENTITY(1,1) PRIMARY KEY,
    aluno_nome     NVARCHAR(120) NOT NULL,
    aluno_email    NVARCHAR(160) NOT NULL,
    curso_id       INT NOT NULL REFERENCES Curso(curso_id),
    data_inscricao DATE NOT NULL DEFAULT (GETDATE()),
    status         NVARCHAR(30) NOT NULL DEFAULT ('ativa')
);

INSERT INTO Instrutor (nome,email) VALUES
 (N'Ana Ribeiro',N'ana.ribeiro@exemplo.com'),
 (N'Carlos Moraes',N'carlos.moraes@exemplo.com');

INSERT INTO Curso (titulo,categoria,carga_horaria,instrutor_id) VALUES
 (N'Introdução a Python',N'Programação',20,1),
 (N'DataViz com Power BI',N'Data',16,2),
 (N'Banco de Dados SQL',N'Data',24,2);

INSERT INTO Inscricao (aluno_nome,aluno_email,curso_id,status) VALUES
 (N'Julia Martins',N'julia@aluno.com',1,N'ativa'),
 (N'Nicolas Santos',N'nicolas@aluno.com',1,N'ativa'),
 (N'Oscar Arias',N'oscar@aluno.com',2,N'ativa'),
 (N'Bruno Lima',N'bruno@aluno.com',3,N'pendente');