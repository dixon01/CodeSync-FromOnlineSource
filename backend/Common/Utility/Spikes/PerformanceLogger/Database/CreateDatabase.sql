USE [master]
GO
/****** Object:  Database [PerformanceLogger]    Script Date: 01/23/2013 13:39:05 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PerformanceLogger')
BEGIN
CREATE DATABASE [PerformanceLogger] ON  PRIMARY 
( NAME = N'PerformanceLogger', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PerformanceLogger.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PerformanceLogger_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PerformanceLogger_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [PerformanceLogger] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PerformanceLogger].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PerformanceLogger] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PerformanceLogger] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PerformanceLogger] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PerformanceLogger] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PerformanceLogger] SET ARITHABORT OFF
GO
ALTER DATABASE [PerformanceLogger] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [PerformanceLogger] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PerformanceLogger] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PerformanceLogger] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PerformanceLogger] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PerformanceLogger] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PerformanceLogger] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PerformanceLogger] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PerformanceLogger] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PerformanceLogger] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PerformanceLogger] SET  DISABLE_BROKER
GO
ALTER DATABASE [PerformanceLogger] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PerformanceLogger] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PerformanceLogger] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PerformanceLogger] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PerformanceLogger] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PerformanceLogger] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PerformanceLogger] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PerformanceLogger] SET  READ_WRITE
GO
ALTER DATABASE [PerformanceLogger] SET RECOVERY FULL
GO
ALTER DATABASE [PerformanceLogger] SET  MULTI_USER
GO
ALTER DATABASE [PerformanceLogger] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PerformanceLogger] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'PerformanceLogger', N'ON'
GO
USE [PerformanceLogger]
GO
/****** Object:  ForeignKey [FK_Entries_Sessions]    Script Date: 01/23/2013 13:39:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Entries_Sessions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Entries]'))
ALTER TABLE [dbo].[Entries] DROP CONSTRAINT [FK_Entries_Sessions]
GO
/****** Object:  StoredProcedure [dbo].[LogEntry]    Script Date: 01/23/2013 13:39:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogEntry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LogEntry]
GO
/****** Object:  StoredProcedure [dbo].[CreateSession]    Script Date: 01/23/2013 13:39:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateSession]
GO
/****** Object:  Table [dbo].[Entries]    Script Date: 01/23/2013 13:39:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Entries_Sessions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Entries]'))
ALTER TABLE [dbo].[Entries] DROP CONSTRAINT [FK_Entries_Sessions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Entries]') AND type in (N'U'))
DROP TABLE [dbo].[Entries]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 01/23/2013 13:39:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Sessions_StartDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sessions] DROP CONSTRAINT [DF_Sessions_StartDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessions]') AND type in (N'U'))
DROP TABLE [dbo].[Sessions]
GO
/****** Object:  User [PerformanceLogger]    Script Date: 01/23/2013 13:39:05 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PerformanceLogger')
DROP USER [PerformanceLogger]
GO
USE [master]
GO
/****** Object:  Login [PerformanceLogger]    Script Date: 01/23/2013 13:39:05 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'PerformanceLogger')
DROP LOGIN [PerformanceLogger]
GO
/****** Object:  Login [PerformanceLogger]    Script Date: 01/23/2013 13:39:05 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'PerformanceLogger')
CREATE LOGIN [PerformanceLogger] WITH PASSWORD=N'A­ØrÔR©	÷o@~u û iú^´', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [PerformanceLogger] DISABLE
GO
USE [PerformanceLogger]
GO
/****** Object:  User [PerformanceLogger]    Script Date: 01/23/2013 13:39:05 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PerformanceLogger')
CREATE USER [PerformanceLogger] FOR LOGIN [PerformanceLogger] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 01/23/2013 13:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL CONSTRAINT [DF_Sessions_StartDate]  DEFAULT (getutcdate()),
	[Machine] [varchar](160) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entries]    Script Date: 01/23/2013 13:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Entries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Entries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [int] NOT NULL,
	[EntryId] [int] NOT NULL,
	[TickCount] [int] NOT NULL,
	[Tag] [varchar](160) NOT NULL,
 CONSTRAINT [PK_Entries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[CreateSession]    Script Date: 01/23/2013 13:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateSession]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateSession] 
	-- Add the parameters for the stored procedure here
	@MachineName varchar(160),
	@Description varchar(500) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [PerformanceLogger].[dbo].[Sessions]
           ([Machine]
           ,[Description])
     VALUES
           (@MachineName
           , @Description)
     DECLARE @id int = SCOPE_IDENTITY()
     SELECT @id
     RETURN @id
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[LogEntry]    Script Date: 01/23/2013 13:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogEntry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogEntry]
	@SessionId int,
	@EntryId int,
	@TickCount int,
	@Tag varchar(160) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [PerformanceLogger].[dbo].[Entries]
           ([SessionId]
           ,[EntryId]
           ,[TickCount]
           , [Tag])
     VALUES
           (@SessionId
           , @EntryId
           , @TickCount
           , @Tag)

END
' 
END
GO
/****** Object:  ForeignKey [FK_Entries_Sessions]    Script Date: 01/23/2013 13:39:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Entries_Sessions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Entries]'))
ALTER TABLE [dbo].[Entries]  WITH CHECK ADD  CONSTRAINT [FK_Entries_Sessions] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Entries_Sessions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Entries]'))
ALTER TABLE [dbo].[Entries] CHECK CONSTRAINT [FK_Entries_Sessions]
GO
