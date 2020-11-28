SHOW TABLES;
DROP TABLE tblEndereco; 

--  TABELA ENDEREÇO **************************************************************
CREATE TABLE tblEndereco 
(
Id INT PRIMARY KEY auto_increment,
Rua VARCHAR(50),
CEP Varchar(11),
Sala Varchar(4)
);

-- selecionar tabela
SELECT * FROM tblEndereco;

-- Inserir FK
ALTER TABLE tblEndereco 
ADD FOREIGN KEY (FK_tblTipoEndereco)
	REFERENCES tblTipoEndereco(Id)
	ON DELETE CASCADE
	ON UPDATE RESTRICT;

-- Inserir uma nova coluna
ALTER TABLE tblEndereco ADD Rua VARCHAR(50);

-- Alterar o tipo
ALTER TABLE tblEndereco MODIFY Rua VARCHAR(90);

-- Inserir dados na tabela
INSERT INTO tblEndereco (Rua, CEP, Sala)
VALUES  ('Rod. Marinal Direita Anchieta, 3609','04247010','3'),
		('Rua Domiciniano Leite Ribeiro, 52','04317000',''),
		('Rua General Humberto de Alencar Castelo Branco, 276','00000000','');

-- Fazer update na tabela para enserir dados da nova FK 
UPDATE tblEndereco SET FK_tblTipoEndereco = 1 WHERE Id = 5;    
UPDATE tblEndereco SET FK_tblTipoEndereco = 2 WHERE Id = 6;  
UPDATE tblEndereco SET FK_tblTipoEndereco = 3 WHERE Id = 8;    
        
-- Deletar uma Linha
DELETE FROM tblEndereco WHERE Id=7;
        
-- Alterar o tipo de dado da coluna         
ALTER TABLE tblEndereco MODIFY tblEndereco_Rua Varchar(80);

-- Deletar a tabela
DROP TABLE tblEndereco;

-- Adicionar coluna FK
ALTER TABLE tblEndereco ADD FK_tblTipoEndereco INT;
ALTER TABLE tblEndereco ADD FK_tblCidade INT;

-- Feletar coluna com nome errado
DELETE FK_tblCidade FROM tblEndereco;

-- Relacionar as tabelas
SELECT  Endereco.Rua,
		Endereco.Cep,
        TipoEndereco.Tipo
 FROM tblEndereco AS Endereco
	JOIN tblTipoEndereco AS TipoEndereco
		ON Endereco.FK_tblTipoEndereco = TipoEndereco.Id;





