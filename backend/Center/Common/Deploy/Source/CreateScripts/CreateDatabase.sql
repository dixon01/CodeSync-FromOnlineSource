USE [master]
GO

IF NOT EXISTS(SELECT name FROM sys.sql_logins WHERE name = 'gorba_center_online')
BEGIN
    CREATE LOGIN [gorba_center_online] WITH PASSWORD=N'gorba', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
END



USE [master]
GO
/****** Object:  Database [Gorba_CenterOnline]    Script Date: 03/15/2013 11:33:07 ******/
CREATE DATABASE [Gorba_CenterOnline]
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [Gorba_CenterOnline] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gorba_CenterOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gorba_CenterOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Gorba_CenterOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gorba_CenterOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gorba_CenterOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gorba_CenterOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gorba_CenterOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gorba_CenterOnline] SET  READ_WRITE 
GO
ALTER DATABASE [Gorba_CenterOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [Gorba_CenterOnline] SET  MULTI_USER 
GO
ALTER DATABASE [Gorba_CenterOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gorba_CenterOnline] SET DB_CHAINING OFF 
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  DatabaseRole [db_executor]    Script Date: 03/15/2013 11:33:08 ******/
CREATE ROLE [db_executor] AUTHORIZATION [dbo]
GO
/****** Object:  User [gorba_center_online]    Script Date: 03/15/2013 11:33:08 ******/
GO
CREATE USER [gorba_center_online] FOR LOGIN [gorba_center_online] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_executor', @membername = N'gorba_center_online'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'gorba_center_online'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'gorba_center_online'
GO
GRANT EXECUTE TO [db_executor] AS [dbo]
GO
GRANT CONNECT TO [gorba_center_online] AS [dbo]
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivityAnnouncementTextSet]    Script Date: 03/15/2013 11:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityAnnouncementTextSet](
	[Id] [int] NOT NULL,
	[Interval] [time](7) NOT NULL,
	[Repetition] [int] NOT NULL,
 CONSTRAINT [PK_AnnouncementActivitySet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[UserSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OwnerTenantId] int NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[HashedPassword] [char](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FirstName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Culture] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortName] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TimeZoneInfoId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_UserSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_UserSetUserName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserSetUserName] ON [dbo].[UserSet] 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)



GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[OperationSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StopDate] [datetime] NULL,
	[StartExecutionDayMon] [bit] NOT NULL,
	[StartExecutionDayTue] [bit] NOT NULL,
	[StartExecutionDayWed] [bit] NOT NULL,
	[StartExecutionDayThu] [bit] NOT NULL,
	[StartExecutionDayFri] [bit] NOT NULL,
	[StartExecutionDaySat] [bit] NOT NULL,
	[StartExecutionDaySun] [bit] NOT NULL,
	[Repetition] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[OperationState] [int] NOT NULL,
	[ExecutionOnceStartDateKind] [int] NOT NULL,
	[ExecutionOnceStopDateKind] [int] NOT NULL,
	[ExecutionWeeklyStartDate] [datetime] NULL,
	[ExecutionWeeklyStopDate] [datetime] NULL,
	[ExecutionWeeklyBeginTime] [datetime] NULL,
	[ExecutionWeeklyEndTime] [datetime] NULL,
	[ExecutionWeeklyStopDateKind] [int] NOT NULL,
	[WeekRepetition] [int] NOT NULL,
	[ActivityStatus] [int] NOT NULL,
	[RevokedOn] [datetime] NULL,
	[IsRevoked]  AS (CONVERT([bit],case when [RevokedOn] IS NULL then (0) else (1) end,(0))) PERSISTED NOT NULL,
	[RevokedBy] [int] NULL,
	[FavoriteFlag] [int] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[ErrorActivitiesCount] [int] NOT NULL,
	[RevokingActivitiesCount] [int] NOT NULL,
	[ActiveActivitiesCount] [int] NOT NULL,
	[TransmittingActivitiesCount] [int] NOT NULL,
	[TransmittedActivitiesCount] [int] NOT NULL,
	[ScheduledActivitiesCount] [int] NOT NULL,
	[EndedActivitiesCount] [int] NOT NULL,
	[RevokedActivitiesCount] [int] NOT NULL,
	[SuspendingActivitiesCount] [int] NOT NULL,
	[SuspendedActivitiesCount] [int] NOT NULL,
	[TotalActivitiesCount] [int] NOT NULL,
 CONSTRAINT [PK_OperationSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_OperationSetName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE NONCLUSTERED INDEX [IX_OperationSetName] ON [dbo].[OperationSet] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_OperationSetOperationStatus]    Script Date: 03/15/2013 11:33:18 ******/
CREATE NONCLUSTERED INDEX [IX_OperationSetOperationStatus] ON [dbo].[OperationSet] 
(
	[OperationState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_OperationSetUserId]    Script Date: 03/15/2013 11:33:18 ******/
CREATE NONCLUSTERED INDEX [IX_OperationSetUserId] ON [dbo].[OperationSet] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivitySet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivitySet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OperationId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[RealTaskId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastRealTaskCreationDateTime] [datetime] NOT NULL,
	[CurrentState] [int] NOT NULL,
	[ErrorActivityInstancesCount] [int] NOT NULL,
	[RevokingActivityInstancesCount] [int] NOT NULL,
	[ActiveActivityInstancesCount] [int] NOT NULL,
	[TransmittingActivityInstancesCount] [int] NOT NULL,
	[TransmittedActivityInstancesCount] [int] NOT NULL,
	[ScheduledActivityInstancesCount] [int] NOT NULL,
	[EndedActivityInstancesCount] [int] NOT NULL,
	[RevokedActivityInstancesCount] [int] NOT NULL,
	[CreatedActivityInstancesCount] [int] NOT NULL,
	[SchedulingActivityInstancesCount] [int] NOT NULL,
	[SuspendedActivityInstancesCount] [int] NOT NULL,
	[SuspendingActivityInstancesCount] [int] NOT NULL,
	[TotalActivityInstancesCount] [int] NOT NULL,
	[RemovedOn] [datetime2](7) NULL,
	[IsRemoved]  AS (CONVERT([bit],case when [RemovedOn] IS NULL then (0) else (1) end,(0))) PERSISTED NOT NULL,
 CONSTRAINT [PK_ActivitySet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivityBusLineOnOffSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityBusLineOnOffSet](
	[Id] [int] NOT NULL,
	[Activate] [bit] NOT NULL,
	[Line] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivationMode] [int] NOT NULL,
	[SpecialText] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ActivityBusLineOnOffSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivityDeleteTripsSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityDeleteTripsSet](
	[Id] [int] NOT NULL,
	[TripId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LineId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItcsProviderId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItcsDirectionId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ActivityDeleteTripsSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivityDisplayOnOffSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityDisplayOnOffSet](
	[Id] [int] NOT NULL,
	[NewState] [int] NOT NULL,
 CONSTRAINT [PK_ActivityDisplayOnOffSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivityInfoTextSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityInfoTextSet](
	[Id] [int] NOT NULL,
	[LineNumber] [int] NOT NULL,
	[DisplayText] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DestinationId] [int] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[InfoRowId] [smallint] NOT NULL,
	[Blink] [bit] NOT NULL,
	[DisplayedScreenSide] [smallint] NOT NULL,
	[Alignment] [smallint] NOT NULL,
	[Font] [smallint] NULL,
 CONSTRAINT [PK_InfoLineTextActivitySet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[UnitTypeSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitTypeSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDefault] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UnitTypeSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_UnitTypeSetUniqueName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UnitTypeSetUniqueName] ON [dbo].[UnitTypeSet] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ProductTypeSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypeSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Revision] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDefault] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Properties] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ProductTypeSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_ProductTypeSetUniqueName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProductTypeSetUniqueName] ON [dbo].[ProductTypeSet] 
(
	[UnitTypeId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[TenantSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenantSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDefault] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TenantSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_TenantSetIsDeleted]    Script Date: 03/15/2013 11:33:18 ******/
CREATE NONCLUSTERED INDEX [IX_TenantSetIsDeleted] ON [dbo].[TenantSet] 
(
	[IsDefault] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_TenantSetUniqueName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TenantSetUniqueName] ON [dbo].[TenantSet] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[LayoutSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Definition] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LayoutSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_LayoutSetUniqueName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LayoutSetUniqueName] ON [dbo].[LayoutSet] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[UnitSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[LayoutId] [int] NULL,
	[UId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShortName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SerialNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[NetworkAddress] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsOnline] [bit] NOT NULL,
	[LastSeenOnline] [datetime] NULL,
	[LocationName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommunicationStatus] [int] NOT NULL,
	[LastRestartRequestDate] [datetime] NULL,
	[LastTimeSyncRequestDate] [datetime] NULL,
	[LastTimeSyncValue] [datetime] NULL,
	[TimeZoneInfoId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ErrorOperationsCount] [int] NOT NULL,
	[RevokingOperationsCount] [int] NOT NULL,
	[GatewayAddress] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActiveOperationsCount] [int] NOT NULL,
	[TransmittingOperationsCount] [int] NOT NULL,
	[TransmittedOperationsCount] [int] NOT NULL,
	[ScheduledOperationsCount] [int] NOT NULL,
	[EndedOperationsCount] [int] NOT NULL,
	[RevokedOperationsCount] [int] NOT NULL,
	[SuspendingOperationsCount] [int] NOT NULL,
	[SuspendedOperationsCount] [int] NOT NULL,
	[TotalOperationsCount] [int] NOT NULL,
	[OperationStatus] [int] NOT NULL,
 CONSTRAINT [PK_UnitSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_UnitSet_NetworkAddress]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UnitSet_NetworkAddress] ON [dbo].[UnitSet] 
(
	[NetworkAddress] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_UnitSetUniqueName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UnitSetUniqueName] ON [dbo].[UnitSet] 
(
	[TenantId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivityInstanceSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityInstanceSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitId] [int] NOT NULL,
	[ActivityId] [int] NOT NULL,
	[State] [int] NOT NULL,
	[IsUpdating] [bit] NOT NULL DEFAULT(0),
	[TaskIdentifier] [uniqueidentifier] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[RemovedOn] [datetime2](7) NULL,
	[IsRemoved]  AS (CONVERT([bit],case when [RemovedOn] IS NULL then (0) else (1) end,(0))) PERSISTED NOT NULL,
	DateStarted datetime2(7) NULL,
	IsStarted  AS (CONVERT([bit],case when [DateStarted] IS NULL then (0) else (1) end,0)) PERSISTED ,
	CurrentSchedulingStart datetime2(7) NULL,
	CurrentSchedulingEnd datetime2(7) NULL,
	CurrentSchedulingTransmission datetime2(7) NULL,
	DateRevokeRequested datetime2(7) NULL,
	IsRevokeRequested  AS (CONVERT([bit],case when DateRevokeRequested IS NULL then (0) else (1) end,0)) PERSISTED ,
	DateCompleted datetime2(7) NULL,
	IsCompleted  AS (CONVERT([bit],case when DateCompleted IS NULL then (0) else (1) end,0)) PERSISTED
 CONSTRAINT [PK_ActivityInstanceSet_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivityInstanceStateSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityInstanceStateSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[State] [int] NOT NULL,
	[EmittedDateTime] [datetime2](7) NOT NULL,
	[TaskIdentifier] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ActivityInstanceStateSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ActivityTaskSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityTaskSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[TaskIdentifier] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_ActivityInstanceSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [IX_ActivityInstanceSet_TaskIdentifier] UNIQUE NONCLUSTERED 
(
	[TaskIdentifier] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[AlarmSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UnitId] [int] NOT NULL,
	[UserId] [int] NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Severity] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[ConfirmationText] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[DateConfirmed] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateModified] [datetime] NULL,
	[DateReceived] [datetime] NOT NULL,
	[UnconfirmedSince]  AS (case when [DateConfirmed] IS NULL then [DateReceived] else '9999-12-31 23:59:59.997' end),
	[AlarmMessageId] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsConfirmed]  AS (CONVERT([bit],case when [UserId] IS NOT NULL then (1) else (0) end,(0))) PERSISTED,
 CONSTRAINT [PK_AlarmSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[AnnouncementTextSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnouncementTextSet](
	[AnnouncementId] [int] NOT NULL,
	[Language] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Text] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_AnnouncementTextSet] PRIMARY KEY CLUSTERED 
(
	[AnnouncementId] ASC,
	[Language] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[UserRoleSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserRoleSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[DataScopeSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataScopeSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_DataScopeSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[PermissionSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_PermissionSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[AssociationPermissionDataScopeUserRoleSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssociationPermissionDataScopeUserRoleSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionId] [int] NOT NULL,
	[DataScopeId] [int] NOT NULL,
	[UserRoleId] [int] NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AssociationPermissionDataScopeUserRoleSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[AssociationTenantUserUserRoleSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssociationTenantUserUserRoleSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [int] NOT NULL,
	[UserRoleId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AssociationTenantUserUserRoleSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[AssociationUnitOperationSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssociationUnitOperationSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitId] [int] NOT NULL,
	[OperationId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AssociationUnitOperationSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_AssociationUnitOperationUnitIdOperationId]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AssociationUnitOperationUnitIdOperationId] ON [dbo].[AssociationUnitOperationSet] 
(
	[UnitId] ASC,
	[OperationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[AssociationUnitStopPointSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssociationUnitStopPointSet](
	[UnitId] [int] NOT NULL,
	[StopPointId] [int] NOT NULL,
 CONSTRAINT [PK_UnitStopPointAssociations] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC,
	[StopPointId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[UnitGroupTypeSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitGroupTypeSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDefault] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UnitGroupTypeSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_UnitGroupTypeSetUniqueName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UnitGroupTypeSetUniqueName] ON [dbo].[UnitGroupTypeSet] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[UnitGroupSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitGroupSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[GroupTypeId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SystemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UnitGroupSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_UnitGroupSetUniqueName]    Script Date: 03/15/2013 11:33:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UnitGroupSetUniqueName] ON [dbo].[UnitGroupSet] 
(
	[TenantId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[AssociationUnitUnitGroupSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssociationUnitUnitGroupSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitId] [int] NOT NULL,
	[UnitGroupId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AssociationUnitUnitGroupSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[DatabaseVersionSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatabaseVersionSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VersionMajor] [int] NOT NULL,
	[VersionMinor] [int] NOT NULL,
	[VersionBuild] [int] NOT NULL,
	[VersionRevision] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_DatabaseVersionSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ProtocolTypeSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProtocolTypeSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProtocolType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ItcsProviderSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItcsProviderSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [bit] NOT NULL,
	[Properties] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProtocolTypeId] [int] NOT NULL,
	[ReferenceId] [int] NOT NULL,
 CONSTRAINT [PK_ItcsProviders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ItcsDisplayAreaSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItcsDisplayAreaSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Properties] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ItcsDisplayAreas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[StopPointSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StopPointSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_StopPointSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ItcsFilterSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItcsFilterSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StopPointId] [int] NOT NULL,
	[ItcsDisplayAreaId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Properties] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LineReference] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DirectionText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DirectionReference] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LineText] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ItcsFilters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ItcsLineSpecialTextSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItcsLineSpecialTextSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItcsDisplayAreaId] [int] NOT NULL,
	[ValidUntil] [datetime2](7) NOT NULL,
	[LineId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DirectionId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LineSpecialText] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Priority] [smallint] NULL,
	[SpeechOutput] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ItcsLineSpecialTextSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ItcsTimeTableEntrySet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItcsTimeTableEntrySet](
	[Id] [uniqueidentifier] NOT NULL,
	[ItcsDisplayAreaId] [int] NOT NULL,
	[OperationalDay] [datetime2](7) NOT NULL,
	[LineId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DirectionId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TripId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StopSequenceCounter] [int] NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
	[ValidUntil] [datetime2](7) NOT NULL,
	[LineText] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DirectionTexts] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ScheduledArrival] [datetime2](7) NULL,
	[ScheduledDeparture] [datetime2](7) NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
	[TripVehicleId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TripLineNumber] [int] NULL,
	[TripBlockNumber] [int] NULL,
	[TripRunNumber] [int] NULL,
	[TripDepartureStopLong] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TripDestinationStopLong] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TripDepartureStop] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TripDestinationStop] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TripDepartureTimeStartStop] [datetime2](7) NULL,
	[TripArrivalTimeDestinationStop] [datetime2](7) NULL,
	[TripOperator] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TripProductId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TripServiceAttributes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsTripDeleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ItcsTimeTableEntrySet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ItcsRealtimeDataSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItcsRealtimeDataSet](
	[ItcsTimeTableEntryId] [uniqueidentifier] NOT NULL,
	[EstimatedArrival] [datetime2](7) NULL,
	[EstimatedDeparture] [datetime2](7) NULL,
	[RealArrival] [datetime2](7) NULL,
	[RealDeparture] [datetime2](7) NULL,
	[IsAtStation] [bit] NOT NULL,
	[DepartureNoticeId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContainsRealtime] [bit] NOT NULL,
	[QueueIndicator] [bit] NOT NULL,
	[TrainsetId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrainsetPosition] [int] NULL,
	[TrainsetNumOfTrips] [int] NULL,
	[HasDisruption] [bit] NOT NULL,
	[DestinationStop] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TripSpecialText] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SpeechOutputs] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StopId] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StopPositionText] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VehicleNumbers] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ItcsRealtimeDataSet] PRIMARY KEY CLUSTERED 
(
	[ItcsTimeTableEntryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ItcsTextMappingSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItcsTextMappingSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItcsProviderId] [int] NOT NULL,
	[ProductTypeId] [int] NULL,
	[Type] [smallint] NOT NULL,
	[SourceText] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MappedText] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TtsText] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastUsed] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ItcsTextMappingSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
CREATE UNIQUE NONCLUSTERED INDEX [ItcsTextMappingSetUniqueKey] ON [dbo].[ItcsTextMappingSet]
(
	[ItcsProviderId] ASC,
	[ProductTypeId] ASC,
	[SourceText] ASC,
	[Type] ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[OperationFavoriteSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationFavoriteSet](
	[TenantId] [int] NOT NULL,
	[OperationId] [int] NOT NULL,
 CONSTRAINT [PK_OperationFavoriteSet] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC,
	[OperationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ProtocolConfigurationSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProtocolConfigurationSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProtocolTypeId] [int] NOT NULL,
	[realTimeDataOnly] [bit] NULL,
	[httpListenerHost] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[httpListenerPort] [int] NULL,
	[httpServerHost] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[httpServerport] [int] NULL,
	[httpWebProxyHost] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[httpWebProxyPort] [int] NULL,
	[httpClientIdentification] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[httpServerIdentification] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[httpResponseTimeOut] [int] NULL,
	[xmlClientRequestSenderId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[xmlServerRequestSenderId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[xmlNameSpaceRequest] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[xmlNameSpaceResponse] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[omitXmlDeclaration] [bit] NULL,
	[evaluateDataReadyInStatusResponse] [bit] NULL,
	[statusRequestIntervalInSec] [int] NULL,
	[subscriptionRetryIntervalInSec] [int] NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Properties] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProtocolConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

USE [Gorba_CenterOnline]
/****** Object:  Index [IX_ProtocolConfiguration]    Script Date: 03/15/2013 11:33:18 ******/
CREATE NONCLUSTERED INDEX [IX_ProtocolConfiguration] ON [dbo].[ProtocolConfigurationSet] 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[ReferenceTextSet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceTextSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitId] [int] NOT NULL,
	[ReferenceTextId] [bigint] NOT NULL,
	[FontNumber] [tinyint] NOT NULL,
	[ReferenceType] [int] NOT NULL,
	[DisplayText] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TtsText] [varchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidUntil] [datetime2](7) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReferenceTextSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
USE [Gorba_CenterOnline]
GO
/****** Object:  Table [dbo].[SeveritySet]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeveritySet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_SeveritySet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
/****** Object:  View [dbo].[Activities]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Activities]
AS
SELECT [Id]
      ,[OperationId]
      ,[DateCreated]
      ,[DateModified]
      ,[IsDeleted]
      ,[RealTaskId]
      ,[LastRealTaskCreationDateTime]
      ,[CurrentState]
      ,[ErrorActivityInstancesCount]
      ,[RevokingActivityInstancesCount]
      ,[ActiveActivityInstancesCount]
      ,[TransmittingActivityInstancesCount]
      ,[TransmittedActivityInstancesCount]
      ,[ScheduledActivityInstancesCount]
      ,[EndedActivityInstancesCount]
      ,[RevokedActivityInstancesCount]
      ,[CreatedActivityInstancesCount]
      ,[SchedulingActivityInstancesCount]
	  ,[SuspendingActivityInstancesCount]
	  ,[SuspendedActivityInstancesCount]
      ,[TotalActivityInstancesCount]
      ,[RemovedOn]
      ,[IsRemoved]
  FROM [Gorba_CenterOnline].[dbo].[ActivitySet]
WHERE     (IsDeleted = 0)






GO
/****** Object:  View [dbo].[ActivitiesInfoText]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ActivitiesInfoText]
AS
SELECT     Base.Id, Base.OperationId, Base.DateCreated, Base.DateModified,
			[Base].[CurrentState], [Base].[RealTaskId],
			[Base].[LastRealTaskCreationDateTime],
			[Base].[RemovedOn], [Base].[IsRemoved],
			Derived.LineNumber, Derived.DestinationId, Derived.DisplayText,
			Derived.ExpirationDate, Derived.InfoRowId, Derived.Blink,
			Derived.DisplayedScreenSide, Derived.Alignment, Derived.Font
FROM         dbo.ActivityInfoTextSet AS Derived INNER JOIN
                      dbo.Activities AS Base ON Derived.Id = Base.Id





GO
/****** Object:  View [dbo].[ActivityTasks]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ActivityTasks]
AS
WITH ActivityStates([EmittedDateTime], [TaskIdentifier])
AS
(
	SELECT  MAX([S].[EmittedDateTime]) AS [EmittedDateTime], [S].[TaskIdentifier]
	FROM [ActivityInstanceStateSet] [S]
	GROUP BY [S].[TaskIdentifier]
)
, ActivityStateValues([EmittedDateTime], [State], [TaskIdentifier])
AS
(
	SELECT  [S].[EmittedDateTime], [S].[State], [S].[TaskIdentifier]
	FROM [ActivityInstanceStateSet] [S]
	INNER JOIN [ActivityStates] [All] ON [All].[EmittedDateTime] = [S].[EmittedDateTime] AND [All].[TaskIdentifier] = [S].[TaskIdentifier]
)
SELECT     [I].[Id],[I].[TaskIdentifier] AS [TaskIdentifier], [I].[ActivityId] AS [ActivityId], [I].[UnitId] AS [UnitId], ISNULL(CAST([V].[State] AS int), 0) AS [State]
FROM         dbo.ActivityTaskSet [I]
INNER JOIN [ActivityStateValues] [V] ON [V].[TaskIdentifier]=[I].[TaskIdentifier]












GO
/****** Object:  View [dbo].[Alarms]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Alarms]
AS
SELECT     Id, Name, UnitId, UserId, Description, Severity, Type, ConfirmationText, DateCreated, EndDate, DateConfirmed, DateModified, DateReceived, UnconfirmedSince, 
                      AlarmMessageId, IsConfirmed
FROM         dbo.AlarmSet
WHERE     (IsDeleted = 0)













GO
/****** Object:  View [dbo].[AssociationsPermissionDataScopeUserRole]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AssociationsPermissionDataScopeUserRole]
AS
SELECT     Id, PermissionId, DataScopeId, UserRoleId, Name
FROM         dbo.AssociationPermissionDataScopeUserRoleSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[AssociationsTenantUserUserRole]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AssociationsTenantUserUserRole]
AS
SELECT     Id, TenantId, UserId, UserRoleId
FROM         dbo.AssociationTenantUserUserRoleSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[AssociationsUnitOperation]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AssociationsUnitOperation]
AS
SELECT     Id, UnitId, OperationId
FROM         dbo.AssociationUnitOperationSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[AssociationsUnitStopPoint]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Create new view on [AssociationUnitStopPointSet] called ItcsProviders
-- =============================================
CREATE VIEW [dbo].[AssociationsUnitStopPoint]
AS
SELECT [UnitId]
      ,[StopPointId]
  FROM [Gorba_CenterOnline].[dbo].[AssociationUnitStopPointSet]



GO
/****** Object:  View [dbo].[AssociationsUnitUnitGroup]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AssociationsUnitUnitGroup]
AS
SELECT     Id, UnitId, UnitGroupId
FROM         dbo.AssociationUnitUnitGroupSet
WHERE     (IsDeleted = 0)


;





GO
/****** Object:  View [dbo].[DatabaseVersions]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DatabaseVersions]
AS
SELECT     Id, Name, VersionMajor, VersionMinor, VersionBuild, VersionRevision, Description, DateCreated
FROM         dbo.DatabaseVersionSet

;















GO
/****** Object:  View [dbo].[DataScopes]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DataScopes]
AS
SELECT     Id, Name, Description, DateCreated, DateModified
FROM         dbo.DataScopeSet



;















GO
/****** Object:  View [dbo].[ItcsDisplayAreas]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Create new view on [ItcsDisplayAreaSet] called ItcsDisplayAreas
-- =============================================
CREATE VIEW [dbo].[ItcsDisplayAreas]
AS
SELECT [Id]
      ,[ProviderId]
      ,[Name]
      ,[Description]
      ,[Properties]
  FROM [Gorba_CenterOnline].[dbo].[ItcsDisplayAreaSet]




GO
/****** Object:  View [dbo].[ItcsFilters]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create new view on [ItcsFiltersSet] called ItcsFilters
-- =============================================
CREATE VIEW [dbo].[ItcsFilters]
AS
SELECT     Id, StopPointId, ItcsDisplayAreaId, Properties, LineReference, DirectionText, DirectionReference, LineText, IsActive
FROM         dbo.ItcsFilterSet
WHERE     (IsActive = 1)









GO
/****** Object:  View [dbo].[ItcsLineSpecialTexts]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.ItcsLineSpecialTexts
AS
SELECT     Id, ItcsDisplayAreaId, ValidUntil, LineId, DirectionId, LineSpecialText, Priority, SpeechOutput
FROM         dbo.ItcsLineSpecialTextSet
WHERE     (IsDeleted = 0)



GO
/****** Object:  View [dbo].[ItcsProviders]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Create new view on [ItcsProviderSet] called ItcsProviders
-- =============================================
CREATE VIEW [dbo].[ItcsProviders]
AS
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[IsDeleted]
      ,[Properties]
      ,[ProtocolTypeId]
      ,[ReferenceId]
  FROM [Gorba_CenterOnline].[dbo].[ItcsProviderSet]




GO
/****** Object:  View [dbo].[ItcsRealtimeData]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.ItcsRealtimeData
AS
SELECT     ItcsTimeTableEntryId, EstimatedArrival, EstimatedDeparture, RealArrival, RealDeparture, IsAtStation, ContainsRealtime, HasDisruption, DepartureNoticeId, 
                      QueueIndicator, TrainsetId, TrainsetPosition, TrainsetNumOfTrips, DestinationStop, TripSpecialText, SpeechOutputs, StopId, StopPositionText, VehicleNumbers
FROM         dbo.ItcsRealtimeDataSet



GO
/****** Object:  View [dbo].[ItcsTextMappings]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.ItcsTextMappings
AS
SELECT     Id, ItcsProviderId, ProductTypeId, Type, SourceText, MappedText, TtsText, LastUsed
FROM         dbo.ItcsTextMappingSet
WHERE     (IsDeleted = 0)



GO
/****** Object:  View [dbo].[ItcsTimeTableEntries]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.ItcsTimeTableEntries
AS
SELECT     Id, ItcsDisplayAreaId, OperationalDay, LineId, DirectionId, TripId, StopSequenceCounter, LastUpdated, ValidUntil, LineText, DirectionTexts, ScheduledArrival, 
                      ScheduledDeparture, IsTripDeleted, TimeStamp, TripVehicleId, TripLineNumber, TripBlockNumber, TripRunNumber, TripDepartureStopLong, TripDestinationStopLong, 
                      TripDepartureStop, TripDestinationStop, TripDepartureTimeStartStop, TripArrivalTimeDestinationStop, TripOperator, TripProductId, TripServiceAttributes
FROM         dbo.ItcsTimeTableEntrySet
WHERE     (IsDeleted = 0)



GO
/****** Object:  View [dbo].[Layouts]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Layouts]
AS
SELECT     Id, Name, Definition, [Description], DateCreated, DateModified
FROM         dbo.LayoutSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[Operations]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Operations]
AS
SELECT [O].[Id]
      ,[O].[UserId]
      ,[O].[StartDate]
      ,[O].[Name]
      ,[O].[StopDate]
      ,[O].[StartExecutionDayMon]
      ,[O].[StartExecutionDayTue]
      ,[O].[StartExecutionDayWed]
      ,[O].[StartExecutionDayThu]
      ,[O].[StartExecutionDayFri]
      ,[O].[StartExecutionDaySat]
      ,[O].[StartExecutionDaySun]
      ,[O].[Repetition]
      ,[O].[DateCreated]
      ,[O].[DateModified]
      , 0 AS [OperationState]
      ,[O].[ExecutionOnceStartDateKind]
      ,[O].[ExecutionOnceStopDateKind]
      ,[O].[ExecutionWeeklyStartDate]
      ,[O].[ExecutionWeeklyStopDate]
      ,[O].[ExecutionWeeklyBeginTime]
      ,[O].[ExecutionWeeklyEndTime]
      ,[O].[ExecutionWeeklyStopDateKind]
      ,[O].[WeekRepetition]
      ,[O].[ActivityStatus]
      , [O].[RevokedOn]
      , [O].[IsRevoked]
      , [O].[RevokedBy]
      , [O].[FavoriteFlag]
      , [O].[Priority]
      , [O].[TotalActivitiesCount] AS [ActivitiesCount]
      , [O].[TotalActivitiesCount]
      , [O].[ErrorActivitiesCount]
      , [O].[RevokingActivitiesCount]
      , [O].[ActiveActivitiesCount]
      , [O].[TransmittingActivitiesCount]
      , [O].[TransmittedActivitiesCount]
      , [O].[ScheduledActivitiesCount]
      , [O].[EndedActivitiesCount]
      , [O].[RevokedActivitiesCount]
	  , [O].[SuspendingActivitiesCount]
	  , [O].[SuspendedActivitiesCount]
  FROM [dbo].[OperationSet] [O]
WHERE     ([O].IsDeleted = 0)

;












GO
/****** Object:  View [dbo].[Permissions]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Permissions]
AS
SELECT     Id, Name, Description, DateCreated, DateModified
FROM         dbo.PermissionSet



;















GO
/****** Object:  View [dbo].[ProductTypes]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ProductTypes]
AS
SELECT [Id]
      ,[UnitTypeId]
      ,[Name]
      ,[Revision]
      ,[Description]
      ,[IsDefault]
      ,[DateCreated]
      ,[DateModified]
      ,[Properties]
  FROM [Gorba_CenterOnline].[dbo].[ProductTypeSet]
WHERE     (IsDeleted = 0)






GO
/****** Object:  View [dbo].[ProtocolTypes]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ProtocolTypes]
AS
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[IsDeleted]
  FROM [dbo].[ProtocolTypeSet]














GO
/****** Object:  View [dbo].[Severities]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Severities]
AS
SELECT     Id, Name, Description, DateCreated, DateModified
FROM         dbo.SeveritySet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[Tenants]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Tenants]
AS
SELECT     Id, [UId], Name, Description, IsDefault, DateCreated, DateModified
FROM         dbo.TenantSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[UnitGroups]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UnitGroups]
AS
SELECT     Id, TenantId, GroupTypeId, ParentId, Name, SystemName, Description, DateCreated, DateModified
FROM         dbo.UnitGroupSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[UnitGroupTypes]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UnitGroupTypes]
AS
SELECT     Id, Name, Description, IsDefault, DateCreated, DateModified
FROM         dbo.UnitGroupTypeSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[Units]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Units]
AS
WITH Map([Type], [Status])
AS
(
	SELECT 0,1
	UNION ALL
	SELECT 1,2
	UNION ALL
	SELECT 2,4
	UNION ALL
	SELECT 3,8
)
, AlarmStatuses([Status], [UnitId])
AS
(
	SELECT  SUM(DISTINCT ISNULL([M].[Status], 1)) AS [Status], [A].[UnitId]
	FROM [AlarmSet] [A]
	LEFT OUTER JOIN [Map] [M] ON [M].[Type] = [A].[Type]
	WHERE [A].[DateConfirmed] IS NULL
	GROUP BY [A].[UnitId]
)
, [Operations_Aggregated] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	GROUP BY [A].[UnitId]
)
, [Operations_Error] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState]=1
	GROUP BY [A].[UnitId]
)
, [Operations_Revoking] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState]=2
	GROUP BY [A].[UnitId]
)
, [Operations_Active] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState] = 3
	GROUP BY [A].[UnitId]
)
, [Operations_Transmitting] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState] = 4
	GROUP BY [A].[UnitId]
)
, [Operations_Transmitted] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState] = 5
	GROUP BY [A].[UnitId]
)
, [Operations_Scheduled] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState] = 6
	GROUP BY [A].[UnitId]
)
, [Operations_Ended] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState] = 7
	GROUP BY [A].[UnitId]
)
, [Operations_Revoked] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState] = 8
	GROUP BY [A].[UnitId]
)
, [Operations_Suspended] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState] = 9
	GROUP BY [A].[UnitId]
)
, [Operations_Suspending] AS
(
	SELECT COUNT(*) AS [Count], [A].[UnitId]
	FROM [Operations] [O]
	INNER JOIN [AssociationsUnitOperation] [A] ON [A].[OperationId] = [O].[Id]
	WHERE [O].[OperationState] = 10
	GROUP BY [A].[UnitId]
)
SELECT [U].[Id]
      ,[U].[TenantId]
      ,[U].[ProductTypeId]
      ,[U].[LayoutId]
      ,[U].[UId]
      ,[U].[Name]
      ,[U].[ShortName]
      ,[U].[SystemName]
      ,[U].[SerialNumber]
      ,[U].[Description]
      ,[U].[DateCreated]
      ,[U].[DateModified]
      ,[U].[NetworkAddress]
      ,[U].[IsOnline]
      ,[U].[LastSeenOnline]
      ,[U].[LocationName]
      ,[U].[CommunicationStatus]
      ,[U].[OperationStatus]
      ,[U].[LastRestartRequestDate]
      ,[U].[LastTimeSyncRequestDate]
      ,[U].[LastTimeSyncValue]
      ,[U].[TimeZoneInfoId]
      ,[U].[GatewayAddress]
      ,ISNULL(CAST([A].[Status] AS int), 0) AS [AlarmStatus]
      ,[U].[ErrorOperationsCount]
      ,[U].[RevokingOperationsCount]
      ,[U].[ActiveOperationsCount]
      ,[U].[TransmittingOperationsCount]
      ,[U].[TransmittedOperationsCount]
      ,[U].[ScheduledOperationsCount]
      ,[U].[EndedOperationsCount]
      ,[U].[RevokedOperationsCount]
	  ,[U].[SuspendingOperationsCount]
	  ,[U].[SuspendedOperationsCount]
      ,[U].[TotalOperationsCount]

FROM         [dbo].[UnitSet] [U]
LEFT OUTER JOIN [AlarmStatuses] [A] ON [A].[UnitId] = [U].[Id]

WHERE     [U].[IsDeleted] = 0





GO
/****** Object:  View [dbo].[UnitTypes]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UnitTypes]
AS
SELECT     Id, Name, Description, IsDefault, DateCreated, DateModified
FROM         dbo.UnitTypeSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[UserRoles]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserRoles]
AS
SELECT     Id, Name, Description, DateCreated, DateModified
FROM         dbo.UserRoleSet
WHERE     (IsDeleted = 0)



;















GO
/****** Object:  View [dbo].[Users]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Users]
AS
SELECT     Id, [OwnerTenantId], Username, HashedPassword, FirstName, LastName, Email, DateCreated, DateModified, IsDeleted, Culture, ShortName, TimeZoneInfoId
FROM         dbo.UserSet













GO
/****** Object:  UserDefinedFunction [dbo].[GetDeletedName]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Francesco Leonetti (lef@gorba.com)
-- Create date: 04.01.12
-- Description:	Gets the name for a deleted entity
-- =============================================
CREATE FUNCTION [dbo].[GetDeletedName] 
(
	@id int,
	@entityName varchar(100)
)
RETURNS varchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @len int = LEN(@entityName)
	DECLARE @size int = 8
	DECLARE @idString varchar(8000) = CONVERT(varchar(8000), @id)
	
	DECLARE @normalizedIdString char(8) = REPLICATE('0',@size-LEN(RTRIM(@idString))) + @idString

	DECLARE @finalLen int = 100 - @size - 1 -- I remove the '~' char too
	
	IF @finalLen > @len
		BEGIN
			SET @finalLen = @len
		END
	
	DECLARE @final varchar(100) = '~' + SUBSTRING(@entityName, 1, @finalLen) + @normalizedIdString

	-- Return the result of the function
	RETURN @final

END

;















GO
/****** Object:  StoredProcedure [dbo].[ClearItcsData]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClearItcsData]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @now datetime2(7) = GETUTCDATE()
    
    DELETE [ItcsRealtimeDataSet]
    FROM [ItcsRealtimeDataSet] [R]
    INNER JOIN [ItcsTimeTableEntrySet] [E] ON [E].[Id] = [R].[ItcsTimeTableEntryId]
    WHERE [ValidUntil] IS NOT NULL AND [ValidUntil] < @now
    
    DELETE FROM [ItcsTimeTableEntrySet]
    WHERE [ValidUntil] IS NOT NULL AND [ValidUntil] < @now
    
    DELETE FROM [ReferenceTextSet]
    WHERE [ValidUntil] IS NOT NULL AND [ValidUntil] < @now
END





GO
/****** Object:  StoredProcedure [dbo].[ClearItcsProviderData]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClearItcsProviderData]
(
	@itcsProviderName varchar(160)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @now datetime2(7) = GETUTCDATE()
    
    DECLARE @providerId int
    SELECT @providerId = [Id]
    FROM [dbo].[ItcsProviders]
    WHERE [Name] LIKE @itcsProviderName
    
    DELETE [ItcsRealtimeDataSet]
    FROM [ItcsRealtimeDataSet] [R]
    INNER JOIN [ItcsTimeTableEntrySet] [E] ON [E].[Id] = [R].[ItcsTimeTableEntryId]
    INNER JOIN [ItcsDisplayAreas] [A] ON [E].[ItcsDisplayAreaId] = [A].[Id] AND [A].[ProviderId] = @providerId
    
    DELETE [ItcsTimeTableEntrySet]
    FROM [ItcsTimeTableEntrySet] [E]
    INNER JOIN [ItcsDisplayAreas] [A] ON [E].[ItcsDisplayAreaId] = [A].[Id] AND [A].[ProviderId] = @providerId

END





GO
/****** Object:  StoredProcedure [dbo].[ClearObsoleteItcsData]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClearObsoleteItcsData]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @now datetime2(7) = GETUTCDATE()
    
    DELETE [ItcsRealtimeDataSet]
    FROM [ItcsRealtimeDataSet] [R]
    INNER JOIN [ItcsTimeTableEntrySet] [E] ON [E].[Id] = [R].[ItcsTimeTableEntryId]
    WHERE [E].[ValidUntil] IS NOT NULL AND [E].[ValidUntil] < @now
    
    DELETE [ItcsTimeTableEntrySet]
    FROM [ItcsTimeTableEntrySet] [E]
    WHERE [E].[ValidUntil] IS NOT NULL AND [E].[ValidUntil] < @now

END





GO
/****** Object:  StoredProcedure [dbo].[ClearOperations]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClearOperations]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    DELETE FROM ActivityTaskSet
    DELETE FROM ActivityInstanceSet
    
    DELETE FROM ActivityBusLineOnOffSet
    DELETE FROM ActivityDeleteTripsSet
    DELETE FROM ActivityDisplayOnOffSet
    DELETE FROM AnnouncementTextSet
    DELETE FROM ActivityAnnouncementTextSet
    DELETE FROM ActivityInfoTextSet
    DELETE FROM ActivitySet
    
    DELETE FROM AssociationUnitOperationSet
    
    DELETE FROM OperationSet
    
    UPDATE [UnitSet]
    SET [OperationStatus] = 0,
     [TotalOperationsCount] = 0,
    [ErrorOperationsCount] = 0,
    [RevokingOperationsCount] = 0,
    [ActiveOperationsCount] = 0,
    [TransmittingOperationsCount] = 0,
    [TransmittedOperationsCount] = 0,
    [ScheduledOperationsCount] = 0,
    [EndedOperationsCount] = 0,
    [RevokedOperationsCount] = 0
END










GO
/****** Object:  StoredProcedure [dbo].[ClearUnits]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClearUnits]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Units
END












GO
/****** Object:  StoredProcedure [dbo].[DatabaseVersion_Insert]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francesco Leonetti (francesco.leonetti@gorba.com)
-- Create date: 02.12.11 10:47
-- Description:	Inserts a new version of the database in the DatabaseVersionSet table.
--				Everything is done within a transaction.
--				If the @dateCreated parameter is NULL, then the actual UTC time is used.
--				If the operations succeeds, the identifier assigned to the created row is selected
-- =============================================
CREATE PROCEDURE [dbo].[DatabaseVersion_Insert]
(
	@name varchar(100),
	@description varchar(500) = NULL,
	@versionMajor int,
	@versionMinor int,
	@versionBuild int,
	@versionRevision int,
	@dateCreated datetime2 = NULL
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY --Start the Try Block..
		BEGIN TRANSACTION DatabaseVersion_InsertTx -- Start the transaction..
			IF @dateCreated IS NULL
				BEGIN
					SET @dateCreated = GETUTCDATE()
				END
			INSERT INTO [DatabaseVersionSet]
			([Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated])
			VALUES
			(@name, @description, @versionMajor, @versionMinor, @versionBuild, @versionRevision, @dateCreated)
			
			DECLARE @id int = SCOPE_IDENTITY()
			SELECT @id
			
			COMMIT TRAN -- Transaction Success!

	END TRY

	BEGIN CATCH


		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRAN --RollBack in case of Error
			END
			
			DECLARE @message varchar(500) = ERROR_MESSAGE()
			DECLARE @severity int = ERROR_SEVERITY()
			RAISERROR(@message, @severity, 1)

	END CATCH

END



;

;

;














GO
/****** Object:  StoredProcedure [dbo].[DatabaseVersion_Select]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francesco Leonetti (francesco.leonetti@gorba.com)
-- Create date: 02.12.11
-- Description:	This SP selects the database version entries ordering them by version.
-- =============================================
CREATE PROCEDURE [dbo].[DatabaseVersion_Select]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DV].*
	FROM [DatabaseVersions] [DV]
	ORDER BY [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision]
END



;

;

;














GO
/****** Object:  StoredProcedure [dbo].[Operation_Delete]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francesco Leonetti (francesco.leonetti@gorba.com)
-- Create date: 22.12.11
-- Description:	Deletes an operation and all its related activities
-- =============================================
CREATE PROCEDURE [dbo].[Operation_Delete]
(
	@id int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY --Start the Try Block..
		BEGIN TRANSACTION Operation_DeleteTx -- Start the transaction..
	
	-- If needed, it can be replaced with the usage of a cursor and the Activity_Delete operation.
	UPDATE [ActivitySet]
	SET [IsDeleted]=1
	WHERE [OperationId]=@id

	UPDATE [OperationSet]
	SET [Name] = [dbo].GetDeletedName([Id], [Name]), [IsDeleted]=1
	WHERE [Id]=@id
			
			COMMIT TRAN -- Transaction Success!

	END TRY

	BEGIN CATCH


		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRAN --RollBack in case of Error
			END
			
			DECLARE @message varchar(500) = ERROR_MESSAGE()
			DECLARE @severity int = ERROR_SEVERITY()
			RAISERROR(@message, @severity, 1)

	END CATCH
END



;















GO
/****** Object:  StoredProcedure [dbo].[Operation_SelectByUser]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thomas Epple (thomas.epple@gorba.com)
-- Create date: 14.02.2012
-- Description:	Selects Operations filterd by userId and/or tenantId
-- =============================================
CREATE PROCEDURE [dbo].[Operation_SelectByUser] 
	(@userId int = NULL,
	@tenantId int = NULL
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @userId IS NULL AND @tenantId IS NULL
	BEGIN
		SELECT *
		FROM [OperationSet]
	END
	ELSE
	BEGIN
		IF @userId IS NULL
		BEGIN
			SELECT DISTINCT O.* from OperationSet O 
			JOIN AssociationUnitOperationSet UO ON O.Id = UO.OperationId 
			JOIN UnitSet U on UO.UnitId = U.Id
			WHERE U.TenantId = @tenantId		
		END
		ELSE
		BEGIN
			IF @tenantId IS NULL
			BEGIN
				SELECT *
				FROM [OperationSet] [O]
				WHERE O.UserId = @userID
			END
			ELSE
			BEGIN
				SELECT DISTINCT O.* from OperationSet O 
				JOIN AssociationUnitOperationSet UO ON O.Id = UO.OperationId 
				JOIN UnitSet U on UO.UnitId = U.Id
				WHERE U.TenantId = @tenantId AND O.UserId = @userId
			END
		END	
	END	END

;

;

;













GO
/****** Object:  StoredProcedure [dbo].[Operation_GetActivitySubmissions]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francesco Leonetti (francesco.leonetti@gorba.com)
-- Create date: February 16th, 2012
-- Description:	Retrieves the submitted activity for an operation on a specified unit.
-- ACHTUNG! In this version, all activities are returned, and not only active ones.
-- The management of the state of an activity should be implemented.
-- =============================================
CREATE PROCEDURE [dbo].[Operation_GetActivitySubmissions] 
	-- Add the parameters for the stored procedure here
	@operationId int = NULL,
	@unitId int = NULL,
	@onlyActive bit = 0,
	@userId int = NULL,
	@tenantId int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @operations TABLE
		([Id] int
      ,[UserId] int
      ,[StartDate] datetime
      ,[Name] varchar(100)
      ,[StopDate] datetime NULL
      ,[StartExecutionDayMon] bit
      ,[StartExecutionDayTue] bit
      ,[StartExecutionDayWed] bit
      ,[StartExecutionDayThu] bit
      ,[StartExecutionDayFri] bit
      ,[StartExecutionDaySat] bit
      ,[StartExecutionDaySun] bit
      ,[Repetition] int
      ,[DateCreated] datetime
      ,[DateModified] datetime NULL
      , [IsDeleted] bit
      ,[OperationState] int
      ,[ExecutionOnceStartDateKind] int
      ,[ExecutionOnceStopDateKind] int
      ,[ExecutionWeeklyStartDate] datetime NULL
      ,[ExecutionWeeklyStopDate] datetime NULL
      ,[ExecutionWeeklyBeginTime] datetime NULL
      ,[ExecutionWeeklyEndTime] datetime NULL
      ,[ExecutionWeeklyStopDateKind] int
      ,[WeekRepetition] int
      , [ActivityStatus] int
      , [RevokedOn] datetime NULL
      , [IsRevoked] int
      , [RevokedBy] int NULL
      , [FavoriteFlag] int)

    -- Insert statements for procedure here
    INSERT INTO @operations
	EXEC [Operation_SelectByUser] @userId = @userId, @tenantId = @tenantId
	
	DECLARE @unit_operation TABLE([UnitId] int, [OperationId] int)
	
	INSERT INTO @unit_operation
	SELECT [UO].[UnitId], [UO].[OperationId]
	FROM [AssociationsUnitOperation] [UO]
	WHERE [UO].[OperationId] IN
	(
		SELECT [O].[Id]
		FROM @operations [O]
		WHERE (@operationId IS NULL OR [O].[Id]=@operationId)
	)
	AND
	(@unitId IS NULL OR [UO].[UnitId]=@unitId)
	
	SELECT [A].[Id] [ActivityId], [UO].[OperationId], [UO].[UnitId]
	FROM @unit_operation [UO]
	INNER JOIN [Activities] [A] ON [A].[OperationId]=[UO].[OperationId]
END

;

;

;













GO
/****** Object:  StoredProcedure [dbo].[Unit_Restart]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francesco Leonetti (francesco.leonetti@gorba.com)
-- Create date: Friday, March 30th
-- Description:	Sets the request restart date for the specified unit.
-- =============================================
CREATE PROCEDURE [dbo].[Unit_Restart]
(
	@unitId int,
	@requestDate datetime
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    BEGIN TRY
		BEGIN TRANSACTION UnitRestart_Tx
		
			UPDATE [UnitSet]
			SET [LastRestartRequestDate] = @requestDate
			WHERE [Id] = @unitId
		
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH


		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRAN --RollBack in case of Error
			END
			
			DECLARE @message varchar(500) = ERROR_MESSAGE()
			DECLARE @severity int = ERROR_SEVERITY()
			RAISERROR(@message, @severity, 1)

	END CATCH
	
END

;

;

;














GO
/****** Object:  StoredProcedure [dbo].[Unit_TimeSync]    Script Date: 03/15/2013 11:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Francesco Leonetti (francesco.leonetti@gorba.com)
-- Create date: Friday, March 30th
-- Description:	Sets the request time sync date for the specified unit.
-- =============================================
CREATE PROCEDURE [dbo].[Unit_TimeSync]
(
	@unitId int,
	@requestDate datetime,
	@value datetime
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    BEGIN TRY
		BEGIN TRANSACTION UnitTimeSync_Tx
		
			UPDATE [UnitSet]
			SET [LastTimeSyncRequestDate] = @requestDate
			, [LastTimeSyncValue] = @value
			WHERE [Id] = @unitId
		
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH


		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRAN --RollBack in case of Error
			END
			
			DECLARE @message varchar(500) = ERROR_MESSAGE()
			DECLARE @severity int = ERROR_SEVERITY()
			RAISERROR(@message, @severity, 1)

	END CATCH
	
END

;

;

;














GO
ALTER TABLE [dbo].[UserSet] ADD  CONSTRAINT [DF_UserSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [Gorba_CenterOnline].[dbo].[UserSet]
ADD CONSTRAINT [FK_UserSet_OwnerTenantId] FOREIGN KEY ([OwnerTenantId])
REFERENCES [Gorba_CenterOnline].[dbo].[TenantSet]([Id])USE [Gorba_CenterOnline]
GO
ALTER TABLE [dbo].[OperationSet]  WITH CHECK ADD  CONSTRAINT [FK_OperationSet_UserSet] FOREIGN KEY([UserId])
REFERENCES [UserSet] ([Id])
GO
ALTER TABLE [dbo].[OperationSet] CHECK CONSTRAINT [FK_OperationSet_UserSet]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_StartExecutionDayMon]  DEFAULT ((0)) FOR [StartExecutionDayMon]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_StartExecutionDayTue]  DEFAULT ((0)) FOR [StartExecutionDayTue]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_StartExecutionDayWed]  DEFAULT ((0)) FOR [StartExecutionDayWed]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_StartExecutionDayThu]  DEFAULT ((0)) FOR [StartExecutionDayThu]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_StartExecutionDayFri]  DEFAULT ((0)) FOR [StartExecutionDayFri]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_StartExecutionDaySat]  DEFAULT ((0)) FOR [StartExecutionDaySat]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_StartExecutionDaySun]  DEFAULT ((0)) FOR [StartExecutionDaySun]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_Repetition]  DEFAULT ((0)) FOR [Repetition]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_OperationStatus]  DEFAULT ((0)) FOR [OperationState]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_ExecutionOnceStartDateKind]  DEFAULT ((0)) FOR [ExecutionOnceStartDateKind]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_ExecutionOnceStopDateKind]  DEFAULT ((0)) FOR [ExecutionOnceStopDateKind]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_ExecutionWeeklyStartDate]  DEFAULT ((0)) FOR [ExecutionWeeklyStartDate]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_ExecutionWeeklyStopDateKind]  DEFAULT ((0)) FOR [ExecutionWeeklyStopDateKind]
GO
ALTER TABLE [dbo].[OperationSet] ADD  CONSTRAINT [DF_OperationSet_WeekRepetition]  DEFAULT ((0)) FOR [WeekRepetition]
GO
ALTER TABLE [dbo].[ActivitySet]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySet_OperationSet] FOREIGN KEY([OperationId])
REFERENCES [OperationSet] ([Id])
GO
ALTER TABLE [dbo].[ActivitySet] CHECK CONSTRAINT [FK_ActivitySet_OperationSet]
GO
ALTER TABLE [dbo].[ActivitySet] ADD  CONSTRAINT [DF_ActivitySet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ActivityBusLineOnOffSet]  WITH CHECK ADD  CONSTRAINT [FK_ActivityBusLineOnOffSet_ActivitySet] FOREIGN KEY([Id])
REFERENCES [ActivitySet] ([Id])
GO
ALTER TABLE [dbo].[ActivityBusLineOnOffSet] CHECK CONSTRAINT [FK_ActivityBusLineOnOffSet_ActivitySet]
GO
ALTER TABLE [dbo].[ActivityDeleteTripsSet]  WITH CHECK ADD  CONSTRAINT [FK_ActivityDeleteTripsSet_ActivitySet] FOREIGN KEY([Id])
REFERENCES [ActivitySet] ([Id])
GO
ALTER TABLE [dbo].[ActivityDeleteTripsSet] CHECK CONSTRAINT [FK_ActivityDeleteTripsSet_ActivitySet]
GO
ALTER TABLE [dbo].[ActivityDisplayOnOffSet]  WITH CHECK ADD  CONSTRAINT [FK_ActivityDisplayOnOffSet_ActivitySet] FOREIGN KEY([Id])
REFERENCES [ActivitySet] ([Id])
GO
ALTER TABLE [dbo].[ActivityDisplayOnOffSet] CHECK CONSTRAINT [FK_ActivityDisplayOnOffSet_ActivitySet]
GO
ALTER TABLE [dbo].[ActivityInfoTextSet]  WITH CHECK ADD  CONSTRAINT [FK_InfoLineTextActivitySet_ActivitySet] FOREIGN KEY([Id])
REFERENCES [ActivitySet] ([Id])
GO
ALTER TABLE [dbo].[ActivityInfoTextSet] CHECK CONSTRAINT [FK_InfoLineTextActivitySet_ActivitySet]
GO
ALTER TABLE [dbo].[UnitTypeSet] ADD  CONSTRAINT [DF_UnitTypeSet_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[UnitTypeSet] ADD  CONSTRAINT [DF_UnitTypeSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductTypeSet]  WITH CHECK ADD  CONSTRAINT [FK_ProductTypeSet_UnitTypeSet] FOREIGN KEY([UnitTypeId])
REFERENCES [UnitTypeSet] ([Id])
GO
ALTER TABLE [dbo].[ProductTypeSet] CHECK CONSTRAINT [FK_ProductTypeSet_UnitTypeSet]
GO
ALTER TABLE [dbo].[ProductTypeSet] ADD  CONSTRAINT [DF_ProductTypeSet_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[ProductTypeSet] ADD  CONSTRAINT [DF_ProductTypeSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TenantSet] ADD  CONSTRAINT [DF_TenantSet_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [Gorba_CenterOnline].[dbo].[TenantSet]
ADD CONSTRAINT [TenantSet_UniqueUId] UNIQUE ([UId])
GO
ALTER TABLE [dbo].[TenantSet] ADD  CONSTRAINT [DF_TenantSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[LayoutSet] ADD  CONSTRAINT [DF_LayoutSet_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[LayoutSet] ADD  CONSTRAINT [DF_LayoutSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UnitSet]  WITH CHECK ADD  CONSTRAINT [FK_UnitSet_LayoutSet] FOREIGN KEY([LayoutId])
REFERENCES [LayoutSet] ([Id])
GO
ALTER TABLE [dbo].[UnitSet] CHECK CONSTRAINT [FK_UnitSet_LayoutSet]
GO
ALTER TABLE [dbo].[UnitSet]  WITH CHECK ADD  CONSTRAINT [FK_UnitSet_ProductTypeSet] FOREIGN KEY([ProductTypeId])
REFERENCES [ProductTypeSet] ([Id])
GO
ALTER TABLE [Gorba_CenterOnline].[dbo].[UnitSet]
ADD CONSTRAINT [UnitSet_UniqueUId] UNIQUE ([UId])
GO
ALTER TABLE [dbo].[UnitSet] CHECK CONSTRAINT [FK_UnitSet_ProductTypeSet]
GO
ALTER TABLE [dbo].[UnitSet]  WITH CHECK ADD  CONSTRAINT [FK_UnitSet_TenanttSet] FOREIGN KEY([TenantId])
REFERENCES [TenantSet] ([Id])
GO
ALTER TABLE [dbo].[UnitSet] CHECK CONSTRAINT [FK_UnitSet_TenanttSet]
GO
ALTER TABLE [dbo].[UnitSet] ADD  CONSTRAINT [DF_UnitSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UnitSet] ADD  CONSTRAINT [DF_UnitSet_IsOnline]  DEFAULT ((0)) FOR [IsOnline]
GO
ALTER TABLE [dbo].[ActivityInstanceSet]  WITH CHECK ADD  CONSTRAINT [FK_ActivityInstanceSet_ActivitySet] FOREIGN KEY([ActivityId])
REFERENCES [ActivitySet] ([Id])
GO
ALTER TABLE [dbo].[ActivityInstanceSet] CHECK CONSTRAINT [FK_ActivityInstanceSet_ActivitySet]
GO
ALTER TABLE [dbo].[ActivityInstanceSet]  WITH CHECK ADD  CONSTRAINT [FK_ActivityInstanceSet_UnitSet] FOREIGN KEY([UnitId])
REFERENCES [UnitSet] ([Id])
GO
ALTER TABLE [dbo].[ActivityInstanceSet] CHECK CONSTRAINT [FK_ActivityInstanceSet_UnitSet]
GO
ALTER TABLE [dbo].[ActivityInstanceSet] ADD  CONSTRAINT [DF_ActivityInstanceSet_DateCreated_1]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ActivityInstanceStateSet]  WITH CHECK ADD  CONSTRAINT [FK_ActivityInstanceStateSet_ActivitySet] FOREIGN KEY([ActivityId])
REFERENCES [ActivitySet] ([Id])
GO
ALTER TABLE [dbo].[ActivityInstanceStateSet] CHECK CONSTRAINT [FK_ActivityInstanceStateSet_ActivitySet]
GO
ALTER TABLE [dbo].[ActivityInstanceStateSet]  WITH CHECK ADD  CONSTRAINT [FK_ActivityInstanceStateSet_UnitSet] FOREIGN KEY([UnitId])
REFERENCES [UnitSet] ([Id])
GO
ALTER TABLE [dbo].[ActivityInstanceStateSet] CHECK CONSTRAINT [FK_ActivityInstanceStateSet_UnitSet]
GO
ALTER TABLE [dbo].[ActivityTaskSet] ADD  CONSTRAINT [DF_ActivityInstanceSet_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[AlarmSet]  WITH CHECK ADD  CONSTRAINT [FK_AlarmSet_UnitSet] FOREIGN KEY([UnitId])
REFERENCES [UnitSet] ([Id])
GO
ALTER TABLE [dbo].[AlarmSet] CHECK CONSTRAINT [FK_AlarmSet_UnitSet]
GO
ALTER TABLE [dbo].[AlarmSet]  WITH CHECK ADD  CONSTRAINT [FK_AlarmSet_UserSet] FOREIGN KEY([UserId])
REFERENCES [UserSet] ([Id])
GO
ALTER TABLE [dbo].[AlarmSet] CHECK CONSTRAINT [FK_AlarmSet_UserSet]
GO
ALTER TABLE [dbo].[AlarmSet] ADD  CONSTRAINT [DF_AlarmSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AnnouncementTextSet]  WITH CHECK ADD  CONSTRAINT [FK_AnnouncementTextSet_AnnouncementActivitySet] FOREIGN KEY([AnnouncementId])
REFERENCES [ActivityAnnouncementTextSet] ([Id])
GO
ALTER TABLE [dbo].[AnnouncementTextSet] CHECK CONSTRAINT [FK_AnnouncementTextSet_AnnouncementActivitySet]
GO
ALTER TABLE [dbo].[UserRoleSet] ADD  CONSTRAINT [DF_UserRoleSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DataScopeSet] ADD  CONSTRAINT [DF_DataScopeSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PermissionSet] ADD  CONSTRAINT [DF_PermissionSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AssociationPermissionDataScopeUserRoleSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationPermissionDataScopeUserRoleSet_DataScopeSet] FOREIGN KEY([DataScopeId])
REFERENCES [DataScopeSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationPermissionDataScopeUserRoleSet] CHECK CONSTRAINT [FK_AssociationPermissionDataScopeUserRoleSet_DataScopeSet]
GO
ALTER TABLE [dbo].[AssociationPermissionDataScopeUserRoleSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationPermissionDataScopeUserRoleSet_PermissionSet] FOREIGN KEY([PermissionId])
REFERENCES [PermissionSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationPermissionDataScopeUserRoleSet] CHECK CONSTRAINT [FK_AssociationPermissionDataScopeUserRoleSet_PermissionSet]
GO
ALTER TABLE [dbo].[AssociationPermissionDataScopeUserRoleSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationPermissionDataScopeUserRoleSet_UserRoleSet] FOREIGN KEY([UserRoleId])
REFERENCES [UserRoleSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationPermissionDataScopeUserRoleSet] CHECK CONSTRAINT [FK_AssociationPermissionDataScopeUserRoleSet_UserRoleSet]
GO
ALTER TABLE [dbo].[AssociationPermissionDataScopeUserRoleSet] ADD  CONSTRAINT [DF_PermissionDataScopeUserRoleSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AssociationTenantUserUserRoleSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationTenantUserUserRoleSet_TenantSet] FOREIGN KEY([TenantId])
REFERENCES [TenantSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationTenantUserUserRoleSet] CHECK CONSTRAINT [FK_AssociationTenantUserUserRoleSet_TenantSet]
GO
ALTER TABLE [dbo].[AssociationTenantUserUserRoleSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationTenantUserUserRoleSet_UserRoleSet] FOREIGN KEY([UserRoleId])
REFERENCES [UserRoleSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationTenantUserUserRoleSet] CHECK CONSTRAINT [FK_AssociationTenantUserUserRoleSet_UserRoleSet]
GO
ALTER TABLE [dbo].[AssociationTenantUserUserRoleSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationTenantUserUserRoleSet_UserSet] FOREIGN KEY([UserId])
REFERENCES [UserSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationTenantUserUserRoleSet] CHECK CONSTRAINT [FK_AssociationTenantUserUserRoleSet_UserSet]
GO
ALTER TABLE [dbo].[AssociationTenantUserUserRoleSet] ADD  CONSTRAINT [DF_AssociationTenantUserUserRoleSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AssociationUnitOperationSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationUnitOperationSet_OperationSet] FOREIGN KEY([OperationId])
REFERENCES [OperationSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationUnitOperationSet] CHECK CONSTRAINT [FK_AssociationUnitOperationSet_OperationSet]
GO
ALTER TABLE [dbo].[AssociationUnitOperationSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationUnitOperationSet_UnitSet] FOREIGN KEY([UnitId])
REFERENCES [UnitSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationUnitOperationSet] CHECK CONSTRAINT [FK_AssociationUnitOperationSet_UnitSet]
GO
ALTER TABLE [dbo].[AssociationUnitOperationSet] ADD  CONSTRAINT [DF_AssociationUnitOperationSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UnitGroupTypeSet] ADD  CONSTRAINT [DF_UnitGroupTypeSet_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[UnitGroupTypeSet] ADD  CONSTRAINT [DF_UnitGroupTypeSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UnitGroupSet]  WITH CHECK ADD  CONSTRAINT [FK_UnitGroupSet_ParentUnitGroupSet] FOREIGN KEY([ParentId])
REFERENCES [UnitGroupSet] ([Id])
GO
ALTER TABLE [dbo].[UnitGroupSet] CHECK CONSTRAINT [FK_UnitGroupSet_ParentUnitGroupSet]
GO
ALTER TABLE [dbo].[UnitGroupSet]  WITH CHECK ADD  CONSTRAINT [FK_UnitGroupSet_TenantSet] FOREIGN KEY([TenantId])
REFERENCES [TenantSet] ([Id])
GO
ALTER TABLE [dbo].[UnitGroupSet] CHECK CONSTRAINT [FK_UnitGroupSet_TenantSet]
GO
ALTER TABLE [dbo].[UnitGroupSet]  WITH CHECK ADD  CONSTRAINT [FK_UnitGroupSet_UnitGroupTypeSet] FOREIGN KEY([GroupTypeId])
REFERENCES [UnitGroupTypeSet] ([Id])
GO
ALTER TABLE [dbo].[UnitGroupSet] CHECK CONSTRAINT [FK_UnitGroupSet_UnitGroupTypeSet]
GO
ALTER TABLE [dbo].[UnitGroupSet] ADD  CONSTRAINT [DF_UnitGroupSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AssociationUnitUnitGroupSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationUnitUnitGroupSet_UnitGroupSet] FOREIGN KEY([UnitGroupId])
REFERENCES [UnitGroupSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationUnitUnitGroupSet] CHECK CONSTRAINT [FK_AssociationUnitUnitGroupSet_UnitGroupSet]
GO
ALTER TABLE [dbo].[AssociationUnitUnitGroupSet]  WITH CHECK ADD  CONSTRAINT [FK_AssociationUnitUnitGroupSet_UnitSet] FOREIGN KEY([UnitId])
REFERENCES [UnitSet] ([Id])
GO
ALTER TABLE [dbo].[AssociationUnitUnitGroupSet] CHECK CONSTRAINT [FK_AssociationUnitUnitGroupSet_UnitSet]
GO
ALTER TABLE [dbo].[AssociationUnitUnitGroupSet] ADD  CONSTRAINT [DF_AssociationUnitUnitGroupSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ItcsProviderSet]  WITH CHECK ADD  CONSTRAINT [FK_ItcsProviders_ProtocolTypeSet] FOREIGN KEY([ProtocolTypeId])
REFERENCES [ProtocolTypeSet] ([Id])
GO
ALTER TABLE [dbo].[ItcsProviderSet] CHECK CONSTRAINT [FK_ItcsProviders_ProtocolTypeSet]
GO
ALTER TABLE [dbo].[ItcsDisplayAreaSet]  WITH CHECK ADD  CONSTRAINT [FK_ItcsDisplayAreas_ItcsProviders] FOREIGN KEY([ProviderId])
REFERENCES [ItcsProviderSet] ([Id])
GO
ALTER TABLE [dbo].[ItcsDisplayAreaSet] CHECK CONSTRAINT [FK_ItcsDisplayAreas_ItcsProviders]
GO
ALTER TABLE [dbo].[ItcsFilterSet]  WITH NOCHECK ADD  CONSTRAINT [FK_ItcsFilters_ItcsDisplayAreas] FOREIGN KEY([ItcsDisplayAreaId])
REFERENCES [ItcsDisplayAreaSet] ([Id])
GO
ALTER TABLE [dbo].[ItcsFilterSet] CHECK CONSTRAINT [FK_ItcsFilters_ItcsDisplayAreas]
GO
ALTER TABLE [dbo].[ItcsFilterSet]  WITH NOCHECK ADD  CONSTRAINT [FK_ItcsFilters_StopPoints] FOREIGN KEY([StopPointId])
REFERENCES [StopPointSet] ([Id])
GO
ALTER TABLE [dbo].[ItcsFilterSet] CHECK CONSTRAINT [FK_ItcsFilters_StopPoints]
GO
ALTER TABLE [dbo].[ItcsLineSpecialTextSet]  WITH CHECK ADD  CONSTRAINT [FK_ItcsLineSpecialTextSet_ItcsDisplayAreas] FOREIGN KEY([ItcsDisplayAreaId])
REFERENCES [ItcsDisplayAreaSet] ([Id])
GO
ALTER TABLE [dbo].[ItcsLineSpecialTextSet] CHECK CONSTRAINT [FK_ItcsLineSpecialTextSet_ItcsDisplayAreas]
GO
ALTER TABLE [dbo].[ItcsLineSpecialTextSet] ADD  CONSTRAINT [DF_ItcsLineSpecialTextSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ItcsTimeTableEntrySet]  WITH CHECK ADD  CONSTRAINT [FK_ItcsTimeTableEntrySet_ItcsDisplayAreas] FOREIGN KEY([ItcsDisplayAreaId])
REFERENCES [ItcsDisplayAreaSet] ([Id])
GO
ALTER TABLE [dbo].[ItcsTimeTableEntrySet] CHECK CONSTRAINT [FK_ItcsTimeTableEntrySet_ItcsDisplayAreas]
GO
ALTER TABLE [dbo].[ItcsTimeTableEntrySet] ADD  CONSTRAINT [DF_ItcsTimeTableEntrySet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ItcsRealtimeDataSet]  WITH CHECK ADD  CONSTRAINT [FK_ItcsRealtimeDataSet_ItcsTimeTableEntrySet] FOREIGN KEY([ItcsTimeTableEntryId])
REFERENCES [ItcsTimeTableEntrySet] ([Id])
GO
ALTER TABLE [dbo].[ItcsRealtimeDataSet] CHECK CONSTRAINT [FK_ItcsRealtimeDataSet_ItcsTimeTableEntrySet]
GO
ALTER TABLE [dbo].[ItcsTextMappingSet]  WITH CHECK ADD  CONSTRAINT [FK_ItcsTextMappingSet_ItcsProviders] FOREIGN KEY([ItcsProviderId])
REFERENCES [ItcsProviderSet] ([Id])
GO
ALTER TABLE [dbo].[ItcsTextMappingSet] CHECK CONSTRAINT [FK_ItcsTextMappingSet_ItcsProviders]
GO
ALTER TABLE [dbo].[ItcsTextMappingSet]  WITH CHECK ADD  CONSTRAINT [FK_ItcsTextMappingSet_ProductTypeSet] FOREIGN KEY([ProductTypeId])
REFERENCES [ProductTypeSet] ([Id])
GO
ALTER TABLE [dbo].[ItcsTextMappingSet] CHECK CONSTRAINT [FK_ItcsTextMappingSet_ProductTypeSet]
GO
ALTER TABLE [dbo].[ItcsTextMappingSet] ADD  CONSTRAINT [DF_ItcsTextMappingSet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProtocolConfigurationSet]  WITH CHECK ADD  CONSTRAINT [FK_ProtocolConfiguration_ProtocolType] FOREIGN KEY([ProtocolTypeId])
REFERENCES [ProtocolTypeSet] ([Id])
GO
ALTER TABLE [dbo].[ProtocolConfigurationSet] CHECK CONSTRAINT [FK_ProtocolConfiguration_ProtocolType]
GO
ALTER TABLE [dbo].[ReferenceTextSet]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceTextSet_UnitSet] FOREIGN KEY([UnitId])
REFERENCES [UnitSet] ([Id])
GO
ALTER TABLE [dbo].[ReferenceTextSet] CHECK CONSTRAINT [FK_ReferenceTextSet_UnitSet]
GO
ALTER TABLE [dbo].[ReferenceTextSet] ADD  CONSTRAINT [DF_ReferenceTextSet_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SeveritySet] ADD  CONSTRAINT [DF_SeveritySet_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO

-- Configuring snapshot isolation 

ALTER DATABASE [Gorba_CenterOnline] SET allow_snapshot_isolation ON
GO
ALTER DATABASE [Gorba_CenterOnline] SET READ_COMMITTED_SNAPSHOT ON;
GO


SET IDENTITY_INSERT [dbo].[DatabaseVersionSet] ON 

GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (1, N'Version 1.0.1.0', N'Initial version of the database. This is the base for all future development.', 1, 0, 1, 0, CAST(0x00009FB000C5C100 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (2, N'Version 1.0.1.1', N'Added basic tables.', 1, 0, 1, 1, CAST(0x00009FB10087F4B0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (3, N'Version 1.0.1.2', N'Added tables for workflows, operations and activities. Other minor improvements to tables and SPs.', 1, 0, 1, 2, CAST(0x00009FB200A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (4, N'Version 1.0.1.3', N'Added tables, views and stored procedures for itcs clientµ. Task id 413', 1, 0, 1, 3, CAST(0x00009FB700F73140 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (5, N'Version 1.0.1.4', N'Added tables, views and SPs for Itcs timetable, realtime, scheduled, station and infolinetext.', 1, 0, 1, 4, CAST(0x00009FB701140810 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (6, N'Version 1.0.1.5', N'Changes and fixes for Operations and Activities. Removed the connection to workflows.', 1, 0, 1, 5, CAST(0x00009FB900B54640 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (7, N'Version 1.0.1.6', N'Added association between units and stations. Added the network address to the units. Other improvements to tables and SPs', 1, 0, 1, 6, CAST(0x00009FC10083D600 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (8, N'Version 1.0.2.7', N'Added access levels', 1, 0, 2, 7, CAST(0x00009FCF00C5C100 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (9, N'Version 1.0.2.8', N'Added tables for alarms.', 1, 0, 2, 8, CAST(0x00009FD400A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (10, N'Version 1.0.2.9', N'Changes to meet naming conventions', 1, 0, 2, 9, CAST(0x00009FD401300BF0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (11, N'Version 1.0.2.10', N'Changes to meet naming conventions; updates activity and InfoLineTextActivity', 1, 0, 2, 10, CAST(0x00009FDB00EEF3E0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (12, N'Version 1.0.2.11', N'Renamed SP InfoLineText_Insert into InfoLineTextActivity_Insert and updated it. Added SP InfoLineTextActivity_Delete. Both call the base SP activity_XXX.', 1, 0, 2, 11, CAST(0x00009FDB00BAC480 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (13, N'Version 1.0.3.12', N'Fixed some minor issues. Moved UnitId from Activity to Operation.', 1, 0, 3, 12, CAST(0x00009FDE00C042C0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (14, N'Version 1.0.4.13', N'Removed UnitId from Operations.', 1, 0, 4, 13, CAST(0x00009FE40107AC00 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (15, N'Version 1.0.4.14', N'Changes in the OperationSet and related views and SPs.', 1, 0, 4, 14, CAST(0x00009FED0107AC00 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (16, N'Version 1.0.5.15', N'Added SPs Operation_SelectByUser, Unit_SelectByTenant and Unit_SelectByTenantOfUser for filtering', 1, 0, 5, 15, CAST(0x00009FF700EB1B80 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (17, N'Version 1.0.5.16', N'Added properties IsOnline, LastSeenOnline, Culture and modified related SP. Add SP Unit_Update.', 1, 0, 5, 16, CAST(0x00009FF800F1F950 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (18, N'Version 1.0.5.17', N'Added SP GetActivitySubmissions', 1, 0, 5, 17, CAST(0x00009FF900BAC480 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (19, N'Database version 1.0.6.18', N'Fixed SPs Unit_SelectByTenantOfUser and Operation_SelectByUser', 1, 0, 6, 18, CAST(0x0000A00B007A58B4 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (20, N'Version 1.0.8.19', N'Added fields to the unit table.', 1, 0, 8, 19, CAST(0x0000A02200A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (21, N'Version 1.0.8.20', N'Added stations and lines. Other minor changes to users and units.', 1, 0, 8, 20, CAST(0x0000A02300A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (22, N'Version 1.0.8.21', N'Added Unit_Restart and Unit_TimeSync SPs.', 1, 0, 8, 21, CAST(0x0000A02400A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (23, N'Version 1.0.8.22', N'Added Activity status on the operations.', 1, 0, 8, 22, CAST(0x0000A02700A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (24, N'Version 1.0.8.23', N'Fixed bug in the Operation_GetActivitySubmissions SP.', 1, 0, 8, 23, CAST(0x0000A02900A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (25, N'Version 1.0.10.24', N'Updated the alarms. Removed the alarm type and status from alarms.', 1, 0, 10, 24, CAST(0x0000A03900A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (26, N'Version 1.0.10.25', N'Updated the alarms.', 1, 0, 10, 25, CAST(0x0000A03E00A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (27, N'Version 1.0.10.26', N'Added Itcs specific tables.', 1, 0, 10, 26, CAST(0x0000A04400A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (28, N'Version 1.0.11.27', N'Added computed fields to alarms and operations.', 1, 0, 11, 27, CAST(0x0000A04A00A78AA0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (29, N'Version 1.0.11.28', N'Extended Itcs model.', 1, 0, 11, 28, CAST(0x0000A04C00761A60 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (30, N'Version 1.0.11.29', N'Added directions.', 1, 0, 11, 29, CAST(0x0000A05100761A60 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (31, N'Version 1.0.12.30', N'Minor changes.', 1, 0, 12, 30, CAST(0x0000A05800761A60 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (32, N'Version 1.0.13.31', N'Remove ItcsConfiguration and added Properties field to the ItcsProvider and the ItcsFilter.', 1, 0, 13, 31, CAST(0x0000A06300761A60 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (33, N'Version 1.0.13.32', N'Updated Units view to compute the AlarmStatus column. Changed the logic of the UnconfirmedSince column.', 1, 0, 13, 32, CAST(0x0000A06700761A60 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (34, N'Version 1.0.13.33', N'Fixed error in the Units view.', 1, 0, 13, 33, CAST(0x0000A06800761A60 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (35, N'Version 1.0.13.34', N'Fixed the Units view.', 1, 0, 13, 34, CAST(0x0000A06800970FE0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (36, N'Version 1.0.13.35', N'Removed ItcsConfiguration and ProtocolConfiguration.', 1, 0, 13, 35, CAST(0x0000A06900970FE0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (37, N'Version 1.0.13.36', N'Added ActivityDisplayOnOff and ActivityDeleteTrips.', 1, 0, 13, 36, CAST(0x0000A06900B80560 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (38, N'Version 1.0.13.37', N'Added missing State column to the ActivityInstanceState table.', 1, 0, 13, 37, CAST(0x0000A06A00B80560 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (39, N'Version 1.0.13.38', N'Edited the Operations view to get the state from the ActivityInfoStates.', 1, 0, 13, 38, CAST(0x0000A06D00869520 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (40, N'Version 1.0.14.39', N'Added TimeZoneInfoId to UserSet, RealTaskId to ActivitySet, AlarmMessageId to AlarmSet and updated the views.', 1, 0, 14, 39, CAST(0x0000A07600B00E50 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (41, N'Version 1.0.14.40', N'Edited views to support activity state tracking.', 1, 0, 14, 40, CAST(0x0000A07B008F18D0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (42, N'Version 1.0.15.41', N'Edited views to support activity state tracking.', 1, 0, 15, 41, CAST(0x0000A07F008F18D0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (43, N'Version 1.0.15.42', N'Add VdvMessageSet and view. Delete tables TimeTableEntrySet, RealtimeDataSet and ScheduledDataSet.', 1, 0, 15, 42, CAST(0x0000A084011494B0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (44, N'Version 1.0.15.43', N'Updated Operations and Units views.', 1, 0, 15, 43, CAST(0x0000A0890090BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (45, N'Version 1.0.15.44', N'ItcsProviders.Properties changes from xml to varchar.', 1, 0, 15, 44, CAST(0x0000A08A0090BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (46, N'Version 1.0.16.45', N'Changes in Vdv messages and reference texts. Fixed bug in the Operations view.', 1, 0, 16, 45, CAST(0x0000A0930090BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (47, N'Version 1.0.16.46', N'Added the ClearItcsData SP.', 1, 0, 16, 46, CAST(0x0000A0970090BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (48, N'Version 1.0.17.47', N'Added the ClearOperations SP, refactored the status management in Units, Operations and Activities. Added the Activity instances.', 1, 0, 17, 47, CAST(0x0000A0A10090BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (49, N'Version 1.0.17.48', N'Activity status management changes.', 1, 0, 17, 48, CAST(0x0000A0A50090BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (50, N'Version 1.0.18.49', N'Fixed Announcement, Line on/off and Delete trip activity tables. Other minor fixes.', 1, 0, 18, 49, CAST(0x0000A0AE0090BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (51, N'Version 1.0.18.50', N'Added computed IsConfirmed column, updated ActivityBusLineOnOff.', 1, 0, 18, 50, CAST(0x0000A0AF0090BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (52, N'Version 1.0.19.51', N'Added IsConfirmed to alarms.', 1, 0, 19, 51, CAST(0x0000A0B700F0BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (53, N'Version 1.0.21.52', N'Rename table ItcsFilters to ItcsFilterSet, add view ItcsFilters, make index UserSetUsername unique.', 1, 0, 21, 52, CAST(0x0000A0D700A0BEB0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (54, N'Version 1.0.22.53', N'Add table, view and stored procedure to handle the relation 0..n between units and unit groups.Remove GroupId from UnitSet table and relatives database objects.', 1, 0, 22, 53, CAST(0x0000A0E600000000 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (55, N'Version 1.0.22.54', N'Remove the UnitGroup_SelectAssociatedUnits stored procedure because we don t need it and contained a fixed value.', 1, 0, 22, 54, CAST(0x0000A0EB00000000 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (56, N'Version 1.0.23.55', N'Added ItcsTimeTableEntrySet and ItcsRealtimeDataSet tables (and relative views). Removed VdvMessageSet, StationSet, WorkflowSet and WorkflowInstanceSet (and all relative views and SPs). Changed xml fields to varchar(MAX).', 1, 0, 23, 55, CAST(0x0000A0F400000000 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (57, N'Version 1.0.23.56', N'Added flag HasDisruption to ItcsRealtimeDataSet. Change ReferenceId of ItcsProviders from varchar to int. Remove IsDeleted from ItcsRealtimeDataSet and add IsTripDeleted to ItcsTimeTableEntrySet. Update related views.', 1, 0, 23, 56, CAST(0x0000A0F900000000 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (58, N'Version 1.0.24.57', N'Change Real and Estimated datetime columns of ItcsRealtimeDataSet to allow NULL.', 1, 0, 24, 57, CAST(0x0000A10200000000 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (59, N'Version 1.0.25.58', N'Changed computed column OperationSet.IsRevoked to be a bit instad of an integer. Added Removed properties to ActivitySet and ActivityInstanceSet.', 1, 0, 25, 58, CAST(0x0000A11000BD83A0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (60, N'Version 1.1.29.59', N'Rename columns in ItcsRealtimeSet to match Vdv spec. Add missing fields to ItcsTimeTableEntrySet and ItcsRealtimeSet and update the views. Add tables ItcsTextMappingSet, ItcsLineSpecialTextSet and views', 1, 1, 29, 59, CAST(0x0000A14F011148F0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (61, N'Version 1.1.29.60', N'Refactoring for the code quality. Removed unused stored procedures and tables. Fixed naming according to conventions already used/defined.', 1, 1, 29, 60, CAST(0x0000A15400EEF3E0 AS DateTime))
GO


INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (62, N'Version 1.1.32.61', N'Changing identifiers for ItcsTimeTableEntrySet and ItcsRealtimeDataSet from int to uniqueidentifier to support bulk inserts.', 1, 1, 32, 61, CAST(0x0000A18200BD83A0 AS DateTime))
GO

INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (63, N'Version 1.1.33.62', N'Add unique index for text mapping set.', 1, 1, 33, 62, CAST(0x0000A18C00F80000 AS DateTime))
GO

INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (64, N'Version 1.3.41.63', N'Tenant is now nullable in the association with users and user roles.', 1, 3, 41, 63, CAST(0x0000A1FD00787794 AS DateTime))
GO

INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (65, N'Version 1.3.45.64', N'Added OwnerTenantId to Users. Renamed column [UserSet].[Name] to [UserSet].[FirstName]. Added [UId] column to TenantSet and UnitSet. Updated views to reflect the changes.', 1, 3, 45, 64, CAST(0x0000A22F009450C0 AS DateTime))
GO

INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (66, N'Version 1.4.47.65', N'Added column Priority to table OperationSet and updated the view.', 1, 4, 47, 65, CAST(0x0000A253009450C0 AS DateTime))
GO

INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (67, N'Version 1.4.48.66', N'Added columns SuspendedActivityInstancesCount, SuspendingActivityInstancesCount and IsUpdating to table ActivitySet, columns SuspendedOperationsCount and SuspendingOperationsCount to UnitSet, columns SuspendedActivitiesCount and SuspendingActivitiesCount to OperationSet and updated the views.', 1, 4, 48, 66, CAST(0x0000A261009450C0 AS DateTime))
GO

INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (68, N'Version 1.4.49.67', N'Moved column IsUpdating from ActivitySet to ActivityInstanceSet and updated the views.', 1, 4, 49, 67, CAST(0x0000A26F009450C0 AS DateTime))
GO

INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (69, N'Version 1.5.201410.68', N'Added Start and Scheduling information to ActivityInstance.', 1, 5, 201410, 68, CAST(0x0000A32C009450C0 AS DateTime))
GO

INSERT [dbo].[DatabaseVersionSet] ([Id], [Name], [Description], [VersionMajor], [VersionMinor], [VersionBuild], [VersionRevision], [DateCreated]) VALUES (70, N'Version 1.5.201410.69', N'Added information about revoking and completing activity instances.', 1, 5, 201410, 69, CAST(0x0000A330009450C0 AS DateTime))
GO

SET IDENTITY_INSERT [dbo].[DatabaseVersionSet] OFF
GO
