/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     05/12/2022 9:42:47 PM                        */
/*==============================================================*/
USE master
go
IF DB_ID('NDS_Covid19') IS NOT NULL
	DROP DATABASE NDS_Covid19
GO
CREATE DATABASE NDS_Covid19
GO
USE NDS_Covid19
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CASES_REPORT') and o.name = 'FK_CASES_RE_RELATIONS_DAY')
alter table CASES_REPORT
   drop constraint FK_CASES_RE_RELATIONS_DAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CASES_REPORT') and o.name = 'FK_CASES_RE_RELATIONS_PUBLIC_H')
alter table CASES_REPORT
   drop constraint FK_CASES_RE_RELATIONS_PUBLIC_H
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DAY') and o.name = 'FK_DAY_RELATIONS_MONTH')
alter table DAY
   drop constraint FK_DAY_RELATIONS_MONTH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MONTH') and o.name = 'FK_MONTH_RELATIONS_QUARTER')
alter table MONTH
   drop constraint FK_MONTH_RELATIONS_QUARTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ONGOING_OUTBREAKS_PHU') and o.name = 'FK_ONGOING__RELATIONS_OUTBREAK')
alter table ONGOING_OUTBREAKS_PHU
   drop constraint FK_ONGOING__RELATIONS_OUTBREAK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ONGOING_OUTBREAKS_PHU') and o.name = 'FK_ONGOING__RELATIONS_PUBLIC_H')
alter table ONGOING_OUTBREAKS_PHU
   drop constraint FK_ONGOING__RELATIONS_PUBLIC_H
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHU_CITY') and o.name = 'FK_PHU_CITY_RELATIONS_PHU_GROU')
alter table PHU_CITY
   drop constraint FK_PHU_CITY_RELATIONS_PHU_GROU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHU_REGION') and o.name = 'FK_PHU_REGI_RELATIONS_PHU_CITY')
alter table PHU_REGION
   drop constraint FK_PHU_REGI_RELATIONS_PHU_CITY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PUBLIC_HEALTH_UNIT') and o.name = 'FK_PUBLIC_H_RELATIONS_PHU_REGI')
alter table PUBLIC_HEALTH_UNIT
   drop constraint FK_PUBLIC_H_RELATIONS_PHU_REGI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('QUARTER') and o.name = 'FK_QUARTER_RELATIONS_YEAR')
alter table QUARTER
   drop constraint FK_QUARTER_RELATIONS_YEAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VACCINES_BY_AGE_PHU') and o.name = 'FK_VACCINES_RELATIONS_PUBLIC_H')
alter table VACCINES_BY_AGE_PHU
   drop constraint FK_VACCINES_RELATIONS_PUBLIC_H
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CASES_REPORT')
            and   name  = 'RELATIONSHIP_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index CASES_REPORT.RELATIONSHIP_8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CASES_REPORT')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index CASES_REPORT.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CASES_REPORT')
            and   type = 'U')
   drop table CASES_REPORT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DAY')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index DAY.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DAY')
            and   type = 'U')
   drop table DAY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MONTH')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index MONTH.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MONTH')
            and   type = 'U')
   drop table MONTH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ONGOING_OUTBREAKS_PHU')
            and   name  = 'RELATIONSHIP_10_FK'
            and   indid > 0
            and   indid < 255)
   drop index ONGOING_OUTBREAKS_PHU.RELATIONSHIP_10_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ONGOING_OUTBREAKS_PHU')
            and   name  = 'RELATIONSHIP_9_FK'
            and   indid > 0
            and   indid < 255)
   drop index ONGOING_OUTBREAKS_PHU.RELATIONSHIP_9_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ONGOING_OUTBREAKS_PHU')
            and   type = 'U')
   drop table ONGOING_OUTBREAKS_PHU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OUTBREAKS_GROUP')
            and   type = 'U')
   drop table OUTBREAKS_GROUP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHU_CITY')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHU_CITY.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHU_CITY')
            and   type = 'U')
   drop table PHU_CITY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHU_GROUP')
            and   type = 'U')
   drop table PHU_GROUP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHU_REGION')
            and   name  = 'RELATIONSHIP_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHU_REGION.RELATIONSHIP_6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHU_REGION')
            and   type = 'U')
   drop table PHU_REGION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PUBLIC_HEALTH_UNIT')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index PUBLIC_HEALTH_UNIT.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PUBLIC_HEALTH_UNIT')
            and   type = 'U')
   drop table PUBLIC_HEALTH_UNIT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('QUARTER')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index QUARTER.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('QUARTER')
            and   type = 'U')
   drop table QUARTER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VACCINES_BY_AGE_PHU')
            and   name  = 'RELATIONSHIP_11_FK'
            and   indid > 0
            and   indid < 255)
   drop index VACCINES_BY_AGE_PHU.RELATIONSHIP_11_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VACCINES_BY_AGE_PHU')
            and   type = 'U')
   drop table VACCINES_BY_AGE_PHU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YEAR')
            and   type = 'U')
   drop table YEAR
go

/*==============================================================*/
/* Table: CASES_REPORT                                          */
/*==============================================================*/
create table CASES_REPORT (
   CASEREPORT_ID        int         identity         not null,
   PHU_ID               int                  not null,
   DAY_ID               int                  not null,
   STATUS               int                  null,
   OUTCOME              varchar(10)          null,
   SOURCE               varchar(20)          null,
   AGE                  varchar(10)          null,
   GENDER               varchar(10)          null,
   SPECIMENDATE         date             null,
   CASEREPORT_DATE      date             null,
   TESTREPORT_DATE      date             null,
   ACCURATEEPISODE_DATE date             null,
   OUTBREAKRELATED      varchar(10)          null,
   constraint PK_CASES_REPORT primary key nonclustered (CASEREPORT_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on CASES_REPORT (
DAY_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on CASES_REPORT (
PHU_ID ASC
)
go

/*==============================================================*/
/* Table: DAY                                                   */
/*==============================================================*/
create table DAY (
   DAY_ID               int      identity            not null,
   MONTH_ID             int                  null,
   DAY                  int                  null,
   constraint PK_DAY primary key nonclustered (DAY_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on DAY (
MONTH_ID ASC
)
go

/*==============================================================*/
/* Table: MONTH                                                 */
/*==============================================================*/
create table MONTH (
   MONTH_ID             int       identity           not null,
   QUARTER_ID           int                  null,
   MONTH                int                  null,
   constraint PK_MONTH primary key nonclustered (MONTH_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on MONTH (
QUARTER_ID ASC
)
go

/*==============================================================*/
/* Table: ONGOING_OUTBREAKS_PHU                                 */
/*==============================================================*/
create table ONGOING_OUTBREAKS_PHU (
   OOPHU_ID             int        identity          not null,
   PHU_ID               int                  not null,
   OUTBREAK_ID          int                  not null,
   DATE                 date             null,
   NUMBER_ONGOING_OUTBREAKS int                  null,
   constraint PK_ONGOING_OUTBREAKS_PHU primary key nonclustered (OOPHU_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on ONGOING_OUTBREAKS_PHU (
PHU_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on ONGOING_OUTBREAKS_PHU (
OUTBREAK_ID ASC
)
go

/*==============================================================*/
/* Table: OUTBREAKS_GROUP                                       */
/*==============================================================*/
create table OUTBREAKS_GROUP (
   OUTBREAK_ID          int       identity           not null,
   OUTBREAK_NAME        varchar(50)          null,
   constraint PK_OUTBREAKS_GROUP primary key nonclustered (OUTBREAK_ID)
)
go

/*==============================================================*/
/* Table: PHU_CITY                                              */
/*==============================================================*/
create table PHU_CITY (
   PHU_CITY_ID          int      identity            not null,
   PHU_GROUP_ID         int                  not null,
   PHU_CITY_NAME        varchar(100)         null,
   constraint PK_PHU_CITY primary key nonclustered (PHU_CITY_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on PHU_CITY (
PHU_GROUP_ID ASC
)
go

/*==============================================================*/
/* Table: PHU_GROUP                                             */
/*==============================================================*/
create table PHU_GROUP (
   PHU_GROUP_ID         int        identity          not null,
   PHU_GROUP_NAME       varchar(100)         null,
   constraint PK_PHU_GROUP primary key nonclustered (PHU_GROUP_ID)
)
go

/*==============================================================*/
/* Table: PHU_REGION                                            */
/*==============================================================*/
create table PHU_REGION (
   PHU_REGION_ID        int      identity            not null,
   PHU_CITY_ID          int                  not null,
   PHU_REGION_NAME      varchar(100)         null,
   constraint PK_PHU_REGION primary key nonclustered (PHU_REGION_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on PHU_REGION (
PHU_CITY_ID ASC
)
go

/*==============================================================*/
/* Table: PUBLIC_HEALTH_UNIT                                    */
/*==============================================================*/
create table PUBLIC_HEALTH_UNIT (
   PHU_ID               int     identity             not null,
   PHU_REGION_ID        int                  not null,
   REPORTING_PHU_ADDRESS varchar(100)         null,
   REPORTING_PHU_POSTAL_CODE varchar(10)          null,
   REPORTING_PHU_WEBSITE varchar(100)         null,
   REPORTING_PHU_LATITUDE bigint               null,
   REPORTING_PHU_LONGITUDE bigint               null,
   constraint PK_PUBLIC_HEALTH_UNIT primary key nonclustered (PHU_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on PUBLIC_HEALTH_UNIT (
PHU_REGION_ID ASC
)
go

/*==============================================================*/
/* Table: QUARTER                                               */
/*==============================================================*/
create table QUARTER (
   QUARTER_ID           int      identity            not null,
   YEAR_ID              int                  null,
   QUARTER              int                  null,
   constraint PK_QUARTER primary key nonclustered (QUARTER_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on QUARTER (
YEAR_ID ASC
)
go

/*==============================================================*/
/* Table: VACCINES_BY_AGE_PHU                                   */
/*==============================================================*/
create table VACCINES_BY_AGE_PHU (
   VBAPHU_ID            int       identity           not null,
   PHU_ID               int                  not null,
   DATE                 date             null,
   AGE_GROUP            varchar(10)          null,
   AT_LEAST_ONE_DOSE_CUMULATIVE int                  null,
   SECOND_DOSE_CUMULATIVE int                  null,
   FULLY_VACCINATED_CUMULATIVE int                  null,
   THIRD_DOSE_CUMULATIVE int                  null,
   constraint PK_VACCINES_BY_AGE_PHU primary key nonclustered (VBAPHU_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on VACCINES_BY_AGE_PHU (
PHU_ID ASC
)
go

/*==============================================================*/
/* Table: YEAR                                                  */
/*==============================================================*/
create table YEAR (
   YEAR_ID              int       identity           not null,
   YEAR                 int                  null,
   constraint PK_YEAR primary key nonclustered (YEAR_ID)
)
go

alter table CASES_REPORT
   add constraint FK_CASES_RE_RELATIONS_DAY foreign key (DAY_ID)
      references DAY (DAY_ID)
go

alter table CASES_REPORT
   add constraint FK_CASES_RE_RELATIONS_PUBLIC_H foreign key (PHU_ID)
      references PUBLIC_HEALTH_UNIT (PHU_ID)
go

alter table DAY
   add constraint FK_DAY_RELATIONS_MONTH foreign key (MONTH_ID)
      references MONTH (MONTH_ID)
go

alter table MONTH
   add constraint FK_MONTH_RELATIONS_QUARTER foreign key (QUARTER_ID)
      references QUARTER (QUARTER_ID)
go

alter table ONGOING_OUTBREAKS_PHU
   add constraint FK_ONGOING__RELATIONS_OUTBREAK foreign key (OUTBREAK_ID)
      references OUTBREAKS_GROUP (OUTBREAK_ID)
go

alter table ONGOING_OUTBREAKS_PHU
   add constraint FK_ONGOING__RELATIONS_PUBLIC_H foreign key (PHU_ID)
      references PUBLIC_HEALTH_UNIT (PHU_ID)
go

alter table PHU_CITY
   add constraint FK_PHU_CITY_RELATIONS_PHU_GROU foreign key (PHU_GROUP_ID)
      references PHU_GROUP (PHU_GROUP_ID)
go

alter table PHU_REGION
   add constraint FK_PHU_REGI_RELATIONS_PHU_CITY foreign key (PHU_CITY_ID)
      references PHU_CITY (PHU_CITY_ID)
go

alter table PUBLIC_HEALTH_UNIT
   add constraint FK_PUBLIC_H_RELATIONS_PHU_REGI foreign key (PHU_REGION_ID)
      references PHU_REGION (PHU_REGION_ID)
go

alter table QUARTER
   add constraint FK_QUARTER_RELATIONS_YEAR foreign key (YEAR_ID)
      references YEAR (YEAR_ID)
go

alter table VACCINES_BY_AGE_PHU
   add constraint FK_VACCINES_RELATIONS_PUBLIC_H foreign key (PHU_ID)
      references PUBLIC_HEALTH_UNIT (PHU_ID)
go

