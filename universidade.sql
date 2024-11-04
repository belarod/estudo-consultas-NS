CREATE TABLE aluno(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    matricula VARCHAR(7) UNIQUE,
    cep VARCHAR(8),
    numero VARCHAR(6),
    id_turma INT,

    FOREIGN KEY (id_turma) REFERENCES turma(id)
);

CREATE TABLE curso(
    nome VARCHAR(30) PRIMARY KEY,
    area VARCHAR(30)
);

CREATE TABLE aluno_curso(
    id_aluno VARCHAR(11),
    id_curso VARCHAR(30),

    FOREIGN KEY (id_aluno) REFERENCES aluno(cpf),
    FOREIGN KEY (id_curso) REFERENCES curso(nome),
    PRIMARY KEY (id_aluno, id_curso)
);

CREATE TABLE professor(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    matricula VARCHAR(7) UNIQUE,
    cep VARCHAR(8),
    numero VARCHAR(6),
    titulacao VARCHAR(15),
    disponibilidade VARCHAR(50)
);

CREATE TABLE turma(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    capacidade INT,
    id_disciplina VARCHAR(30),
    id_semestre INT,

    FOREIGN KEY (id_disciplina) REFERENCES disciplina(nome),
    FOREIGN KEY (id_semestre) REFERENCES semestre(id)
);

CREATE TABLE semestre(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ano VARCHAR(4),
    digito VARCHAR(1) CHECK (digito IN ('1', '2'))
);

CREATE TABLE disciplina(
    nome VARCHAR(30) PRIMARY KEY,
    capacidade INT,
    id_professor VARCHAR(11),
    id_sala VARCHAR(3),

    FOREIGN KEY (id_professor) REFERENCES professor(cpf),
    FOREIGN KEY (id_sala) REFERENCES sala(numero)
);

CREATE TABLE sala(
    numero VARCHAR(3) PRIMARY KEY,
    capacidade INT
);

--Inserts

INSERT INTO aluno (cpf, nome, matricula, cep, numero, id_turma) VALUES
('12345678901', 'Carlos Silva', 'MAT0001', '12345678', '101', 1),
('23456789012', 'Maria Oliveira', 'MAT0002', '23456789', '102', 2),
('34567890123', 'João Santos', 'MAT0003', '34567890', '103', 3),
('45678901234', 'Ana Costa', 'MAT0004', '45678901', '104', 1),
('56789012345', 'Pedro Almeida', 'MAT0005', '56789012', '105', 2),
('67890123456', 'Paula Souza', 'MAT0006', '67890123', '106', 3),
('78901234567', 'Marcos Lima', 'MAT0007', '78901234', '107', 1),
('89012345678', 'Fernanda Ribeiro', 'MAT0008', '89012345', '108', 2),
('90123456789', 'Ricardo Pereira', 'MAT0009', '90123456', '109', 3),
('01234567890', 'Aline Fernandes', 'MAT0010', '01234567', '110', 1),
('11122233344', 'Lucas Mendes', 'MAT0011', '11122233', '111', 2),
('22233344455', 'Juliana Araujo', 'MAT0012', '22233344', '112', 3),
('33344455566', 'Rafael Barbosa', 'MAT0013', '33344455', '113', 1),
('44455566677', 'Camila Nogueira', 'MAT0014', '44455566', '114', 2),
('55566677788', 'Eduardo Cunha', 'MAT0015', '55566677', '115', 3),
('66677788899', 'Larissa Moreira', 'MAT0016', '66677788', '116', 1),
('77788899900', 'Thiago Cardoso', 'MAT0017', '77788899', '117', 2),
('88899900011', 'Gabriela Lopes', 'MAT0018', '88899900', '118', 3),
('99900011122', 'Felipe Sousa', 'MAT0019', '99900011', '119', 1),
('00011122233', 'Sofia Rocha', 'MAT0020', '00011122', '120', 2);

INSERT INTO curso (nome, area) VALUES
('Engenharia de Software', 'Tecnologia'),
('Ciência da Computação', 'Tecnologia'),
('Administração', 'Negócios'),
('Direito', 'Humanas'),
('Pedagogia', 'Educação'),
('Arquitetura', 'Design'),
('Medicina', 'Saúde'),
('Enfermagem', 'Saúde'),
('Psicologia', 'Humanas'),
('Biomedicina', 'Saúde'),
('Engenharia Civil', 'Tecnologia'),
('Engenharia Elétrica', 'Tecnologia'),
('Design Gráfico', 'Design'),
('Jornalismo', 'Comunicação'),
('Marketing', 'Negócios'),
('Ciencias Contábeis', 'Negócios'),
('Fisioterapia', 'Saúde'),
('Educação Física', 'Saúde'),
('Química', 'Exatas'),
('Matemática', 'Exatas');

INSERT INTO professor (cpf, nome, matricula, cep, numero, titulacao, disponibilidade) VALUES
('11122233344', 'Roberto Almeida', 'PROF01', '12345678', '101', 'Mestre', 'Segunda a Sexta, 08:00 - 12:00'),
('22233344455', 'Fernanda Costa', 'PROF02', '23456789', '102', 'Doutora', 'Segunda a Quarta, 14:00 - 18:00'),
('33344455566', 'Lucas Mendes', 'PROF03', '34567890', '103', 'Graduado', 'Terça e Quinta, 09:00 - 13:00'),
('44455566677', 'Ana Souza', 'PROF04', '45678901', '104', 'Mestre', 'Segunda e Sexta, 10:00 - 15:00'),
('55566677788', 'Pedro Lima', 'PROF05', '56789012', '105', 'Doutor', 'Quarta a Sexta, 16:00 - 20:00'),
('66677788899', 'Camila Nogueira', 'PROF06', '67890123', '106', 'Graduada', 'Terça e Quarta, 08:00 - 12:00'),
('77788899900', 'Marcos Silva', 'PROF07', '78901234', '107', 'Mestre', 'Segunda a Quinta, 14:00 - 17:00'),
('88899900011', 'Sofia Rocha', 'PROF08', '89012345', '108', 'Doutora', 'Sexta, 08:00 - 12:00'),
('99900011122', 'Thiago Cardoso', 'PROF09', '90123456', '109', 'Graduado', 'Segunda a Terça, 09:00 - 13:00'),
('00011122233', 'Gabriela Lopes', 'PROF10', '01234567', '110', 'Mestre', 'Quarta a Sexta, 14:00 - 18:00'),
('11122233345', 'Ricardo Pereira', 'PROF11', '11122233', '111', 'Doutor', 'Segunda e Quarta, 10:00 - 15:00'),
('22233344456', 'Juliana Araujo', 'PROF12', '22233344', '112', 'Graduada', 'Terça e Quinta, 08:00 - 12:00'),
('33344455567', 'Eduardo Cunha', 'PROF13', '33344455', '113', 'Mestre', 'Segunda a Sexta, 16:00 - 20:00'),
('44455566678', 'Larissa Moreira', 'PROF14', '44455566', '114', 'Doutora', 'Terça e Quarta, 09:00 - 13:00'),
('55566677789', 'Felipe Sousa', 'PROF15', '55566677', '115', 'Graduado', 'Quarta a Quinta, 14:00 - 17:00'),
('66677788890', 'Camila Fernandes', 'PROF16', '66677788', '116', 'Mestre', 'Sexta, 08:00 - 12:00'),
('77788899901', 'Roberta Lima', 'PROF17', '77788899', '117', 'Doutora', 'Segunda a Terça, 09:00 - 13:00'),
('88899900012', 'Rafael Barros', 'PROF18', '88899900', '118', 'Graduado', 'Quarta a Sexta, 10:00 - 15:00'),
('99900011123', 'Aline Martins', 'PROF19', '99900011', '119', 'Mestre', 'Segunda a Quinta, 14:00 - 18:00'),
('00011122234', 'Marcelo Souza', 'PROF20', '00011122', '120', 'Doutor', 'Terça e Sexta, 08:00 - 12:00');

INSERT INTO semestre (ano, digito) VALUES
('2021', '1'),
('2021', '2'),
('2022', '1'),
('2022', '2'),
('2023', '1'),
('2023', '2'),
('2024', '1'),
('2024', '2'),
('2025', '1'),
('2025', '2'),
('2026', '1'),
('2026', '2'),
('2027', '1'),
('2027', '2'),
('2028', '1'),
('2028', '2'),
('2029', '1'),
('2029', '2'),
('2030', '1'),
('2030', '2');

INSERT INTO disciplina (nome, capacidade, id_professor, id_sala) VALUES
('Programação I', 30, '11122233344', '101'),
('Matemática Discreta', 40, '22233344455', '102'),
('Estruturas de Dados', 35, '33344455566', '103'),
('Banco de Dados', 30, '44455566677', '104'),
('Sistemas Operacionais', 25, '55566677788', '105'),
('Redes de Computadores', 40, '66677788899', '106'),
('Engenharia de Software', 30, '77788899900', '107'),
('Teoria da Computação', 25, '88899900011', '108'),
('Desenvolvimento Web', 35, '99900011122', '109'),
('Inteligência Artificial', 30, '00011122233', '110'),
('Matemática para Computação', 30, '11122233344', '111'),
('Física Aplicada', 40, '22233344455', '112'),
('Química Geral', 35, '33344455566', '113'),
('Linguagens de Programação', 30, '44455566677', '114'),
('Análise de Sistemas', 40, '55566677788', '115'),
('Gestão de Projetos', 30, '66677788899', '116'),
('Metodologia Científica', 25, '77788899900', '117'),
('Ética Profissional', 30, '88899900011', '118'),
('Programação II', 30, '99900011122', '119'),
('Algoritmos Avançados', 25, '00011122233', '120');

INSERT INTO sala (numero, capacidade) VALUES
('101', 30),
('102', 40),
('103', 25),
('104', 50),
('105', 35),
('106', 30),
('107', 40),
('108', 25),
('109', 35),
('110', 50),
('201', 30),
('202', 40),
('203', 25),
('204', 50),
('205', 35),
('206', 30),
('207', 40),
('208', 25),
('209', 35),
('210', 50);

INSERT INTO aluno_curso (id_aluno, id_curso) VALUES
('12345678901', 'Engenharia de Software'),
('23456789012', 'Ciência da Computação'),
('34567890123', 'Administração'),
('45678901234', 'Direito'),
('56789012345', 'Pedagogia'),
('67890123456', 'Arquitetura'),
('78901234567', 'Medicina'),
('89012345678', 'Enfermagem'),
('90123456789', 'Psicologia'),
('01234567890', 'Biomedicina');

INSERT INTO turma (capacidade, id_disciplina, id_semestre) VALUES
(30, 'Programação I', 1),
(40, 'Matemática Discreta', 1),
(35, 'Estruturas de Dados', 1),
(30, 'Banco de Dados', 2),
(25, 'Sistemas Operacionais', 2),
(40, 'Redes de Computadores', 2),
(30, 'Engenharia de Software', 1),
(25, 'Teoria da Computação', 2),
(30, 'Desenvolvimento Web', 1),
(40, 'Inteligência Artificial', 2);

-- View's, CTE's e Subconsultas

WITH Total_Alunos_Por_Turma AS (
    SELECT
        t.id AS Turma,
        COUNT(a.cpf) AS Total_de_Alunos
    FROM turma t
    LEFT JOIN aluno a ON t.id = a.id_turma
    GROUP BY t.id
),
Media_Geral_Alunos AS (
    SELECT AVG(Total_de_Alunos) AS Media_Alunos
    FROM Total_Alunos_Por_Turma
)

SELECT t.Turma, t.Total_de_Alunos
FROM Total_Alunos_Por_Turma t, Media_Geral_Alunos m
WHERE t.Total_de_Alunos > m.Media_Alunos;