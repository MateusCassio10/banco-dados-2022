insert into cliente
values(1,'Mateus Santos', '22228978533','santos.mateus@gmail.com',
'@mts2309*','1994-07-23','Software Engineer','Masculino',12234514,'av. Cidade Jardim',
 07, 'casa', 'Jd Satélite', 'São José dos Campos','SP','Brasil');

 insert into cliente
values(2,'Raquel Souza', '14563978833','kelsouza194@gmail.com',
'kelszo2519*','1990-03-27','Psicóloga','Feminino',12310814,'av. Andrômeda',
 1504, 'b 04 ap 907', 'Jd Satélite', 'São José dos Campos','SP','Brasil');

  insert into cliente
values(3,'Igor S. Silva ', '85756314824','igorssilva12@yahoo.com.br',
'Boleta*+','1987-10-30','Militar','Masculino',12234518,'Rua Alexandre Herculano',
 384, 'b 02 ap 505', 'Pinheiros', 'São Paulo','SP','Brasil');

  insert into cliente
values(4,'Marcos Felipe', '23217985800','felipe_marcos@gmail.com',
'Familia*77+','1991-09-19','Metalúrgico','Masculino',05129824,'Rua Zurique',
 14, 'casa', 'Abolição', 'Rio de Janeiro','RJ','Brasil');

 insert into cliente
values(5,'Cássio Albergoni', '56423167865','albergoni07@gmail.com',
'Ny+Br1526*','1975-12-25','Analista de Sistemas','Masculino',10007,'Cross Bay Boulevard Street',
 1408, 'casa', 'Queens', 'New York','NY','Estados Unidos');

 select * from cliente;


 insert into banco
 values(1, 'Santander', '033');

  insert into banco
 values(2, 'Bradesco', '237');

  insert into banco
 values(3, 'Itau', '341');

  insert into banco
 values(4, 'Nubank', '260');

 select * from banco;


 insert into contas_correntes
 values(1, 1, 2, '02079017-8','237','Math',1000.00);

  insert into contas_correntes
 values(2, 1, 1, '01158025-1','3733','Math',1800.00);

  insert into contas_correntes
 values(3, 2, 4, '25149013-5','260','Keel',19000.00);

   insert into contas_correntes
 values(4, 3, 1, '02556587-9','3733','Boleta',25000.00);

   insert into contas_correntes
 values(5, 4, 2, '25149013-5','237','Marquito',17500.00);

   insert into contas_correntes
 values(6, 5, 3, '87458201-0','M34-0','Mr.Cássio',28985.00);

   insert into contas_correntes
 values(7, 5, 1, '23266214-7','3733','Mr.Cássio',25000.00);

  insert into contas_correntes
 values(8, 2, 1, '20635612-6','3733','Keel',11000.00);

    insert into contas_correntes
 values(9, 3, 3, '02039425-4','M34-0','Boleta',5000.00);

    insert into contas_correntes
 values(10, 4, 4, '00152365-0','260','Marquito',13400.00);

 select * from contas_correntes;



 insert into categoria
 values(1, 'Carro', 'D');

 insert into categoria
 values(2, 'Alimentação', 'D');

 insert into categoria
 values(3, 'Lazer', 'D');

 insert into categoria
 values(4, 'Pet', 'D');

 insert into categoria
 values(5, 'Moradia', 'D');

 insert into categoria
 values(6, 'Assinaturas de Televisão', 'D');

 insert into categoria
 values(7, 'Estudo', 'D');

 insert into categoria
 values(8, 'Livros', 'D');

 insert into categoria
 values(9, 'Vestimento', 'D');

  insert into categoria
 values(10, 'viagem', 'D');

  insert into categoria
 values(11, 'trabalho', 'D');

 insert into categoria
 values(12, 'Alimentação no Trabalho', 'D');

 select * from categoria;


 insert into movimentacao_financeira
 values(1, 297.00, '2022-09-22', 1, 1,'Gasolina para trabalho');

  insert into movimentacao_financeira
 values(2, 100.00, '2020-04-16', 1, 3, 'Futebol no trabalho');

  insert into movimentacao_financeira
 values(3, 57.00, '2022-08-05', 1, 4, 'Ração do Dog');

  insert into movimentacao_financeira
 values(4, 230.00, '2020-10-01', 2, 9, 'Sapato');

  insert into movimentacao_financeira
 values(5, 45.00, '2022-10-02', 2, 11, 'Alimentação no trabalho');




 insert into movimentacao_financeira
 values(6, 1500.00, '2022-09-01', 3, 5, 'Aluguel');

  insert into movimentacao_financeira
 values(7, 150.00, '2022-08-15', 3, 11, 'Festa do trabalho');

  insert into movimentacao_financeira
 values(8, 3575.00, '2020-08-19', 3, 10, 'Viagem para Gramado');

  insert into movimentacao_financeira
 values(9, 1784.00, '2022-05-23', 8, 9, 'roupas e tênis');

  insert into movimentacao_financeira
 values(10, 323.00, '2022-06-06', 8, 11, 'gasolina para trabalho');




 insert into movimentacao_financeira
 values(11, 197.00, '2022-01-22', 4, 6, 'tv a cabo');

  insert into movimentacao_financeira
 values(12, 450.00, '2020-02-12', 9, 9, 'aluguel de terno');

  insert into movimentacao_financeira
 values(13, 2857.00, '2022-08-05', 4, 1, 'pneu e revisão do carro');

  insert into movimentacao_financeira
 values(14, 40.00, '2020-11-01', 4, 11, 'futebol do trabalho');

  insert into movimentacao_financeira
 values(15, 487.00, '2022-10-08', 9, 2, 'viagem ao RJ');




 insert into movimentacao_financeira
 values(16, 37.00, '2021-08-21', 5, 8, 'compra do livro');

  insert into movimentacao_financeira
 values(17, 1000.00, '2022-04-16', 10, 5, 'aluguel');

  insert into movimentacao_financeira
 values(18, 657.00, '2020-05-24', 10, 3, 'Hop hari');

  insert into movimentacao_financeira
 values(19, 80.00, '2022-10-01', 10, 11,'Alimentação no trabalho');

  insert into movimentacao_financeira
 values(20, 75.00, '2022-01-12', 5, 7, 'curso alura');




  insert into movimentacao_financeira
 values(21, 3000.00, '2022-05-15', 7, 5, 'aluguel');

  insert into movimentacao_financeira
 values(22, 150.00, '2021-02-14', 7, 6, 'tv a cabo');

  insert into movimentacao_financeira
 values(23, 19950.00, '2022-04-11', 6, 1, 'compra de um carro');

  insert into movimentacao_financeira
 values(24, 150.00, '2022-09-02', 6, 11, 'festa do trabalho');

  insert into movimentacao_financeira
 values(25, 8550.00, '2020-08-08', 7, 10, 'viagem para europa');

  insert into movimentacao_financeira
 values(26, 10.00, '2022-09-05', 6, 11, 'festa do trabalho');

  insert into movimentacao_financeira
 values(27, 5.00, '2022-08-31', 6, 11, 'festa');

 select * from movimentacao_financeira;


insert into categoria
 values(13, 'Salario', 'R');

  insert into movimentacao_financeira
 values(28, 3500.00, '2022-10-01', 1, 13, 'Pagamento Outubro');

   insert into movimentacao_financeira
 values(29, 3500.00, '2022-09-01', 1, 13, 'Pagamento Setembro');

   insert into movimentacao_financeira
 values(30, 3500.00, '2022-08-01', 1, 13, 'Pagamento Agosto');

   insert into movimentacao_financeira
 values(31, 3500.00, '2022-07-01', 1, 13, 'Pagamento Julho');

   insert into movimentacao_financeira
 values(32, 3500.00, '2022-06-01', 1, 13, 'Pagamento Junho');

   insert into movimentacao_financeira
 values(33, 3500.00, '2022-05-01', 1, 13, 'Pagamento Maio');

   insert into movimentacao_financeira
 values(34, 3500.00, '2022-04-01', 1, 13, 'Pagamento Abril');

   insert into movimentacao_financeira
 values(35, 3500.00, '2022-03-01', 1, 13, 'Pagamento Março');

   insert into movimentacao_financeira
 values(36, 3500.00, '2022-02-01', 1, 13, 'Pagamento Fevereiro');

