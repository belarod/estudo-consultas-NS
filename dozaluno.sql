CREATE TABLE professor(
    cpf VARCHAR(11),
    nome VARCHAR(50),
    ctps VARCHAR(11),
    PRIMARY KEY (cpf)
);

CREATE TABLE aluno(
    cpf VARCHAR(11),
    nome VARCHAR(50),
    matricula VARCHAR(7),
    PRIMARY KEY (cpf)
);

CREATE TABLE disciplina(
    nome VARCHAR(30),
    capacidade INT,
    CHECK (capacidade >= 0),
    PRIMARY KEY (nome)
);

CREATE TABLE sala(
    nome VARCHAR(3) PRIMARY KEY,
    vaga INT,
    id_disciplina VARCHAR(30) REFERENCES disciplina(nome)
);

CREATE TABLE ministra(
    id_prof VARCHAR(11) REFERENCES professor(cpf),
    id_disc VARCHAR(30) REFERENCES disciplina(nome),
    CONSTRAINT professor_disciplina PRIMARY KEY (id_prof, id_disc)
);

CREATE TABLE estuda(
    id_aluno VARCHAR(11) REFERENCES aluno(cpf),
    id_disc VARCHAR(30) REFERENCES disciplina(nome),
    CONSTRAINT aluno_disciplina PRIMARY KEY (id_aluno, id_disc)
);

INSERT INTO professor (cpf, nome, ctps) VALUES
('12345678901', 'Alice Silva', '12345678901'),
('23456789012', 'Bruno Costa', '23456789012'),
('34567890123', 'Carla Mendes', '34567890123'),
('45678901234', 'Daniel Oliveira', '45678901234'),
('56789012345', 'Eva Santos', '56789012345'),
('67890123456', 'Felipe Rocha', '67890123456'),
('78901234567', 'Gina Almeida', '78901234567'),
('89012345678', 'Hugo Pereira', '89012345678'),
('90123456789', 'Isabel Fernandes', '90123456789'),
('01234567890', 'João Martins', '01234567890'),
('12345098761', 'Karen Lima', '12345098761'),
('23456109872', 'Lucas Carvalho', '23456109872'),
('34567210983', 'Marta Ribeiro', '34567210983'),
('45678321094', 'Nina Soares', '45678321094'),
('56789432105', 'Otávio Pires', '56789432105');

INSERT INTO aluno (cpf, nome, matricula) VALUES
('09876543210', 'Paula Souza', '2023001'),
('10987654321', 'Ricardo Gomes', '2023002'),
('21098765432', 'Sofia Lima', '2023003'),
('32109876543', 'Tiago Alves', '2023004'),
('43210987654', 'Ursula Costa', '2023005'),
('54321098765', 'Victor Hugo', '2023006'),
('65432109876', 'Wanda Mendes', '2023007'),
('76543210987', 'Xuxa Pereira', '2023008'),
('87654321098', 'Yuri Ribeiro', '2023009'),
('98765432109', 'Zara Almeida', '2023010'),
('09812345674', 'Aline Santos', '2023011'),
('10923456785', 'Bruno Silva', '2023012'),
('21034567896', 'Clara Costa', '2023013'),
('32145678907', 'Davi Oliveira', '2023014'),
('43256789018', 'Eva Ribeiro', '2023015');

INSERT INTO disciplina (nome, capacidade) VALUES
('Matematica', 30),
('Fisica', 25),
('Quimica', 20),
('Historia', 35),
('Geografia', 40),
('Biologia', 30),
('Ingles', 25),
('Portugues', 30),
('Ed. Fisica', 20),
('Artes', 15),
('Musica', 25),
('Programacao', 30),
('Economia', 35),
('Sociologia', 40),
('Filosofia', 30);

INSERT INTO sala (nome, vaga, id_disciplina) VALUES
('101', 30, 'Matematica'),
('102', 25, 'Fisica'),
('103', 20, 'Quimica'),
('104', 35, 'Biologia'),
('105', 40, 'Historia'),
('106', 30, 'Geografia'),
('107', 15, 'Ingles'),
('108', 45, 'Portugues'),
('109', 28, 'Sociologia'),
('110', 33, 'Filosofia'),
('111', 22, 'Artes'),
('112', 50, 'Educacao_Fisica'),
('113', 30, 'Quimica'),
('114', 18, 'Matematica'),
('115', 36, 'Fisica');


INSERT INTO ministra (id_prof, id_disc) VALUES
('12345678901', 'Matematica'),
('23456789012', 'Fisica'),
('34567890123', 'Quimica'),
('45678901234', 'Historia'),
('56789012345', 'Geografia'),
('67890123456', 'Biologia'),
('78901234567', 'Ingles'),
('89012345678', 'Portugues'),
('90123456789', 'Ed. Fisica'),
('01234567890', 'Artes'),
('12345098761', 'Musica'),
('23456109872', 'Programacao'),
('34567210983', 'Economia'),
('45678321094', 'Sociologia'),
('56789432105', 'Filosofia');

INSERT INTO estuda (id_aluno, id_disc) VALUES
('09876543210', 'Matematica'),
('10987654321', 'Fisica'),
('21098765432', 'Quimica'),
('32109876543', 'Historia'),
('43210987654', 'Geografia'),
('54321098765', 'Biologia'),
('65432109876', 'Ingles'),
('76543210987', 'Portugues'),
('87654321098', 'Ed. Fisica'),
('98765432109', 'Artes'),
('09812345674', 'Musica'),
('10923456785', 'Programacao'),
('21034567896', 'Economia'),
('32145678907', 'Sociologia'),
('43256789018', 'Filosofia');

--ATV join's

SELECT disciplina.nome, sala.nome
FROM disciplina
LEFT JOIN sala;



SELECT aluno.nome AS NomeCompleto,
       estuda.id_disc AS Disciplinas
FROM aluno
LEFT JOIN estuda ON aluno.cpf = estuda.id_aluno;



SELECT p.nome, m.id_disc, s.nome
FROM professor p
LEFT JOIN ministra m on p.cpf = m.id_prof
    LEFT JOIN sala s ON m.id_disc = s.id_disciplina;



SELECT DISTINCT d.nome AS Disciplina, d.capacidade AS Capacidade, p.nome AS Professor
FROM disciplina d
LEFT JOIN ministra m on d.nome = m.id_disc
    LEFT JOIN professor p on m.id_prof = p.cpf
WHERE d.capacidade > 30;



SELECT d.nome AS Disciplina,
       s.vaga || ' - ' || d.capacidade AS Sala_e_Capacidade,
       CASE
           WHEN s.vaga  >= 40 THEN 'grande'
           ELSE 'pequena'
           END AS Capacidade
FROM sala s
LEFT JOIN disciplina d ON d.nome = s.id_disciplina
WHERE s.vaga >= 40;



SELECT nome AS Profs_e_Alunos FROM aluno
UNION ALL
SELECT nome FROM professor;

--ATV Agregações e Funções

SELECT a.nome AS Aluno,
       COUNT(e.id_disc) AS Disciplinas_Matriculadas
FROM aluno a
INNER JOIN estuda e on a.cpf = e.id_aluno
GROUP BY a.nome;



SELECT SUM(d.capacidade) AS Capacidade_da_Universidade
FROM disciplina d;



SELECT SUM(d.capacidade) AS Capacidade_da_Universidade,
       COUNT(e.id_aluno) AS Quantidade_de_Alunos
FROM disciplina d
LEFT JOIN estuda e ON d.nome = e.id_disc;



SELECT COUNT(p.nome) AS Profs_sem_Disciplina
FROM professor p
LEFT JOIN ministra m ON p.cpf = m.id_prof
WHERE m.id_prof IS NULL;



SELECT d.nome AS Disciplinas_com_5plus
FROM disciplina d
INNER JOIN estuda e ON d.nome = e.id_disc
GROUP BY d.nome
HAVING COUNT(e.id_aluno) >= 5;



SELECT DISTINCT s.nome AS Salas_em_Uso
FROM sala s
INNER JOIN disciplina d ON d.nome = s.id_disciplina;



SELECT UPPER(SUBSTR(a.nome, 1, 1)) AS Inicial,
       COUNT(*) AS Quantidade
FROM aluno a
GROUP BY UPPER(SUBSTR(a.nome, 1, 1))
ORDER BY Inicial;

--View's, CTE's e Subconsultas, continuação

ALTER TABLE estuda
ADD nota_final DECIMAL(3, 1) CHECK (nota_final >= 0 AND nota_final <= 10);
UPDATE estuda SET nota_final = 9.5 WHERE id_aluno = '09876543210';
UPDATE estuda SET nota_final = 8.0 WHERE id_aluno = '10987654321';
UPDATE estuda SET nota_final = 7.5 WHERE id_aluno = '21098765432';
UPDATE estuda SET nota_final = 6.0 WHERE id_aluno = '32109876543';
UPDATE estuda SET nota_final = 5.5 WHERE id_aluno = '43210987654';
UPDATE estuda SET nota_final = 9.0 WHERE id_aluno = '54321098765';
UPDATE estuda SET nota_final = 4.0 WHERE id_aluno = '65432109876';
UPDATE estuda SET nota_final = 8.5 WHERE id_aluno = '76543210987';
UPDATE estuda SET nota_final = 3.0 WHERE id_aluno = '87654321098';
UPDATE estuda SET nota_final = 10.0 WHERE id_aluno = '98765432109';
UPDATE estuda SET nota_final = 6.5 WHERE id_aluno = '09812345674';
UPDATE estuda SET nota_final = 7.0 WHERE id_aluno = '10923456785';
UPDATE estuda SET nota_final = 5.0 WHERE id_aluno = '21034567896';
UPDATE estuda SET nota_final = 4.5 WHERE id_aluno = '32145678907';
UPDATE estuda SET nota_final = 2.5 WHERE id_aluno = '43256789018';

WITH Nota_Media_por_Disciplina AS (
    SELECT d.nome AS Disciplina,
           AVG(e.nota_final) AS Nota_Média
    FROM estuda e
    INNER JOIN disciplina d on e.id_disc = d.nome
    GROUP BY d.nome
)
SELECT a.nome AS Aluno,
       d.nome AS Disciplina,
       e.nota_final AS Nota_Final
FROM estuda e
INNER JOIN aluno a ON e.id_aluno = a.cpf
INNER JOIN disciplina d ON e.id_disc = d.nome
INNER JOIN Nota_Media_por_Disciplina nmpd ON d.nome = nmpd.Disciplina
WHERE e.nota_final < nmpd.Nota_Média;



WITH Alunos_por_Disciplina AS (
    SELECT p.nome AS Professor,
        COUNT(e.id_aluno) AS Alunos
    FROM professor p
    INNER JOIN ministra m on p.cpf = m.id_prof
    INNER JOIN estuda e on m.id_disc = e.id_disc
    GROUP BY m.id_disc || '-' || p.nome
)
SELECT Professor,
       MIN(Alunos) AS Min_Alunos,
       MAX(Alunos) AS Max_Alunos,
       AVG(Alunos) AS Media_Alunos
FROM Alunos_por_Disciplina AS ap
GROUP BY Professor;