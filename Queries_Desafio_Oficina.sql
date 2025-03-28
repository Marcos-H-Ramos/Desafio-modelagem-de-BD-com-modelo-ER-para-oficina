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

-- Recuperar custo de mão de obra, peça e total da ordem
SELECT n° as Ordem, `Mão de obra`, `Peças`, (`Mão de obra` + `Peças`) Total
------------------------------------------ COntinuar daqui



-- Defina ordenações dos dados com ORDER BY;
-- Condições de filtros aos grupos – HAVING Statement;
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;