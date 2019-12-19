#---------------------------------------------------------------------------
#  Effacer la BD (si elle existait déjà)
#  Créer la BD
#  Utiliser la BD
#
DROP DATABASE IF EXISTS BD01 ;
CREATE DATABASE BD01 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE BD01 ;

SET NAMES UTF8 ;

#---------------------------------------------------------------------------
#  Créer la table PERSONNE
#
CREATE TABLE  Personne
(
  Id	  INT       NOT NULL PRIMARY KEY	AUTO_INCREMENT,
  Nom	  CHAR(20)  NOT NULL,
  Prenom  CHAR(20)  NOT NULL,
  Age     INT       NOT NULL,
  Sexe	  CHAR(1)	NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#---------------------------------------------------------------------------
#  Remplir la table PERSONNE
#
INSERT INTO Personne
(	Nom,
	Prenom,
	Age,
	Sexe
)
VALUES
	( 'Charpentier',	'Félicien',	77,	'H'	),
	( 'Durand',		'Orianne',	87,	'F'	),
	( 'Fournier',		'Félicien',	71,	'H'	),
	( 'Mercier',		'Nadette',	16,	'F'	),
	( 'Vasseur',		'Gaspard',	27,	'H'	),
	( 'Deschamps',		'Léa',		82,	'F'	);
  
