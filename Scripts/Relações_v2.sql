CREATE SCHEMA 'escola_aviacao' DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
use escola_aviacao;

create table estado (
	id_estado int not null,
    nome varchar(60) not null,
    sigla varchar(5) not null,
    constraint pk_estado primary key (id_estado)
);

create table cidade (
	id_cidade int not null,
    id_estado int not null,
    nome varchar(60) not null,
    constraint pk_cidade primary key (id_cidade),
    constraint fk_cidade01 foreign key (id_estado) references estado (id_estado)
);

create table pais (
	id_pais int not null,
    nome varchar(100) not null,
    constraint pk_pais primary key (id_pais)
);    

create table aluno (
    id_aluno int auto_increment not null,
    id_cidade_naturalidade int not null,
    id_cidade_end int,
    nome varchar(60) not null,
    cpf varchar(11) unique not null,
    data_nascimento DATE not null,    
	end_cep varchar(8),
    end_logradouro varchar(100),
    end_complemento varchar(30),
    end_numero int,
    end_bairro varchar(50),
    telefone varchar(20),
    email varchar(100) unique,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_aluno primary key (id_aluno),
    constraint fk_aluno01 foreign key (id_cidade_end) references cidade (id_cidade),
    constraint fk_aluno02 foreign key (id_cidade_naturalidade) references cidade (id_cidade)
);

create table cargo (
	id_cargo int auto_increment not null,
    nome varchar(60) unique not null,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_cargo primary key (id_cargo)
);

create table titulacao (
	id_titulacao int auto_increment not null,
    descricao varchar(100) unique not null,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_titulacao primary key (id_titulacao)
);

create table funcionario (
    id_funcionario int auto_increment not null,
    id_cargo int not null,
    id_titulacao int, -- exemplo: "piloto comercial", "instrutor de voo"
    id_cidade_end int,    
    nome varchar(60) not null,
    cpf varchar(11) unique not null,
    data_nascimento date not null,
    end_cep varchar(8),
    end_logradouro varchar(100),
    end_complemento varchar(50),
    end_numero int,
    end_bairro varchar(50),    
    telefone varchar(20),
    email varchar(100) unique,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_funcionario primary key (id_funcionario),
    constraint fk_funcionario01 foreign key (id_cargo) references cargo (id_cargo),
    constraint fk_funcionario02 foreign key (id_titulacao) references titulacao (id_titulacao),
    constraint kf_funcionario03 foreign key (id_cidade_end) references cidade (id_cidade)
);

create table aeronave (
    id_aeronave int auto_increment not null,
    modelo varchar(100) not null,
    matricula varchar(10) unique not null,  -- matrícula da aeronave
    capacidade int,  -- número de assentos
    ano_fabricacao int,
    in_status enum('Disponível', 'Manutenção') default 'Disponível' not null,  -- exemplo: "disponível", "em manutenção"
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_aeronave primary key (id_aeronave)
);

create table curso (
    id_curso int auto_increment not null,
    nome varchar(100) unique not null,
    descricao text,
    duracao int,  -- duração em horas
    carga_horaria int,  -- carga horária total do curso
    valor decimal(10, 2),  -- valor do curso
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_curso primary key (id_curso)
);

create table matricula (
    id_matricula int auto_increment not null,
    id_aluno int not null,
    id_curso int not null,
    data_matricula timestamp default current_timestamp,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_matricula primary key (id_matricula),
    constraint fk_matricula01 foreign key (id_aluno) references aluno (id_aluno),
    constraint fk_matricula02 foreign key (id_curso) references curso (id_curso)
);

create table aula (
    id_aula int auto_increment not null,
    id_curso int not null,
    id_funcionario int not null,
    id_aeronave int not null,
    data_aula datetime not null,
    duracao int,  -- duração da aula em minutos
    in_status enum('Agendada', 'Concluída') default 'Agendada' not null, -- exemplo: "agendada", "concluída" 
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_aula primary key (id_aula),
    constraint fk_aula01 foreign key (id_curso) references curso (id_curso),
    constraint fk_aula02 foreign key (id_funcionario) references funcionario (id_funcionario),
    constraint fk_aula03 foreign key (id_aeronave) references aeronave (id_aeronave)
);

create table agendamento (
    id_agendamento int auto_increment not null,
    id_aluno int not null,
    id_aula int not null,
    data_agendamento timestamp default current_timestamp,
    in_status enum('Agendado', 'Cancelado') default 'Agendado' not null,  -- exemplo: "agendado", "cancelado"
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_agendamento primary key (id_agendamento),
    constraint fk_agendamento01 foreign key (id_aluno) references aluno (id_aluno),
    constraint fk_agendamento02 foreign key (id_aula) references aula (id_aula)
);

create table pagamento (
    id_pagamento int auto_increment not null,
    id_aluno int not null,
    valor_pago decimal(10, 2) default 0.00 not null,
    data_pagamento timestamp default current_timestamp,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_pagamento primary key (id_pagamento),
    constraint fk_pagamento01 foreign key (id_aluno) references aluno (id_aluno)
);

create table historico_voo (
    id_historico int auto_increment not null,
    id_aluno int not null,
    id_aeronave int not null,
    data_voo datetime not null,
    horas_voo decimal(5, 2),  -- horas de voo acumuladas
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_historico_voo primary key (id_historico),
    constraint fk_historico_voo01 foreign key (id_aluno) references aluno (id_aluno),
    constraint fk_historico_voo02 foreign key (id_aeronave) references aeronave (id_aeronave)
);

create table tipo_licenca (
	id_tipo_licenca int auto_increment not null,
    descricao varchar(100) unique not null,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_tipo_licenca primary key (id_tipo_licenca)
);

create table licenca (
    id_licenca int auto_increment,
    id_tipo_licenca int not null, -- exemplo: "piloto privado", "piloto comercial"
    id_aluno int not null, 
    id_pais int not null, -- país emissor da licença,
    numero_licenca varchar(50) unique,  -- número da licença (caso exista)
    data_emissao date not null,  -- data de emissão da licença
    data_validade date,  -- data de validade (caso aplicável)
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_licenca primary key (id_licenca),
    constraint fk_licenca01 foreign key (id_tipo_licenca) references tipo_licenca (id_tipo_licenca),
    constraint fk_licenca02 foreign key (id_aluno) references aluno (id_aluno),
    constraint fk_licenca03 foreign key (id_pais) references pais (id_pais)
);

create table tipo_certificado (
	id_tipo_certificado int auto_increment not null,
    descricao varchar(100) unique not null,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_tipo_certificacao primary key (id_tipo_certificado)
); 

create table orgao_emissor (
	id_orgao_emissor int auto_increment not null,
    nome varchar(100) unique not null,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_orgao_emissor primary key (id_orgao_emissor)
);    

create table certificacao (
    id_certificacao int auto_increment not null,
    id_tipo_certificado int not null, -- exemplo: "voo por instrumentos", "piloto de aeronaves específicas"
    id_orgao_emissor int not null, -- instituição ou órgão que emitiu a certificação
    id_aluno int not null,	
    numero_certificacao varchar(50) unique,  -- número da certificação (caso exista)
    data_emissao date not null,  -- data de emissão da certificação
    validade date,  -- data de validade (caso aplicável)
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_certificacao primary key (id_certificacao),
    constraint fk_certificacao01 foreign key (id_tipo_certificado) references tipo_certificado (id_tipo_certificado),
    constraint fk_certificacao02 foreign key (id_orgao_emissor) references orgao_emissor (id_orgao_emissor),
    constraint fk_certificacao03 foreign key (id_aluno) references aluno (id_aluno)
);

create table tipo_exame (
	id_tipo_exame int auto_increment not null,
    descricao varchar(100) unique not null,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_tipo_exame primary key (id_tipo_exame)
);

create table instituicao (
	id_instituicao int auto_increment not null,
    nome varchar(100) unique not null,
    intituicao_aplicacao enum('Exame', 'Treinamento') not null,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_instituicao primary key (id_instituicao)
);

create table exame (
    id_exame int auto_increment not null,
    id_instituicao int not null, -- instituição que aplicou o exame
    id_tipo_exame int not null, -- exemplo: "exame médico", "exame teórico"
    id_aluno int not null,    
    resultado enum('Aprovado', 'Reprovado') default 'Aprovado' not null,   -- exemplo: "aprovado", "reprovado"
    data_exame date not null,  -- data do exame
    validade date,  -- data de validade do exame (se aplicável, como no caso de exames médicos)
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_exame primary key (id_exame),
    constraint fk_exame01 foreign key (id_instituicao) references instituicao (id_instituicao),
    constraint fk_exame02 foreign key (id_tipo_exame) references tipo_exame (id_tipo_exame),
    constraint fk_exame03 foreign key (id_aluno) references aluno (id_aluno)
);

create table tipo_treinamento (
	id_tipo_treinamento int auto_increment not null,
    descricao varchar(100) unique not null,
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_tipo_treinamento primary key (id_tipo_treinamento)
);

create table treinamento (
    id_treinamento int auto_increment,
    id_tipo_treinamento int not null, -- exemplo: "treinamento de emergências", "treinamento de navegação"
    id_instituicao int not null, -- instituição ou escola que ministrou o treinamento
    id_aluno int not null,
    horas_treinamento int,  -- número de horas do treinamento
    data_inicio date not null,  -- data de início do treinamento
    data_fim date,  -- data de conclusão do treinamento
    data_cadastro timestamp default current_timestamp,
    data_alteracao timestamp,
    situacao_registro smallint default 1 not null, -- 0 - Excluído, 1 - Ativo
    constraint pk_treinamento primary key (id_treinamento),
    constraint fk_treinamento01 foreign key (id_tipo_treinamento) references tipo_treinamento (id_tipo_treinamento),
    constraint fk_treinamento02 foreign key (id_instituicao) references instituicao (id_instituicao),
    constraint fk_treinamento03 foreign key (id_aluno) references aluno (id_aluno)
);