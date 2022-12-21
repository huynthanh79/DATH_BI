USE [master]
go
IF DB_ID('Stage_Covid19') IS NOT NULL
	DROP DATABASE Stage_Covid19
GO
CREATE DATABASE Stage_Covid19
GO
USE Stage_Covid19
GO


CREATE TABLE [dbo].[Case_Detail](
	[ObjectId] [bigint] NULL,
	[row_id] [bigint] NULL,
	[date_reported] [date] NULL,
	[health_region] [nvarchar](255) NULL,
	[age_group] [varchar](100) NULL,
	[gender] [varchar](100) NULL,
	[exposure] [varchar](100) NULL,
	[case_status] [varchar](100) NULL,
	[province] [nvarchar](100) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Case_Report](
	[Outcome] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Reporting_PHU] [nvarchar](255) NULL,
	[CaseReported_Date] [date] NULL,
	[PHUCity] [varchar](255) NULL,
	[CaseAcquisition_Info] [varchar](50) NULL,
	[PHU_Address] [varchar](255) NULL,
	[OutbreakRelated] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Ongoing_Outbreaks_PHU](
	[date] [date] NULL,
	[phu_num] [int] NULL,
	[outbreak_group] [nvarchar](100) NULL,
	[number_ongoing_outbreaks] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PHU_Group](
	[PHU_Group] [nvarchar](255) NULL,
	[PHU_City] [nvarchar](255) NULL,
	[PHU_region] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Public_Health_Unit](
	[PHU_ID] [int] NULL,
	[Reporting_PHU] [nvarchar](255) NULL,
	[Reporting_PHU_Address] [nvarchar](255) NULL,
	[Reporting_PHU_City] [nvarchar](255) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Vaccines_By_Age_PHU](
	[Date] [date] NULL,
	[PHU ID] [int] NULL,
	[Agegroup] [nvarchar](255) NULL,
	[At least one dose_cumulative] [int] NULL,
	[Second_dose_cumulative] [int] NULL,
	[fully_vaccinated_cumulative] [int] NULL,
	[third_dose_cumulative] [int] NULL
) ON [PRIMARY]
GO