/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 11                       */
/* Created on:     03/05/2018 09:28:46                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_EMPLOI_PUBLIER_UTILISAT') then
    alter table Emploi
       delete foreign key FK_EMPLOI_PUBLIER_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EXPERIEN_POSSEDER_UTILISAT') then
    alter table Experience
       delete foreign key FK_EXPERIEN_POSSEDER_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FORMATIO_ACQUERIR_UTILISAT') then
    alter table Formation
       delete foreign key FK_FORMATIO_ACQUERIR_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_IMAGEALB_CONTENIR_UTILISAT') then
    alter table ImageAlbum
       delete foreign key FK_IMAGEALB_CONTENIR_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MESSAGER_ENVOYER_UTILISAT') then
    alter table Messagerie
       delete foreign key FK_MESSAGER_ENVOYER_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NOTIFICA_DECLENCHE_EMPLOI') then
    alter table Notification
       delete foreign key FK_NOTIFICA_DECLENCHE_EMPLOI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NOTIFICA_DECLENCHE_POST') then
    alter table Notification
       delete foreign key FK_NOTIFICA_DECLENCHE_POST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NOTIFICA_DECLENCHE_MESSAGER') then
    alter table Notification
       delete foreign key FK_NOTIFICA_DECLENCHE_MESSAGER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_POSTER_UTILISAT') then
    alter table Post
       delete foreign key FK_POST_POSTER_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RESEAU_AVOIR_UTILISAT') then
    alter table Reseau
       delete foreign key FK_RESEAU_AVOIR_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UTILISAT_DESTINER_NOTIFICA') then
    alter table Utilisateur
       delete foreign key FK_UTILISAT_DESTINER_NOTIFICA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_APPARTEN_APPARTENI_GROUPEUS') then
    alter table appartenir
       delete foreign key FK_APPARTEN_APPARTENI_GROUPEUS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_APPARTEN_APPARTENI_UTILISAT') then
    alter table appartenir
       delete foreign key FK_APPARTEN_APPARTENI_UTILISAT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Emploi'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Emploi
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Experience'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Experience
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Formation'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Formation
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='GROUPEUSER_PK'
     and t.table_name='Groupeuser'
) then
   drop index Groupeuser.GROUPEUSER_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Groupeuser'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Groupeuser
end if;

if exists(
   select 1 from sys.systable 
   where table_name='ImageAlbum'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table ImageAlbum
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Messagerie'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Messagerie
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Notification'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Notification
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Post'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Post
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Reseau'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Reseau
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Utilisateur'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Utilisateur
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='APPARTENIR_FK2'
     and t.table_name='appartenir'
) then
   drop index appartenir.APPARTENIR_FK2
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='APPARTENIR_FK'
     and t.table_name='appartenir'
) then
   drop index appartenir.APPARTENIR_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='APPARTENIR_PK'
     and t.table_name='appartenir'
) then
   drop index appartenir.APPARTENIR_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='appartenir'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table appartenir
end if;

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
   likerEmploi          smallint                       null,
   partagerEmploi       smallint                       null,
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
   receptionMeessage    smallint                       null,
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
   visibilitePost       smallint                       null,
   filePost             varchar(254)                   null,
   likerPost            smallint                       null,
   commenterPost        smallint                       null,
   commentairePost      varchar(254)                   null,
   partagerPost         smallint                       null,
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
   activerUser          smallint                       null,
   constraint PK_UTILISATEUR primary key (idUser)
);

/*==============================================================*/
/* Table: appartenir                                            */
/*==============================================================*/
create table appartenir 
(
   idGroupe             integer                        not null,
   idUser               integer                        not null,
   constraint PK_APPARTENIR primary key clustered (idGroupe, idUser)
);

/*==============================================================*/
/* Index: APPARTENIR_PK                                         */
/*==============================================================*/
create unique clustered index APPARTENIR_PK on appartenir (
idGroupe ASC,
idUser ASC
);

/*==============================================================*/
/* Index: APPARTENIR_FK                                         */
/*==============================================================*/
create index APPARTENIR_FK on appartenir (
idGroupe ASC
);

/*==============================================================*/
/* Index: APPARTENIR_FK2                                        */
/*==============================================================*/
create index APPARTENIR_FK2 on appartenir (
idUser ASC
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

