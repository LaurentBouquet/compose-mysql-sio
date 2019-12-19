#-------------------------------------------------------------------------------
#  Effacer la BD (si elle existait déjà)
#
DROP DATABASE IF EXISTS BD03 ;
CREATE DATABASE BD03 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE BD03 ;

SET NAMES UTF8 ;

#-------------------------------------------------------------------------------
#  Créer la Table VILLE
#

CREATE TABLE Ville
(	CP		INT		NOT NULL 	PRIMARY KEY	,
	Nom		CHAR( 30 )	NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#-------------------------------------------------------------------------------
#  Créer des Villes ...


INSERT INTO Ville
(	CP,
	Nom
)
VALUES
	( 50300,	'Avranches'	),
	( 75000,	'Paris'		),
	( 91000,	'Evry'		);

#-------------------------------------------------------------------------------
#  Créer la Table PERSONNE
#

CREATE TABLE Personne 
(	Id		INT		NOT NULL 	PRIMARY KEY	AUTO_INCREMENT,
	Nom		CHAR( 30 )	NOT NULL ,
	Prenom		CHAR( 30 )	NOT NULL ,
	Age		INT		NOT NULL ,
	Sexe		CHAR(  1 )	NOT NULL ,
	CP		INT		NOT NULL ,

	FOREIGN KEY (CP) REFERENCES Ville(CP)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#-------------------------------------------------------------------------------
#  Créer des Personnes ...
#

INSERT INTO Personne
(	Nom,
	Prenom,
	Age,
	Sexe,
	CP
)
VALUES
	( 'Charpentier',	'Felicien',	77,	'H',	50300	),
	( 'Durand',		'Orianne',	87,	'F',	75000	),
	( 'Fournier',		'Felicien',	71,	'H',	91000	),
	( 'Mercier',		'Nadette',	16,	'F',	50300	),
	( 'Vasseur',		'Gaspard',	27,	'H',	75000	),
	( 'Deschamps',		'Lea',		82,	'F',	91000	);

