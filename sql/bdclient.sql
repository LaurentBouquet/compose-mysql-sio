-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 18 Décembre 2019 à 15:07
-- Version du serveur :  5.7.11
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdclient`
--
CREATE DATABASE IF NOT EXISTS `bdclient` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bdclient`;

-- --------------------------------------------------------

--
-- Structure de la table `t_client`
--

DROP TABLE IF EXISTS `t_client`;
CREATE TABLE `t_client` (
  `CLI_ID` int(11) NOT NULL,
  `CLI_Nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLI_Prenom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VILLE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `t_ville`
--

DROP TABLE IF EXISTS `t_ville`;
CREATE TABLE `t_ville` (
  `VILLE_ID` int(11) NOT NULL,
  `VILLE_Nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `t_ville`
--

INSERT INTO `t_ville` (`VILLE_ID`, `VILLE_Nom`) VALUES
(1, 'Paris');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_client`
--
ALTER TABLE `t_client`
  ADD PRIMARY KEY (`CLI_ID`),
  ADD KEY `VILLE_ID` (`VILLE_ID`);

--
-- Index pour la table `t_ville`
--
ALTER TABLE `t_ville`
  ADD PRIMARY KEY (`VILLE_ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_client`
--
ALTER TABLE `t_client`
  MODIFY `CLI_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_ville`
--
ALTER TABLE `t_ville`
  MODIFY `VILLE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_client`
--
ALTER TABLE `t_client`
  ADD CONSTRAINT `t_client_ibfk_1` FOREIGN KEY (`VILLE_ID`) REFERENCES `t_ville` (`VILLE_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
