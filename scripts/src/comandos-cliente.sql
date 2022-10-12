-- 1. Uma query que busque todos os meus gastos do mês de agosto de 2022.
select * from movimentacao_financeira
where data between '2022-08-01 00:00:00' and '2022-08-31 23:59:59';


-- 2. Buscar todas as movimentações que tive do bradesco (código do banco 237), com a descrição da categoria.
select mf.*, c.descricao from movimentacao_financeira mf
inner join contas_correntes cc on cc.id = mf.conta_id
inner join banco b on b.id = cc.banco_id
inner join categoria c on c.id = mf.categoria_id
where b.codigo_banco = '237';


-- 3. Buscar todas as minhas categorias que tenham "trabalho" em sua descrição. Quero buscar como "Trabalho" ou "trabalho" e traga categorias como: "Gasolina para trabalho", "alimentação no Trabalho", "Futebol do trabalho".
select * from categoria
where lower(descricao) like '%trabalho%';


-- 4. Todas movimentações que tive no primeiro semestre deste ano.
select * from movimentacao_financeira mf
where data between '2022-01-01 00:00:00' and '2022-06-30 23:59:59';


-- 5. Buscar as categorias (somente a descrição) que tiveram movimentação na primeira semana de setembro, sem repetição, ordenada por ordem alfabética, desprezando espaços em branco antes e depois da descrição da categoria.
select distinct trim(c.descricao) from movimentacao_financeira mf
inner join categoria c on c.id = mf.categoria_id
where week(mf.data) = week('2022-09-01')
order by 1 asc;


-- 6. buscar a soma de todas as minhas despesa agrupadas por categoria (descrição), que tiveram pelo menos 1000 reais de gasto, arredondando o valor para duas casas após a vírgula
select c.descricao, round(sum(mf.valor), 2) from movimentacao_financeira mf
inner join categoria c on c.id = mf.categoria_id
where mf.valor > 1000
and c.tipo = 'D'
group by c.descricao;


-- 7. buscar as minhas últimas 5 receitas.
select * from movimentacao_financeira mf
inner join categoria c on c.id = mf.categoria_id
where c.tipo = 'R'
order by mf.data desc
limit 5;


-- 8. buscar o valor da minha maior movimentação dentro deste mês.
select max(mf.valor) from movimentacao_financeira mf
where month(mf.data) = month(current_date());


--9. buscar o nome da categoria mais movimentada, por mês, no ano de 2020. Ex mes | categoria | valor movimentado janeiro | restaurante | 1200 fevereiro | moradia | 1300 marco | viagem | 5600



-- 10. Quero saber qual o saldo das minhas contas. Exemplo: Nubank | 1200 Itaú | -300 Santander | 450
select c.nome, b.nome, cc.apelido,
((cc.saldo
	 -
     coalesce((Select sum(mf.valor)
    from movimentacao_financeira mf
    inner join categoria c on c.id = mf.categoria_id
    where c.tipo = 'D'
    and mf.conta_id = cc.id), 0)
	+
    coalesce((Select sum(mf.valor)
    from movimentacao_financeira mf
    inner join categoria c on c.id = mf.categoria_id
    where c.tipo = 'R'
    and mf.conta_id = cc.id), 0))) as Saldo
from contas_correntes cc
inner join banco b on b.id = cc.banco_id
inner join cliente c on c.id = cc.cliente_id
group by cc.cliente_id, cc.banco_id;

