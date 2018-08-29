-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Usuario (
idUsuario int PRIMARY KEY,
nome varchar,
email varchar,
senha varchar
)

CREATE TABLE Lista (
idLista int PRIMARY KEY,
nome varchar,
calculoLista varchar,
idUsuario int,
idCatLista int,
FOREIGN KEY(idUsuario) REFERENCES Usuario (idUsuario)
)

CREATE TABLE CategoriaLista (
idCatLista int PRIMARY KEY,
nome varchar
)

CREATE TABLE CategoriaProduto (
idCatProduto int PRIMARY KEY,
nome varchar
)

CREATE TABLE Produto (
idProduto int PRIMARY KEY,
nome varchar,
preco double,
validade date,
quantidade int,
precoTotal double,
idCatProduto int,
FOREIGN KEY(idCatProduto) REFERENCES CategoriaProduto (idCatProduto)
)

CREATE TABLE ProdutoLista (
dataInsercao date,
idLista int,
idProduto int,
FOREIGN KEY(idLista) REFERENCES Lista (idLista),
FOREIGN KEY(idProduto) REFERENCES Produto (idProduto)
)

CREATE TABLE Estoque (
idEstoque int PRIMARY KEY,
idProduto int,
registrarSaida date
)

CREATE TABLE ProdutoEstoque (
idEstoque int,
idProduto int,
DataInsercao date,
FOREIGN KEY(idEstoque) REFERENCES Estoque (idEstoque),
FOREIGN KEY(idProduto) REFERENCES Produto (idProduto)
)

ALTER TABLE Lista ADD FOREIGN KEY(idCatLista) REFERENCES CategoriaLista (idCatLista)
ALTER TABLE Estoque ADD FOREIGN KEY(idProduto) REFERENCES Estoque (idEstoque)
