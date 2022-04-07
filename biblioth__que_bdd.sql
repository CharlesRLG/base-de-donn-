-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 07 avr. 2022 à 11:44
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliothèque_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `ID_Auteur` int(11) NOT NULL,
  `Nom_auteur` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prenom_Auteur` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`ID_Auteur`, `Nom_auteur`, `Prenom_Auteur`) VALUES
(1, 'Bernard', 'Jojo'),
(2, 'Dufour', 'Tata'),
(3, 'Ouistiti', 'Titi'),
(4, 'jacqueline', 'Bernadette');

-- --------------------------------------------------------

--
-- Structure de la table `classifier`
--

CREATE TABLE `classifier` (
  `ID_Genre` int(11) NOT NULL,
  `Code_ISBN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE `emprunter` (
  `Date_emprunt` date NOT NULL,
  `Date_retour` date NOT NULL,
  `Code_ISBN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_Emprunteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emprunteur`
--

CREATE TABLE `emprunteur` (
  `ID_Emprunteur` int(11) NOT NULL,
  `Nom_emprunteur` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prenom_emprunteur` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Numéro_téléphonne` int(11) NOT NULL,
  `Emprunteur_actif` tinyint(1) NOT NULL DEFAULT 0,
  `Utilisateur_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `emprunteur`
--

INSERT INTO `emprunteur` (`ID_Emprunteur`, `Nom_emprunteur`, `Prenom_emprunteur`, `Numéro_téléphonne`, `Emprunteur_actif`, `Utilisateur_ID`) VALUES
(1, 'ipsum', 'Jojo', 1111222233, 0, 2),
(2, 'ipsum', 'Tata', 1548359846, 1, 3),
(3, 'Ipsum', 'Tutu', 549685413, 1, 4),
(4, 'ipsum', 'Jaja', 15493526, 0, 5),
(5, 'ipsum', 'Jano', 1238549213, 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `ID_Genre` int(11) NOT NULL,
  `Genre_livre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`ID_Genre`, `Genre_livre`, `Description_genre`) VALUES
(1, 'Enfant', 'Livres pour enfants'),
(2, 'Cuisine', 'Tout sur la cuisine'),
(3, 'Nature/Animaux', 'Toute sur la nature et les animaux'),
(4, 'Politique', 'La politique ...');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `Code_ISBN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Titre_livre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_Auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`Code_ISBN`, `Titre_livre`, `ID_Auteur`) VALUES
('25473X22', 'Toto mange des légumes', 1),
('4353', 'Les 200 recettes au four', 2),
('54353X14', 'Toto fait des crêpes', 1),
('68432', 'Blabla - Tout sur la parole', 4),
('75772', 'Tout sur les animaux', 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID_Utilisateur` int(11) NOT NULL,
  `Rôles` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MotDePasse` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_Utilisateur`, `Rôles`, `Email`, `MotDePasse`) VALUES
(1, 'Admin', 'blabla@bibliotheque.com', '123'),
(2, 'client', 'client@laposte.net', '123'),
(3, 'client', 'client2@gmail.com', '123'),
(4, 'client', 'client3@yahoo.fr', '456'),
(5, 'client', 'client4@gmail.net', '456'),
(6, 'client', 'client5@laposte.fr', '456');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`ID_Auteur`);

--
-- Index pour la table `classifier`
--
ALTER TABLE `classifier`
  ADD UNIQUE KEY `Code_ISBN` (`Code_ISBN`),
  ADD UNIQUE KEY `ID_Genre` (`ID_Genre`);

--
-- Index pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD UNIQUE KEY `Code_ISBN` (`Code_ISBN`),
  ADD KEY `ID_Emprunteur` (`ID_Emprunteur`);

--
-- Index pour la table `emprunteur`
--
ALTER TABLE `emprunteur`
  ADD PRIMARY KEY (`ID_Emprunteur`),
  ADD KEY `Utilisateur_ID` (`Utilisateur_ID`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID_Genre`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`Code_ISBN`),
  ADD KEY `ID_Auteur` (`ID_Auteur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID_Utilisateur`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `ID_Auteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `emprunteur`
--
ALTER TABLE `emprunteur`
  MODIFY `ID_Emprunteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `ID_Genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID_Utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classifier`
--
ALTER TABLE `classifier`
  ADD CONSTRAINT `classifier_ibfk_1` FOREIGN KEY (`Code_ISBN`) REFERENCES `livre` (`Code_ISBN`),
  ADD CONSTRAINT `classifier_ibfk_2` FOREIGN KEY (`ID_Genre`) REFERENCES `genre` (`ID_Genre`);

--
-- Contraintes pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD CONSTRAINT `emprunter_ibfk_1` FOREIGN KEY (`Code_ISBN`) REFERENCES `livre` (`Code_ISBN`),
  ADD CONSTRAINT `emprunter_ibfk_2` FOREIGN KEY (`ID_Emprunteur`) REFERENCES `emprunteur` (`ID_Emprunteur`);

--
-- Contraintes pour la table `emprunteur`
--
ALTER TABLE `emprunteur`
  ADD CONSTRAINT `emprunteur_ibfk_1` FOREIGN KEY (`Utilisateur_ID`) REFERENCES `utilisateur` (`ID_Utilisateur`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`ID_Auteur`) REFERENCES `auteur` (`ID_Auteur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
