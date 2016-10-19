USE [master]
GO
/****** Object:  Database [NTUST]    Script Date: 2016/8/1 下午 01:52:28 ******/
CREATE DATABASE [NTUST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NTUST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NTUST.mdf' , SIZE = 18624KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NTUST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NTUST_log.ldf' , SIZE = 579008KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NTUST] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NTUST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NTUST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NTUST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NTUST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NTUST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NTUST] SET ARITHABORT OFF 
GO
ALTER DATABASE [NTUST] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NTUST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NTUST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NTUST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NTUST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NTUST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NTUST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NTUST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NTUST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NTUST] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NTUST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NTUST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NTUST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NTUST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NTUST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NTUST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NTUST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NTUST] SET RECOVERY FULL 
GO
ALTER DATABASE [NTUST] SET  MULTI_USER 
GO
ALTER DATABASE [NTUST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NTUST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NTUST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NTUST] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NTUST] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NTUST', N'ON'
GO
USE [NTUST]
GO
/****** Object:  Table [dbo].[AcceptanceRecord]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcceptanceRecord](
	[AcceptID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[AllPart] [nvarchar](50) NULL,
	[Batch] [int] NULL,
	[Date] [nvarchar](50) NULL,
	[Location] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[FirmName] [nvarchar](50) NULL,
	[TargetNumber] [nvarchar](max) NULL,
	[PurchaseLevel] [nvarchar](50) NULL,
	[DeadlineDate] [nvarchar](50) NULL,
	[CompletionDate] [nvarchar](50) NULL,
	[OverNY] [nvarchar](50) NULL,
	[ContractPrice] [decimal](18, 3) NULL,
	[ChangeCount] [int] NULL,
	[Process] [nvarchar](max) NULL,
	[Result] [nvarchar](50) NULL,
	[ResultNOT] [nvarchar](max) NULL,
	[ImproveDate] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_CompletionRecord] PRIMARY KEY CLUSTERED 
(
	[AcceptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccessData]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessData](
	[AccessID] [int] IDENTITY(1,1) NOT NULL,
	[AccessFunction] [nvarchar](max) NULL,
	[UID] [int] NOT NULL,
 CONSTRAINT [PK_AccessData] PRIMARY KEY CLUSTERED 
(
	[AccessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_AnaRelation]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_AnaRelation](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SortNum] [int] NULL,
	[ParentID] [int] NULL,
	[KidID] [int] NULL,
	[Number] [decimal](18, 3) NULL,
	[CNumber] [decimal](18, 3) NULL,
	[NewItem] [int] NULL CONSTRAINT [DF_Bid_AnaRelation_NewItem]  DEFAULT ((0)),
	[WUID] [int] NULL,
 CONSTRAINT [PK_Bid_AnaRelation] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_Joint]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_Joint](
	[JBID] [int] IDENTITY(1,1) NOT NULL,
	[BID] [int] NOT NULL,
	[FID] [int] NOT NULL,
	[JBItem] [nvarchar](50) NULL,
	[JBPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Bid_Joint] PRIMARY KEY CLUSTERED 
(
	[JBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_Library]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_Library](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[BID] [int] NOT NULL,
	[ItemName] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Complex] [int] NULL,
	[AnaNumber] [decimal](18, 3) NULL,
	[RFQ_Code] [nvarchar](50) NULL,
	[Price] [decimal](18, 3) NULL,
	[APrice] [decimal](18, 3) NULL,
	[BPrice] [decimal](18, 3) NULL,
	[Amount] [decimal](18, 3) NULL,
	[CAmount] [decimal](18, 3) NULL,
	[Notes] [nvarchar](50) NULL,
	[ItemKind] [nvarchar](50) NULL,
	[ResourceNY] [int] NULL,
	[PriceRef] [nvarchar](50) NULL,
	[Temp_Amount] [decimal](18, 3) NULL,
	[Temp_CAmount] [decimal](18, 3) NULL,
 CONSTRAINT [PK_Bid1DB_Library] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_PreData]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_PreData](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessCode] [nvarchar](50) NULL,
	[ForecastName] [nvarchar](50) NULL,
	[ForecastPrice] [decimal](18, 2) NULL,
	[ForecastBiddingDate] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Bid_PreData] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_WBS]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_WBS](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[BID] [int] NOT NULL,
	[LayerCode] [nvarchar](50) NULL,
	[LayerNum] [int] NULL,
	[UpperUID] [int] NULL,
	[SortNum] [int] NULL,
	[ItemOrder] [nvarchar](10) NULL,
	[PriceID] [int] NULL,
	[ItemName] [nvarchar](50) NULL,
	[Unit] [nvarchar](10) NULL,
	[ItemKind] [nvarchar](50) NULL,
	[Number] [decimal](18, 3) NULL,
	[CNumber] [decimal](18, 3) NULL,
	[BNumber] [decimal](18, 3) NULL,
	[Notes] [nvarchar](max) NULL,
	[NewItem] [int] NOT NULL CONSTRAINT [DF_Bid1DB_WBS_NewItem]  DEFAULT ((0)),
	[order_Num] [int] NULL,
 CONSTRAINT [PK_Bid1DB_WBS] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_WBSLayer]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_WBSLayer](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[BID] [int] NULL,
	[PID] [int] NULL,
	[LayerNum] [int] NULL,
	[LayerKind] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidAssess]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidAssess](
	[BID] [int] NOT NULL,
	[ConditionStatus] [int] NOT NULL CONSTRAINT [DF_BidAssess_ConditionStatus]  DEFAULT ((0)),
	[Condition1] [nvarchar](50) NULL,
	[ConditionNote1] [nvarchar](max) NULL,
	[Condition2] [nvarchar](50) NULL,
	[ConditionNote2] [nvarchar](max) NULL,
	[Condition3] [nvarchar](50) NULL,
	[ConditionNote3] [nvarchar](max) NULL,
	[Condition4] [nvarchar](50) NULL,
	[ConditionNote4] [nvarchar](max) NULL,
	[Condition5] [nvarchar](50) NULL,
	[ConditionNote5] [nvarchar](max) NULL,
	[Condition6] [nvarchar](50) NULL,
	[ConditionNote6] [nvarchar](max) NULL,
	[ContractStatus] [int] NOT NULL CONSTRAINT [DF_BidAssess_ContractStatus]  DEFAULT ((0)),
	[Contract1] [nvarchar](50) NULL,
	[ContractNote1] [nvarchar](max) NULL,
	[Contract2] [nvarchar](50) NULL,
	[ContractNote2] [nvarchar](max) NULL,
	[Contract3] [nvarchar](50) NULL,
	[ContractNote3] [nvarchar](max) NULL,
	[Contract4] [nvarchar](50) NULL,
	[ContractNote4] [nvarchar](max) NULL,
	[Contract5] [nvarchar](50) NULL,
	[ContractNote5] [nvarchar](max) NULL,
	[Contract6] [nvarchar](50) NULL,
	[ContractNote6] [nvarchar](max) NULL,
	[Contract7] [nvarchar](50) NULL,
	[ContractNote7] [nvarchar](max) NULL,
	[Contract8] [nvarchar](50) NULL,
	[ContractNote8] [nvarchar](max) NULL,
	[Contract9] [nvarchar](50) NULL,
	[ContractNote9] [nvarchar](max) NULL,
	[PreMan] [nvarchar](50) NULL,
	[PreSuggestion] [nvarchar](50) NULL,
	[PreResultNote] [nvarchar](max) NULL,
	[PreOver] [int] NOT NULL CONSTRAINT [DF_BidAssess_PreOver]  DEFAULT ((0)),
	[ReMan] [nvarchar](50) NULL,
	[TempResult] [nvarchar](50) NULL,
	[ResultNote] [nvarchar](max) NULL,
	[Result] [nvarchar](50) NULL CONSTRAINT [DF_BidAssess_Result]  DEFAULT (N'NO'),
 CONSTRAINT [PK_BidAssess] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidM_DurationPunish]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidM_DurationPunish](
	[PunishID] [int] IDENTITY(1,1) NOT NULL,
	[BID] [nvarchar](50) NOT NULL,
	[StageName] [nvarchar](50) NULL,
	[DurationType] [nvarchar](50) NULL,
	[Duration] [nvarchar](50) NULL,
	[PunishType] [nvarchar](50) NULL,
	[Punish] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_BidM_DurationPunish] PRIMARY KEY CLUSTERED 
(
	[PunishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidM_Warranty]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidM_Warranty](
	[WarrantyID] [int] IDENTITY(1,1) NOT NULL,
	[BID] [nvarchar](50) NOT NULL,
	[WarrantyItem] [nvarchar](50) NULL,
	[WarrantyYear] [decimal](3, 1) NULL,
 CONSTRAINT [PK_BidM_Warranty] PRIMARY KEY CLUSTERED 
(
	[WarrantyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidM0]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidM0](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[BidCode] [nvarchar](50) NULL,
	[BidName] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ProjectCode] [nvarchar](50) NULL,
	[SaveTime] [smalldatetime] NULL CONSTRAINT [DF_BidM0_SaveTime]  DEFAULT (getdate()),
	[BidSumPrice] [decimal](18, 2) NULL CONSTRAINT [DF_BidM0_BidSumPrice]  DEFAULT ((0)),
	[BidNumType] [int] NULL,
 CONSTRAINT [PK_BidM] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidM1]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidM1](
	[BID] [int] NOT NULL,
	[ForecastPrice] [decimal](18, 2) NULL,
	[ForecastBiddingDate] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_BidM1] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidM2]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidM2](
	[BID] [int] NOT NULL,
	[EngCountry] [nvarchar](50) NULL,
	[EngLocation] [nvarchar](50) NULL,
	[EGetBidNY] [int] NULL,
	[EBiddingNY] [int] NULL,
	[BiddingEndDate] [nvarchar](50) NULL,
	[OwnerName] [nvarchar](50) NULL,
	[OwnerContactPerson] [nvarchar](50) NULL,
	[OwnerAddress] [nvarchar](50) NULL,
	[OwnerContactTel] [nvarchar](50) NULL,
	[IlluBond] [decimal](18, 2) NULL,
	[PerformanceBondType] [nvarchar](50) NULL,
	[PerformanceBond] [decimal](18, 2) NULL,
	[IlluFee] [decimal](18, 2) NULL,
	[ReturnIlluDeadline] [nvarchar](50) NULL,
	[BidBondType] [nvarchar](50) NULL,
	[BidBond] [decimal](18, 2) NULL,
	[GetBidAddress] [nvarchar](50) NULL,
	[GetBidNY] [int] NULL,
	[OpenBidTime] [nvarchar](50) NULL,
	[FirmQualif] [nvarchar](max) NULL,
	[JointBidNY] [int] NULL,
	[AwardingType] [nvarchar](50) NULL,
	[OpenBidAddress] [nvarchar](50) NULL,
	[BudgetAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_BidM2] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidM3]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidM3](
	[BID] [int] NOT NULL,
	[ContractWay] [nvarchar](50) NULL,
	[OwnerName] [nvarchar](50) NULL,
	[ArchitectName] [nvarchar](50) NULL,
	[ConsultantName] [nvarchar](50) NULL,
	[PCMname] [nvarchar](50) NULL,
	[DurationType] [nvarchar](10) NULL,
	[Duration] [nvarchar](50) NULL,
	[StartDeadlinetype] [nvarchar](10) NULL,
	[StartDeadline] [nvarchar](50) NULL,
	[CompletionEscDeadline] [int] NULL,
	[DelayEscDeadline] [int] NULL,
	[WarrantyPercentage] [decimal](4, 2) NULL,
	[OtherWarranty] [nvarchar](max) NULL,
	[PrepayPercentage] [decimal](4, 2) NULL,
	[EstAcceptNum] [int] NULL,
	[EstAcceptUnit] [nvarchar](5) NULL,
	[EstAcceptDate1] [nvarchar](50) NULL,
	[EstAcceptDate2] [nvarchar](50) NULL,
	[RetentionPercentage] [decimal](4, 2) NULL,
	[PriceSubsidyNY] [int] NULL,
	[OtherPayment] [nvarchar](max) NULL,
	[ContractCaution1] [nvarchar](max) NULL,
	[ContractCaution2] [nvarchar](max) NULL,
	[ContractCaution3] [nvarchar](max) NULL,
	[ContractCaution4] [nvarchar](max) NULL,
 CONSTRAINT [PK_BidM3] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidM4]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidM4](
	[BID] [int] NOT NULL,
	[EngType] [nvarchar](50) NULL,
	[EngClass] [nvarchar](50) NULL,
	[DownFloorNum] [int] NULL,
	[UpFloorNum] [int] NULL,
	[Height] [decimal](18, 2) NULL,
	[ExcDepth] [decimal](18, 2) NULL,
	[DownFloorArea] [decimal](18, 2) NULL,
	[UpFloorArea] [decimal](18, 2) NULL,
	[FoundationType] [nvarchar](50) NULL,
	[Retaining] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[Other] [nvarchar](50) NULL,
 CONSTRAINT [PK_BidM4] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidM5]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidM5](
	[BID] [int] NOT NULL,
	[GetBidDate] [datetime] NULL,
	[WorkManDep] [nvarchar](50) NULL,
	[WorkManName] [nvarchar](50) NULL,
	[BookEstimateEndDate] [datetime] NULL,
	[PriBidMeetTime] [datetime] NULL,
	[SendBidDate] [datetime] NULL,
	[ReturnIlluDate] [datetime] NULL,
	[EstimateCosts] [decimal](18, 2) NULL,
	[ProposalPrice] [decimal](18, 2) NULL,
	[ProposalProfit] [decimal](18, 2) NULL,
	[ApprovedPrice] [decimal](18, 2) NULL,
	[ApprovedProfit] [decimal](18, 2) NULL,
 CONSTRAINT [PK_BidM5] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidPreItem]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidPreItem](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[ResponseDept] [nvarchar](50) NULL CONSTRAINT [DF_BidPreItem_ResponseDept]  DEFAULT ((0)),
 CONSTRAINT [PK_BidPreItem] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidRecord]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidRecord](
	[BID] [int] NOT NULL,
	[GetFirm] [nvarchar](50) NULL,
	[UpsetPrice] [decimal](18, 2) NULL,
	[AwardPrice] [decimal](18, 2) NULL,
	[BidRatio] [decimal](5, 4) NULL,
	[Result] [nvarchar](10) NULL CONSTRAINT [DF_BidRecord_Result]  DEFAULT ((0)),
	[BidStaff] [nvarchar](50) NULL,
	[BidPrice] [decimal](18, 2) NULL,
	[FirstDiscountPrice] [decimal](18, 2) NULL,
	[LastDiscountPrice] [decimal](18, 2) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_BidRecord] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BidRecord_FirmList]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidRecord_FirmList](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[BID] [int] NOT NULL,
	[FirmName] [nvarchar](50) NULL,
	[CheckNY] [int] NULL,
	[GetNY] [int] NULL,
	[BidPrice] [decimal](18, 2) NULL,
	[NoReason] [nvarchar](50) NULL,
	[NoReason1] [nvarchar](50) NULL,
	[LowReason] [nvarchar](max) NULL,
	[TB_Other] [nvarchar](max) NULL,
 CONSTRAINT [PK_BidRecord_RivalList] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CBudget_Change]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBudget_Change](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[CEdition] [int] NULL,
	[EEdition] [int] NULL,
	[ApprovedDate] [datetime] NULL,
	[ApprovedDoc] [nvarchar](50) NULL,
	[AdjestDuration] [int] NULL,
	[AdjestBookFinishDate] [datetime] NULL,
	[AdjestPrice] [decimal](18, 0) NULL,
	[AdjestTotalPrice] [decimal](18, 0) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Budget_ChangeSummary] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CBudget_Change_Detail]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBudget_Change_Detail](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[CWID] [int] NULL,
	[ChNumber1] [decimal](18, 3) NULL,
	[Response1] [nvarchar](50) NULL,
	[Reason1] [nvarchar](50) NULL,
	[Notes1] [nvarchar](max) NULL,
	[ChNumber2] [decimal](18, 3) NULL,
	[Response2] [nvarchar](50) NULL,
	[Reason2] [nvarchar](50) NULL,
	[Notes2] [nvarchar](max) NULL,
	[ChNumber3] [decimal](18, 3) NULL,
	[Response3] [nvarchar](50) NULL,
	[Reason3] [nvarchar](50) NULL,
	[Notes3] [nvarchar](max) NULL,
	[ChNumber4] [decimal](18, 3) NULL,
	[Response4] [nvarchar](50) NULL,
	[Reason4] [nvarchar](50) NULL,
	[Notes4] [nvarchar](max) NULL,
	[ChNumber5] [decimal](18, 3) NULL,
	[Response5] [nvarchar](50) NULL,
	[Reason5] [nvarchar](50) NULL,
	[Notes5] [nvarchar](max) NULL,
	[ChNumber6] [decimal](18, 3) NULL,
	[Response6] [nvarchar](50) NULL,
	[Reason6] [nvarchar](50) NULL,
	[Notes6] [nvarchar](max) NULL,
	[ChNumber7] [decimal](18, 3) NULL,
	[Response7] [nvarchar](50) NULL,
	[Reason7] [nvarchar](50) NULL,
	[Notes7] [nvarchar](max) NULL,
	[ChNumber8] [decimal](18, 3) NULL,
	[Response8] [nvarchar](50) NULL,
	[Reason8] [nvarchar](50) NULL,
	[Notes8] [nvarchar](max) NULL,
	[ChNumber9] [decimal](18, 3) NULL,
	[Response9] [nvarchar](50) NULL,
	[Reason9] [nvarchar](50) NULL,
	[Notes9] [nvarchar](max) NULL,
	[ChNumber10] [decimal](18, 3) NULL,
	[Response10] [nvarchar](50) NULL,
	[Reason10] [nvarchar](50) NULL,
	[Notes10] [nvarchar](max) NULL,
	[ChNumber11] [decimal](18, 3) NULL,
	[Response11] [nvarchar](50) NULL,
	[Reason11] [nvarchar](50) NULL,
	[Notes11] [nvarchar](max) NULL,
	[ChNumber12] [decimal](18, 3) NULL,
	[Response12] [nvarchar](50) NULL,
	[Reason12] [nvarchar](50) NULL,
	[Notes12] [nvarchar](max) NULL,
	[ChNumber13] [decimal](18, 3) NULL,
	[Response13] [nvarchar](50) NULL,
	[Reason13] [nvarchar](50) NULL,
	[Notes13] [nvarchar](max) NULL,
	[ChNumber14] [decimal](18, 3) NULL,
	[Response14] [nvarchar](50) NULL,
	[Reason14] [nvarchar](50) NULL,
	[Notes14] [nvarchar](max) NULL,
	[ChNumber15] [decimal](18, 3) NULL,
	[Response15] [nvarchar](50) NULL,
	[Reason15] [nvarchar](50) NULL,
	[Notes15] [nvarchar](max) NULL,
	[ChNumber16] [decimal](18, 3) NULL,
	[Response16] [nvarchar](50) NULL,
	[Reason16] [nvarchar](50) NULL,
	[Notes16] [nvarchar](max) NULL,
	[ChNumber17] [decimal](18, 3) NULL,
	[Response17] [nvarchar](50) NULL,
	[Reason17] [nvarchar](50) NULL,
	[Notes17] [nvarchar](max) NULL,
	[ChNumber18] [decimal](18, 3) NULL,
	[Response18] [nvarchar](50) NULL,
	[Reason18] [nvarchar](50) NULL,
	[Notes18] [nvarchar](max) NULL,
	[ChNumber19] [decimal](18, 3) NULL,
	[Response19] [nvarchar](50) NULL,
	[Reason19] [nvarchar](50) NULL,
	[Notes19] [nvarchar](max) NULL,
	[ChNumber20] [decimal](18, 3) NULL,
	[Response20] [nvarchar](50) NULL,
	[Reason20] [nvarchar](50) NULL,
	[Notes20] [nvarchar](max) NULL,
 CONSTRAINT [PK_CBudget_Change_Detail] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CBudget_WBS]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBudget_WBS](
	[CWID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[LayerCode] [nvarchar](50) NULL,
	[LayerNum] [int] NULL,
	[UpperWID] [int] NULL,
	[SortNum] [int] NULL,
	[ItemOrder] [nvarchar](50) NULL,
	[PriceID] [int] NULL,
	[ItemName] [nvarchar](50) NULL,
	[Unit] [nvarchar](10) NULL,
	[ItemKind] [nvarchar](50) NULL,
	[CNumber] [decimal](18, 3) NULL,
	[LastCNumber] [decimal](18, 3) NULL,
	[CUnitPrice] [decimal](18, 3) NULL,
	[Notes] [nvarchar](max) NULL,
	[CEdition] [int] NOT NULL CONSTRAINT [DF_Budget_WBS_CEdition]  DEFAULT ((0)),
	[order_Num] [int] NULL,
	[ComNumber] [decimal](18, 3) NULL,
	[ComNotes] [nvarchar](max) NULL,
	[Temp_id] [int] NULL,
 CONSTRAINT [PK_Pro_WBS] PRIMARY KEY CLUSTERED 
(
	[CWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CityList]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityList](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [nvarchar](50) NULL,
	[CityID] [int] NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_CityList] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassList]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassList](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClassList] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConstructionElement]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstructionElement](
	[ElementID] [int] IDENTITY(1,1) NOT NULL,
	[ElementFileName] [nvarchar](max) NOT NULL,
	[ElementName] [nvarchar](max) NOT NULL,
	[ImgName] [nvarchar](max) NULL,
	[ElementVersion] [int] NOT NULL,
	[UploadDatetime] [datetime] NOT NULL,
	[UploadPerson] [int] NOT NULL,
	[ReferenceID] [int] NOT NULL,
	[TheNewest] [bit] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
	[PublicID] [int] NULL,
 CONSTRAINT [PK_ConstructionElement] PRIMARY KEY CLUSTERED 
(
	[ElementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CountryCode]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryCode](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_CountryCode] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_Activity]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Activity](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[DailyID] [int] NOT NULL,
	[EWID] [int] NULL,
	[WIID] [int] NULL,
	[WIName] [nvarchar](max) NULL,
	[Version] [int] NULL,
	[Unit] [nvarchar](50) NULL,
	[BudgetNumber] [decimal](18, 3) NULL,
	[DoneNumber] [decimal](18, 3) NULL,
	[DailyNumber] [decimal](18, 3) NULL,
 CONSTRAINT [PK_Daily_Activity] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_Equipment]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Equipment](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[DailyID] [int] NULL,
	[PriceID] [int] NULL,
	[ItemName] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[CAmount] [decimal](18, 3) NULL,
	[EAmount] [decimal](18, 3) NULL,
	[DailyNumber] [decimal](18, 3) NULL,
	[ValucationNY] [int] NOT NULL,
 CONSTRAINT [PK_Daily_LaborEquipment] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_Labor]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Labor](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[DailyID] [int] NULL,
	[PriceID] [int] NULL,
	[ItemName] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[CAmount] [decimal](18, 3) NULL,
	[EAmount] [decimal](18, 3) NULL,
	[DailyNumber] [decimal](18, 3) NULL,
	[ValucationNY] [int] NOT NULL CONSTRAINT [DF_Daily_Labor_ValucationNY]  DEFAULT ((0)),
 CONSTRAINT [PK_Daily_Labor] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_Main]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Main](
	[DailyID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[Date] [date] NULL,
	[WeatherAM] [nvarchar](50) NULL,
	[WeatherPM] [nvarchar](50) NULL,
	[DurationAM] [bit] NULL,
	[DurationPM] [bit] NULL,
	[BookProgress] [decimal](5, 3) NULL,
	[RealProgress] [decimal](5, 3) NULL,
 CONSTRAINT [PK_Daily_Main] PRIMARY KEY CLUSTERED 
(
	[DailyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_Material]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Material](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[DailyID] [int] NULL,
	[PriceID] [int] NULL,
	[ItemName] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[CAmount] [decimal](18, 3) NULL,
	[EAmount] [decimal](18, 3) NULL,
	[DailyInNumber] [decimal](18, 3) NULL,
	[DailyOutNumber] [decimal](18, 3) NULL,
	[ValucationNY] [int] NOT NULL CONSTRAINT [DF_Daily_Material_ValucationNY]  DEFAULT ((0)),
 CONSTRAINT [PK_Daily_Material] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_Record]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Record](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[DailyID] [int] NOT NULL,
	[RecordType] [nvarchar](max) NOT NULL,
	[RecordContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Daily_Record] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_TestReport]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_TestReport](
	[Daily_ReportID] [int] IDENTITY(1,1) NOT NULL,
	[DailyID] [int] NOT NULL,
	[Daily_SampleID] [int] NULL,
	[RegularNumber] [decimal](18, 3) NULL,
	[TestMan] [nvarchar](max) NULL,
	[RealReportDate] [date] NULL,
	[LabName] [nvarchar](50) NULL,
	[TestReportPath] [nvarchar](50) NULL,
 CONSTRAINT [PK_Daily_TestReport] PRIMARY KEY CLUSTERED 
(
	[Daily_ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_TestSampling]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_TestSampling](
	[Daily_SampleID] [int] IDENTITY(1,1) NOT NULL,
	[DailyID] [int] NOT NULL,
	[PriceID] [int] NULL,
	[ItemName] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[SNumber] [decimal](18, 3) NULL,
	[SUnit] [nvarchar](50) NULL,
	[PNumber] [decimal](18, 3) NULL,
	[PUnit] [nvarchar](50) NULL,
	[Standard] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[SamplingMan] [nvarchar](max) NULL,
	[MaterailInDate] [date] NULL,
	[BookReportDate] [date] NULL,
	[TestType] [nvarchar](50) NOT NULL CONSTRAINT [DF_Daily_TestSampling_TestType]  DEFAULT ((0)),
	[FirmName] [nvarchar](50) NULL,
	[LabName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Daily_TestSampling] PRIMARY KEY CLUSTERED 
(
	[Daily_SampleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_UsualWord]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_UsualWord](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[UW_Type] [nvarchar](50) NOT NULL,
	[UW_Content] [nvarchar](max) NOT NULL,
	[Sort] [int] NULL,
 CONSTRAINT [PK_Daily_UsualWord] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daily_WorkPic]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_WorkPic](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[DailyID] [int] NULL,
	[PicTitle] [nvarchar](50) NULL,
	[PicLocation] [nvarchar](50) NULL,
	[PicPath] [nvarchar](max) NULL,
	[PicDate] [date] NULL,
	[PicType] [nvarchar](50) NULL,
	[PicPeriod] [nvarchar](50) NULL,
	[CWID] [int] NULL,
	[SC_Code] [nvarchar](50) NULL,
	[PicNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_Daily_WorkPic] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DepartmentList]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentList](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[DepartmentLeader] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_DepartmentList] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EBudget_Change]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EBudget_Change](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[EEdition] [int] NULL,
	[ApprovedDate] [datetime] NULL,
	[ApprovedDoc] [nvarchar](50) NULL,
	[AdjestDuration] [int] NULL,
	[AdjestBookFinishDate] [datetime] NULL,
	[AdjestPrice] [decimal](18, 0) NULL,
	[AdjestTotalPrice] [decimal](18, 0) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_EBudget_Change] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EBudget_Change_Detail]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EBudget_Change_Detail](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[EWID] [int] NULL,
	[ChNumber1] [decimal](18, 3) NULL,
	[Response1] [nvarchar](50) NULL,
	[Reason1] [nvarchar](50) NULL,
	[Note1] [nvarchar](max) NULL,
	[CBudget1] [int] NULL,
	[ChNumber2] [decimal](18, 3) NULL,
	[Response2] [nvarchar](50) NULL,
	[Reason2] [nvarchar](50) NULL,
	[Note2] [nvarchar](max) NULL,
	[CBudget2] [int] NULL,
	[ChNumber3] [decimal](18, 3) NULL,
	[Response3] [nvarchar](50) NULL,
	[Reason3] [nvarchar](50) NULL,
	[Note3] [nvarchar](max) NULL,
	[CBudget3] [int] NULL,
	[ChNumber4] [decimal](18, 3) NULL,
	[Response4] [nvarchar](50) NULL,
	[Reason4] [nvarchar](50) NULL,
	[Notes4] [nvarchar](max) NULL,
	[CBudget4] [int] NULL,
	[ChNumber5] [decimal](18, 3) NULL,
	[Response5] [nvarchar](50) NULL,
	[Reason5] [nvarchar](50) NULL,
	[Note5] [nvarchar](max) NULL,
	[CBudget5] [int] NULL,
	[ChNumber6] [decimal](18, 3) NULL,
	[Response6] [nvarchar](50) NULL,
	[Reason6] [nvarchar](50) NULL,
	[Note6] [nvarchar](max) NULL,
	[CBudget6] [int] NULL,
	[ChNumber7] [decimal](18, 3) NULL,
	[Response7] [nvarchar](50) NULL,
	[Reason7] [nvarchar](50) NULL,
	[Note7] [nvarchar](max) NULL,
	[CBudget7] [int] NULL,
	[ChNumber8] [decimal](18, 3) NULL,
	[Response8] [nvarchar](50) NULL,
	[Reason8] [nvarchar](50) NULL,
	[Note8] [nvarchar](max) NULL,
	[CBudget8] [int] NULL,
	[ChNumber9] [decimal](18, 3) NULL,
	[Response9] [nvarchar](50) NULL,
	[Reason9] [nvarchar](50) NULL,
	[Note9] [nvarchar](max) NULL,
	[CBudget9] [int] NULL,
	[ChNumber10] [decimal](18, 3) NULL,
	[Response10] [nvarchar](50) NULL,
	[Reason10] [nvarchar](50) NULL,
	[Note10] [nvarchar](max) NULL,
	[CBudget10] [int] NULL,
	[ChNumber11] [decimal](18, 3) NULL,
	[Response11] [nvarchar](50) NULL,
	[Reason11] [nvarchar](50) NULL,
	[Note11] [nvarchar](max) NULL,
	[CBudget11] [int] NULL,
	[ChNumber12] [decimal](18, 3) NULL,
	[Response12] [nvarchar](50) NULL,
	[Reason12] [nvarchar](50) NULL,
	[Note12] [nvarchar](max) NULL,
	[CBudget12] [int] NULL,
	[ChNumber13] [decimal](18, 3) NULL,
	[Response13] [nvarchar](50) NULL,
	[Reason13] [nvarchar](50) NULL,
	[Note13] [nvarchar](max) NULL,
	[CBudget13] [int] NULL,
	[ChNumber14] [decimal](18, 3) NULL,
	[Response14] [nvarchar](50) NULL,
	[Reason14] [nvarchar](50) NULL,
	[Note14] [nvarchar](max) NULL,
	[CBudget14] [int] NULL,
	[ChNumber15] [decimal](18, 3) NULL,
	[Response15] [nvarchar](50) NULL,
	[Reason15] [nvarchar](50) NULL,
	[Note15] [nvarchar](max) NULL,
	[CBudget15] [int] NULL,
	[ChNumber16] [decimal](18, 3) NULL,
	[Response16] [nvarchar](50) NULL,
	[Reason16] [nvarchar](50) NULL,
	[Note16] [nvarchar](max) NULL,
	[CBudget16] [int] NULL,
	[ChNumber17] [decimal](18, 3) NULL,
	[Response17] [nvarchar](50) NULL,
	[Reason17] [nvarchar](50) NULL,
	[Note17] [nvarchar](max) NULL,
	[CBudget17] [int] NULL,
	[ChNumber18] [decimal](18, 3) NULL,
	[Response18] [nvarchar](50) NULL,
	[Reason18] [nvarchar](50) NULL,
	[Note18] [nvarchar](max) NULL,
	[CBudget18] [int] NULL,
	[ChNumber19] [decimal](18, 3) NULL,
	[Response19] [nvarchar](50) NULL,
	[Reason19] [nvarchar](50) NULL,
	[Note19] [nvarchar](max) NULL,
	[CBudget19] [int] NULL,
	[ChNumber20] [decimal](18, 3) NULL,
	[Response20] [nvarchar](50) NULL,
	[Reason20] [nvarchar](50) NULL,
	[Note20] [nvarchar](max) NULL,
	[CBudget20] [int] NULL,
 CONSTRAINT [PK_EBudget_Change_Detail_1] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EBudget_ResourceBK]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EBudget_ResourceBK](
	[BKID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[ItemKind] [nvarchar](50) NULL,
	[WiEWID] [int] NULL,
	[WiLayerCode] [nvarchar](50) NULL,
	[WiName] [nvarchar](max) NULL,
	[WiUnit] [nvarchar](max) NULL,
	[RiPriceID] [int] NULL,
	[RiPrice] [decimal](18, 0) NULL,
	[RiName] [nvarchar](max) NULL,
	[RiUnit] [nvarchar](max) NULL,
	[RiUpperBKID] [int] NULL,
	[RiLayer] [int] NULL,
	[AnaNumber] [decimal](18, 3) NULL,
	[WorkRate] [decimal](18, 3) NULL,
	[ItemAmount] [decimal](18, 3) NULL,
	[LastAmount] [decimal](18, 3) NULL,
 CONSTRAINT [PK_EBudget_ResourceBK] PRIMARY KEY CLUSTERED 
(
	[BKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EBudget_WBS]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EBudget_WBS](
	[EWID] [int] IDENTITY(1,1) NOT NULL,
	[CWID] [int] NULL,
	[PID] [int] NOT NULL,
	[LayerCode] [nvarchar](50) NULL,
	[LayerNum] [int] NULL,
	[UpperWID] [int] NULL,
	[SortNum] [int] NULL,
	[ItemOrder] [nvarchar](50) NULL,
	[ResourceCode] [nvarchar](50) NULL,
	[ItemName] [nvarchar](50) NULL,
	[Unit] [nvarchar](10) NULL,
	[ItemKind] [nvarchar](50) NULL,
	[ENumber] [decimal](18, 3) NULL,
	[LastENumber] [decimal](18, 3) NULL,
	[EUnitPrice] [decimal](18, 3) NULL,
	[LastEUnitPrice] [decimal](18, 3) NULL,
	[Notes] [nvarchar](max) NULL,
	[EEdition] [int] NOT NULL CONSTRAINT [DF_EBudget_WBS_EEdition]  DEFAULT ((0)),
	[ExecuteKind] [nvarchar](50) NULL,
	[NewItem] [int] NULL CONSTRAINT [DF_EBudget_WBS_NewItem]  DEFAULT ((0)),
	[ActivityUseNY] [int] NOT NULL CONSTRAINT [DF_EBudget_WBS_ActivityUseNY]  DEFAULT ((0)),
	[ResourceNY] [int] NOT NULL CONSTRAINT [DF_EBudget_WBS_ReasourceNY]  DEFAULT ((0)),
	[LastSubNumber] [decimal](18, 3) NULL,
	[order_Num] [int] NULL,
	[PriceID] [int] NULL,
 CONSTRAINT [PK_EBudget_WBS] PRIMARY KEY CLUSTERED 
(
	[EWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FFund_Item]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FFund_Item](
	[FF_IID] [int] IDENTITY(1,1) NOT NULL,
	[FFID] [int] NULL,
	[SC_MID] [int] NULL,
	[ComplexNumber] [decimal](18, 2) NULL,
	[ComplexPrice] [decimal](18, 2) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_FFund_Item] PRIMARY KEY CLUSTERED 
(
	[FF_IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FFund_Main]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FFund_Main](
	[FFID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[SCID] [int] NOT NULL,
	[FF_Code] [nvarchar](50) NULL,
	[FF_Edition] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[FundDate] [datetime] NULL,
	[PayDate] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[Item1] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item1]  DEFAULT ((0)),
	[Item2] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item2]  DEFAULT ((0)),
	[Item3] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item3]  DEFAULT ((0)),
	[Item4] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item4]  DEFAULT ((0)),
	[Item5] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item5]  DEFAULT ((0)),
	[Item6] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item6]  DEFAULT ((0)),
	[Item7] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item7]  DEFAULT ((0)),
	[Item8] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item8]  DEFAULT ((0)),
	[Item9] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item9]  DEFAULT ((0)),
	[Item10] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item10]  DEFAULT ((0)),
	[Item11] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item11]  DEFAULT ((0)),
	[Item12] [decimal](18, 2) NOT NULL CONSTRAINT [DF_FFund_Main_Item12]  DEFAULT ((0)),
 CONSTRAINT [PK_FFund_Main] PRIMARY KEY CLUSTERED 
(
	[FFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FFund_Modify]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FFund_Modify](
	[FF_MID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[SCID] [int] NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Price] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 2) NULL,
	[SumPrice] [decimal](18, 2) NULL,
	[Recorder] [nvarchar](50) NULL,
	[BelongFFID] [int] NOT NULL,
	[IncreaseDebit] [nvarchar](10) NOT NULL,
	[RelationFF_MID] [int] NOT NULL,
 CONSTRAINT [PK_FFund_Debit] PRIMARY KEY CLUSTERED 
(
	[FF_MID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FI_Mapping]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FI_Mapping](
	[FIID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[EWID] [int] NULL,
	[PriceID] [int] NULL,
	[FI_Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_FI_Mapping] PRIMARY KEY CLUSTERED 
(
	[FIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Firm_Assess]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firm_Assess](
	[FirmID] [int] NOT NULL,
	[Item1] [int] NULL,
	[ItemNote1] [nvarchar](max) NULL,
	[Item2] [int] NULL,
	[ItemNote2] [nvarchar](max) NULL,
	[Item3] [int] NULL,
	[ItemNote3] [nvarchar](max) NULL,
	[Item4] [int] NULL,
	[ItemNote4] [nvarchar](max) NULL,
	[Item5] [int] NULL,
	[ItemNote5] [nvarchar](max) NULL,
	[Item6] [int] NULL,
	[ItemNote6] [nvarchar](max) NULL,
	[TotalScore] [int] NULL,
	[FirstResult] [nvarchar](50) NULL,
	[FirstRater] [nvarchar](50) NULL,
	[FirstDate] [datetime] NULL,
	[FirstNote] [nvarchar](max) NULL,
	[SecondResult] [nvarchar](50) NULL,
	[SecondRater] [nvarchar](50) NULL,
	[SecondDate] [datetime] NULL,
	[SecondNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_Firm_Assess] PRIMARY KEY CLUSTERED 
(
	[FirmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Firm_Check]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firm_Check](
	[SCID] [int] NOT NULL,
	[FirmID] [int] NULL,
	[Item1] [int] NULL,
	[ItemNote1] [nvarchar](max) NULL,
	[Item2] [int] NULL,
	[ItemNote2] [nvarchar](max) NULL,
	[Item3] [int] NULL,
	[ItemNote3] [nvarchar](max) NULL,
	[Item4] [int] NULL,
	[ItemNote4] [nvarchar](max) NULL,
	[Item5] [int] NULL,
	[ItemNote5] [nvarchar](max) NULL,
	[Item6] [int] NULL,
	[ItemNote6] [nvarchar](max) NULL,
	[TotalScore] [int] NULL,
	[FirstResult] [nvarchar](50) NULL,
	[FirstRater] [nvarchar](50) NULL,
	[FirstDate] [datetime] NULL,
	[FirstNote] [nvarchar](max) NULL,
	[SecondResult] [nvarchar](50) NULL,
	[SecondRater] [nvarchar](50) NULL,
	[SecondDate] [datetime] NULL,
	[SecondNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_Firm_Check] PRIMARY KEY CLUSTERED 
(
	[SCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FirmM]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmM](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[EIN] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[SupportItem] [nvarchar](50) NULL,
	[Owner] [nvarchar](50) NULL,
	[OwnerMobile] [nvarchar](50) NULL,
	[Capital] [decimal](18, 2) NULL,
	[StaffAmount] [int] NULL,
	[Location] [nvarchar](50) NULL,
	[Tel1] [nvarchar](50) NULL,
	[Tel2] [nvarchar](50) NULL,
	[Fax1] [nvarchar](50) NULL,
	[Fax2] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ContectAddress] [nvarchar](50) NULL,
	[RegisteredAddress] [nvarchar](50) NULL,
	[Notes] [nvarchar](50) NULL,
 CONSTRAINT [PK_FirmManagement] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Foundation]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foundation](
	[FoundationID] [int] IDENTITY(1,1) NOT NULL,
	[FoundationName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Foundation] PRIMARY KEY CLUSTERED 
(
	[FoundationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FunctionList]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionList](
	[FunctionID] [int] IDENTITY(1,1) NOT NULL,
	[NickName] [nchar](10) NULL,
	[FunctionName] [nvarchar](50) NULL,
	[URL] [nvarchar](max) NULL,
	[Status] [nchar](1) NULL,
	[UpperID] [int] NULL,
 CONSTRAINT [PK_FunctionList] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IllustratedDoc]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IllustratedDoc](
	[IllustratedDocID] [int] IDENTITY(1,1) NOT NULL,
	[IllustratedDocFileName] [nvarchar](max) NOT NULL,
	[IllustratedDocName] [nvarchar](max) NOT NULL,
	[NewDocName] [nvarchar](max) NULL,
	[IllustratedDocNumber] [nvarchar](max) NOT NULL,
	[PCCNumber] [nvarchar](max) NULL,
	[IllustratedDocVersion] [int] NOT NULL,
	[UploadDateTime] [datetime] NOT NULL,
	[UploadUserID] [int] NOT NULL,
	[ReferenceID] [int] NOT NULL,
	[TheNewest] [bit] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NOT NULL,
	[RelatedDocID] [nvarchar](max) NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK_IllustratedDoc] PRIMARY KEY CLUSTERED 
(
	[IllustratedDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KCheckList]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KCheckList](
	[KCheckListId] [int] IDENTITY(1,1) NOT NULL,
	[Locationn] [nvarchar](max) NULL,
	[KCheckListProject] [nvarchar](max) NULL,
	[KCheckListEngineeringList] [nvarchar](max) NULL,
 CONSTRAINT [PK_KCheckList] PRIMARY KEY CLUSTERED 
(
	[KCheckListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KCheckListItem]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KCheckListItem](
	[KCheckListItemId] [int] IDENTITY(1,1) NOT NULL,
	[KCheckListItemName] [nvarchar](max) NULL,
	[KCheckListItemPhase] [nvarchar](max) NULL,
	[KCheckListId] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KCheckListItemSt]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KCheckListItemSt](
	[KCheckListItemStId] [int] IDENTITY(1,1) NOT NULL,
	[KCheckListItem] [nvarchar](max) NULL,
	[DateTime] [nvarchar](max) NULL,
	[Person] [nvarchar](max) NULL,
	[Grade] [nvarchar](max) NULL,
	[CheckListTime] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_ECheckListEngineeringItemSt] PRIMARY KEY CLUSTERED 
(
	[KCheckListItemStId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KCheckListLost]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KCheckListLost](
	[KCheckListLostId] [int] IDENTITY(1,1) NOT NULL,
	[KCheckListItem] [nchar](10) NULL,
	[DateTime] [nchar](10) NULL,
	[Person] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[CheckList] [nchar](10) NULL,
	[Remark] [nchar](10) NULL,
 CONSTRAINT [PK_KCheckListLost] PRIMARY KEY CLUSTERED 
(
	[KCheckListLostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KCheckListLostUpload]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KCheckListLostUpload](
	[KCheckListLostUploadId] [int] IDENTITY(1,1) NOT NULL,
	[KCheckListItemStId] [nvarchar](max) NULL,
	[DateTime] [nvarchar](max) NULL,
	[UploadAddress] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_KCheckListLostUpload] PRIMARY KEY CLUSTERED 
(
	[KCheckListLostUploadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KCheckListTime]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KCheckListTime](
	[KCheckListTimeId] [int] IDENTITY(1,1) NOT NULL,
	[CheckList] [nvarchar](max) NULL,
	[DateTime] [nvarchar](max) NULL,
	[Person] [nvarchar](max) NULL,
	[CheckListEngineering] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Lock] [nvarchar](50) NULL,
	[LostStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_KCheckListTime] PRIMARY KEY CLUSTERED 
(
	[KCheckListTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KEngineeringList]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KEngineeringList](
	[KEngineeringListId] [int] IDENTITY(1,1) NOT NULL,
	[KEngineeringListName] [nvarchar](50) NULL,
	[PID] [nvarchar](50) NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[KEngineeringListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KEngineeringListItem]    Script Date: 2016/8/1 下午 01:52:28 ******/
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
/****** Object:  Table [dbo].[LayerOrder]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayerOrder](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Kind] [int] NULL,
	[OrderNum] [int] NULL,
	[OrderName] [nvarchar](50) NULL,
 CONSTRAINT [PK_LayerOrder] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LM_code]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LM_code](
	[LMID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LM_code] PRIMARY KEY CLUSTERED 
(
	[LMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MainCode]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainCode](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Code2] [nvarchar](5) NULL,
	[Code5] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[MainSub] [int] NULL,
	[PCC] [int] NULL,
 CONSTRAINT [PK_MainCode] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[module] [nvarchar](50) NULL,
	[Menu] [nvarchar](50) NULL,
	[link] [nvarchar](50) NULL,
	[Mark] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ModuleAccess]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleAccess](
	[ModuleNo] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ModuleAccess] PRIMARY KEY CLUSTERED 
(
	[ModuleNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFund_Item]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFund_Item](
	[OF_IID] [int] IDENTITY(1,1) NOT NULL,
	[OFID] [int] NULL,
	[CWID] [int] NULL,
	[ONumber] [decimal](18, 3) NULL,
	[OPrice] [decimal](18, 3) NULL,
	[ANumber] [decimal](18, 3) NULL,
	[APrice] [decimal](18, 3) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_OFund_Item] PRIMARY KEY CLUSTERED 
(
	[OF_IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFund_Main]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFund_Main](
	[OFID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[OF_Code] [nvarchar](50) NULL,
	[OF_Edition] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[FundDate] [datetime] NULL,
	[PayDate] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[OItem1] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item1]  DEFAULT ((0)),
	[OItem2] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item2]  DEFAULT ((0)),
	[OItem3] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item3]  DEFAULT ((0)),
	[OItem4] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item4]  DEFAULT ((0)),
	[OItem5] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item5]  DEFAULT ((0)),
	[OItem6] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item6]  DEFAULT ((0)),
	[OItem7] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item7]  DEFAULT ((0)),
	[OItem8] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item8]  DEFAULT ((0)),
	[OItem9] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item9]  DEFAULT ((0)),
	[OItem10] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item10]  DEFAULT ((0)),
	[OItem11] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item11]  DEFAULT ((0)),
	[OItem12] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item12]  DEFAULT ((0)),
	[OItem13] [decimal](18, 3) NOT NULL CONSTRAINT [DF_Table_1_Item121]  DEFAULT ((0)),
	[OItem14] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_Item131]  DEFAULT ((0)),
	[AItem1] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem1]  DEFAULT ((0)),
	[AItem2] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem2]  DEFAULT ((0)),
	[AItem3] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem3]  DEFAULT ((0)),
	[AItem4] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem4]  DEFAULT ((0)),
	[AItem5] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem5]  DEFAULT ((0)),
	[AItem6] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem6]  DEFAULT ((0)),
	[AItem7] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem7]  DEFAULT ((0)),
	[AItem8] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem8]  DEFAULT ((0)),
	[AItem9] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem9]  DEFAULT ((0)),
	[AItem10] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem10]  DEFAULT ((0)),
	[AItem11] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem11]  DEFAULT ((0)),
	[AItem12] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem12]  DEFAULT ((0)),
	[AItem13] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem13]  DEFAULT ((0)),
	[AItem14] [decimal](18, 3) NOT NULL CONSTRAINT [DF_OFund_Main_AItem14]  DEFAULT ((0)),
 CONSTRAINT [PK_OFund_Main] PRIMARY KEY CLUSTERED 
(
	[OFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFund_Modify]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFund_Modify](
	[OF_MID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Price] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 2) NULL,
	[SumPrice] [decimal](18, 2) NULL,
	[Documents] [nvarchar](50) NULL,
	[Recorder] [nvarchar](50) NULL,
	[BelonFID] [int] NOT NULL,
	[ApprovalOFID] [int] NOT NULL,
	[IncreaseDebit] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_OFund_Modify] PRIMARY KEY CLUSTERED 
(
	[OF_MID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivateAnalysis]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateAnalysis](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SortNum] [int] NULL,
	[ParentID] [int] NULL,
	[KidID] [int] NULL,
	[WorkRate] [decimal](18, 3) NULL,
 CONSTRAINT [PK_PrivateAnalysis] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivateResource]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateResource](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[Complex] [int] NULL,
	[AnaNumber] [decimal](18, 3) NULL,
	[Code] [nvarchar](max) NULL,
	[Price] [decimal](18, 3) NULL,
	[Notes] [nvarchar](50) NULL,
	[ItemKind] [nvarchar](50) NULL,
	[PublicID] [int] NULL,
 CONSTRAINT [PK_PrivateResource] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pro_Analysis]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pro_Analysis](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SortNum] [int] NULL,
	[ParentID] [int] NULL,
	[KidID] [int] NULL,
	[WorkRate] [decimal](18, 3) NULL,
 CONSTRAINT [PK_Pro_AnaRelation] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pro_Resource]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pro_Resource](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[ItemName] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Complex] [int] NULL CONSTRAINT [DF_Pro_Resource_Complex]  DEFAULT ((0)),
	[AnaNumber] [decimal](18, 3) NULL,
	[RFQ_Code] [nvarchar](50) NULL,
	[CPrice] [decimal](18, 3) NULL,
	[EPrice] [decimal](18, 3) NULL,
	[CAmount] [decimal](18, 3) NULL,
	[EAmount] [decimal](18, 3) NULL,
	[Notes] [nvarchar](50) NULL,
	[ItemKind] [nvarchar](50) NULL,
	[Bid_PriceID] [int] NULL,
	[Bid_RFQ_Code] [nvarchar](50) NULL,
	[CResourceNY] [int] NULL,
	[EResourceNY] [int] NULL,
	[Temp_id] [int] NULL,
 CONSTRAINT [PK_Pro_Library] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Progress_Real]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress_Real](
	[RealProgID] [int] IDENTITY(1,1) NOT NULL,
	[ProgressID] [int] NOT NULL,
	[WorkDate] [date] NOT NULL,
	[CompleteAmount] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_Progress_Real] PRIMARY KEY CLUSTERED 
(
	[RealProgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Progress_WIINF]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress_WIINF](
	[ProgressID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[WBSID] [int] NOT NULL,
	[WBSName] [nvarchar](max) NOT NULL,
	[WIID] [int] NOT NULL,
	[WIName] [nvarchar](max) NOT NULL,
	[Duration] [int] NOT NULL,
	[PreWorkID] [nvarchar](max) NULL,
	[FTime] [nvarchar](max) NULL,
	[ES] [int] NULL,
	[EE] [int] NULL,
	[LS] [int] NULL,
	[LE] [int] NULL,
	[CP] [bit] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Amount] [decimal](18, 3) NULL,
	[Version] [int] NULL,
	[Lock] [bit] NULL,
 CONSTRAINT [PK_Progress_WIINF] PRIMARY KEY CLUSTERED 
(
	[ProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectM_DurationPunish]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectM_DurationPunish](
	[PunishID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[StageName] [nvarchar](50) NOT NULL,
	[DurationType] [nvarchar](50) NULL,
	[Duration] [nvarchar](50) NULL,
	[PunishType] [nvarchar](50) NULL,
	[Punish] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProjectM_DurationPunish] PRIMARY KEY CLUSTERED 
(
	[PunishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectM_JV]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectM_JV](
	[JVID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[FID] [int] NOT NULL,
	[JVItem] [nvarchar](50) NULL,
	[JVPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ProjectM_JV] PRIMARY KEY CLUSTERED 
(
	[JVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectM_Warranty]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectM_Warranty](
	[WarrantyID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[WarrantyItem] [nvarchar](50) NULL,
	[WarrantyYear] [decimal](3, 1) NULL,
 CONSTRAINT [PK_ProjectM_Warranty] PRIMARY KEY CLUSTERED 
(
	[WarrantyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectM0]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectM0](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectCode] [nvarchar](50) NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[ProjectNickname] [nvarchar](50) NULL,
	[ProjectStatus] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[FromBid] [int] NULL,
	[CodeName] [nvarchar](50) NOT NULL,
	[LayerLock] [int] NULL CONSTRAINT [DF_ProjectM0_LayerLock]  DEFAULT ((0)),
	[LayerMax] [int] NULL,
	[OrderWay] [nvarchar](10) NULL,
	[SeparatedSymbol] [nvarchar](5) NULL,
	[OrderString] [nvarchar](max) NULL,
	[CBudgetLock] [int] NOT NULL CONSTRAINT [DF_ProjectM0_CBudgetLock]  DEFAULT ((0)),
	[EBudgetLock] [int] NOT NULL CONSTRAINT [DF_ProjectM0_EBudhetLock]  DEFAULT ((0)),
	[CBudgetNumType] [int] NULL,
	[EBudgetNumType] [int] NULL,
	[BidNumType] [int] NULL,
 CONSTRAINT [PK_ProjectM0] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectM1]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectM1](
	[PID] [int] NOT NULL,
	[EngCountry] [nvarchar](50) NULL,
	[EngLocation] [nvarchar](50) NULL,
	[SitePerson] [nvarchar](50) NULL,
	[SiteTel] [nvarchar](50) NULL,
	[SiteFax] [nvarchar](50) NULL,
	[OwnerName] [nvarchar](50) NULL,
	[OwnerContactPerson] [nvarchar](50) NULL,
	[OwnerAddress] [nvarchar](50) NULL,
	[OwnerContactTel] [nvarchar](50) NULL,
	[BookOpenDate] [nvarchar](50) NULL,
	[BookFinishDate] [nvarchar](50) NULL,
	[RealOpenDate] [nvarchar](50) NULL,
	[RealFinishDate] [nvarchar](50) NULL,
	[ApprovedFinishDate] [nvarchar](50) NULL,
	[AcceptCheckDate] [nvarchar](50) NULL,
	[WarrantyDate] [nvarchar](50) NULL,
	[WarrantyMoneyDate] [nvarchar](50) NULL,
	[PerformanceBondType] [nvarchar](50) NULL,
	[PerformanceBond] [decimal](18, 2) NULL,
	[EngType] [nvarchar](50) NULL,
	[EngClass] [nvarchar](50) NULL,
	[DownFloorNum] [int] NULL,
	[UpFloorNum] [int] NULL,
	[Height] [decimal](18, 2) NULL,
	[ExcDepth] [decimal](18, 2) NULL,
	[DownFloorArea] [decimal](18, 2) NULL,
	[UpFloorArea] [decimal](18, 2) NULL,
	[FoundationType] [nvarchar](50) NULL,
	[Retaining] [nvarchar](50) NULL,
	[ConNote] [nvarchar](50) NULL,
	[Other] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProjectM1] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectM2]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectM2](
	[PID] [int] NOT NULL,
	[OContrctPrice] [decimal](18, 2) NULL,
	[ContractWay] [nvarchar](50) NULL,
	[OwnerName] [nvarchar](50) NULL,
	[ArchitectName] [nvarchar](50) NULL,
	[ConsultantName] [nvarchar](50) NULL,
	[PCMname] [nvarchar](50) NULL,
	[DurationType] [nvarchar](10) NULL,
	[Duration] [nvarchar](50) NULL,
	[BuildLicense] [nvarchar](50) NULL,
	[BuildLicenseDtae] [nvarchar](50) NULL,
	[UseLicense] [nvarchar](50) NULL,
	[UseLicenseDate] [nvarchar](50) NULL,
	[StartDeadlinetype] [nvarchar](10) NULL,
	[StartDeadline] [nvarchar](50) NULL,
	[CompletionEscDeadline] [int] NULL,
	[DelayEscDeadline] [int] NULL,
	[WarrantyPercentage] [decimal](4, 2) NULL,
	[OtherWarranty] [nvarchar](max) NULL,
	[PrepayPercentage] [decimal](4, 2) NULL,
	[EstAcceptNum] [int] NULL,
	[EstAcceptUnit] [nvarchar](5) NULL,
	[EstAcceptDate1] [nvarchar](50) NULL,
	[EstAcceptDate2] [nvarchar](50) NULL,
	[RetentionPercentage] [decimal](4, 2) NULL,
	[PriceSubsidyNY] [int] NULL,
	[OtherPayment] [nvarchar](max) NULL,
	[ContractCaution1] [nvarchar](max) NULL,
	[ContractCaution2] [nvarchar](max) NULL,
	[ContractCaution3] [nvarchar](max) NULL,
	[ContractCaution4] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProjectM2] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_Base]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Base](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ReportDate] [date] NOT NULL,
	[MorningWeather] [nvarchar](10) NOT NULL,
	[AfternoonWeather] [nvarchar](10) NOT NULL,
	[DataDate] [date] NOT NULL,
	[ReporterID] [int] NOT NULL,
	[MorningWork] [bit] NULL,
	[AfternoonWork] [bit] NULL,
 CONSTRAINT [PK_Report_Base] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_MaterialIN]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_MaterialIN](
	[RMIID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NOT NULL,
	[CodeName] [nvarchar](50) NULL,
	[FirmID] [int] NOT NULL,
	[ResourceID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Report_MaterialIN] PRIMARY KEY CLUSTERED 
(
	[RMIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_MaterialOut]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_MaterialOut](
	[RMOID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NOT NULL,
	[ResourceID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Report_MaterialOut] PRIMARY KEY CLUSTERED 
(
	[RMOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_Progress]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Progress](
	[RPID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NOT NULL,
	[ProgressID] [int] NOT NULL,
	[CompleteProgress] [int] NOT NULL,
 CONSTRAINT [PK_Report_Progress] PRIMARY KEY CLUSTERED 
(
	[RPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_Record]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Record](
	[RRID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NOT NULL,
	[RecordType] [nvarchar](50) NOT NULL,
	[RecordContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Report_Record] PRIMARY KEY CLUSTERED 
(
	[RRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report_Test]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Test](
	[RTID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NOT NULL,
	[TestType] [nvarchar](50) NOT NULL,
	[TestResult] [nvarchar](50) NOT NULL,
	[TestRemark] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Report_Test] PRIMARY KEY CLUSTERED 
(
	[RTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Retaining]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retaining](
	[RetainingID] [int] IDENTITY(1,1) NOT NULL,
	[RetainingName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Retaining] PRIMARY KEY CLUSTERED 
(
	[RetainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RFQ]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQ](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[RFQ_Code] [nvarchar](50) NULL,
	[Sort] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[FirmID] [int] NULL,
	[Location] [nvarchar](50) NULL,
	[ReplyDate] [nvarchar](50) NULL,
	[Warranty] [nvarchar](max) NULL,
	[WorkManDep] [nvarchar](50) NULL,
	[WorkManName] [nvarchar](50) NULL,
	[ExpiretionDate] [nvarchar](50) NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[Tax] [decimal](18, 0) NULL,
	[Notes] [nvarchar](50) NULL,
	[DiscountPercent] [decimal](4, 2) NULL,
	[DiscountTotal] [decimal](18, 0) NULL,
	[QuoteNY] [int] NOT NULL CONSTRAINT [DF_RFQ_QuoteNY]  DEFAULT ((0)),
 CONSTRAINT [PK_RFQ] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RFQ_File]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQ_File](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[RFQ_Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Path] [nvarchar](max) NULL,
 CONSTRAINT [PK_FirmQPrice_File] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RFQ_Material]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQ_Material](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[RFQ_Code] [nvarchar](50) NULL,
	[BID] [int] NULL,
	[PriceID] [int] NULL,
	[PID] [int] NULL,
	[Pro_PriceID] [int] NULL,
	[FirmID] [int] NULL,
	[DisCountType] [int] NULL,
	[UnitPrice] [decimal](18, 3) NULL,
	[DiscountPrice] [decimal](18, 3) NULL,
	[ComplexPrice] [decimal](18, 3) NULL,
	[Explan] [nvarchar](max) NULL,
	[ClearWay] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_RFQ_Material] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SidePage]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SidePage](
	[idno] [int] IDENTITY(1,1) NOT NULL,
	[situation] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffInfo]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffInfo](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[SysUserName] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[ID] [nvarchar](50) NULL,
	[Sex] [nvarchar](10) NULL,
	[Blood] [nvarchar](10) NULL,
	[Birthday] [nvarchar](50) NULL,
	[EngName] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CensusAdd] [nvarchar](max) NULL,
	[ContactAdd] [nvarchar](max) NULL,
	[OnBoardDate] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_StaffInfo] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubBudget_Item]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubBudget_Item](
	[SB_MID] [int] IDENTITY(1,1) NOT NULL,
	[SBID] [int] NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[BelongEWID] [int] NULL,
	[BelongItem] [nvarchar](50) NULL,
	[SCNumber] [decimal](18, 3) NULL,
	[UnitPrice] [decimal](18, 3) NULL,
	[DelTemp] [int] NULL CONSTRAINT [DF_SubBudget_Material_DeleteTemp]  DEFAULT ((0)),
	[AddTemp] [int] NULL CONSTRAINT [DF_SubBudget_Material_AddTemp]  DEFAULT ((0)),
	[DisCountRecord] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubBudget_Material] PRIMARY KEY CLUSTERED 
(
	[SB_MID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubBudgetList]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubBudgetList](
	[SBID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[SB_Code] [nvarchar](50) NOT NULL,
	[SB_Name] [nvarchar](50) NULL,
	[BookInTime] [datetime] NULL,
	[BookContractDate] [datetime] NULL,
	[LastContractDate] [datetime] NULL,
	[ContractWay] [nvarchar](50) NULL,
	[WorkManDep] [nvarchar](50) NULL,
	[WorkManName] [nvarchar](50) NULL,
	[BudgetPrice] [decimal](18, 3) NULL,
	[BudgetLockNY] [int] NOT NULL CONSTRAINT [DF_SubBudgetList_Lock]  DEFAULT ((0)),
	[RFQ_ReplyDate] [nvarchar](50) NULL,
	[RFQ_Warranty] [decimal](18, 2) NULL,
	[RFQ_Attach1] [int] NOT NULL CONSTRAINT [DF_SubBudgetList_Attach1]  DEFAULT ((0)),
	[RFQ_Attach2] [int] NOT NULL CONSTRAINT [DF_SubBudgetList_Attach2]  DEFAULT ((0)),
	[RFQ_Attach3] [int] NOT NULL CONSTRAINT [DF_SubBudgetList_Attach3]  DEFAULT ((0)),
	[RFQ_Attach4] [int] NOT NULL CONSTRAINT [DF_SubBudgetList_Attach4]  DEFAULT ((0)),
	[RFQ_Attach5] [int] NOT NULL CONSTRAINT [DF_SubBudgetList_Attach5]  DEFAULT ((0)),
	[RFQ_Attach6] [int] NOT NULL CONSTRAINT [DF_SubBudgetList_Attach6]  DEFAULT ((0)),
	[RFQ_AttachOther] [nvarchar](50) NULL CONSTRAINT [DF_SubBudgetList_AttachOther]  DEFAULT ((0)),
	[RFQ_Notes] [nvarchar](max) NULL,
	[SC_Code] [nvarchar](50) NULL,
	[GetFirmID] [int] NOT NULL CONSTRAINT [DF_SubBudgetList_GetFirmID]  DEFAULT ((0)),
	[SCID] [int] NULL,
 CONSTRAINT [PK_SubContract] PRIMARY KEY CLUSTERED 
(
	[SBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubClassMapping]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubClassMapping](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectCode] [nvarchar](50) NULL,
	[SubClass] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubClassMapping] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubContract_Change]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubContract_Change](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SCID] [int] NOT NULL,
	[SC_MID] [int] NOT NULL,
	[ChNumber] [decimal](18, 3) NULL,
	[Edition] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[UpdateTemp] [int] NOT NULL,
 CONSTRAINT [PK_SubContract_Change] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubContract_File]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubContract_File](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SCID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Path] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubContract_File] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubContract_Item]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubContract_Item](
	[SC_MID] [int] IDENTITY(1,1) NOT NULL,
	[SCID] [int] NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[BelongEWID] [int] NULL,
	[BelongItem] [nvarchar](50) NULL,
	[SCNumber] [decimal](18, 3) NULL,
	[LastSCNumber] [decimal](18, 3) NULL,
	[UnitPrice] [decimal](18, 3) NULL,
	[ComplexPrice] [decimal](18, 3) NULL,
	[LastComplexPrice] [decimal](18, 3) NULL,
	[LastEdition] [int] NOT NULL CONSTRAINT [DF_SubContract_Item_LastEdition]  DEFAULT ((0)),
	[Explan] [nvarchar](max) NULL,
	[ClearWay] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubContract_Item] PRIMARY KEY CLUSTERED 
(
	[SC_MID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubContract_Main]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubContract_Main](
	[SCID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[SC_Code] [nvarchar](50) NOT NULL,
	[SC_Name] [nvarchar](50) NOT NULL,
	[FirmID] [int] NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[LastTotalPrice] [decimal](18, 0) NULL,
	[BookInTime] [datetime] NULL,
	[ContractType] [nvarchar](50) NULL,
	[GuaranteeWay] [nvarchar](50) NULL,
	[SubmitPercent] [decimal](4, 2) NULL,
	[RequestNum] [int] NULL,
	[RequestDate] [nvarchar](50) NULL,
	[PayDate] [nvarchar](50) NULL,
	[DurationRule] [nvarchar](50) NULL,
	[PunishType] [nvarchar](50) NULL,
	[Punish] [nvarchar](50) NULL,
	[WarrantyYear] [decimal](3, 1) NULL,
	[MaintainYear] [decimal](3, 1) NULL,
	[ReWarrantyYear] [decimal](3, 1) NULL,
	[TaxPercent] [decimal](4, 2) NULL,
	[Scope] [nvarchar](max) NULL,
	[ContractNote] [nvarchar](max) NULL,
	[PrepayPercent] [decimal](4, 2) NULL,
	[PrepayCash] [decimal](4, 2) NULL,
	[PrepayCheck] [decimal](4, 2) NULL,
	[PrepayCheckDay] [int] NULL,
	[PrepayGuarantee] [nvarchar](50) NULL,
	[FundCash] [decimal](4, 2) NULL,
	[FundCheck] [decimal](4, 2) NULL,
	[FundCheckDay] [int] NULL,
	[RetentionPercent] [decimal](4, 2) NULL,
	[RetentionCash] [decimal](4, 2) NULL,
	[RetentionCheck] [decimal](4, 2) NULL,
	[RetentionCheckDay] [int] NULL,
	[WarrantyPercent] [decimal](4, 2) NULL,
	[WarrantyCash] [decimal](4, 2) NULL,
	[WarrantyCheck] [decimal](4, 2) NULL,
	[WarrantyCheckDay] [int] NULL,
	[WarrantyWay] [nvarchar](50) NULL,
	[LastEdition] [int] NOT NULL CONSTRAINT [DF_SubContract_Main_LastEdition]  DEFAULT ((0)),
 CONSTRAINT [PK_SubContract_Main] PRIMARY KEY CLUSTERED 
(
	[SCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubRFQ_File]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRFQ_File](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SBID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Path] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubRFQ_File] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubRFQ_Firm]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRFQ_Firm](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SBID] [int] NOT NULL,
	[Sort] [int] NULL,
	[FirmID] [int] NULL,
	[ExpiretionDate] [nvarchar](50) NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[Tax] [decimal](18, 0) NULL,
	[DiscountPercent] [decimal](4, 2) NULL,
	[DiscountTotal] [decimal](18, 0) NULL,
	[DisTotalPrice] [decimal](18, 0) NULL,
	[ContractType] [nvarchar](50) NULL,
	[GuaranteeWay] [nvarchar](50) NULL,
	[SubmitPercent] [decimal](4, 2) NULL,
	[RequestNum] [int] NULL,
	[RequestDate] [nvarchar](50) NULL,
	[PayDate] [nvarchar](50) NULL,
	[DurationRule] [nvarchar](50) NULL,
	[PunishType] [nvarchar](50) NULL,
	[Punish] [nvarchar](50) NULL,
	[WarrantyYear] [decimal](3, 1) NULL,
	[MaintainYear] [decimal](3, 1) NULL,
	[ReWarrantyYear] [decimal](3, 1) NULL,
	[TaxPercent] [decimal](4, 2) NULL,
	[Scope] [nvarchar](max) NULL,
	[ContractNote] [nvarchar](max) NULL,
	[PrepayPercent] [decimal](4, 2) NULL,
	[PrepayCash] [decimal](4, 2) NULL,
	[PrepayCheck] [decimal](4, 2) NULL,
	[PrepayCheckDay] [int] NULL,
	[PrepayGuarantee] [nvarchar](50) NULL,
	[FundCash] [decimal](4, 2) NULL,
	[FundCheck] [decimal](4, 2) NULL,
	[FundCheckDay] [int] NULL,
	[RetentionPercent] [decimal](4, 2) NULL,
	[RetentionCash] [decimal](4, 2) NULL,
	[RetentionCheck] [decimal](4, 2) NULL,
	[RetentionCheckDay] [int] NULL,
	[WarrantyPercent] [decimal](4, 2) NULL,
	[WarrantyCash] [decimal](4, 2) NULL,
	[WarrantyCheck] [decimal](4, 2) NULL,
	[WarrantyCheckDay] [int] NULL,
	[WarrantyWay] [nvarchar](50) NULL,
	[GetNY] [int] NOT NULL CONSTRAINT [DF_SubRFQ_Firm_QuoteNY]  DEFAULT ((0)),
 CONSTRAINT [PK_SubRFQ_Firm] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubRFQ_Material]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRFQ_Material](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[SBID] [int] NOT NULL,
	[FirmID] [int] NULL,
	[SB_MID] [int] NULL,
	[PriceID] [int] NULL,
	[UnitPrice] [decimal](18, 3) NULL,
	[ComplexPrice] [decimal](18, 3) NULL,
	[DisUnitPrice] [decimal](18, 3) NULL,
	[DisComplexPrice] [decimal](18, 3) NULL,
	[Explan] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubRFQ_Material] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test_table]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_table](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[ConTent] [nvarchar](max) NULL,
	[sort_number] [int] NOT NULL,
 CONSTRAINT [PK_Test_table] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test_table_excel]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_table_excel](
	[Code] [int] NULL,
	[Caption] [nvarchar](50) NULL,
	[Qty] [int] NULL,
	[Price] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProjectPageAccess]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProjectPageAccess](
	[UPPAID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_UserProjectPageAccess] PRIMARY KEY CLUSTERED 
(
	[UPPAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsualWord]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsualWord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Sortnumber] [int] NULL,
	[UnitID] [nvarchar](max) NULL,
	[PublicID] [int] NULL,
 CONSTRAINT [PK_UsualWord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkPicType]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkPicType](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[WP_Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_WorkPicType] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[CBUDGET]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CBUDGET] AS
SELECT a.CWID,a.CNumber,a.LastCNumber,a.PID,b.CPrice,
a.LastCNumber * (b.CPrice) AS CTotal
FROM CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID

GO
/****** Object:  View [dbo].[EBUDGET]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[EBUDGET]
AS
SELECT          a.EWID, a.ENumber, a.LastENumber, a.PID, b.EPrice, a.LastENumber * b.CPrice AS ETotal
FROM              dbo.EBudget_WBS AS a LEFT OUTER JOIN
                            dbo.Pro_Resource AS b ON a.PriceID = b.PriceID
GO
/****** Object:  View [dbo].[Report_3in1]    Script Date: 2016/8/1 下午 01:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Report_3in1]
AS
SELECT          A.RPID, A.ReportID, A.ProgressID, A.CompleteProgress, B.ReportID AS Expr1, B.ProjectID, B.ReportDate, 
                            B.MorningWeather, B.AfternoonWeather, B.DataDate, B.ReporterID, B.MorningWork, B.AfternoonWork, 
                            C.ProgressID AS Expr2, C.WBSID, C.WBSName, C.WIID, C.WIName, C.Duration, C.PreWorkID, C.ES, C.EE, C.LS, 
                            C.LE, C.ProjectID AS Expr3, C.CP, C.StartDate, C.EndDate
FROM              dbo.Report_Progress AS A INNER JOIN
                            dbo.Report_Base AS B ON A.ReportID = B.ReportID INNER JOIN
                            dbo.Progress_WIINF AS C ON A.ProgressID = C.ProgressID

GO
/****** Object:  Index [IX_UsualWord]    Script Date: 2016/8/1 下午 01:52:28 ******/
CREATE NONCLUSTERED INDEX [IX_UsualWord] ON [dbo].[UsualWord]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Daily_Equipment] ADD  CONSTRAINT [DF_Daily_LaborEquipment_ValucationNY]  DEFAULT ((0)) FOR [ValucationNY]
GO
ALTER TABLE [dbo].[FFund_Modify] ADD  CONSTRAINT [DF_FFund_Debit_BelongFFID]  DEFAULT ((0)) FOR [BelongFFID]
GO
ALTER TABLE [dbo].[FFund_Modify] ADD  CONSTRAINT [DF_FFund_Modify_RelationFF_MID]  DEFAULT ((0)) FOR [RelationFF_MID]
GO
ALTER TABLE [dbo].[OFund_Modify] ADD  CONSTRAINT [DF_OFund_Modify_BelongFFID]  DEFAULT ((0)) FOR [BelonFID]
GO
ALTER TABLE [dbo].[OFund_Modify] ADD  CONSTRAINT [DF_OFund_Modify_BelonFID1]  DEFAULT ((0)) FOR [ApprovalOFID]
GO
ALTER TABLE [dbo].[SubContract_Change] ADD  CONSTRAINT [DF_SubContract_Change_UpdateTemp]  DEFAULT ((0)) FOR [UpdateTemp]
GO
ALTER TABLE [dbo].[Bid_Joint]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Joint_FirmM] FOREIGN KEY([FID])
REFERENCES [dbo].[FirmM] ([UID])
GO
ALTER TABLE [dbo].[Bid_Joint] CHECK CONSTRAINT [FK_Bid_Joint_FirmM]
GO
USE [master]
GO
ALTER DATABASE [NTUST] SET  READ_WRITE 
GO
