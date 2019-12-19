-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 15 jan. 2019 à 09:58
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gserv`
--
CREATE DATABASE IF NOT EXISTS `gserv` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `gserv`;

-- --------------------------------------------------------

--
-- Structure de la table `t_etablissement_eta`
--

DROP TABLE IF EXISTS `t_etablissement_eta`;
CREATE TABLE IF NOT EXISTS `t_etablissement_eta` (
  `ETA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ETA_LIBELLE` varchar(50) DEFAULT NULL,
  `ETA_NBPLACE` int(11) DEFAULT NULL,
  `ETA_ADRESSE1` varchar(40) DEFAULT NULL,
  `ETA_ADRESSE2` varchar(40) DEFAULT NULL,
  `ETA_ADRESSE3` varchar(40) DEFAULT NULL,
  `ETA_CP` char(5) DEFAULT NULL,
  `ETA_VILLE` varchar(40) DEFAULT NULL,
  `ETA_TEL` char(14) DEFAULT NULL,
  `ETA_FAX` char(14) DEFAULT NULL,
  `PER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ETA_ID`),
  KEY `FKETA_ETA_PER_ID` (`PER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `t_etablissement_eta`
--

INSERT INTO `t_etablissement_eta` (`ETA_ID`, `ETA_LIBELLE`, `ETA_NBPLACE`, `ETA_ADRESSE1`, `ETA_ADRESSE2`, `ETA_ADRESSE3`, `ETA_CP`, `ETA_VILLE`, `ETA_TEL`, `ETA_FAX`, `PER_ID`) VALUES
(1, 'Hôpital Charles-Nicolle', 1270, '1 rue de Germont', NULL, NULL, '76038', 'Rouen Cedex', '02 32 88 89 90', '02 35 08 81 83', 1),
(2, 'Hôpital de Bois-Guillaume', 579, '157 Av Du Marechal Juin', 'BP 100', NULL, '76230', 'Bois-Guillaume', '02 32 88 90 54', '02 35 08 83 05', 12);

-- --------------------------------------------------------

--
-- Structure de la table `t_personne_per`
--

DROP TABLE IF EXISTS `t_personne_per`;
CREATE TABLE IF NOT EXISTS `t_personne_per` (
  `PER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PER_NOM` varchar(40) NOT NULL,
  `PER_PRENOM` varchar(40) DEFAULT NULL,
  `TIT_ID` int(11) DEFAULT NULL,
  `PER_EMAIL` varchar(40) DEFAULT NULL,
  `SPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PER_ID`),
  KEY `FKPER_TIT_ID` (`TIT_ID`),
  KEY `FKPER_PER_SPE_ID` (`SPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `t_personne_per`
--

INSERT INTO `t_personne_per` (`PER_ID`, `PER_NOM`, `PER_PRENOM`, `TIT_ID`, `PER_EMAIL`, `SPE_ID`) VALUES
(1, 'MILEZ', 'Jean Pierre', 1, NULL, 1),
(2, 'AUQUOIT', 'Isabelle', 2, NULL, NULL),
(3, 'PIERRET', 'Elsa', 2, NULL, NULL),
(4, 'BECKARI', 'Robert', 1, NULL, NULL),
(5, 'BEQUIN', 'Dorothée', 2, NULL, NULL),
(6, 'SABOURD', 'Jean Christophe', 1, NULL, NULL),
(7, 'BACHE', 'Marc', 1, NULL, 2),
(8, 'AMARD', 'Ali', 4, NULL, NULL),
(9, 'ZUIT', 'Agnès', 2, NULL, NULL),
(10, 'THOMAS', 'Marion', 3, NULL, NULL),
(11, 'LERE', 'Pierre', 4, NULL, NULL),
(12, 'BLANC', 'Isabelle', 3, NULL, 3),
(13, 'THUR', 'Sophie', 3, NULL, NULL),
(14, 'BOND', 'Emmanuelle', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_rattacher_rat`
--

DROP TABLE IF EXISTS `t_rattacher_rat`;
CREATE TABLE IF NOT EXISTS `t_rattacher_rat` (
  `ROL_ID` int(11) NOT NULL,
  `PER_ID` int(11) NOT NULL,
  `SRV_ID` int(11) NOT NULL,
  PRIMARY KEY (`ROL_ID`,`PER_ID`,`SRV_ID`),
  KEY `FKRAT_PER_ID` (`PER_ID`),
  KEY `FKRAT_SRV_ID` (`SRV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `t_rattacher_rat`
--

INSERT INTO `t_rattacher_rat` (`ROL_ID`, `PER_ID`, `SRV_ID`) VALUES
(1, 1, 1),
(3, 2, 1),
(3, 3, 1),
(3, 4, 1),
(4, 5, 1),
(1, 6, 2),
(1, 7, 26),
(3, 7, 3),
(3, 8, 26),
(3, 9, 26),
(4, 10, 26),
(4, 11, 26),
(1, 12, 27),
(3, 12, 27),
(4, 13, 27),
(6, 14, 27);

-- --------------------------------------------------------

--
-- Structure de la table `t_role_rol`
--

DROP TABLE IF EXISTS `t_role_rol`;
CREATE TABLE IF NOT EXISTS `t_role_rol` (
  `ROL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROL_LIBELLE` varchar(50) NOT NULL,
  `ROL_ORDRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ROL_ID`),
  UNIQUE KEY `ROL_LIBELLE` (`ROL_LIBELLE`),
  UNIQUE KEY `ROL_ORDRE` (`ROL_ORDRE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `t_role_rol`
--

INSERT INTO `t_role_rol` (`ROL_ID`, `ROL_LIBELLE`, `ROL_ORDRE`) VALUES
(1, 'Chef de Service', 1),
(2, 'Secrétariats', 2),
(3, 'Praticiens Hospitaliers', 3),
(4, 'Assistants des Hôpitaux', 4),
(5, 'Médecins Attachés', 5),
(6, 'Praticiens Attachés', 6);

-- --------------------------------------------------------

--
-- Structure de la table `t_service_srv`
--

DROP TABLE IF EXISTS `t_service_srv`;
CREATE TABLE IF NOT EXISTS `t_service_srv` (
  `SRV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SRV_LIBELLE` varchar(50) NOT NULL,
  `SRV_ADRESSE1` varchar(40) DEFAULT NULL,
  `SRV_ADRESSE2` varchar(40) DEFAULT NULL,
  `SRV_ADRESSE3` varchar(40) DEFAULT NULL,
  `SRV_CP` char(5) DEFAULT '76031',
  `SRV_VILLE` varchar(40) DEFAULT 'ROUEN Cedex',
  `SRV_TEL` char(14) DEFAULT NULL,
  `SRV_EMAIL` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SRV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `t_service_srv`
--

INSERT INTO `t_service_srv` (`SRV_ID`, `SRV_LIBELLE`, `SRV_ADRESSE1`, `SRV_ADRESSE2`, `SRV_ADRESSE3`, `SRV_CP`, `SRV_VILLE`, `SRV_TEL`, `SRV_EMAIL`) VALUES
(1, 'Alcoologie', 'Pavillon de la Colombière', 'CHU BOIS-GUILLAUME', NULL, '76031', 'ROUEN Cedex', NULL, NULL),
(2, 'Anatomie Cytologie Pathologiques', 'Pavillon Jacques Delarue', 'CHU CH.NICOLLE', NULL, '76031', 'ROUEN Cedex', '02.32.89.54.56', NULL),
(3, 'Biochimie Médicale', 'CHU CH NICOLLE', NULL, NULL, '76031', 'ROUEN Cedex', '02.32.88.81.19', 'Secretariat.biochimie@chu-rouen76.fr'),
(4, 'Cardiologie', '3ème étage', 'Pavillon Derocque', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', NULL, 'cardiologue@chu-rouen76'),
(5, 'Chirurgie Infantile', '1 2 et 3ème étages', 'Pavillon de Pédiatrie', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.89.82.63', 'pediatrique@chu-rouen76.fr'),
(6, 'Dermatologie', 'Porte 12', 'Anciens Batiments', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.89.56.45', NULL),
(8, 'Epidémiologie', 'Pavillon Pillore', 'CHU CH.NICOLLE', NULL, '76031', 'ROUEN Cedex', NULL, NULL),
(9, 'Génétique', 'Rez de Jardin', 'Anneau Central', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.85.54.21', 'genetique@chu-rouen76.fr'),
(10, 'Gériatrie Aiguë St Julien', 'Pavillon C. Claudel', 'CHU ROUEN ST JULIEN', NULL, '76031', 'ROUEN Cedex', NULL, 'Geriatrie.Aigue@chu-rouen76.fr'),
(11, 'Gynécologie et Obstétrique', '1 et 2ème étages', 'Pavillon Mère et Enfant', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.85.45.47', 'Gynecologie.Obstetrique@chu-rouen76.fr'),
(12, 'Hépato Gastro Entérologie', '1er étage', 'Pavillon Derocque', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.56.84.75', NULL),
(13, 'Imagerie Médicale Bois Guillaume', 'Rez de Chaussée', 'Pavillon de l\'Argilière', 'CHU BOIS-GUILLAUME', '76031', 'ROUEN Cedex', '02.32.54.87.99', 'Imagerie-BG@chu-rouen76.fr'),
(14, 'Imagerie Pédiatrique', 'Rez de Jardin', 'Pavillon de Pédiatrie', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', NULL, NULL),
(15, 'Immuno Hématologie Oncologie Pédiatrique', '4ème étage', 'Pavillon de Pédiatrie', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.56.55.88', NULL),
(16, 'Laboratoire St Julien', 'Batiment C. MONET', 'CHU ROUEN ST JULIEN', NULL, '76031', 'ROUEN Cedex', '02.32.55.45.45', 'BiologieSJ@chu-rouen76.fr'),
(17, 'Maison de Retraite Boucicaut', 'Arcadie et Bethel', 'CHU MR BOUCICAUT', NULL, '76031', 'ROUEN Cedex', '02.32.55.21.21', NULL),
(18, 'Médecine du Travail', 'Pavillon de l\'Aubette', 'CHU CH.NICOLLE', NULL, '76031', 'ROUEN Cedex', '02.32.45.56.57', 'Med.Travail@chu-rouen76.fr'),
(19, 'Neurochirurgie', '6ème étage', 'Pavillon Félix Dévé', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.54.51.12', 'Neurochirurgie@chu-rouen76.fr'),
(20, 'Neurologie', '5ème étage', 'Pavillon Félix Dévé', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.54.51.14', 'Neurologie@chu-rouen76.fr'),
(21, 'Ophtalmologie', 'Rez de Chaussée', 'Pavillon Félix Dévé', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.54.51.00', 'Ophtalmologie@chu-rouen76.fr'),
(22, 'Pédiatrie Médicale', 'Pavillon de Pédiatrie', 'CHU CH.NICOLLE', NULL, '76031', 'ROUEN Cedex', '02.32.54.52.00', 'Pediatrie@chu-rouen76.fr'),
(23, 'Psychiatrie', 'Cour Leschevin - Porte 20', 'Anciens Batiments', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.52.51.51', NULL),
(24, 'Réanimation Médicale', 'RDC Aile Est', 'Pavillon Félix Dévé', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.52.51.55', NULL),
(25, 'Tabacologie', 'Rez de Chaussée', 'Anneau Central', 'CHU CH.NICOLLE', '76031', 'ROUEN Cedex', '02.32.52.51.50', NULL),
(26, 'Chirurgie Générale et digestive', '1er étage', 'Pavillon Derocque', 'CHU CH NICOLLE', '76031', 'ROUEN Cedex', '02 35 88 81 61', 'digestive@chu-rouen76.fr'),
(27, 'Médecine légale', 'Pavillon Jacques Delarue', 'CHU CH NICOLLE', NULL, '76031', 'ROUEN Cedex', '02 35 80 80 60', ' legale@chu-rouen76.fr');

-- --------------------------------------------------------

--
-- Structure de la table `t_specialite_spe`
--

DROP TABLE IF EXISTS `t_specialite_spe`;
CREATE TABLE IF NOT EXISTS `t_specialite_spe` (
  `SPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SPE_LIBELLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `t_specialite_spe`
--

INSERT INTO `t_specialite_spe` (`SPE_ID`, `SPE_LIBELLE`) VALUES
(1, 'TOXICOMANIE ET ALCOOLOGIE'),
(2, 'ANESTHESIOLOGIE-REANIMATION CHIRURGICALE'),
(3, 'GENETIQUE MEDICALE');

-- --------------------------------------------------------

--
-- Structure de la table `t_titre_tit`
--

DROP TABLE IF EXISTS `t_titre_tit`;
CREATE TABLE IF NOT EXISTS `t_titre_tit` (
  `TIT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIT_LIBELLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TIT_ID`),
  UNIQUE KEY `TIT_LIBELLE` (`TIT_LIBELLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `t_titre_tit`
--

INSERT INTO `t_titre_tit` (`TIT_ID`, `TIT_LIBELLE`) VALUES
(3, 'Madame le Docteur'),
(2, 'Madame le Professeur'),
(4, 'Monsieur le Docteur'),
(1, 'Monsieur le Professeur');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_etablissement_eta`
--
ALTER TABLE `t_etablissement_eta`
  ADD CONSTRAINT `FKETA_ETA_PER_ID` FOREIGN KEY (`PER_ID`) REFERENCES `t_personne_per` (`PER_ID`);

--
-- Contraintes pour la table `t_personne_per`
--
ALTER TABLE `t_personne_per`
  ADD CONSTRAINT `FKPER_PER_SPE_ID` FOREIGN KEY (`SPE_ID`) REFERENCES `t_specialite_spe` (`SPE_ID`),
  ADD CONSTRAINT `FKPER_TIT_ID` FOREIGN KEY (`TIT_ID`) REFERENCES `t_titre_tit` (`TIT_ID`);

--
-- Contraintes pour la table `t_rattacher_rat`
--
ALTER TABLE `t_rattacher_rat`
  ADD CONSTRAINT `FKRAT_PER_ID` FOREIGN KEY (`PER_ID`) REFERENCES `t_personne_per` (`PER_ID`),
  ADD CONSTRAINT `FKRAT_ROL_ID` FOREIGN KEY (`ROL_ID`) REFERENCES `t_role_rol` (`ROL_ID`),
  ADD CONSTRAINT `FKRAT_SRV_ID` FOREIGN KEY (`SRV_ID`) REFERENCES `t_service_srv` (`SRV_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
