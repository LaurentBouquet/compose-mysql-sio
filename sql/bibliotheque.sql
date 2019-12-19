-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 16 Décembre 2019 à 23:43
-- Version du serveur :  5.7.11
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bibliotheque`
--
DROP DATABASE IF EXISTS bibliotheque ;
CREATE DATABASE `bibliotheque` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bibliotheque`;

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

DROP TABLE IF EXISTS `auteurs`;
CREATE TABLE IF NOT EXISTS `auteurs` (
  `idauteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `datenaiss` date DEFAULT NULL,
  `datedeces` date DEFAULT NULL,
  `bibliographie` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idauteur`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `auteurs`
--

TRUNCATE TABLE `auteurs`;
--
-- Contenu de la table `auteurs`
--

INSERT INTO `auteurs` (`idauteur`, `nom`, `prenom`, `datenaiss`, `datedeces`, `bibliographie`) VALUES
(1, 'Zola', 'Émile', NULL, NULL, ''),
(2, 'Verne', 'Jules', NULL, NULL, ''),
(3, 'Hugo', 'Victor', NULL, NULL, ''),
(4, 'de Saint Exupéry', 'Antoine', NULL, NULL, ''),
(5, 'Corneille', '', NULL, NULL, ''),
(6, 'Ionesco', 'Eugène', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

DROP TABLE IF EXISTS `editeurs`;
CREATE TABLE IF NOT EXISTS `editeurs` (
  `idediteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` char(14) COLLATE utf8_unicode_ci NOT NULL,
  `fax` char(14) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idediteur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `editeurs`
--

TRUNCATE TABLE `editeurs`;
--
-- Contenu de la table `editeurs`
--

INSERT INTO `editeurs` (`idediteur`, `nom`, `adresse`, `code`, `ville`, `pays`, `telephone`, `fax`) VALUES
(1, 'Gallimard', '', '', '', '', '', ''),
(2, 'Flammarion', '', '', '', '', '', ''),
(3, 'Hachette', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `emprunteurs`
--

DROP TABLE IF EXISTS `emprunteurs`;
CREATE TABLE IF NOT EXISTS `emprunteurs` (
  `idemprunteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` char(14) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `datenaiss` date DEFAULT NULL,
  `nbretards` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idemprunteur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `emprunteurs`
--

TRUNCATE TABLE `emprunteurs`;
--
-- Contenu de la table `emprunteurs`
--

INSERT INTO `emprunteurs` (`idemprunteur`, `nom`, `prenom`, `adresse`, `code`, `ville`, `telephone`, `sexe`, `datenaiss`, `nbretards`) VALUES
(1, 'Martin', 'Jean', '', '', '', '', '', NULL, 0),
(2, 'Duval', 'Marie', '', '', '', '', '', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

DROP TABLE IF EXISTS `emprunts`;
CREATE TABLE IF NOT EXISTS `emprunts` (
  `idemprunt` int(11) NOT NULL AUTO_INCREMENT,
  `idlivre` int(11) NOT NULL,
  `idemprunteur` int(11) NOT NULL,
  `datepret` date DEFAULT NULL,
  `daterendu` date DEFAULT NULL,
  PRIMARY KEY (`idemprunt`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `emprunts`
--

TRUNCATE TABLE `emprunts`;
--
-- Contenu de la table `emprunts`
--

INSERT INTO `emprunts` (`idemprunt`, `idlivre`, `idemprunteur`, `datepret`, `daterendu`) VALUES
(1, 6, 1, '2019-12-17', NULL),
(2, 5, 2, '2019-10-15', NULL),
(3, 4, 2, '2019-10-22', '2019-12-09'),
(4, 1, 1, '2019-09-27', NULL),
(5, 3, 2, '2019-09-15', '2019-10-20');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

DROP TABLE IF EXISTS `livres`;
CREATE TABLE IF NOT EXISTS `livres` (
  `idlivre` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `titre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nbpages` int(11) DEFAULT NULL,
  `dateparu` date DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `idediteur` int(11) NOT NULL,
  `idauteur` int(11) NOT NULL,
  `theme` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idlivre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `livres`
--

TRUNCATE TABLE `livres`;
--
-- Contenu de la table `livres`
--

INSERT INTO `livres` (`idlivre`, `isbn`, `titre`, `nbpages`, `dateparu`, `prix`, `idediteur`, `idauteur`, `theme`, `format`) VALUES
(1, '', 'Germinal', NULL, NULL, NULL, 1, 1, '', ''),
(2, '', 'Le Cid', NULL, NULL, NULL, 1, 5, '', ''),
(3, '', 'Rhinocéros', NULL, NULL, NULL, 3, 6, '', ''),
(4, '', '20000 lieues sous les mers', NULL, NULL, NULL, 2, 2, '', ''),
(5, '', 'Les Misérables', NULL, NULL, NULL, 3, 3, '', ''),
(6, '', 'Le Petit Prince', NULL, NULL, NULL, 3, 4, '', ''),
(7, '', 'Thérèse Raquin', NULL, NULL, NULL, 3, 1, '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
