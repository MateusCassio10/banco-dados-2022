CREATE SCHEMA `financas_pessoais`;

CREATE TABLE `financas_pessoais`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `data_nascimento` DATETIME NOT NULL,
  `profissao` VARCHAR(255) NULL,
  `genero` VARCHAR(45) NULL,
  `cep` INT(8) NULL,
  `rua` VARCHAR(255) NULL,
  `numero` INT NULL,
  `complemento` VARCHAR(255) NULL,
  `bairro` VARCHAR(255) NULL,
  `cidade` VARCHAR(255) NULL,
  `estado` VARCHAR(2) NULL,
  `pais` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));



  CREATE TABLE `financas_pessoais`.`banco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `codigo_banco`VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


  CREATE TABLE `financas_pessoais`.`contas_correntes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `banco_id` INT NOT NULL,
  `numero_conta` VARCHAR(45) NOT NULL,
  `agencia` VARCHAR(45) NOT NULL,
  `apelido` VARCHAR(255) NOT NULL,
  `saldo` DECIMAL(18,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`));


  CREATE TABLE `financas_pessoais`.`movimentacao_financeira` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(18,2) NOT NULL  DEFAULT 0.00,
  `data` DATETIME NOT NULL,
  `conta_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`));


  CREATE TABLE `financas_pessoais`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));


ALTER TABLE `financas_pessoais`.`contas_correntes`
ADD CONSTRAINT `fk_cliente_id`
  FOREIGN KEY (`cliente_id`)
  REFERENCES `financas_pessoais`.`cliente` (`id`),
ADD CONSTRAINT `fk_banco_id`
  FOREIGN KEY (`banco_id`)
  REFERENCES `financas_pessoais`.`banco` (`id`);


  ALTER TABLE `financas_pessoais`.`contas_correntes`
ADD UNIQUE INDEX `un_cliente_banco` (`cliente_id` ASC, `banco_id` ASC);


ALTER TABLE `financas_pessoais`.`movimentacao_financeira`
ADD CONSTRAINT `fk_conta_id`
  FOREIGN KEY (`conta_id`)
  REFERENCES `financas_pessoais`.`contas_correntes` (`id`),
ADD CONSTRAINT `fk_categoria_id`
  FOREIGN KEY (`categoria_id`)
  REFERENCES `financas_pessoais`.`categoria` (`id`);


ALTER TABLE `financas_pessoais`.`movimentacao_financeira`
ADD COLUMN `descricao` VARCHAR(255) NOT NULL;


ALTER TABLE `financas_pessoais`.`categoria`
ADD COLUMN `tipo` CHAR(1) NOT NULL DEFAULT 'D';


use `financas_pessoais`;
