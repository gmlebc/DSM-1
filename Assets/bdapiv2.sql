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
('No Scrum, os sprints geralmente têm uma duração de uma a quatro semanas', true),
('Durante um sprint, a equipe trabalha em incrementos do produto de forma contínua', true),
('Na revisão do sprint, a equipe demonstra o trabalho concluído ao Scrum Master', false),
('A coragem no Scrum envolve enfrentar desafios e problemas durante o desenvolvimento do produto', true),
('O foco no Scrum significa priorizar atividades que não contribuem diretamente para os objetivos do produto', false),
('O respeito no Scrum não é importante para promover um ambiente de trabalho saudável', false),
('A abertura no Scrum envolve compartilhar informações de forma honesta e direta, mas não reconhecer erros', false),
('Os princípios do Scrum são diretrizes fundamentais que não influenciam o comportamento das equipes', false),
('Os valores do Scrum não são inspirados no Manifesto Ágil', false),
('O Scrum promove uma cultura de colaboração, responsabilidade e estagnação dentro das organizações', false),
('O Scrum Master é responsável por representar os interesses do cliente dentro da equipe Scrum', false),
('Uma das principais responsabilidades do Product Owner é gerenciar o backlog do produto', true),
('O Time de Desenvolvimento é responsável por facilitar o processo Scrum', false),
('O Scrum Master atua como facilitador do processo Scrum, garantindo que todas as cerimônias sejam realizadas de forma eficaz', true),
('O Product Owner é responsável por priorizar o backlog do produto com base nas necessidades do negócio', true),
('O Scrum Master é responsável por remover obstáculos que possam impedir o progresso da equipe', true),
('O Time de Desenvolvimento é composto por profissionais especializados em uma única área, o que facilita a entrega de incrementos de produto', false),
('O Product Owner é responsável por garantir que a equipe esteja focada nas atividades que agregam mais valor ao cliente e ao negócio', true),
('O Scrum Master atua como o representante dos stakeholders e do cliente dentro da equipe Scrum', false),
('O Time de Desenvolvimento é responsável por entregar um produto de alta qualidade, incluindo código bem escrito, testado e documentado', true);