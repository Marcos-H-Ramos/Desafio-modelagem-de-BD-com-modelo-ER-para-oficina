use oficina;
show tables;
select * from `oficina`.`Ordem de serviço`;
desc veiculo;

-- Recuperações simples com SELECT Statement e Filtros com WHERE Statement;
-- Recuperar o nome de cada cliente por placa
select Nome, placa_do_veiculo as Placa, Modelo 
	from cliente join veiculo v
	WHERE idCliente = Cliente_idCliente1;

-- Recuperar Nome do cliente, Numero da ordem e valor pago por ordem aprovadas ou concluidas
SELECT n° as Ordem, c.Nome, valor as Entradas
	FROM cliente c JOIN veiculo v JOIN `Ordem de serviço` o 
		ON veiculo_idveiculo = idveiculo AND idCliente = cliente_idCliente1
	WHERE o.status = 'Aprovado' OR o.status = 'Concluido';

-- Crie expressões para gerar atributos derivados;
-- Recuperar divida por cliente
SELECT c.Nome, SUM(valor) as Entradas
	FROM cliente c JOIN veiculo v JOIN `Ordem de serviço` o 
		ON veiculo_idveiculo = idveiculo AND idCliente = cliente_idCliente1
	WHERE o.status = 'Aprovado' OR o.status = 'Concluido'
    GROUP BY Nome;
    
-- Recuperar o custo de mão de obra por equipe
SELECT 
    c.`Equipe de mecânicos_idEquipe de mecânicos`,
    COALESCE(SUM(m.`Valor da Hora`), 0) AS total_valor_hora
	FROM `Oficina`.`Composição da Equipe` c
	JOIN `Oficina`.`Mecânico` m 
    ON m.`idMecânico` IN (
        c.`Mecânico_idMecânico_Lider`,
        c.`Mecânico_idMecânico_2`,
        c.`Mecânico_idMecânico_3`,
        c.`Mecânico_idMecânico_4`
    )
GROUP BY c.`Equipe de mecânicos_idEquipe de mecânicos`;

-- Defina ordenações dos dados com ORDER BY;
-- Condições de filtros aos grupos – HAVING Statement;
-- Recuperar valor total de mão de obra por ordem de serviço aprovada ordenado por n° da ordem
SELECT `n°`,`Status`, `Serviços`, (total_valor_hora * `Horas de Trabalho`) as `Mão de Obra` FROM 
	(SELECT 
    c.`Equipe de mecânicos_idEquipe de mecânicos`,
    COALESCE(SUM(m.`Valor da Hora`), 0) AS total_valor_hora
	FROM `Oficina`.`Composição da Equipe` c 
	JOIN `Oficina`.`Mecânico` m 
    ON m.`idMecânico` IN (
        c.`Mecânico_idMecânico_Lider`,
        c.`Mecânico_idMecânico_2`,
        c.`Mecânico_idMecânico_3`,
        c.`Mecânico_idMecânico_4`
    )
GROUP BY c.`Equipe de mecânicos_idEquipe de mecânicos`) t JOIN `oficina`.`ordem de serviço` USING(`Equipe de mecânicos_idEquipe de mecânicos`)
HAVING `Status` = 'Aprovado'
ORDER BY `n°`;
