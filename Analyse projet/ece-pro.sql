/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 11                       */
/* Created on:     02/05/2018 18:17:53                          */
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

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='PUBLIER_FK'
     and t.table_name='Emploi'
) then
   drop index Emploi.PUBLIER_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='EMPLOI_PK'
     and t.table_name='Emploi'
) then
   drop index Emploi.EMPLOI_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Emploi'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Emploi
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='POSSEDER_FK'
     and t.table_name='Experience'
) then
   drop index Experience.POSSEDER_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='EXPERIENCE_PK'
     and t.table_name='Experience'
) then
   drop index Experience.EXPERIENCE_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Experience'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Experience
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ACQUERIR_FK'
     and t.table_name='Formation'
) then
   drop index Formation.ACQUERIR_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='FORMATION_PK'
     and t.table_name='Formation'
) then
   drop index Formation.FORMATION_PK
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
     and i.index_name='ENVOYER_FK'
     and t.table_name='Messagerie'
) then
   drop index Messagerie.ENVOYER_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='MESSAGE_PK'
     and t.table_name='Messagerie'
) then
   drop index Messagerie.MESSAGE_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Messagerie'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Messagerie
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='DECLENCHER3_FK'
     and t.table_name='Notification'
) then
   drop index Notification.DECLENCHER3_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='DECLANCHER2_FK'
     and t.table_name='Notification'
) then
   drop index Notification.DECLANCHER2_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='DECLANCHER1_FK'
     and t.table_name='Notification'
) then
   drop index Notification.DECLANCHER1_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='NOTIFICATION_PK'
     and t.table_name='Notification'
) then
   drop index Notification.NOTIFICATION_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Notification'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Notification
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='POSTER_FK'
     and t.table_name='Post'
) then
   drop index Post.POSTER_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='POST_PK'
     and t.table_name='Post'
) then
   drop index Post.POST_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Post'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Post
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='AVOIR_FK'
     and t.table_name='Reseau'
) then
   drop index Reseau.AVOIR_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='RESEAU_PK'
     and t.table_name='Reseau'
) then
   drop index Reseau.RESEAU_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Reseau'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Reseau
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='DESTINER_FK'
     and t.table_name='Utilisateur'
) then
   drop index Utilisateur.DESTINER_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='UTILISATEUR_PK'
     and t.table_name='Utilisateur'
) then
   drop index Utilisateur.UTILISATEUR_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Utilisateur'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Utilisateur
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
   constraint PK_MESSAGERIE primary key (idMessage)
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
   idMessage            integer                        null,
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
/* Index: DECLENCHER3_FK                                        */
/*==============================================================*/
create index DECLENCHER3_FK on Notification (
idMessage ASC
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
   activerUser          smallint                       null,
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

