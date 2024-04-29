DROP TABLE if exists tbquestao_por_questionario;
DROP TABLE if exists tbquestionario;
DROP TABLE if exists tbusuario;
DROP TABLE if exists tbquestao;
DROP TABLE if exists tbcertificado;

CREATE TABLE tbusuario (
  idusuario SERIAL PRIMARY KEY,
  mail VARCHAR(50) NULL,
  nome VARCHAR(50) NULL
);

CREATE TABLE tbquestao (
  idquestao SERIAL PRIMARY KEY,
  enunciado VARCHAR(256) NULL,
  resposta BOOLEAN NULL
);

CREATE TABLE tbquestionario(
	idquestionario SERIAL PRIMARY KEY,
	idusuario INTEGER,
	datahorario TIMESTAMP, 
	nota FLOAT,
	CONSTRAINT fk_questionario_idusuario 
		FOREIGN KEY (idusuario) 
		REFERENCES tbusuario(idusuario)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
		
);



CREATE TABLE tbquestao_por_questionario(
	idquestionario INTEGER,
	idquestao integer,
	resposta BOOLEAN,
	primary KEY(idquestionario, idquestao),
	CONSTRAINT fk_qq_idquestionario 
		FOREIGN KEY (idquestionario) 
		REFERENCES tbquestionario(idquestionario)
		ON UPDATE CASCADE
        ON DELETE RESTRICT,
	CONSTRAINT fk_qq_idquestao 
		FOREIGN KEY (idquestao) 
		REFERENCES tbquestao(idquestao)
		ON UPDATE CASCADE
        ON DELETE RESTRICT	
);

INSERT INTO tbquestao (enunciado, resposta) 
VALUES
('Uma variável é um espaço na memória do computador?', true),
('O tipo de dado é o conteúdo da variável?', false),
('Os tipos de dados podem ser primitivos ou objetos?', true),
('Na estrutura decisão if...else o bloco if pode existir sem o bloco else?', true ),
('Na estrutura decisão if...else o bloco else pode existir sem o bloco if?', false),
('A estrutura de decisão if...else pode ser aninhada dentro de um bloco if ou else?', true),
('Uma estrutura de repetição for pode ser usada quando o número de iterações é desconhecido?', false),
('O loop do...while executa o bloco de código pelo menos uma vez, mesmo se a condição for inicialmente falsa?', true),
('Em uma estrutura de repetição while, o bloco de código é executado enquanto a condição especificada for falsa?', false);