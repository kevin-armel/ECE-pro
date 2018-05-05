-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 04 mai 2018 à 16:21
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.0.27

--
-- Base de données :  `ece-pro-database`
--

-- --------------------------------------------------------


/*==============================================================*/
/* Table: Commentaires                                          */
/*==============================================================*/
create table Commentaires 
(
   idCommentaire        int(11)                        not null,
   idPost               int(11)                        null,
   contenuCommentaire   varchar(254)                   null,
   dateCommentaire      datetime                        null,
   constraint PK_COMMENTAIRES primary key (idCommentaire)
);

/*==============================================================*/
/* Index: COMMENTAIRES_PK                                       */
/*==============================================================*/
create unique index COMMENTAIRES_PK on Commentaires (
idCommentaire ASC
);

--
-- Structure de la table `appartenir`
--

CREATE TABLE `appartenir` (
  `idGroupe` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emploi`
--

create table Emploi 
(
   idEmploi             int(11)                        not null,
   idUser               int(11)                        null,
   refecenceEmploi      varchar(254)                   null,
   lieuEmploi           varchar(254)                   null,
   intituleEmploi       varchar(254)                   null,
   mailEmploi           varchar(254)                   null,
   telEmploi            varchar(254)                   null,
   description          varchar(254)                   null,
   profilEmploi         varchar(254)                   null,
   dureeEmploi          varchar(254)                   null,
   remunerationEmploi   varchar(254)                   null,
   datePubEmploi        datetime               DEFAULT NULL,
   constraint PK_EMPLOI primary key (idEmploi)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
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

/*==============================================================*/
/* Table: Liker                                                 */
/*==============================================================*/
create table Liker 
(
   idLiker              int(11)                        not null,
   idPost               int(11)                        null,
   idEmploi             int(11)                        null,
   estLiker             tinyint(1)                     null,
   typeLiker            enum('POST','EMPLOI') NOT NULL,
   constraint PK_LIKER primary key (idLiker)
);

/*==============================================================*/
/* Index: LIKER_PK                                              */
/*==============================================================*/
create unique index LIKER_PK on Liker (
idLiker ASC
);

/*==============================================================*/
/* Index: ETRE1_FK                                              */
/*==============================================================*/
create index ETRE1_FK on Liker (
idPost ASC
);

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

/*==============================================================*/
/* Table: Notification                                          */
/*==============================================================*/
create table Notification 
(
   idNotification       int(11)                        not null,
   idPartager           int(11)                        null,
   idLiker              int(11)                        null,
   idMessage            int(11)                        null,
   typeNotification     enum('MESSAGE','POST','EMPLOI') NOT NULL,
   constraint PK_NOTIFICATION primary key (idNotification)
);

/*==============================================================*/
/* Index: NOTIFICATION_PK                                       */
/*==============================================================*/
create unique index NOTIFICATION_PK on Notification (
idNotification ASC
);

/*==============================================================*/
/* Index: DECLENCHER1_FK                                        */
/*==============================================================*/
create index DECLENCHER1_FK on Notification (
idPartager ASC
);

/*==============================================================*/
/* Index: DECLENCHER3_FK                                        */
/*==============================================================*/
create index DECLENCHER3_FK on Notification (
idMessage ASC
);

/*==============================================================*/
/* Index: DECLANCHER4_FK                                        */
/*==============================================================*/
create index DECLANCHER4_FK on Notification (
idLiker ASC
);
-- --------------------------------------------------------

/*==============================================================*/
/* Table: Partager                                              */
/*==============================================================*/
create table Partager 
(
   idPartager           int(11)                        not null,
   idEmploi             int(11)                        null,
   idPost               int(11)                        null,
   estPartager          tinyint(1)                       null,
   typePartager         enum('POST','EMPLOI') NOT NULL,
   constraint PK_PARTAGER primary key (idPartager)
);

/*==============================================================*/
/* Index: PARTAGER_PK                                           */
/*==============================================================*/
create unique index PARTAGER_PK on Partager (
idPartager ASC
);

/*==============================================================*/
/* Index: ETRE2_FK                                              */
/*==============================================================*/
create index ETRE2_FK on Partager (
idPost ASC
);


--
-- Structure de la table `post`
--

create table Post 
(
   idPost               int(11)                        not null,
   idUser               int(11)                        null,
   contenuPost          varchar(254)                   null,
   visibilitePost       tinyint(1)                     null,
   filePost             varchar(254)                   null,
   datePubPost          timestamp                      null,
   constraint PK_POST primary key (idPost)
);

/*==============================================================*/
/* Index: POST_PK                                               */
/*==============================================================*/
create unique index POST_PK on Post (
idPost ASC
);

/*==============================================================*/
/* Index: POSTER_FK                                             */
/*==============================================================*/
create index POSTER_FK on Post (
idUser ASC
);

-- --------------------------------------------------------

--
-- Structure de la table `reseau`
--

CREATE TABLE `reseau` (
	idUser               int(11)                        not null,
	idAmiReseau          int(11)                        not null,
   constraint PK_RESEAU primary key (idUser, idAmiReseau)
);

--
-- Déchargement des données de la table `reseau`
--



/*==============================================================*/
/* Index: AVOIR_FK                                              */
/*==============================================================*/
create index AVOIR_FK on Reseau (
idUser ASC
);

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
-- Déchargement des données de la table `utilisateur`
--

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
-- Index pour la table `messagerie`
--
ALTER TABLE `messagerie`
  ADD PRIMARY KEY (`idMessage`),
  ADD KEY `FK_MESSAGER_ENVOYER_UTILISAT` (`idUser`);

--
-- Index pour la table `notification`
--
alter table Notification
   add constraint FK_NOTIFICA_DECLANCHE_LIKER foreign key (idLiker)
      references Liker (idLiker)
      on update restrict
      on delete restrict;

alter table Notification
   add constraint FK_NOTIFICA_DECLENCHE_PARTAGER foreign key (idPartager)
      references Partager (idPartager)
      on update restrict
      on delete restrict;

alter table Notification
   add constraint FK_NOTIFICA_DECLENCHE_MESSAGER foreign key (idMessage)
      references Messagerie (idMessage)
      on update restrict
      on delete restrict;

alter table Partager
   add constraint FK_PARTAGER_ETRE2_POST foreign key (idPost)
      references Post (idPost)
      on update restrict
      on delete restrict;

alter table Partager
   add constraint FK_PARTAGER_ETRE3_EMPLOI foreign key (idEmploi)
      references Emploi (idEmploi)
      on update restrict
      on delete restrict;

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `emploi`
--


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
-- AUTO_INCREMENT pour la table `messagerie`
--

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `idNotification` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE Commentaires
  MODIFY idCommentaire int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reseau`
--


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
-- Contraintes pour la table `emploi`
--
ALTER TABLE `emploi`
  ADD CONSTRAINT `FK_EMPLOI_PUBLIER_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);


alter table Commentaires
   add constraint FK_COMMENTA_COMMENTER_POST foreign key (idPost)
      references Post (idPost)
      on update restrict
      on delete restrict;
  
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

alter table Liker
   add constraint FK_LIKER_ETRE1_POST foreign key (idPost)
      references Post (idPost)
      on update restrict
      on delete restrict;

alter table Liker
   add constraint FK_LIKER_ETRE4_EMPLOI foreign key (idEmploi)
      references Emploi (idEmploi)
      on update restrict
      on delete restrict;
  
--
-- Contraintes pour la table `messagerie`
--
ALTER TABLE `messagerie`
  ADD CONSTRAINT `FK_MESSAGER_ENVOYER_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `notification`
--

--
-- Contraintes pour la table `reseau`
--
ALTER TABLE `reseau`
  ADD CONSTRAINT `FK_RESEAU_AVOIR_UTILISAT` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);
COMMIT;
