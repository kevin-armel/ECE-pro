/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 11                       */
/* Created on:     04/05/2018 18:02:14                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_COMMENTA_COMMENTER_POST') then
    alter table Commentaires
       delete foreign key FK_COMMENTA_COMMENTER_POST
end if;

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

if exists(select 1 from sys.sysforeignkey where role='FK_LIKER_ETRE1_POST') then
    alter table Liker
       delete foreign key FK_LIKER_ETRE1_POST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LIKER_ETRE4_EMPLOI') then
    alter table Liker
       delete foreign key FK_LIKER_ETRE4_EMPLOI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MESSAGER_ENVOYER_UTILISAT') then
    alter table Messagerie
       delete foreign key FK_MESSAGER_ENVOYER_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NOTIFICA_DECLANCHE_LIKER') then
    alter table Notification
       delete foreign key FK_NOTIFICA_DECLANCHE_LIKER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NOTIFICA_DECLENCHE_PARTAGER') then
    alter table Notification
       delete foreign key FK_NOTIFICA_DECLENCHE_PARTAGER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NOTIFICA_DECLENCHE_MESSAGER') then
    alter table Notification
       delete foreign key FK_NOTIFICA_DECLENCHE_MESSAGER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARTAGER_ETRE2_POST') then
    alter table Partager
       delete foreign key FK_PARTAGER_ETRE2_POST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARTAGER_ETRE3_EMPLOI') then
    alter table Partager
       delete foreign key FK_PARTAGER_ETRE3_EMPLOI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_POSTER_UTILISAT') then
    alter table Post
       delete foreign key FK_POST_POSTER_UTILISAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RESEAU_AVOIR_UTILISAT') then
    alter table Reseau
       delete foreign key FK_RESEAU_AVOIR_UTILISAT
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
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='COMMENTAIRES_PK'
     and t.table_name='Commentaires'
) then
   drop index Commentaires.COMMENTAIRES_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Commentaires'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Commentaires
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
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='CONTENIR_FK'
     and t.table_name='ImageAlbum'
) then
   drop index ImageAlbum.CONTENIR_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='IMAGEALBUM_PK'
     and t.table_name='ImageAlbum'
) then
   drop index ImageAlbum.IMAGEALBUM_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='ImageAlbum'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table ImageAlbum
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ETRE1_FK'
     and t.table_name='Liker'
) then
   drop index Liker.ETRE1_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='LIKER_PK'
     and t.table_name='Liker'
) then
   drop index Liker.LIKER_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Liker'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Liker
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
     and i.index_name='MESSAGERIE_PK'
     and t.table_name='Messagerie'
) then
   drop index Messagerie.MESSAGERIE_PK
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
     and i.index_name='DECLANCHER4_FK'
     and t.table_name='Notification'
) then
   drop index Notification.DECLANCHER4_FK
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
     and i.index_name='DECLENCHER1_FK'
     and t.table_name='Notification'
) then
   drop index Notification.DECLENCHER1_FK
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
     and i.index_name='ETRE2_FK'
     and t.table_name='Partager'
) then
   drop index Partager.ETRE2_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='PARTAGER_PK'
     and t.table_name='Partager'
) then
   drop index Partager.PARTAGER_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Partager'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Partager
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
   select 1 from sys.systable 
   where table_name='Reseau'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Reseau
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
/* Table: Commentaires                                          */
/*==============================================================*/
create table Commentaires 
(
   idCommentaire        integer                        not null,
   idPost               integer                        null,
   contenuCommentaire   integer                        null,
   dateCommentaire      integer                        null,
   constraint PK_COMMENTAIRES primary key (idCommentaire)
);

/*==============================================================*/
/* Index: COMMENTAIRES_PK                                       */
/*==============================================================*/
create unique index COMMENTAIRES_PK on Commentaires (
idCommentaire ASC
);

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
   datePubEmploi        timestamp                      null,
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
/* Index: IMAGEALBUM_PK                                         */
/*==============================================================*/
create unique index IMAGEALBUM_PK on ImageAlbum (
idImage ASC
);

/*==============================================================*/
/* Index: CONTENIR_FK                                           */
/*==============================================================*/
create index CONTENIR_FK on ImageAlbum (
idUser ASC
);

/*==============================================================*/
/* Table: Liker                                                 */
/*==============================================================*/
create table Liker 
(
   idLiker              integer                        not null,
   idPost               integer                        null,
   idEmploi             integer                        null,
   estLiker             smallint                       null,
   typeLiker            varchar(254)                   null,
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
/* Index: MESSAGERIE_PK                                         */
/*==============================================================*/
create unique index MESSAGERIE_PK on Messagerie (
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
   idPartager           integer                        null,
   idLiker              integer                        null,
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

/*==============================================================*/
/* Table: Partager                                              */
/*==============================================================*/
create table Partager 
(
   idPartager           integer                        not null,
   idEmploi             integer                        null,
   idPost               integer                        null,
   estPartager          smallint                       null,
   typePartager         varchar(254)                   null,
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

/*==============================================================*/
/* Table: Reseau                                                */
/*==============================================================*/
create table Reseau 
(
   idUser               integer                        not null,
   idAmiReseau          integer                        not null,
   constraint PK_RESEAU primary key (idUser, idAmiReseau)
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
   nomUser              varchar(254)                   null,
   prenomUser           varchar(254)                   null,
   gradeUser            varchar(254)                   null,
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
/* Index: UTILISATEUR_PK                                        */
/*==============================================================*/
create unique index UTILISATEUR_PK on Utilisateur (
idUser ASC
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

alter table Commentaires
   add constraint FK_COMMENTA_COMMENTER_POST foreign key (idPost)
      references Post (idPost)
      on update restrict
      on delete restrict;

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

alter table Messagerie
   add constraint FK_MESSAGER_ENVOYER_UTILISAT foreign key (idUser)
      references Utilisateur (idUser)
      on update restrict
      on delete restrict;

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

