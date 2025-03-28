
CREATE database IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8 ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Contato` VARCHAR(13) NOT NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Veiculo` (
  `idVeiculo` INT NOT NULL,
  `Placa do veiculo` VARCHAR(8) NOT NULL,
  `Modelo` VARCHAR(23) NOT NULL,
  `Marca` VARCHAR(15) NULL,
  `Ano` INT NULL,
  `Cliente_idCliente1` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`, `Cliente_idCliente1`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente1` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente1`)
    REFERENCES `oficina`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Equipe de mecânicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Equipe de mecânicos` (
  `idEquipe de mecânicos` INT NOT NULL,
  PRIMARY KEY (`idEquipe de mecânicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Ordem de serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Ordem de serviço` (
  `idOrdem de serviço` INT NOT NULL,
  `n°` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  `Serviços` VARCHAR(45) NULL,
  `Data de Emissão` DATE NULL,
  `Data de Entrega` DATE NULL,
  `Horas de Trabalho` INT NOT NULL,
  `Valor` FLOAT NULL,
  `Equipe de mecânicos_idEquipe de mecânicos` INT NOT NULL,
  `Veiculo_idVeiculo` INT NOT NULL,
  PRIMARY KEY (`idOrdem de serviço`, `Equipe de mecânicos_idEquipe de mecânicos`, `Veiculo_idVeiculo`),
  INDEX `fk_Ordem de serviço_Equipe de mecânicos1_idx` (`Equipe de mecânicos_idEquipe de mecânicos` ASC) VISIBLE,
  UNIQUE INDEX `n°_UNIQUE` (`n°` ASC) VISIBLE,
  INDEX `fk_Ordem de serviço_Veiculo1_idx` (`Veiculo_idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de serviço_Equipe de mecânicos1`
    FOREIGN KEY (`Equipe de mecânicos_idEquipe de mecânicos`)
    REFERENCES `oficina`.`Equipe de mecânicos` (`idEquipe de mecânicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de serviço_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `oficina`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Mecânico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Mecânico` (
  `idMecânico` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Código` INT NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Valor da Hora` FLOAT NULL,
  `Contato` VARCHAR(13) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMecânico`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Mão de Obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Mão de Obra` (
  `idMão de Obra` INT NOT NULL,
  `Tarefa` VARCHAR(15) NOT NULL,
  `Valor` FLOAT NOT NULL,
  PRIMARY KEY (`idMão de Obra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Ordem de serviço_has_Mão de Obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Ordem de serviço_has_Mão de Obra` (
  `Ordem de serviço_idOrdem de serviço` INT NOT NULL,
  `Mão de Obra_idMão de Obra` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Ordem de serviço_idOrdem de serviço`, `Mão de Obra_idMão de Obra`),
  INDEX `fk_Ordem de serviço_has_Mão de Obra_Mão de Obra1_idx` (`Mão de Obra_idMão de Obra` ASC) VISIBLE,
  INDEX `fk_Ordem de serviço_has_Mão de Obra_Ordem de serviço1_idx` (`Ordem de serviço_idOrdem de serviço` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de serviço_has_Mão de Obra_Ordem de serviço1`
    FOREIGN KEY (`Ordem de serviço_idOrdem de serviço`)
    REFERENCES `oficina`.`Ordem de serviço` (`idOrdem de serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de serviço_has_Mão de Obra_Mão de Obra1`
    FOREIGN KEY (`Mão de Obra_idMão de Obra`)
    REFERENCES `oficina`.`Mão de Obra` (`idMão de Obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Peças` (
  `idPeças` INT NOT NULL,
  `Peça` VARCHAR(15) NOT NULL,
  `Ano` INT NULL,
  `Modelo` VARCHAR(15) NULL,
  `Valor` FLOAT NOT NULL,
  PRIMARY KEY (`idPeças`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Composição da Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Composição da Equipe` (
  `Mecânico_idMecânico` INT NOT NULL,
  `Equipe de mecânicos_idEquipe de mecânicos` INT NOT NULL,
  PRIMARY KEY (`Mecânico_idMecânico`, `Equipe de mecânicos_idEquipe de mecânicos`),
  INDEX `fk_Mecânico_has_Equipe de mecânicos_Equipe de mecânicos1_idx` (`Equipe de mecânicos_idEquipe de mecânicos` ASC) VISIBLE,
  INDEX `fk_Mecânico_has_Equipe de mecânicos_Mecânico1_idx` (`Mecânico_idMecânico` ASC) VISIBLE,
  CONSTRAINT `fk_Mecânico_has_Equipe de mecânicos_Mecânico1`
    FOREIGN KEY (`Mecânico_idMecânico`)
    REFERENCES `oficina`.`Mecânico` (`idMecânico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecânico_has_Equipe de mecânicos_Equipe de mecânicos1`
    FOREIGN KEY (`Equipe de mecânicos_idEquipe de mecânicos`)
    REFERENCES `oficina`.`Equipe de mecânicos` (`idEquipe de mecânicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Peças_has_Ordem de serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Peças_has_Ordem de serviço` (
  `Peças_idPeças` INT NOT NULL,
  `Ordem de serviço_idOrdem de serviço` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Peças_idPeças`, `Ordem de serviço_idOrdem de serviço`),
  INDEX `fk_Peças_has_Ordem de serviço_Ordem de serviço1_idx` (`Ordem de serviço_idOrdem de serviço` ASC) VISIBLE,
  INDEX `fk_Peças_has_Ordem de serviço_Peças1_idx` (`Peças_idPeças` ASC) VISIBLE,
  CONSTRAINT `fk_Peças_has_Ordem de serviço_Peças1`
    FOREIGN KEY (`Peças_idPeças`)
    REFERENCES `oficina`.`Peças` (`idPeças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peças_has_Ordem de serviço_Ordem de serviço1`
    FOREIGN KEY (`Ordem de serviço_idOrdem de serviço`)
    REFERENCES `oficina`.`Ordem de serviço` (`idOrdem de serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;