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
    disponibilidade VARCHAR(50),
    salario INT
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
('01234567890', 'Biomedicina'),
('11122233344', 'Engenharia Civil'),
('22233344455', 'Engenharia Elétrica'),
('33344455566', 'Design Gráfico'),
('44455566677', 'Jornalismo'),
('55566677788', 'Marketing'),
('66677788899', 'Ciencias Contábeis'),
('77788899900', 'Fisioterapia'),
('88899900011', 'Educação Física'),
('99900011122', 'Química'),
('00011122233', 'Matemática');

INSERT INTO professor (cpf, nome, matricula, cep, numero, titulacao, disponibilidade, salario) VALUES
('11122233344', 'Roberto Almeida', 'PROF01', '12345678', '101', 'Mestre', 'Segunda a Sexta, 08:00 - 12:00', 5000),
('22233344455', 'Fernanda Costa', 'PROF02', '23456789', '102', 'Doutora', 'Segunda a Quarta, 14:00 - 18:00', 7000),
('33344455566', 'Lucas Mendes', 'PROF03', '34567890', '103', 'Graduado', 'Terça e Quinta, 09:00 - 13:00', 4500),
('44455566677', 'Ana Souza', 'PROF04', '45678901', '104', 'Mestre', 'Segunda e Sexta, 10:00 - 15:00', 5200),
('55566677788', 'Pedro Lima', 'PROF05', '56789012', '105', 'Doutor', 'Quarta a Sexta, 16:00 - 20:00', 8000),
('66677788899', 'Camila Nogueira', 'PROF06', '67890123', '106', 'Graduada', 'Terça e Quarta, 08:00 - 12:00', 4200),
('77788899900', 'Marcos Silva', 'PROF07', '78901234', '107', 'Mestre', 'Segunda a Quinta, 14:00 - 17:00', 5500),
('88899900011', 'Sofia Rocha', 'PROF08', '89012345', '108', 'Doutora', 'Sexta, 08:00 - 12:00', 7200),
('99900011122', 'Thiago Cardoso', 'PROF09', '90123456', '109', 'Graduado', 'Segunda a Terça, 09:00 - 13:00', 4600),
('00011122233', 'Gabriela Lopes', 'PROF10', '01234567', '110', 'Mestre', 'Quarta a Sexta, 14:00 - 18:00', 5100),
('11122233345', 'Ricardo Pereira', 'PROF11', '11122233', '111', 'Doutor', 'Segunda e Quarta, 10:00 - 15:00', 7800),
('22233344456', 'Juliana Araujo', 'PROF12', '22233344', '112', 'Graduada', 'Terça e Quinta, 08:00 - 12:00', 4300),
('33344455567', 'Eduardo Cunha', 'PROF13', '33344455', '113', 'Mestre', 'Segunda a Sexta, 16:00 - 20:00', 5900),
('44455566678', 'Larissa Moreira', 'PROF14', '44455566', '114', 'Doutora', 'Terça e Quarta, 09:00 - 13:00', 7100),
('55566677789', 'Felipe Sousa', 'PROF15', '55566677', '115', 'Graduado', 'Quarta a Quinta, 14:00 - 17:00', 4800),
('66677788890', 'Camila Fernandes', 'PROF16', '66677788', '116', 'Mestre', 'Sexta, 08:00 - 12:00', 5000),
('77788899901', 'Roberta Lima', 'PROF17', '77788899', '117', 'Doutora', 'Segunda a Terça, 09:00 - 13:00', 7300),
('88899900012', 'Rafael Barros', 'PROF18', '88899900', '118', 'Graduado', 'Quarta a Sexta, 10:00 - 15:00', 4900),
('99900011123', 'Aline Martins', 'PROF19', '99900011', '119', 'Mestre', 'Terça e Quinta, 14:00 - 18:00', 5400),
('00011122234', 'João Paulo', 'PROF20', '00011122', '120', 'Doutor', 'Segunda a Quarta, 08:00 - 12:00', 7600);

INSERT INTO turma (capacidade, id_disciplina, id_semestre) VALUES
(30, 'Matemática', 1),
(25, 'Português', 1),
(20, 'História', 2),
(35, 'Geografia', 1),
(30, 'Física', 2),
(25, 'Química', 2),
(40, 'Biologia', 1),
(30, 'Educação Física', 1),
(20, 'Artes', 2),
(35, 'Inglês', 1),
(30, 'Educação Moral', 2),
(25, 'Ciencias', 1),
(40, 'Língua Estrangeira', 2),
(30, 'Literatura', 1),
(25, 'Filosofia', 2),
(20, 'Sociologia', 1),
(35, 'Teatro', 2),
(30, 'Música', 1),
(25, 'Dança', 2),
(20, 'Programação', 1);

INSERT INTO semestre (ano, digito) VALUES
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
('2030', '2'),
('2031', '1'),
('2031', '2');

INSERT INTO disciplina (nome, capacidade, id_professor, id_sala) VALUES
('Matemática', 30, '11122233344', '101'),
('Português', 25, '22233344455', '102'),
('História', 20, '33344455566', '103'),
('Geografia', 35, '44455566677', '104'),
('Física', 30, '55566677788', '105'),
('Química', 25, '66677788899', '106'),
('Biologia', 40, '77788899900', '107'),
('Educação Física', 30, '88899900011', '108'),
('Artes', 20, '99900011122', '109'),
('Inglês', 35, '00011122233', '110'),
('Educação Moral', 30, '11122233345', '111'),
('Ciencias', 25, '22233344456', '112'),
('Língua Estrangeira', 40, '33344455567', '113'),
('Literatura', 30, '44455566678', '114'),
('Filosofia', 25, '55566677789', '115'),
('Sociologia', 20, '66677788890', '116'),
('Teatro', 35, '77788899901', '117'),
('Música', 30, '88899900012', '118'),
('Dança', 25, '99900011123', '119'),
('Programação', 20, '00011122234', '120');

INSERT INTO sala (numero, capacidade) VALUES
('101', 30),
('102', 25),
('103', 20),
('104', 35),
('105', 30),
('106', 25),
('107', 40),
('108', 30),
('109', 20),
('110', 35),
('201', 30),
('202', 25),
('203', 20),
('204', 35),
('205', 30),
('206', 25),
('207', 40),
('208', 30),
('209', 20),
('210', 35);

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



WITH Top_3_salarios AS (
    SELECT p.salario
    FROM professor p
    ORDER BY salario DESC
    LIMIT 3
)
SELECT d.nome as Disciplina, p.nome AS Professor, p.salario AS Salário
FROM disciplina d
INNER JOIN professor p ON d.id_professor = p.cpf
WHERE p.salario IN (
    SELECT salario FROM Top_3_salarios
    );



WITH Total_Alunos_Sala AS (
    SELECT COUNT(a.nome) AS Alunos, s.numero
    FROM aluno a
    INNER JOIN turma t on t.id = a.id_turma
    INNER JOIN disciplina d on t.id_disciplina = d.nome
    INNER JOIN sala s on d.id_sala = s.numero
    GROUP BY s.numero
), Salario_Medio_Profs_Sala AS (
    SELECT AVG(p.salario) AS Media_Salario, s.numero
    FROM professor p
    INNER JOIN disciplina d on p.cpf = d.id_professor
    INNER JOIN sala s on d.id_sala = s.numero
    GROUP BY s.numero
)
SELECT
    t.numero AS Sala,
    t.Alunos AS Total_Alunos,
    sm.Media_Salario AS Media_Salario,
    CASE
        WHEN t.Alunos > 0 THEN ROUND(sm.Media_Salario / t.Alunos, 2)
        ELSE 0
    END AS Valor_por_Aluno
FROM Total_Alunos_Sala t
JOIN Salario_Medio_Profs_Sala sm ON t.numero = sm.numero;



WITH Salas_em_uso_por_Alunos AS (
    SELECT DISTINCT d.id_sala AS Salas
    FROM aluno a
    INNER JOIN turma t on t.id = a.id_turma
    INNER JOIN disciplina d on d.nome = t.id_disciplina
)
SELECT * FROM Salas_em_uso_por_Alunos