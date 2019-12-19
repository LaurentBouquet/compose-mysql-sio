-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 17 Décembre 2019 à 14:41
-- Version du serveur :  5.7.11
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `festival`
--
DROP DATABASE IF EXISTS festival ;
CREATE DATABASE `festival` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `festival`;

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
CREATE TABLE `artiste` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `artiste`
--

INSERT INTO `artiste` (`id`, `nom`) VALUES
(1, 'Céline Dion'),
(2, 'A Star is Born'),
(3, 'Garou'),
(4, 'Images'),
(5, 'Frozen'),
(6, 'Gilbert Montagné'),
(7, 'Angèle'),
(8, 'Queen'),
(9, 'Céline Dion'),
(10, 'Johnny Hallyday'),
(11, 'Manau'),
(12, 'Johnny Hallyday'),
(13, 'Patrick Bruel'),
(14, 'Renaud'),
(15, 'Diam\'s'),
(16, 'Andrea Bocelli'),
(17, 'Louise Attaque'),
(18, 'Joe Dassin'),
(19, 'Charles Aznavour'),
(20, 'Renaud'),
(21, 'Johnny Hallyday'),
(22, 'Claude François'),
(23, 'Jean-Jacques Goldman'),
(24, 'Axelle Red'),
(25, 'K. Maro'),
(26, 'Khaled'),
(27, 'Cookie Dingler'),
(28, 'Patricia Kaas'),
(29, 'Gims'),
(30, 'Jean-Jacques');

-- --------------------------------------------------------

--
-- Structure de la table `morceau`
--

DROP TABLE IF EXISTS `morceau`;
CREATE TABLE `morceau` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fk_artiste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `morceau`
--

INSERT INTO `morceau` (`id`, `titre`, `fk_artiste`) VALUES
(1, 'J\'irai où tu iras', 1),
(2, 'Shallow', 2),
(3, 'Sous le vent', 3),
(4, 'Les démons de minuit', 4),
(5, 'Libérée, délivrée', 5),
(6, 'On va s\'aimer', 6),
(7, 'Balance ton quoi', 7),
(8, 'Bohemian Rhapsody', 8),
(9, 'Pour que tu m\'aimes encore', 9),
(10, 'Allumer le feu', 10),
(11, 'La tribu de Dana', 11),
(12, 'Je te promets', 12),
(13, 'Place des grands hommes', 13),
(14, 'Manhattan-Kaboul', 14),
(15, 'Confessions nocturnes', 15),
(16, 'Vivo per lei', 16),
(17, 'J\'t\'emmène au vent', 17),
(18, 'Les Champs-Élysées', 18),
(19, 'Emmenez-moi', 19),
(20, 'Mistral gagnant', 20),
(21, 'L\'envie', 21),
(22, 'Alexandrie Alexandra', 22),
(23, 'Je te donne', 23),
(24, 'Sensualité', 24),
(25, 'Femme Like U', 25),
(26, 'Aïcha', 26),
(27, 'Femme libérée', 27),
(28, 'Mon mec à moi', 28),
(29, 'Sapés comme jamais', 29),
(30, 'Quand la musique est bonne', 30);

-- --------------------------------------------------------

--
-- Structure de la table `programmation`
--

DROP TABLE IF EXISTS `programmation`;
CREATE TABLE `programmation` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_salle` int(11) NOT NULL,
  `fk_morceau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `programmation`
--

INSERT INTO `programmation` (`id`, `date`, `fk_salle`, `fk_morceau`) VALUES
(1, '2020-01-25', 1, 1),
(2, '2020-01-25', 2, 2),
(3, '2020-01-25', 1, 3),
(4, '2020-01-25', 1, 4),
(5, '2020-01-25', 2, 5),
(6, '2020-01-25', 1, 6),
(7, '2020-01-25', 1, 7),
(8, '2020-01-25', 1, 8),
(9, '2020-01-25', 1, 9),
(10, '2020-01-25', 2, 10),
(11, '2020-01-25', 1, 11),
(12, '2020-01-25', 1, 20),
(13, '2020-01-25', 2, 21),
(14, '2020-01-25', 2, 22),
(15, '2020-01-25', 1, 23),
(16, '2020-01-25', 1, 24),
(17, '2020-01-25', 1, 25),
(18, '2020-01-25', 1, 26),
(19, '2020-01-25', 1, 27),
(20, '2020-01-25', 1, 28),
(21, '2020-01-25', 1, 29),
(22, '2020-01-25', 2, 30),
(23, '2020-08-15', 1, 1),
(24, '2020-08-15', 2, 6),
(25, '2020-08-15', 1, 7),
(26, '2020-08-15', 1, 8),
(27, '2020-08-15', 1, 9),
(28, '2020-08-15', 1, 10),
(29, '2020-08-15', 1, 11),
(30, '2020-08-15', 1, 12),
(31, '2020-08-15', 1, 13),
(32, '2020-08-15', 1, 14),
(33, '2020-08-15', 1, 15),
(34, '2020-08-15', 1, 16),
(35, '2020-08-15', 1, 17),
(36, '2020-08-15', 1, 18),
(37, '2020-08-15', 1, 19),
(38, '2020-08-15', 1, 20),
(39, '2020-08-15', 1, 21),
(40, '2020-08-15', 1, 22),
(41, '2020-08-15', 3, 23),
(42, '2020-08-15', 3, 27),
(43, '2020-08-15', 3, 28),
(44, '2020-08-15', 3, 29),
(45, '2020-08-15', 3, 30),
(46, '2020-07-14', 3, 1),
(47, '2020-07-14', 3, 4),
(48, '2020-07-14', 3, 5),
(49, '2020-07-14', 3, 6),
(50, '2020-07-14', 3, 7),
(51, '2020-07-14', 3, 8),
(52, '2020-07-14', 3, 10),
(53, '2020-07-14', 3, 11),
(54, '2020-07-14', 3, 12),
(55, '2020-07-14', 3, 13),
(56, '2020-07-14', 3, 14),
(57, '2020-07-14', 3, 15),
(58, '2020-07-14', 3, 16),
(59, '2020-07-14', 3, 17),
(60, '2020-07-14', 3, 18),
(61, '2020-07-14', 3, 19),
(62, '2020-07-14', 3, 20);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE `salle` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lieu` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`id`, `nom`, `lieu`) VALUES
(1, 'Palais des congrès', 'Paris'),
(2, 'Salle de la Chaussonnière', 'Avranches'),
(3, 'Zénith de Caen', 'Caen');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `morceau`
--
ALTER TABLE `morceau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_musicien` (`fk_artiste`);

--
-- Index pour la table `programmation`
--
ALTER TABLE `programmation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_salle` (`fk_salle`),
  ADD KEY `fk_morceau` (`fk_morceau`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `artiste`
--
ALTER TABLE `artiste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `morceau`
--
ALTER TABLE `morceau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `programmation`
--
ALTER TABLE `programmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `morceau`
--
ALTER TABLE `morceau`
  ADD CONSTRAINT `morceau_ibfk_1` FOREIGN KEY (`fk_artiste`) REFERENCES `artiste` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `programmation`
--
ALTER TABLE `programmation`
  ADD CONSTRAINT `programmation_ibfk_1` FOREIGN KEY (`fk_salle`) REFERENCES `salle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `programmation_ibfk_2` FOREIGN KEY (`fk_morceau`) REFERENCES `morceau` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
