USE [master]
GO
/****** Object:  Database [PublicDB]    Script Date: 2016/8/1 下午 01:54:51 ******/
CREATE DATABASE [PublicDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'USER_Information', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PublicDB.mdf' , SIZE = 51200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'USER_Information_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PublicDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PublicDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PublicDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PublicDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PublicDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PublicDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PublicDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PublicDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PublicDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PublicDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PublicDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PublicDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PublicDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PublicDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PublicDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PublicDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PublicDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PublicDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PublicDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PublicDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PublicDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PublicDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PublicDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PublicDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PublicDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PublicDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PublicDB] SET  MULTI_USER 
GO
ALTER DATABASE [PublicDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PublicDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PublicDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PublicDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PublicDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PublicDB', N'ON'
GO
USE [PublicDB]
GO
/****** Object:  Table [dbo].[AI_Case_Private_Com1]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AI_Case_Private_Com1](
	[CaseID] [bigint] NOT NULL,
	[AIid] [bigint] NULL,
	[X1] [decimal](10, 5) NULL,
	[X2] [decimal](10, 5) NULL,
	[X3] [decimal](10, 5) NULL,
	[X4] [decimal](10, 5) NULL,
	[X5] [decimal](10, 5) NULL,
	[X6] [decimal](10, 5) NULL,
	[X7] [decimal](10, 5) NULL,
	[X8] [decimal](10, 5) NULL,
	[X9] [decimal](10, 5) NULL,
	[X10] [decimal](10, 5) NULL,
	[X11] [decimal](10, 5) NULL,
	[X12] [decimal](10, 5) NULL,
	[X13] [decimal](10, 5) NULL,
	[X14] [decimal](10, 5) NULL,
	[X15] [decimal](10, 5) NULL,
	[X16] [decimal](10, 5) NULL,
	[X17] [decimal](10, 5) NULL,
	[X18] [decimal](10, 5) NULL,
	[X19] [decimal](10, 5) NULL,
	[X20] [decimal](10, 5) NULL,
	[Y] [decimal](10, 5) NULL,
 CONSTRAINT [PK_AI_Case_Private_Com1] PRIMARY KEY CLUSTERED 
(
	[CaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AI_Case_Public]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AI_Case_Public](
	[CaseID] [bigint] IDENTITY(1,1) NOT NULL,
	[AIid] [bigint] NULL,
	[X1] [decimal](10, 5) NULL,
	[X2] [decimal](10, 5) NULL,
	[X3] [decimal](10, 5) NULL,
	[X4] [decimal](10, 5) NULL,
	[X5] [decimal](10, 5) NULL,
	[X6] [decimal](10, 5) NULL,
	[X7] [decimal](10, 5) NULL,
	[X8] [decimal](10, 5) NULL,
	[X9] [decimal](10, 5) NULL,
	[X10] [decimal](10, 5) NULL,
	[X11] [decimal](10, 5) NULL,
	[X12] [decimal](10, 5) NULL,
	[X13] [decimal](10, 5) NULL,
	[X14] [decimal](10, 5) NULL,
	[X15] [decimal](10, 5) NULL,
	[X16] [decimal](10, 5) NULL,
	[X17] [decimal](10, 5) NULL,
	[X18] [decimal](10, 5) NULL,
	[X19] [decimal](10, 5) NULL,
	[X20] [decimal](10, 5) NULL,
	[Y] [decimal](10, 5) NULL,
 CONSTRAINT [PK_AI_Case] PRIMARY KEY CLUSTERED 
(
	[CaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AI_Module]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AI_Module](
	[AIid] [bigint] IDENTITY(1,1) NOT NULL,
	[Sequ] [bigint] NULL,
	[AIName] [nvarchar](50) NULL,
	[gamma] [nvarchar](50) NULL,
	[C] [nvarchar](50) NULL,
	[ParamentNum] [bigint] NULL,
	[UpdateTime] [date] NULL,
 CONSTRAINT [PK_AI_Public] PRIMARY KEY CLUSTERED 
(
	[AIid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AI_Module_Private]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AI_Module_Private](
	[AIid] [bigint] NOT NULL,
	[CompanyID] [bigint] NULL,
	[gamma] [decimal](5, 5) NULL,
	[C] [decimal](5, 5) NULL,
 CONSTRAINT [PK_AI_Module_Private] PRIMARY KEY CLUSTERED 
(
	[AIid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AI_Parament]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AI_Parament](
	[Tid] [bigint] IDENTITY(1,1) NOT NULL,
	[AIid] [bigint] NOT NULL,
	[Xname1] [nvarchar](20) NULL,
	[Xname2] [nvarchar](20) NULL,
	[Xname3] [nvarchar](20) NULL,
	[Xname4] [nvarchar](20) NULL,
	[Xname5] [nvarchar](20) NULL,
	[Xname6] [nvarchar](20) NULL,
	[Xname7] [nvarchar](20) NULL,
	[Xname8] [nvarchar](20) NULL,
	[Xname9] [nvarchar](20) NULL,
	[Xname10] [nvarchar](20) NULL,
	[Xname11] [nvarchar](20) NULL,
	[Xname12] [nvarchar](20) NULL,
	[Xname13] [nvarchar](20) NULL,
	[Xname14] [nvarchar](20) NULL,
	[Xname15] [nvarchar](20) NULL,
	[Xname16] [nvarchar](20) NULL,
	[Xname17] [nvarchar](20) NULL,
	[Xname18] [nvarchar](20) NULL,
	[Xname19] [nvarchar](20) NULL,
	[Xname20] [nvarchar](20) NULL,
	[Yname] [nvarchar](20) NULL,
 CONSTRAINT [PK_AI_Parament] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChangeResponse]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeResponse](
	[ID] [nvarchar](10) NOT NULL,
	[Response] [nvarchar](50) NULL,
	[Reason] [nvarchar](50) NULL,
 CONSTRAINT [PK_工作表1$] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConstructionElement]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstructionElement](
	[ElementID] [int] IDENTITY(1,1) NOT NULL,
	[ElementFileName] [nvarchar](max) NULL,
	[ElementName] [nvarchar](max) NULL,
	[ElementVersion] [int] NULL,
	[UploadDatetime] [datetime] NULL,
	[UploadPerson] [int] NULL,
	[ReferenceID] [int] NULL,
	[TheNewest] [bit] NULL,
	[Remark] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_ConstructionElement] PRIMARY KEY CLUSTERED 
(
	[ElementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FrimType]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrimType](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Sort] [int] NULL,
 CONSTRAINT [PK_FrimType] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KEngineeringList]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KEngineeringList](
	[KEngineeringListId] [int] IDENTITY(1,1) NOT NULL,
	[KEngineeringListName] [nvarchar](max) NULL,
	[PID] [nvarchar](50) NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[KEngineeringListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KEngineeringListItem]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KEngineeringListItem](
	[KEngineeringListItemId] [int] IDENTITY(1,1) NOT NULL,
	[KEngineeringListItemName] [nvarchar](max) NULL,
	[KEngineeringListItemPhase] [nvarchar](50) NULL,
	[KEngineeringListId] [int] NULL,
	[KEngineeringListItemStandard] [nvarchar](max) NULL,
 CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED 
(
	[KEngineeringListItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[module] [nvarchar](50) NULL,
	[Menu] [nvarchar](50) NULL,
	[link] [nvarchar](50) NULL,
	[Mark] [nvarchar](50) NULL,
	[used] [int] NULL,
	[ordernum] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageList]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageList](
	[Id_no] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NULL,
	[PageName] [nvarchar](250) NULL,
	[PageURL] [nvarchar](50) NULL,
	[UpperModel] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PublicAnalysis]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicAnalysis](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SortNum] [int] NULL,
	[ParentID] [int] NULL,
	[KidID] [int] NULL,
	[WorkRate] [decimal](18, 3) NULL,
 CONSTRAINT [PK_PublicAnalysis] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PublicResource]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicResource](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[Complex] [int] NULL,
	[AnaNumber] [decimal](18, 3) NULL,
	[Code] [nvarchar](max) NULL,
	[Price] [decimal](18, 3) NULL,
	[Notes] [nvarchar](50) NULL,
	[ItemKind] [nvarchar](50) NULL,
 CONSTRAINT [PK_PublicResource] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsualWord]    Script Date: 2016/8/1 下午 01:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsualWord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Content] [nvarchar](max) NULL,
	[Sortnumber] [int] NULL,
	[UnitID] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsualWord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[AI_Case_Private_Com1]  WITH CHECK ADD  CONSTRAINT [FK_AI_Case_Private_Com1_AI_Module_Private] FOREIGN KEY([AIid])
REFERENCES [dbo].[AI_Module_Private] ([AIid])
GO
ALTER TABLE [dbo].[AI_Case_Private_Com1] CHECK CONSTRAINT [FK_AI_Case_Private_Com1_AI_Module_Private]
GO
ALTER TABLE [dbo].[AI_Case_Public]  WITH CHECK ADD  CONSTRAINT [FK_AI_Case_Public_AI_Module] FOREIGN KEY([AIid])
REFERENCES [dbo].[AI_Module] ([AIid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AI_Case_Public] CHECK CONSTRAINT [FK_AI_Case_Public_AI_Module]
GO
ALTER TABLE [dbo].[AI_Module_Private]  WITH CHECK ADD  CONSTRAINT [FK_AI_Module_Private_AI_Module] FOREIGN KEY([AIid])
REFERENCES [dbo].[AI_Module] ([AIid])
GO
ALTER TABLE [dbo].[AI_Module_Private] CHECK CONSTRAINT [FK_AI_Module_Private_AI_Module]
GO
ALTER TABLE [dbo].[AI_Parament]  WITH CHECK ADD  CONSTRAINT [FK_AI_Parament_AI_Module] FOREIGN KEY([AIid])
REFERENCES [dbo].[AI_Module] ([AIid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AI_Parament] CHECK CONSTRAINT [FK_AI_Parament_AI_Module]
GO
ALTER TABLE [dbo].[KEngineeringListItem]  WITH CHECK ADD  CONSTRAINT [FK_items_project] FOREIGN KEY([KEngineeringListId])
REFERENCES [dbo].[KEngineeringList] ([KEngineeringListId])
GO
ALTER TABLE [dbo].[KEngineeringListItem] CHECK CONSTRAINT [FK_items_project]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicAnalysis', @level2type=N'COLUMN',@level2name=N'UID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicAnalysis', @level2type=N'COLUMN',@level2name=N'SortNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父項PriceID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicAnalysis', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子項PriceID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicAnalysis', @level2type=N'COLUMN',@level2name=N'KidID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合約數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicAnalysis', @level2type=N'COLUMN',@level2name=N'WorkRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'PriceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工項/工料名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'單位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'Unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有下層分析工項' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'Complex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分析數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'AnaNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資源編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合約單價' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工料種類
(工項/材料/機具/人力/雜項)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PublicResource', @level2type=N'COLUMN',@level2name=N'ItemKind'
GO
USE [master]
GO
ALTER DATABASE [PublicDB] SET  READ_WRITE 
GO
