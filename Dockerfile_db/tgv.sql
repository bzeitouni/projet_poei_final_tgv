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

--    - name: mysql-config-volume ## volume name
      configMap:
        name: mysql-config ## name of ConfigMap
-- Base de données : `tgv`
--


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
  `heuredepart` datetime DEFAULT NULL,
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


-- AJOUT D'ENREGISTREMENTS

-- Creation des Villes

INSERT INTO `Ville` (`codepost`, `nomville`) VALUES ('75000', 'PARIS'), ('69000', 'LYON'),('13000', 'MARSEILLE');

-- Creation des Gares

INSERT INTO `Gare` (`idgare`, `nomgare`, `codepost`) VALUES ('691', 'Part-Dieu', '69000'), ('692', 'Perrache', '69000'), ('751', 'Gare du Nord', '75000'), ('752', 'Gare de Lyon', '75000'), ('753', 'Gare de l\'Est', '75000'), ('754', 'Gare Montparnasse', '75000'), ('131', 'Gare Saint-Charles', '13000');

-- Creation des Trains TGV

INSERT INTO `TGV` (`idtrain`, `idgaredepart`, `idgarearrivee`, `heuredepart`, `heurearrivee`) VALUES ('9881', '752', '131', '2020-01-21 11:00:00', '2020-01-21 14:00:00'), ('9882', '752', '692', '2020-01-22 20:00:00', '2020-01-22 22:00:00'), ('9883', '691', '131', '2020-01-23 09:00:00', '2020-01-23 10:00:00'), ('9884', '692', '753', '2020-02-28 16:00:00', '2020-02-28 19:00:00');
