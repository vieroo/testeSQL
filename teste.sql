create table filiais (
  codigo serial primary key,
  cnpj varchar(14) not null,
  nome varchar(50) not null,
  cidade varchar(50) not null,
  estado varchar(50) not null
);

insert into filiais (cnpj, nome, cidade, estado) values 
('82110818000121', 'ALFA TRANSPORTES LTDA', 'Cacador', 'SC'),
('82110818000202', 'ALFA TRANSPORTES LTDA', 'Curitiba', 'PR'),
('82110818000393', 'ALFA TRANSPORTES LTDA', 'Guarulhos', 'SP'),
('82110818001608', 'ALFA TRANSPORTES LTDA', 'Betim', 'MG'),
('82110818000806', 'ALFA TRANSPORTES LTDA', 'Cachoeirinha', 'RS'),
('82110818002760', 'ALFA TRANSPORTES LTDA', 'Tres Lagoas', 'MS'),
('82110818002094', 'ALFA TRANSPORTES LTDA', 'Goiania', 'GO'),
('82110818002507', 'ALFA TRANSPORTES LTDA', 'Serra', 'ES'),
('82110818002841', 'ALFA TRANSPORTES LTDA', 'Rio de Janeiro', 'RJ');

create table departamentos(
  codigo serial primary key,
  nome varchar(50) not null,
  cod_filial integer not null references filiais(codigo)
);

insert into departamentos (nome, cod_filial) values
('Expedicao', 1),
('SAC', 1),
('Operacional', 1),
('Administrativo', 1),
('Gerencia', 1),
('Expedicao', 2),
('SAC', 2),
('Operacional', 2),
('Administrativo', 2),
('Gerencia', 2),
('Expedicao', 3),
('SAC', 3),
('Operacional', 3),
('Administrativo', 3),
('Gerencia', 3),
('Expedicao', 4),
('SAC', 4),
('Operacional', 4),
('Administrativo', 4),
('Gerencia', 4),
('Expedicao', 5),
('SAC', 5),
('Operacional', 5),
('Administrativo', 5),
('Gerencia', 5),
('Expedicao', 6),
('SAC', 6),
('Operacional', 6),
('Administrativo', 6),
('Gerencia', 6),
('Expedicao', 7),
('SAC', 7),
('Operacional', 7),
('Administrativo', 7),
('Gerencia', 7),
('Expedicao', 8),
('SAC', 8),
('Operacional', 8),
('Administrativo', 8),
('Gerencia', 8),
('Expedicao', 9),
('SAC', 9),
('Operacional', 9),
('Administrativo', 9),
('Gerencia', 9);

create table colaboradores (
  cpf varchar(11) primary key,
  nome varchar(100) not null,
  genero varchar(1) not null,
  data_admissao date,
  salario numeric not null,
  cod_departamento integer not null references departamentos(codigo)
);

insert into colaboradores (cpf, nome, genero, data_admissao, salario, cod_departamento) values
('11045232998', 'Eduardo Viero', 'M', '2022-05-12', 4000.00, 5),
('11187509812', 'Bruno Viero', 'M', '2022-07-15', 3500.00, 3),
('13143446927', 'Carolina de Mattos', 'F', '2021-06-12', 4000.00, 4),
('02547878747', 'Ana Julia', 'F', '2023-01-15', 1850.00, 7),
('01215789658', 'Vera Lucia', 'F', '2021-05-06', 6000.00, 8),
('54203487978', 'Onilson Viero', 'M', '2021-06-05', 6000.00, 9),
('89348757731', 'Neymar Junior', 'M', '2018-04-20', 1700.00, 11),
('04283817283', 'Amalia Viero', 'F', '2020-06-02', 1300.00, 12),
('77628393270', 'Julio Mattos', 'M', '2022-11-18', 1900.00, 14),
('00660032231', 'Amsterdan Moriggi', 'M', '2021-12-24', 2100.00, 17),
('91323049300', 'Joao Maria Silva', 'M', '2022-02-01', 3200.00, 18),
('00142034328', 'Antonio Rosa', 'M', '2020-08-18', 1800.00, 19),
('02877943471', 'Fernanda Lima', 'F', '2022-10-29', 1900.00, 21),
('02179000285', 'Ana Robassi', 'F', '2020-09-30', 4300.00, 22),
('87955206458', 'Bianca Stefan', 'F', '2021-04-19', 1900.00, 23),
('02933394021', 'Diogo Oliveira', 'M', '2018-03-05', 1300.00, 27),
('20397054343', 'Jenifer Antunes', 'F', '2023-04-02', 1800.00, 28),
('40856343928', 'Leonardo Sabini', 'M', '2020-11-16', 2100.00, 29),
('01051600222', 'Taylor Swift', 'F', '2018-11-20', 4200.00, 31),
('39255728370', 'Rodrigo Angero', 'M', '2021-05-19', 3200.00, 32),
('32060278931', 'Fabiana Antunes', 'F', '2017-06-15', 2900.00, 34),
('13193453928', 'Carolina Figueroa', 'F', '2022-07-28', 4700.00, 36),
('17729854209', 'Roger Risotto', 'M', '2021-09-13', 3200.00, 37),
('11102348995', 'Antonio Ribeiro', 'M', '2022-10-13', 1800.00, 38),
('42358794457', 'Angela Carlin', 'F', '2018-07-13', 2700.00, 41),
('58769524822', 'Roberto Pariostto', 'M', '2022-02-12', 2100.00, 42),
('02547869223', 'Priscila Core', 'F', '2018-12-03', 2800.00, 43);

select colaboradores.cpf as cpf_colaborador, colaboradores.nome as nome_colaborador, filiais.cidade as cidade_filial, departamentos.nome as nome_departamento from colaboradores left join departamentos on colaboradores.cod_departamento = departamentos.codigo left join filiais on departamentos.cod_filial = filiais.codigo order by filiais.codigo, colaboradores.nome;

select colaboradores.cpf, colaboradores.nome, colaboradores.data_admissao, filiais.cidade as cidade_filial from colaboradores left join departamentos on colaboradores.cod_departamento = departamentos.codigo inner join filiais on departamentos.cod_filial = filiais.codigo order by colaboradores.data_admissao asc limit 5;

select distinct(filiais.codigo) as cod_filial, filiais.cidade as cidade_filial, count(colaboradores.cpf) as qte_colaboradores from colaboradores left join departamentos on colaboradores.cod_departamento = departamentos.codigo left join filiais on departamentos.cod_filial = filiais.codigo group by filiais.codigo order by filiais.cidade;

select distinct(departamentos.codigo) as cod_depart, departamentos.nome as nome_depart, round(avg(colaboradores.salario),2) as media_salario from colaboradores left join departamentos on colaboradores.cod_departamento = departamentos.codigo group by departamentos.codigo order by departamentos.nome;