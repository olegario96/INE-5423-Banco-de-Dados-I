create table UF (
	idUF varchar(2) not null,
	nomeExtensoUF varchar(50) not null,
	primary key (idUF)
);

create table Cidade (
	idCidade int not null,
	nomeCidade varchar(50) not null,
	idUF varchar(2) not null,
	primary key (idCidade),
	foreign key (idUF) references UF(idUF)
);

create table Bairro (
	idBairro int not null,
	nomeBairro varchar(50) not null,
	idCidade int not null,
	primary key (idBairro),
	foreign key (idCidade) references Cidade(idCidade)
);

create table Endereco (
	idEndereco int not null,
	nomeLogradouro varchar(50) not null,
	CEP varchar(10) not null,
	idBairro int not null,
	primary key (idEndereco),
	foreign key (idBairro) references Bairro(idBairro)
);

create table Profissao (
	idProfissao int not null,
	descricaoProfissao varchar(50) not null,
	primary key (idProfissao)
);

create table ModeloMovel (
	idModeloMovel int not null,
	descricaoModelo varchar(50) not null,
	primary key (idModeloMovel)
);

create table TipoMovel (
	idTipoMovel int not null,
	descricaoTipoMovel varchar(50) not null,
	idModeloMovel int not null,
	primary key (idTipoMovel),
	foreign key (idModeloMovel) references ModeloMovel(idModeloMovel)
);

create table EstadoCivil (
	idEstadoCivil int not null,
	descricaoEstadoCivil varchar(50) not null,
	primary key (idEstadoCivil)
);

create table RegimeCasamento (
	idRegimeCasamento int not null,
	descricaoRegime varchar(50) not null,
	primary key (idRegimeCasamento)
);

create table ReferenciaImobiliaria (
	idImobiliaria int not null,
	descricaoImobiliaria varchar(50) not null,
	telefoneImobiliaria varchar(20) not null,
	primary key (idImobiliaria)
);

create table Pais (
	idPais varchar(3) not null,
	nomePais varchar(50) not null,
	primary key (idPais)
);

create table ReferenciaComercial (
	idReferenciaComercial int not null, 
	telefoneReferenciaComercial varchar(20) not null, 
	nomeReferenciaComercial varchar(50) not null,
	primary key (idReferenciaComercial)
);

create table ReferenciaBancaria (
	idReferenciaBancaria int not null,
	agencia varchar(10) not null,
	gerente varchar(50) not null,
	nome varchar(50) not null,
	primary key (idReferenciaBancaria)
);

create table Empresa (
	CNPJ varchar(20) not null,
	sede varchar(50) not null,
	descricaoEmpresa varchar(50) not null,
	capital varchar(50) not null,
	primary key (CNPJ)
);

create table ApoliceImobiliaria (
	idApoliceImobiliaria int not null,
	valorSeguro int,
	imobiliaria boolean not null,
	primary key (idApoliceImobiliaria)
);

create table Negociacao (
	idNegocio int not null, 
	destinacao varchar(50) not null, 
	dataInicioContrato date not null, 
	prazo int not null, 
	diaCobranca date not null, 
	diaRepasse date not null, 
	diaIncioPeriodo date not null, 
	pintura boolean not null, 
	liberacaoMulta boolean not null, 
	taxaContrato int not null, 
	taxaAdm int not null, 
	referenciaUniven varchar(50) not null, 
	codigoCPFL varchar(20) not null, 
	codigoSABESP varchar(20) not null, 
	condicoesEspeciais varchar(200) not null, 
	residencial boolean not null, 
	valorAluguel int not null, 
	valorCondominio int not null, 
	garantiaAluguel boolean not null, 
	codigoIPTU varchar(20) not null, 
	nParcelasIPTU int not null, 
	valorParcela int not null, 
	idApoliceImobiliaria int not null,
	primary key (idNegocio),
	foreign key (idApoliceImobiliaria) references ApoliceImobiliaria(idApoliceImobiliaria)
);

create table Finalidade (
	idFinalidade int not null,
	descricaoFinalidade varchar(50) not null,
	primary key (idFinalidade)
);

create table Parentesco (
	idParentesco int not null,
	descricaoParentesco varchar(50) not null,
	primary key (idParentesco)
);

create table TipoImovel (
	idTipoImovel int not null,
	descricaoTipoImovel varchar(50) not null,
	primary key (idTipoImovel)
);

create table Situacao (
	idSituacao int not null,
	saldoDevedor int,
	quitado boolean not null,
	primary key (idSituacao)
);

create table Cartorio (
	idCartorio int not null,
	nomeCartorio varchar(50),
	primary key (idCartorio)
);

create table Empregador (
	idEmpregador int not null,
	descricaoEmpregador varchar(50) not null,
	telefoneEmpregador varchar(20) not null,
	numero varchar(10) not null,
	complemento varchar(50),
	idEndereco int not null,
	primary key (idEmpregador),
	foreign key (idEndereco) references Endereco(idEndereco)
);

create table Pessoa (
	CPF varchar(20) not null,
	RG varchar(20) not null,
	dataExedicao date not null,
	nomePessoa varchar(50) not null,
	dataNascimento date not null,
	salarioBruto int not null, 
	numero varchar(10) not null,
	complemento varchar(50),
	telefonePessoa varchar(20) not null,
	email varchar(50) not null,
	idEndereco int not null,
	primary key (CPF),
	foreign key (idEndereco) references Endereco(idEndereco)
);

create table Locatario (
	outrosRendimentos int,
	assalariadoLiberal boolean not null,
	propriaAlugada boolean not null,
	tempoResidencia int not null,
	telefoneCelualr varchar(20) not null,
	filiacao varchar(50) not null,
	nDependentes int not null,
	CPF varchar(20) not null,
	idUF varchar(2) not null,
	idEstadoCivil int not null,
	idRegimeCasamento int,
	idImobiliaria int,
	idPaisNacionalidade varchar(3) not null,
	idPaisNaturalidade varchar(3) not null,
	foreign key (CPF) references Pessoa(CPF),
	foreign key (idUF) references UF(idUF),
	foreign key (idEstadoCivil) references EstadoCivil(idEstadoCivil),
	foreign key (idRegimeCasamento) references RegimeCasamento(idRegimeCasamento),
	foreign key (idImobiliaria) references ReferenciaImobiliaria(idImobiliaria),
	foreign key (idPaisNacionalidade) references Pais(idPais),
	foreign key (idPaisNaturalidade) references Pais(idPais),
	primary key (CPF)
);

create table BemMovel (
	idBemMovel int not null,
	valorMovel int not null,
	anoMovel date not null,
	quitado boolean not null,
	CPF varchar(20) not null,
	idTipoMovel int not null,
	primary key (idBemMovel),
	foreign key (CPF) references Locatario(CPF),
	foreign key (idTipoMovel) references TipoMovel(idTipoMovel)
);

create table BemImovel (
	idBemImovel int not null,
	valor int not null, 
	numeroMatricula varchar(20) not null,
	numero varchar(10) not null,
	complemento varchar(50),
	CPF varchar(20) not null,
	idEndereco int not null,
	idTipoImovel int not null,
	idSituacao int not null,
	idCartorio int not null,
	primary key (idBemImovel),
	foreign key (CPF) references Locatario(CPF),
	foreign key (idEndereco) references Endereco(idEndereco),
	foreign key (idTipoImovel) references TipoImovel(idTipoImovel),
	foreign key (idSituacao) references Situacao(idSituacao),
	foreign key (idCartorio) references Cartorio(idCartorio)
);

create table LocatarioReferenciaComercial (
	CPF varchar(20) not null,
	idReferenciaComercial int not null,
	foreign key (CPF) references Locatario(CPF),
	foreign key (idReferenciaComercial) references ReferenciaComercial(idReferenciaComercial),
	primary key (CPF, idReferenciaComercial)
);

create table LocatarioReferenciaBancaria (
	CPF varchar(20) not null,
	idReferenciaBancaria int not null,
	foreign key (CPF) references Locatario(CPF),
	foreign key (idReferenciaBancaria) references ReferenciaBancaria(idReferenciaBancaria),
	primary key (CPF, idReferenciaBancaria)
);

create table ParticipacaoEmpresa (
	CPF varchar(20) not null,
	CNPJ varchar(20) not null,
	participacao int not null,
	foreign key (CPF) references Locatario(CPF),
	foreign key (CNPJ) references Empresa(CNPJ),
	primary key (CPF, CNPJ),
	check (participacao >= 0 and participacao <= 100)
);

create table LocatarioEmpregador (
	CPF varchar(20) not null,
	idEmpregador int not null,
	cargoFuncao varchar(20) not null,
	tempoServico int not null,
	dataAdmissao date not null,
	foreign key (CPF) references Pessoa(CPF),
	foreign key (idEmpregador) references Empregador(idEmpregador),
	primary key (CPF, idEmpregador)
);

create table Ficha (
	idFicha int not null,
	residencial boolean not null,
	valorAluguel int not null,
	numero varchar(10) not null,
	complemento varchar(50),
	CPF varchar(20) not null,
	idNegocio int not null,
	idFinalidade int not null,
	idEndereco int not null,
	primary key (idFicha),
	foreign key (CPF) references Locatario(CPF),
	foreign key (idNegocio) references Negociacao(idNegocio),
	foreign key (idFinalidade) references Finalidade(idFinalidade),
	foreign key (idEndereco) references Endereco(idEndereco)
);

create table OcupanteResidencial (
	idOcupanteResidencial int not null,
	rendaOcupante int not null,
	nomeOcupante varchar(50) not null,
	dataNascimentoOcupante date not null,
	idParentesco int not null,
	idFicha int not null,
	primary key (idOcupanteResidencial),
	foreign key (idParentesco) references Parentesco(idParentesco),
	foreign key (idFicha) references Ficha(idFicha)
);

create table Conjugue (
	CPFLocatario varchar(20) not null,
	CPFPessoa varchar (20) not null,
	foreign key (CPFLocatario) references Locatario(CPF),
	foreign key (CPFPessoa) references Pessoa(CPF),
	primary key (CPFLocatario, CPFPessoa)
);
