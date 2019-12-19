#---------------------------------------------------------------------------
#  Effacer la BD (si elle existait déjà)
#  Créer la BD
#  Utiliser la BD
#
DROP DATABASE IF EXISTS BD02 ;
CREATE DATABASE BD02 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE BD02 ;

SET NAMES UTF8 ;

#---------------------------------------------------------------------------
#  Créer la table COULEUR
#
CREATE TABLE  Couleur
(
  NumC	  INT       NOT NULL	PRIMARY KEY	AUTO_INCREMENT	,
  NomC	  CHAR(20)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#---------------------------------------------------------------------------
#  Remplir la table Couleur
#
INSERT INTO Couleur ( NumC, NomC )
VALUES	( 10 , 'Rouge' ) ,
	( 11 , 'Vert'  ) ,
	( 12 , 'Bleu'  ) ;
#---------------------------------------------------------------------------
#  Créer la table Pays
#
CREATE TABLE  Pays
(
  NumP	  INT       NOT NULL	PRIMARY KEY	AUTO_INCREMENT	,
  NomP	  CHAR(20)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#---------------------------------------------------------------------------
#  Remplir la table Pays
#
INSERT INTO Pays ( NumP, NomP )
VALUES	( 30 , 'France'  ) ,
	( 31 , 'Espagne' ) ,
	( 32 , 'Chine'   ) ,
	( 33 , 'Maroc'   ) ;
#---------------------------------------------------------------------------
#  Créer la table FOURNISSEUR
#
CREATE TABLE  Fournisseur
(
  NumF	  INT       NOT NULL	PRIMARY KEY	AUTO_INCREMENT	,
  NomF	  CHAR(20)  NOT NULL ,
  Siege   INT       NOT NULL ,

  FOREIGN KEY (Siege) REFERENCES Pays (NumP)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#---------------------------------------------------------------------------
#  Remplir la table JOUET
#
INSERT INTO Fournisseur ( NumF, NomF , Siege )
VALUES	( 20 , 'Matel'   , 31 ) ,
	( 21 , 'Meccano' , 31 ) ,
	( 22 , 'Joustra' , 30 ) ;
#---------------------------------------------------------------------------
#  Créer la table JOUET
#
CREATE TABLE  Jouet
(
  NumJ	  INT       NOT NULL	PRIMARY KEY	AUTO_INCREMENT	,
  NomJ	  CHAR(20)  NOT NULL	,
  Prix	  INT       NOT NULL	,
  Coul	  INT       NOT NULL	,
  Four	  INT       NOT NULL	,
  Prod	  INT       NOT NULL	,

  FOREIGN KEY (Coul) REFERENCES Couleur     (NumC) ,
  FOREIGN KEY (Four) REFERENCES Fournisseur (NumF) ,
  FOREIGN KEY (Prod) REFERENCES Pays        (NumP)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#---------------------------------------------------------------------------
#  Remplir la table JOUET
#
INSERT INTO Jouet ( NomJ , Prix , Coul , Four , Prod )
VALUES	('Ours'	  , 11, 10 , 20 , 30 ) ,
	('Ballon' , 22, 11 , 20 , 31 ) ,
	('Velo'   , 55, 10 , 21 , 32 ) ,
	('Ours'	  , 15, 11 , 21 , 33 ) ,
	('Ballon' , 13, 10 , 22 , 32 ) ,
	('Ballon' , 15, 10 , 22 , 31 ) ,
	('Velo'   , 55, 12 , 21 , 32 ) ,
	('Train'  , 66, 10 , 22 , 33 ) ;
