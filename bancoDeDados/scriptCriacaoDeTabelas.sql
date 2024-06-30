CREATE SCHEMA IF NOT EXISTS `pousada` DEFAULT CHARACTER SET utf8 ;
USE `pousada` ;

CREATE TABLE IF NOT EXISTS `pousada`.`ADMINISTRADOR` (
  `idAdministrador` INT NOT NULL,
  `id_funcionario` INT NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  UNIQUE INDEX `idAdministrador_UNIQUE` (`idAdministrador` ASC) VISIBLE)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `pousada`.`FUNCIONARIO` (
  `idFuncionario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `endereco_rua` VARCHAR(45) NOT NULL,
  `enderecoNumero` VARCHAR(45) NOT NULL,
  `enderecoBairro` VARCHAR(45) NULL,
  `enderecoCidade` VARCHAR(45) NULL,
  `enderecoCEP` VARCHAR(45) NULL,
  `enderecoEstado` VARCHAR(45) NULL,
  `enderecoPais` VARCHAR(45) NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE INDEX `idFuncionario_UNIQUE` (`idFuncionario` ASC) VISIBLE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `pousada`.`HOSPEDE` (
  `idFuncionario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `telefone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `endereco_rua` VARCHAR(45) NOT NULL,
  `enderecoNumero` VARCHAR(45) NOT NULL,
  `enderecoBairro` VARCHAR(45) NULL,
  `enderecoCidade` VARCHAR(45) NULL,
  `enderecoCEP` VARCHAR(45) NULL,
  `enderecoEstado` VARCHAR(45) NOT NULL,
  `enderecoPais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE INDEX `idFuncionario_UNIQUE` (`idFuncionario` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pousada`.`ACOMODACAO` (
  `idAcomodacao` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `capacidade` INT NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idAcomodacao`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `pousada`.`POUSADA` (
  `idPousada` INT NOT NULL,
  `cnpj` CHAR(11) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `telefone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `endereco_rua` VARCHAR(45) NOT NULL,
  `enderecoNumero` VARCHAR(45) NOT NULL,
  `enderecoBairro` VARCHAR(45) NULL,
  `enderecoCidade` VARCHAR(45) NULL,
  `enderecoCEP` VARCHAR(45) NULL,
  `enderecoEstado` VARCHAR(45) NOT NULL,
  `enderecoPais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPousada`),
  UNIQUE INDEX `idFuncionario_UNIQUE` (`idPousada` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pousada`.`RESERVA` (
  `idReserva` INT NOT NULL,
  `dataCheckIn` DATE NULL,
  `dataCheckOut` DATE NULL,
  `numeroDeAcompanhantes` INT NULL,
  `funcionarioResponsavel` VARCHAR(45) NULL,
  `POUSADA_idPousada` INT NOT NULL,
  `HOSPEDE_idFuncionario` INT NOT NULL,
  `ACOMODACAO_idAcomodacao` INT NOT NULL,
  `FUNCIONARIO_idFuncionario` INT NOT NULL,
  `ADMINISTRADOR_idAdministrador` INT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_RESERVA_POUSADA_idx` (`POUSADA_idPousada` ASC) VISIBLE,
  INDEX `fk_RESERVA_HOSPEDE1_idx` (`HOSPEDE_idFuncionario` ASC) VISIBLE,
  INDEX `fk_RESERVA_ACOMODACAO1_idx` (`ACOMODACAO_idAcomodacao` ASC) VISIBLE,
  INDEX `fk_RESERVA_FUNCIONARIO1_idx` (`FUNCIONARIO_idFuncionario` ASC) VISIBLE,
  INDEX `fk_RESERVA_ADMINISTRADOR1_idx` (`ADMINISTRADOR_idAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVA_POUSADA`
    FOREIGN KEY (`POUSADA_idPousada`)
    REFERENCES `pousada`.`POUSADA` (`idPousada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_HOSPEDE1`
    FOREIGN KEY (`HOSPEDE_idFuncionario`)
    REFERENCES `pousada`.`HOSPEDE` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_ACOMODACAO1`
    FOREIGN KEY (`ACOMODACAO_idAcomodacao`)
    REFERENCES `pousada`.`ACOMODACAO` (`idAcomodacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_FUNCIONARIO1`
    FOREIGN KEY (`FUNCIONARIO_idFuncionario`)
    REFERENCES `pousada`.`FUNCIONARIO` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_ADMINISTRADOR1`
    FOREIGN KEY (`ADMINISTRADOR_idAdministrador`)
    REFERENCES `pousada`.`ADMINISTRADOR` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


