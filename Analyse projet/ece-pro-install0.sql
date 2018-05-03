/*==============================================================*/
/* DataBase name:      ece-pro-db                               */
/* Created on:         03/05/2018 09:28:46                      */
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
   likerEmploi          boolean                        null,
   partagerEmploi       boolean                        null,
   constraint PK_EMPLOI primary key (idEmploi)
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
/* Table: Groupeuser                                            */
/*==============================================================*/
create table Groupeuser 
(
   idGroupe             integer                        not null,
   nomGroupe            varchar(254)                   null,
   constraint PK_GROUPEUSER primary key (idGroupe)
);

/*==============================================================*/
/* Index: GROUPEUSER_PK                                         */
/*==============================================================*/
create unique index GROUPEUSER_PK on Groupeuser (
idGroupe ASC
);

/*==============================================================*/
/* Table: ImageAlbum                                            */
/*==============================================================*/
create table ImageAlbum 
(
   idImage              integer                        not null,
   idUser               integer                        null,
   album                varchar(254)                   null,
   constraint PK_IMAGEALBUM primary key (idImage)
);

/*==============================================================*/
/* Table: Messagerie                                            */
/*==============================================================*/
create table Messagerie 
(
   idMessage            integer                        not null,
   idUser               integer                        null,
   fileMessage          varchar(254)                   null,
   destinataireMessage  varchar(254)                   null,
   contenuMessage       varchar(254)                   null,
   receptionMessage     boolean                        null,
   dateEmessage         timestamp                      null,
   dateRmessage         timestamp                      null,
   constraint PK_MESSAGERIE primary key (idMessage)
);

/*==============================================================*/
/* Table: Notification                                          */
/*==============================================================*/
create table Notification 
(
   idNotification       integer                        not null,
   idEmploi             integer                        null,
   idPost               integer                        null,
   idMessage            integer                        null,
   typeNotification     varchar(254)                   null,
   constraint PK_NOTIFICATION primary key (idNotification)
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
   likerPost            boolean                        null,
   commenterPost        boolean                        null,
   commentairePost      varchar(254)                   null,
   partagerPost         boolean                        null,
   constraint PK_POST primary key (idPost)
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
   activerUser          boolean                        null,
   constraint PK_UTILISATEUR primary key (idUser)
);

/*==============================================================*/
/* Table: appartenir                                            */
/*==============================================================*/
create table appartenir 
(
   idGroupe             integer                        not null,
   idUser               integer                        not null,
   constraint PK_APPARTENIR primary key (idGroupe, idUser)
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

alter table ImageAlbum
   add constraint FK_IMAGEALB_CONTENIR_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

alter table Messagerie
   add constraint FK_MESSAGER_ENVOYER_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

alter table Notification
   add constraint FK_NOTIFICA_DECLENCHE_EMPLOI foreign key (idEmploi)
      references Emploi (idEmploi)
      on update restrict
      on delete restrict;

alter table Notification
   add constraint FK_NOTIFICA_DECLENCHE_POST foreign key (idPost)
      references Post (idPost)
      on update restrict
      on delete restrict;

alter table Notification
   add constraint FK_NOTIFICA_DECLENCHE_MESSAGER foreign key (idMessage)
      references Messagerie (idMessage)
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

alter table appartenir
   add constraint FK_APPARTEN_APPARTENI_GROUPEUS foreign key (idGroupe)
      references Groupeuser (idGroupe)
      on update restrict
      on delete restrict;

alter table appartenir
   add constraint FK_APPARTEN_APPARTENI_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

