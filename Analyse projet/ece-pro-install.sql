/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 11                       */
/* Created on:     02/05/2018 16:35:34                          */
/*==============================================================*/

/*==============================================================*/
/* Table: Emploi                                                */
/*==============================================================*/
create table Emploi 
(
   idEmploi             integer                        not null,
   idUser               integer                        null,
   refecenceEmploi      varchar(254)                   null,
   lieuEmploi           varchar(254)                   null,
   intituleEmploi       varchar(254)                   null,
   mailEmploi           varchar(254)                   null,
   telEmploi            varchar(254)                   null,
   description          varchar(254)                   null,
   profilEmploi         varchar(254)                   null,
   dureeEmploi          varchar(254)                   null,
   remunerationEmploi   varchar(254)                   null,
   constraint PK_EMPLOI primary key (idEmploi)
);

/*==============================================================*/
/* Index: EMPLOI_PK                                             */
/*==============================================================*/
create unique index EMPLOI_PK on Emploi (
idEmploi ASC
);

/*==============================================================*/
/* Index: PUBLIER_FK                                            */
/*==============================================================*/
create index PUBLIER_FK on Emploi (
idUser ASC
);

/*==============================================================*/
/* Table: Experience                                            */
/*==============================================================*/
create table Experience 
(
   idExperience         integer                        not null,
   idUser               integer                        null,
   entrepriseExperience varchar(254)                   null,
   lieuExperience       varchar(254)                   null,
   datedExperience      varchar(254)                   null,
   datefExperience      varchar(254)                   null,
   descriptionExperience varchar(254)                   null,
   constraint PK_EXPERIENCE primary key (idExperience)
);

/*==============================================================*/
/* Index: EXPERIENCE_PK                                         */
/*==============================================================*/
create unique index EXPERIENCE_PK on Experience (
idExperience ASC
);

/*==============================================================*/
/* Index: POSSEDER_FK                                           */
/*==============================================================*/
create index POSSEDER_FK on Experience (
idUser ASC
);

/*==============================================================*/
/* Table: Formation                                             */
/*==============================================================*/
create table Formation 
(
   idFormation          integer                        not null,
   idUser               integer                        null,
   diplomeFormation     varchar(254)                   null,
   domaineFormation     varchar(254)                   null,
   extraFormation       varchar(254)                   null,
   anneeFormation       varchar(254)                   null,
   ecoleFormation       varchar(254)                   null,
   constraint PK_FORMATION primary key (idFormation)
);

/*==============================================================*/
/* Index: FORMATION_PK                                          */
/*==============================================================*/
create unique index FORMATION_PK on Formation (
idFormation ASC
);

/*==============================================================*/
/* Index: ACQUERIR_FK                                           */
/*==============================================================*/
create index ACQUERIR_FK on Formation (
idUser ASC
);

/*==============================================================*/
/* Table: Messagerie                                             */
/*==============================================================*/
create table Messagerie 
(
   idMessage            integer                        not null,
   idUser               integer                        null,
   likeMessage          boolean                        null,
   fileMessage          varchar(254)                   null,
   destinataireMessage  varchar(254)                   null,
   contenuMessage       varchar(254)                   null,
   constraint PK_MESSAGE primary key (idMessage)
);

/*==============================================================*/
/* Index: MESSAGE_PK                                            */
/*==============================================================*/
create unique index MESSAGE_PK on Messagerie (
idMessage ASC
);

/*==============================================================*/
/* Index: ENVOYER_FK                                            */
/*==============================================================*/
create index ENVOYER_FK on Messagerie (
idUser ASC
);

/*==============================================================*/
/* Table: Notification                                          */
/*==============================================================*/
create table Notification 
(
   idNotification       integer                        not null,
   idEmploi             integer                        null,
   idPost               integer                        null,
   typeNotification     varchar(254)                   null,
   constraint PK_NOTIFICATION primary key (idNotification)
);

/*==============================================================*/
/* Index: NOTIFICATION_PK                                       */
/*==============================================================*/
create unique index NOTIFICATION_PK on Notification (
idNotification ASC
);

/*==============================================================*/
/* Index: DECLANCHER1_FK                                        */
/*==============================================================*/
create index DECLANCHER1_FK on Notification (
idEmploi ASC
);

/*==============================================================*/
/* Index: DECLANCHER2_FK                                        */
/*==============================================================*/
create index DECLANCHER2_FK on Notification (
idPost ASC
);

/*==============================================================*/
/* Table: Post                                                  */
/*==============================================================*/
create table Post 
(
   idPost               integer                        not null,
   idUser               integer                        null,
   contenuPost          varchar(254)                   null,
   visibilitePost       boolean                        null,
   filePost             varchar(254)                   null,
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

/*==============================================================*/
/* Table: Reseau                                                */
/*==============================================================*/
create table Reseau 
(
   idAmiReseau          integer                        not null,
   idUserReseau         integer                        not null,
   idUser               integer                        null,
   constraint PK_RESEAU primary key (idAmiReseau, idUserReseau)
);

/*==============================================================*/
/* Index: RESEAU_PK                                             */
/*==============================================================*/
create unique index RESEAU_PK on Reseau (
idAmiReseau ASC,
idUserReseau ASC
);

/*==============================================================*/
/* Index: AVOIR_FK                                              */
/*==============================================================*/
create index AVOIR_FK on Reseau (
idUser ASC
);

/*==============================================================*/
/* Table: Utilisateur                                           */
/*==============================================================*/
create table Utilisateur 
(
   idUser               integer                        not null,
   idNotification       integer                        null,
   nomUser              varchar(254)                   null,
   prenomUser           varchar(254)                   null,
   mailUser             varchar(254)                   null,
   competenceUser       varchar(254)                   null,
   adresseUser          varchar(254)                   null,
   roleUser             varchar(254)                   null,
   mdpUser              varchar(254)                   null,
   avatarUser           varchar(254)                   null,
   projetUser           varchar(254)                   null,
   albumUser            varchar(254)                   null,
   constraint PK_UTILISATEUR primary key (idUser)
);

/*==============================================================*/
/* Index: UTILISATEUR_PK                                        */
/*==============================================================*/
create unique index UTILISATEUR_PK on Utilisateur (
idUser ASC
);

/*==============================================================*/
/* Index: DESTINER_FK                                           */
/*==============================================================*/
create index DESTINER_FK on Utilisateur (
idNotification ASC
);

alter table Emploi
   add constraint FK_EMPLOI_PUBLIER_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

alter table Experience
   add constraint FK_EXPERIEN_POSSEDER_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

alter table Formation
   add constraint FK_FORMATIO_ACQUERIR_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

alter table Messagerie
   add constraint FK_MESSAGE_ENVOYER_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

alter table Notification
   add constraint FK_NOTIFICA_DECLANCHE_EMPLOI foreign key (idEmploi)
      references Emploi (idEmploi)
      on update restrict
      on delete restrict;

alter table Notification
   add constraint FK_NOTIFICA_DECLANCHE_POST foreign key (idPost)
      references Post (idPost)
      on update restrict
      on delete restrict;

alter table Post
   add constraint FK_POST_POSTER_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

alter table Reseau
   add constraint FK_RESEAU_AVOIR_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

alter table Utilisateur
   add constraint FK_UTILISAT_DESTINER_NOTIFICA foreign key (idNotification)
      references Notification (idNotification)
      on update restrict
      on delete restrict;

