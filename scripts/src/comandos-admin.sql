-- 1. buscar o nome dos clientes, email, a cidade onde ele mora, que não tiveram nenhuma movimentação dentro do mês atual. Quero isso para mandar um e-mail marketing para que eles voltem a usar o nosso sistema.
select cli.nome, cli.email, cli.cidade
from cliente cli
where id not in (
	select cc.cliente_id
	from movimentacao_financeira mf
	inner join contas_correntes cc on cc.id = mf.conta_id
	where month(data) = month(current_date() )
);


-- 2. buscar o nome e email dos clientes que mais tiveram a maior movimentação de receita do nosso sistema. Quero o top 5 clientes. E também a sua maior movimentação
select cli.nome, cli.email, Max(mf.valor)
from movimentacao_financeira mf
inner join contas_correntes cc on cc.id = mf.conta_id
inner join cliente cli on cli.id = cc.cliente_id
group by cli.id
order by 3 desc
limit 5;


-- 3. fazer uma busca que descubra em qual dia do mês ocorre a maior parte das movimentações. (este dia é o dia que eu quero mandar meu email marketing mensal
select day(mf.data)
from movimentacao_financeira mf
group by day(mf.data), month(mf.data), year(mf.data)
order by count(mf.data) desc
limit 1;


-- 4. Caso algum cliente cancele a assinatura, e peça para eu excluir ele do sistema, eu como admin preciso, por lei, eliminar ele completamente do meu sistema. Me faz um  eu que eu, com posse do CPF do cliente, possa elimininar ele do meu banco de dados.
delete from movimentacao_financeira where id in (
	select * from (
		select mf.id
		from movimentacao_financeira mf
		inner join contas_correntes cc on cc.id = mf.conta_id
		inner join cliente cli on cli.id = cc.cliente_id
		where cli.cpf = '456789'
	) as p
);

delete from contas_correntes where id in (
	select * from (
		select cc.id
		from contas_correntes cc
		inner join cliente cli on cli.id = cc.cliente_id
		where cli.cpf = '456789'
    ) as p
);

delete from cliente where cpf = '456789';


-- 5. criar um bloqueio, caso a movimentação financeira de algum cliente seja 300% maior do que a maior movimentação já feita pelo cliente, impedir a movimentação devido a uma possível fraude. Essa validação só faz sentido caso o cliente já possua mais de 10 movimentações.
DELIMITER $$
USE `financas_pessoais`$$
CREATE DEFINER=`root`@`%` TRIGGER `financas_pessoais`.`movimentacao_financeira_BEFORE_INSERT` BEFORE INSERT ON `movimentacao_financeira` FOR EACH ROW
BEGIN
	SET @QTD_MOVS = (SELECT COUNT(mf.id)
					FROM movimentacao_financeira mf
                    INNER JOIN contas_correntes cc ON cc.id = mf.conta_id
                    WHERE mf.conta_id = NEW.conta_id
                    GROUP BY mf.conta_id);

    IF @QTD_MOVS > 10
    THEN
		SET @MAIOR_MOV = (SELECT MAX(mf.valor)
						FROM movimentacao_financeira mf
						INNER JOIN contas_correntes cc ON cc.id = mf.conta_id
						WHERE mf.conta_id = NEW.conta_id
						GROUP BY mf.conta_id);

		SET @PERCENTUAL_NOVA_MOV = ((NEW.valor / @MAIOR_MOV) * 100);
        IF (@PERCENTUAL_NOVA_MOV >= 300)
        THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: Possível fraude!';

        END IF;
    END IF;
END$$
DELIMITER ;