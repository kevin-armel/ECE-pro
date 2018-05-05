-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 04 mai 2018 à 20:05
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ssss`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

CREATE TABLE `appartenir` (
  `idGroupe` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `idCommentaire` int(11) NOT NULL,
  `idPost` int(11) DEFAULT NULL,
  `contenuCommentaire` varchar(254) DEFAULT NULL,
  `dateCommentaire` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emploi`
--

CREATE TABLE `emploi` (
  `idEmploi` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `refecenceEmploi` varchar(254) DEFAULT NULL,
  `lieuEmploi` varchar(254) DEFAULT NULL,
  `intituleEmploi` varchar(254) DEFAULT NULL,
  `mailEmploi` varchar(254) DEFAULT NULL,
  `telEmploi` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `profilEmploi` varchar(254) DEFAULT NULL,
  `dureeEmploi` varchar(254) DEFAULT NULL,
  `remunerationEmploi` varchar(254) DEFAULT NULL,
  `datePubEmploi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `experience`
--

CREATE TABLE `experience` (
  `idExperience` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `entrepriseExperience` varchar(254) DEFAULT NULL,
  `lieuExperience` varchar(254) DEFAULT NULL,
  `datedExperience` date DEFAULT NULL,
  `datefExperience` date DEFAULT NULL,
  `descriptionExperience` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `idFormation` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `diplomeFormation` varchar(254) DEFAULT NULL,
  `domaineFormation` varchar(254) DEFAULT NULL,
  `extraFormation` varchar(254) DEFAULT NULL,
  `anneeFormation` year(4) DEFAULT NULL,
  `ecoleFormation` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `groupeuser`
--

CREATE TABLE `groupeuser` (
  `idGroupe` int(11) NOT NULL,
  `nomGroupe` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `imagealbum`
--

CREATE TABLE `imagealbum` (
  `idImage` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `album` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `liker`
--

CREATE TABLE `liker` (
  `idLiker` int(11) NOT NULL,
  `idPost` int(11) DEFAULT NULL,
  `idEmploi` int(11) DEFAULT NULL,
  `estLiker` tinyint(1) DEFAULT NULL,
  `typeLiker` enum('POST','EMPLOI') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `messagerie`
--

CREATE TABLE `messagerie` (
  `idMessage` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `fileMessage` blob,
  `destinataireMessage` varchar(254) DEFAULT NULL,
  `contenuMessage` varchar(254) DEFAULT NULL,
  `receptionMessage` tinyint(1) DEFAULT NULL,
  `dateEmessage` datetime DEFAULT NULL,
  `dateRmessage` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `idNotification` int(11) NOT NULL,
  `idPartager` int(11) DEFAULT NULL,
  `idLiker` int(11) DEFAULT NULL,
  `idMessage` int(11) DEFAULT NULL,
  `typeNotification` enum('MESSAGE','POST','EMPLOI') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `partager`
--

CREATE TABLE `partager` (
  `idPartager` int(11) NOT NULL,
  `idEmploi` int(11) DEFAULT NULL,
  `idPost` int(11) DEFAULT NULL,
  `estPartager` tinyint(1) DEFAULT NULL,
  `typePartager` enum('POST','EMPLOI') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `idPost` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `contenuPost` varchar(254) DEFAULT NULL,
  `visibilitePost` tinyint(1) DEFAULT NULL,
  `filePost` varchar(254) DEFAULT NULL,
  `datePubPost` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reseau`
--

CREATE TABLE `reseau` (
  `idUser` int(11) NOT NULL,
  `idAmiReseau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUser` int(11) NOT NULL,
  `nomUser` varchar(254) NOT NULL,
  `prenomUser` varchar(254) NOT NULL,
  `grade_user` varchar(255) DEFAULT NULL,
  `mailUser` varchar(254) NOT NULL,
  `competenceUser` varchar(254) DEFAULT NULL,
  `adresseUser` varchar(254) DEFAULT NULL,
  `roleUser` enum('ROLE_SUPER_ADMIN','ROLE_ADMIN') DEFAULT NULL,
  `mdpUser` varchar(254) NOT NULL,
  `avatarUser` longblob,
  `projetUser` varchar(254) DEFAULT NULL,
  `activerUser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD PRIMARY KEY (`idGroupe`,`idUser`),
  ADD KEY `FK_APPARTEN_APPARTENI_UTILISAT` (`idUser`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`idCommentaire`),
  ADD UNIQUE KEY `COMMENTAIRES_PK` (`idCommentaire`),
  ADD KEY `FK_COMMENTA_COMMENTER_POST` (`idPost`);

--
-- Index pour la table `emploi`
--
ALTER TABLE `emploi`
  ADD PRIMARY KEY (`idEmploi`),
  ADD KEY `FK_EMPLOI_PUBLIER_UTILISAT` (`idUser`);

--
-- Index pour la table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`idExperience`),
  ADD KEY `FK_EXPERIEN_POSSEDER_UTILISAT` (`idUser`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`idFormation`),
  ADD KEY `FK_FORMATIO_ACQUERIR_UTILISAT` (`idUser`);

--
-- Index pour la table `groupeuser`
--
ALTER TABLE `groupeuser`
  ADD PRIMARY KEY (`idGroupe`),
  ADD UNIQUE KEY `GROUPEUSER_PK` (`idGroupe`);

--
-- Index pour la table `imagealbum`
--
ALTER TABLE `imagealbum`
  ADD PRIMARY KEY (`idImage`),
  ADD KEY `FK_IMAGEALB_CONTENIR_UTILISAT` (`idUser`);

--
-- Index pour la table `liker`
--
ALTER TABLE `liker`
  ADD PRIMARY KEY (`idLiker`),
  ADD UNIQUE KEY `LIKER_PK` (`idLiker`),
  ADD KEY `ETRE1_FK` (`idPost`),
  ADD KEY `FK_LIKER_ETRE4_EMPLOI` (`idEmploi`);

--
-- Index pour la table `messagerie`
--
ALTER TABLE `messagerie`
  ADD PRIMARY KEY (`idMessage`),
  ADD KEY `FK_MESSAGER_ENVOYER_UTILISAT` (`idUser`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`idNotification`),
  ADD UNIQUE KEY `NOTIFICATION_PK` (`idNotification`),
  ADD KEY `DECLENCHER1_FK` (`idPartager`),
  ADD KEY `DECLENCHER3_FK` (`idMessage`),
  ADD KEY `DECLANCHER4_FK` (`idLiker`);

--
-- Index pour la table `partager`
--
ALTER TABLE `partager`
  ADD PRIMARY KEY (`idPartager`),
  ADD UNIQUE KEY `PARTAGER_PK` (`idPartager`),
  ADD KEY `ETRE2_FK` (`idPost`),
  ADD KEY `FK_PARTAGER_ETRE3_EMPLOI` (`idEmploi`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idPost`),
  ADD UNIQUE KEY `POST_PK` (`idPost`),
  ADD KEY `POSTER_FK` (`idUser`);

--
-- Index pour la table `reseau`
--
ALTER TABLE `reseau`
  ADD PRIMARY KEY (`idUser`,`idAmiReseau`),
  ADD KEY `AVOIR_FK` (`idUser`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `idCommentaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emploi`
--
ALTER TABLE `emploi`
  MODIFY `idEmploi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `experience`
--
ALTER TABLE `experience`
  MODIFY `idExperience` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `idFormation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupeuser`
--
ALTER TABLE `groupeuser`
  MODIFY `idGroupe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `imagealbum`
--
ALTER TABLE `imagealbum`
  MODIFY `idImage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `liker`
--
ALTER TABLE `liker`
  MODIFY `idLiker` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messagerie`
--
ALTER TABLE `messagerie`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `idNotification` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partager`
--
ALTER TABLE `partager`
  MODIFY `idPartager` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `FK_APPARTEN_APPARTENI_GROUPEUS` FOREIGN KEY (`idGroupe`) REFERENCES `groupeuser` (`idGroupe`),
  ADD CONSTRAINT `FK_APPARTEN_APPARTENI_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `FK_COMMENTA_COMMENTER_POST` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`);

--
-- Contraintes pour la table `emploi`
--
ALTER TABLE `emploi`
  ADD CONSTRAINT `FK_EMPLOI_PUBLIER_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `FK_EXPERIEN_POSSEDER_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_FORMATIO_ACQUERIR_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `imagealbum`
--
ALTER TABLE `imagealbum`
  ADD CONSTRAINT `FK_IMAGEALB_CONTENIR_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `liker`
--
ALTER TABLE `liker`
  ADD CONSTRAINT `FK_LIKER_ETRE1_POST` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`),
  ADD CONSTRAINT `FK_LIKER_ETRE4_EMPLOI` FOREIGN KEY (`idEmploi`) REFERENCES `emploi` (`idEmploi`);

--
-- Contraintes pour la table `messagerie`
--
ALTER TABLE `messagerie`
  ADD CONSTRAINT `FK_MESSAGER_ENVOYER_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FK_NOTIFICA_DECLANCHE_LIKER` FOREIGN KEY (`idLiker`) REFERENCES `liker` (`idLiker`),
  ADD CONSTRAINT `FK_NOTIFICA_DECLENCHE_MESSAGER` FOREIGN KEY (`idMessage`) REFERENCES `messagerie` (`idMessage`),
  ADD CONSTRAINT `FK_NOTIFICA_DECLENCHE_PARTAGER` FOREIGN KEY (`idPartager`) REFERENCES `partager` (`idPartager`);

--
-- Contraintes pour la table `partager`
--
ALTER TABLE `partager`
  ADD CONSTRAINT `FK_PARTAGER_ETRE2_POST` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`),
  ADD CONSTRAINT `FK_PARTAGER_ETRE3_EMPLOI` FOREIGN KEY (`idEmploi`) REFERENCES `emploi` (`idEmploi`);

--
-- Contraintes pour la table `reseau`
--
ALTER TABLE `reseau`
  ADD CONSTRAINT `FK_RESEAU_AVOIR_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
