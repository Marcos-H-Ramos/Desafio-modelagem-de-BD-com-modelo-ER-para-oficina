-- Inserindo dados na tabela Cliente
INSERT INTO `oficina`.`Cliente` (`idCliente`, `Nome`, `CPF`, `Contato`, `Endereço`) VALUES 
(1, 'João Silva', '12345678901', '11999999999', 'Rua A, 123'),
(2, 'Maria Oliveira', '23456789012', '21988888888', 'Rua B, 456'),
(3, 'Carlos Pereira', '34567890123', '31977777777', 'Rua C, 789'),
(4, 'Ana Costa', '45678901234', '41966666666', 'Rua D, 101'),
(5, 'Pedro Santos', '56789012345', '51955555555', 'Rua E, 202'),
(6, 'Fernanda Lima', '67890123456', '61944444444', 'Rua F, 303');

-- Inserindo dados na tabela Veiculo
INSERT INTO `oficina`.`Veiculo` (`idVeiculo`, `Placa do veiculo`, `Modelo`, `Marca`, `Ano`, `Cliente_idCliente1`) VALUES 
(1, 'ABC1234', 'Civic', 'Honda', 2020, 1),
(2, 'DEF5678', 'Corolla', 'Toyota', 2019, 2),
(3, 'GHI9012', 'Model S', 'Tesla', 2021, 3),
(4, 'JKL3456', 'Mustang', 'Ford', 2018, 4),
(5, 'MNO7890', 'Wrangler', 'Jeep', 2022, 5),
(6, 'PQR2345', 'Camry', 'Toyota', 2020, 6);
INSERT INTO `oficina`.`Veiculo` values (7, 'BLZ2345', 'Etios', 'Toyota', 2026, 2);
-- Adicionando três novos veículos para o cliente 4
INSERT INTO `oficina`.`Veiculo` (`idVeiculo`, `placa_do_veiculo`, `Modelo`, `Marca`, `Ano`, `Cliente_idCliente1`) VALUES 
(10, 'STU4567', 'Golf', 'Volkswagen', 2020, 4),
(8, 'VWX8901', 'Polo', 'Volkswagen', 2019, 4),
(9, 'YZA2345', 'Tiguan', 'Volkswagen', 2021, 4);


-- Inserindo dados na tabela Equipe de mecânicos
INSERT INTO `oficina`.`Equipe de mecânicos` (`idEquipe de mecânicos`) VALUES 
(1), (2), (3), (4), (5), (6);

-- Inserindo dados na tabela Ordem de serviço
INSERT INTO `oficina`.`Ordem de serviço` (`idOrdem de serviço`, `n°`, `Veiculo_idVeiculo`, `Status`, `Serviços`, `Data de Emissão`, `Data de Entrega`, `Horas de Trabalho`, `Equipe de mecânicos_idEquipe de mecânicos`, `Valor`) VALUES 
(1, 101, 1, 'Orçamento', 'Troca de óleo', '2025-03-01', '2025-03-02', 2, 1, 150.0),
(2, 102, 2, 'Aprovado', 'Revisão geral', '2025-03-03', '2025-03-05', 5, 2, 500.0),
(3, 103, 3, 'Recusado', 'Troca de pneus', '2025-03-06', '2025-03-07', 3, 3, 300.0),
(4, 104, 4, 'Concluido', 'Alinhamento e balanceamento', '2025-03-08', '2025-03-09', 4, 4, 200.0),
(5, 105, 5, 'Orçamento', 'Troca de bateria', '2025-03-10', '2025-03-11', 2, 5, 250.0),
(6, 106, 6, 'Aprovado', 'Reparo de motor', '2025-03-12', '2025-03-15', 10, 6, 1000.0);
-- Criando uma ordem de serviço para cada novo veículo do cliente 4
INSERT INTO `oficina`.`Ordem de serviço` 
(`idOrdem de serviço`, `n°`, `Veiculo_idVeiculo`, `Status`, `Serviços`, `Data de Emissão`, `Data de Entrega`, `Horas de Trabalho`, `Equipe de mecânicos_idEquipe de mecânicos`, `Valor`) 
VALUES
(10, 107, 7, 'Orçamento', 'Troca de óleo e filtro', '2025-03-20', '2025-03-21', 2, 1, 200.0),
(8, 108, 8, 'Aprovado', 'Revisão completa', '2025-03-22', '2025-03-24', 6, 2, 600.0),
(9, 109, 9, 'Concluido', 'Troca de pastilhas de freio', '2025-03-25', '2025-03-26', 3, 3, 300.0);

-- Criando quatro novas ordens de serviço para o veículo 1
INSERT INTO `oficina`.`Ordem de serviço` 
(`idOrdem de serviço`, `n°`, `Veiculo_idVeiculo`, `Status`, `Serviços`, `Data de Emissão`, `Data de Entrega`, `Horas de Trabalho`, `Equipe de mecânicos_idEquipe de mecânicos`, `Valor`) 
VALUES
(7, 110, 1, 'Aprovado', 'Troca de pneus e alinhamento', '2025-03-27', '2025-03-28', 4, 4, 400.0),
(11, 111, 1, 'Concluido', 'Reparo na suspensão dianteira', '2025-03-29', '2025-03-30', 5, 5, 500.0),
(12, 112, 1, 'Orçamento', 'Troca do sistema elétrico', '2025-04-01', NULL, 0, 2, NULL), -- Ordem em aberto sem conclusão
(13, 113, 1, 'Aprovado', 'Revisão do motor e troca da correia dentada', '2025-04-02', '2025-04-05', 8, 6, 800.0);


-- Inserindo dados na tabela Mecânico
INSERT INTO `oficina`.`Mecânico` (`idMecânico`, `Nome`, `Código`, `CPF`, `Valor da Hora`, `Contato`, `Endereço`, `Especialidade`) VALUES 
(1, 'José Almeida', 101, '72345678901', 50.0, '11999999999', 'Rua G, 123', 'Motor'),
(2, 'Carlos Silva', 102, '73456789012', 45.0, '21988888888', 'Rua H, 456', 'Suspensão'),
(3, 'Ana Paula', 103, '74567890123', 55.0, '31977777777', 'Rua I, 789', 'Freios'),
(4, 'Marcos Lima', 104, '75678901234', 60.0, '41966666666', 'Rua J, 101', 'Transmissão'),
(5, 'Fernanda Costa', 105, '76789012345', 40.0, '51955555555', 'Rua K, 202', 'Elétrica'),
(6, 'Pedro Santos', 106, '77890123456', 65.0, '61944444444', 'Rua L, 303', 'Pintura');

-- Inserindo dados na tabela Mão de Obra
INSERT INTO `oficina`.`Mão de Obra` (`idMão de Obra`, `Tarefa`, `Valor`) VALUES 
(1, 'Troca de óleo', 100.0),
(2, 'Revisão geral', 300.0),
(3, 'Troca de pneus', 200.0),
(4, 'Alinhamento', 150.0),
(5, 'Troca de bateria', 250.0),
(6, 'Reparo de motor', 500.0);

-- Inserindo dados na tabela Ordem de serviço_has_Mão de Obra
INSERT INTO `oficina`.`Ordem de serviço_has_Mão de Obra` (`Ordem de serviço_idOrdem de serviço`, `Mão de Obra_idMão de Obra`, `Quantidade`) VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 4),
(4, 4, 3),
(5, 5, 2),
(6, 6, 5);

-- Inserindo dados na tabela Peças
INSERT INTO `oficina`.`Peças` (`idPeças`, `Peça`, `Ano`, `Modelo`, `Valor`) VALUES 
(1, 'Filtro de óleo', 2020, 'Civic', 50.0),
(2, 'Pneu', 2019, 'Corolla', 200.0),
(3, 'Bateria', 2021, 'Model S', 300.0),
(4, 'Pastilha de freio', 2018, 'Mustang', 100.0),
(5, 'Correia dentada', 2022, 'Wrangler', 150.0),
(6, 'Velas de ignição', 2020, 'Camry', 75.0);

-- Inserindo dados na tabela Composição da Equipe
INSERT INTO `Oficina`.`Composição da Equipe` 
(`Equipe de mecânicos_idEquipe de mecânicos`, `Mecânico_idMecânico_Lider`, `Mecânico_idMecânico_2`, `Mecânico_idMecânico_3`, `Mecânico_idMecânico_4`) 
VALUES 
(1, 1, 2, 3, 4),
(2, 2, 3, 4, 5),
(3, 3, 4, 5, NULL),
(4, 4, NULL, NULL, NULL),
(5, 5, 6, NULL, NULL),
(6, 6, 1, 2, NULL);

-- Inserindo dados na tabela Peças_has_Ordem de serviço
INSERT INTO `oficina`.`Peças_has_Ordem de serviço` (`Peças_idPeças`, `Ordem de serviço_idOrdem de serviço`, `Quantidade`) VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 4),
(4, 4, 3),
(5, 5, 2),
(6, 6, 5);
