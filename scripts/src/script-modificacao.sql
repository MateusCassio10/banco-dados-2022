ALTER TABLE `financas_pessoais`.`movimentacao_financeira`
ADD COLUMN `descricao` VARCHAR(255) NOT NULL;


ALTER TABLE `financas_pessoais`.`categoria`
ADD COLUMN `tipo` CHAR(1) NOT NULL DEFAULT 'D';
alter table movimentacao_financeira
add column descricao VARCHAR(255) NOT NULL;