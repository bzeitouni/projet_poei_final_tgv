-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mar. 21 jan. 2020 à 09:37
-- Version du serveur :  8.0.19
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tgv`
--

CREATE DATABASE tgv;

USE tgv;

-- --------------------------------------------------------

--
-- Structure de la table `Gare`
--

CREATE TABLE `Gare` (
  `idgare` int NOT NULL,
  `nomgare` varchar(100) DEFAULT NULL,
  `codepost` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `TGV`
--

CREATE TABLE `TGV` (
  `idtrain` int NOT NULL,
  `idgaredepart` int DEFAULT NULL,
  `idgarearrivee` int DEFAULT NULL,
  `heuredepart` varchar(100) DEFAULT NULL,
  `heurearrivee` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Ville`
--

CREATE TABLE `Ville` (
  `codepost` int NOT NULL,
  `nomville` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Gare`
--
ALTER TABLE `Gare`
  ADD PRIMARY KEY (`idgare`),
  ADD KEY `codepost` (`codepost`);

--
-- Index pour la table `TGV`
--
ALTER TABLE `TGV`
  ADD PRIMARY KEY (`idtrain`),
  ADD KEY `idgaredepart` (`idgaredepart`),
  ADD KEY `idgarearrivee` (`idgarearrivee`);

--
-- Index pour la table `Ville`
--
ALTER TABLE `Ville`
  ADD PRIMARY KEY (`codepost`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Gare`
--
ALTER TABLE `Gare`
  ADD CONSTRAINT `Gare_ibfk_1` FOREIGN KEY (`codepost`) REFERENCES `Ville` (`codepost`);

--
-- Contraintes pour la table `TGV`
--
ALTER TABLE `TGV`
  ADD CONSTRAINT `TGV_ibfk_1` FOREIGN KEY (`idgaredepart`) REFERENCES `Gare` (`idgare`),
  ADD CONSTRAINT `TGV_ibfk_2` FOREIGN KEY (`idgarearrivee`) REFERENCES `Gare` (`idgare`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
