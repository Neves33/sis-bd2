DROP SCHEMA db_app_db2;

SELECT * 
FROM INFORMATION_SCHEMA. TABLES
WHERE TABLE_SCHEMA = 'db_app_db2';

CREATE SCHEMA db_app_db2;
USE db_app_db2;  

CREATE TABLE autores(
		nome 						VARCHAR(100) PRIMARY KEY NOT NULL
	  , nascimento				 	DATE
      , livro 	 					VARCHAR(100)
      );
      
CREATE TABLE biblioteca(
		nome_livro 					VARCHAR(100) PRIMARY KEY NOT NULL
	  , data_livro				 	DATE
      , categoria_livro				VARCHAR(10)
      , autor						VARCHAR(10)
      , nascimento_autor			DATE
      , classificacao_livro			INT
      );

CREATE TABLE livros(
		nome 						VARCHAR(100) PRIMARY KEY
	  , data_primeira_publicação 	DATE
      , categoria 					VARCHAR(100)
      , classificacao				INT
      , autor					    VARCHAR(100)
      , CONSTRAINT autor_fk FOREIGN KEY(autor) REFERENCES autores(nome)
      );
      
ALTER TABLE biblioteca ADD COLUMN codigo VARCHAR(100);
ALTER TABLE biblioteca RENAME COLUMN nome_livro TO livro;
ALTER TABLE biblioteca MODIFY autor VARCHAR(100);
ALTER TABLE biblioteca MODIFY categoria_livro VARCHAR(100);
ALTER TABLE biblioteca ADD CONSTRAINT bib_liv_fk FOREIGN KEY(livro) REFERENCES livros(nome);

ALTER TABLE autores DROP CONSTRAINT livro_fk;
ALTER TABLE autores DROP livro;


INSERT INTO autores VALUES (  'Rick Warren'
							, STR_TO_DATE( '29/01/1954', '%d/%m/%Y' )
);

INSERT INTO autores VALUES (  'Robert Fisher'
							, STR_TO_DATE( '09/03/1943', '%d/%m/%Y' )
);

SELECT * FROM autores;


INSERT INTO livros(
				nome 						
			  , data_primeira_publicação 	
              , categoria 					
              , classificacao
              , autor
) 
      VALUES (  'O cavaleiro preso na armadura'
				, STR_TO_DATE( '05/10/2020', '%d/%m/%Y' )
                , 'Autoajuda'
                , 5 
                , 'Robert Fisher' 
);

INSERT INTO livros VALUES (  'Liderança com Propósitos'
							, STR_TO_DATE( '01/01/2008', '%d/%m/%Y' )
							, 'Administração da Igreja Religião e Espiritualidade'
							, 4 
							, 'Rick Warren' 
);

INSERT INTO livros VALUES (  'Juntos Somos Melhores'
							, STR_TO_DATE( '01/01/2011', '%d/%m/%Y' )
							, 'Vida Cristã Religião e Espiritualidade'
							, 1 
							, 'Rick Warren' 
);
SELECT * FROM livros;

INSERT INTO biblioteca (
		livro 					
	  , data_livro				 	
      , categoria_livro				
      , autor						
      , nascimento_autor			
      , classificacao_livro		
      
      )VALUES (  
							'Juntos Somos Melhores'
							, null
							, null
							, 'Rick Warren' 
                            , STR_TO_DATE( '01/01/2011', '%d/%m/%Y' )
                            , null
);

SELECT * FROM biblioteca;