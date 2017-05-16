# Une os Selects
SELECT nome FROM tb_funcionarios WHERE salario <= 5.0

UNION

SELECT nome FROM tb_funcionarios WHERE salario > 10;

# Usado para contar
SELECT COUNT(*) AS 'Total de Funcionarios da Empresa:' FROM tb_funcionarios;

# Usado para realizar somas
SELECT SUM(salario) AS 'Soma dos Salarios dos Funcionarios da Empresa:' FROM tb_funcionarios;

# Usado para tirar a media
SELECT AVG(salario) AS 'Media dos Salarios dos Funcionarios da Empresa:' FROM tb_funcionarios;

# Mostra só os valores(resultados) diferentes
SELECT DISTINCT(salario) AS 'Valores de Salarios dos Funcionarios da Empresa:' FROM tb_funcionarios;

# Quantidade de salarios diferentes
SELECT COUNT(DISTINCT(salario)) AS 'Quantidade de Salarios diferentes dos Funcionarios da Empresa:' FROM tb_funcionarios;

# Retorna o valor maximo da coluna 
SELECT MAX(salario) AS 'Maior Salario da Empresa:' FROM tb_funcionarios;

# Retorna o valor minimo da coluna 
SELECT MIN(salario) AS 'Menor Salario da Empresa:' FROM tb_funcionarios;

# Subconsultas (Consultas de consultas)
SELECT nome FROM (SELECT nome, salario FROM tb_funcionarios) AS query1
ORDER BY nome;

# Extra com JOIN
SELECT nome, cargo 
FROM (
SELECT A.nome, A.salario, B.nome AS cargo 
FROM tb_funcionarios A 
LEFT JOIN tb_cargo B ON (A.cargo_id = B.id)
) AS query1
ORDER BY nome;

# Cria-se view para congelar as consultas entretanto não os dados
CREATE VIEW dados_funcionario 
AS
SELECT A.nome, A.salario, B.nome AS cargo 
FROM tb_funcionarios A 
LEFT JOIN tb_cargo B ON (A.cargo_id = B.id);

SELECT * FROM dados_funcionario ORDER BY nome;