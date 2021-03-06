USE [master]
GO
/****** Object:  Database [WxConstruction]    Script Date: 2017/9/22 11:09:33 ******/
CREATE DATABASE [WxConstruction]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WxConstruction', FILENAME = N'D:\Database\WxConstruction.mdf' , SIZE = 198656KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WxConstruction_log', FILENAME = N'D:\Database\WxConstruction_log.ldf' , SIZE = 241216KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WxConstruction] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WxConstruction].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WxConstruction] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WxConstruction] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WxConstruction] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WxConstruction] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WxConstruction] SET ARITHABORT OFF 
GO
ALTER DATABASE [WxConstruction] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WxConstruction] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WxConstruction] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WxConstruction] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WxConstruction] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WxConstruction] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WxConstruction] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WxConstruction] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WxConstruction] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WxConstruction] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WxConstruction] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WxConstruction] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WxConstruction] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WxConstruction] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WxConstruction] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WxConstruction] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WxConstruction] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WxConstruction] SET RECOVERY FULL 
GO
ALTER DATABASE [WxConstruction] SET  MULTI_USER 
GO
ALTER DATABASE [WxConstruction] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WxConstruction] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WxConstruction] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WxConstruction] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WxConstruction] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WxConstruction', N'ON'
GO
ALTER DATABASE [WxConstruction] SET QUERY_STORE = OFF
GO
USE [WxConstruction]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [WxConstruction]
GO
/****** Object:  Table [dbo].[AdvancedArticle]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvancedArticle](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Advertising] [uniqueidentifier] NULL,
	[ShareImageUrl] [varchar](1000) NULL,
	[ShareTimelineTitle] [varchar](100) NULL,
	[ShareAppMessageTitle] [varchar](100) NULL,
	[ShareAppMessageDescription] [varchar](200) NULL,
	[ShareTimelinePoint] [int] NOT NULL,
	[ShareAppMessagePoint] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[PageVisitCount] [int] NOT NULL,
 CONSTRAINT [PK_AdvancedArticle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertising]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertising](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ImageUrl] [varchar](1000) NOT NULL,
	[LandingUrl] [varchar](500) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[Clicks] [int] NOT NULL,
 CONSTRAINT [PK_Advertising] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleMaterial]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleMaterial](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[MediaId] [varchar](100) NULL,
	[Name] [varchar](100) NULL,
	[CreateTime] [datetime] NOT NULL,
	[OperatorUser] [uniqueidentifier] NOT NULL,
	[WeixinStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_ArticleMaterial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleMaterialItem]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleMaterialItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[ArticleMaterial] [uniqueidentifier] NOT NULL,
	[Title] [varchar](128) NOT NULL,
	[ThumbMediaId] [varchar](100) NULL,
	[Author] [varchar](16) NULL,
	[Digest] [varchar](240) NULL,
	[ShowCoverPic] [tinyint] NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[ContentSourceUrl] [varchar](1000) NULL,
	[ThumbUrl] [varchar](300) NULL,
	[ThumbName] [varchar](100) NULL,
	[Url] [varchar](300) NULL,
	[Index] [int] NOT NULL,
	[ImgMapping] [varchar](max) NULL,
 CONSTRAINT [PK_ArticleMaterialItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorizer]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorizer](
	[AppId] [varchar](50) NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AuthorizationTime] [datetime] NOT NULL,
	[Online] [bit] NOT NULL,
	[RefreshToken] [varchar](300) NOT NULL,
	[RefreshTokenGetTime] [datetime] NOT NULL,
	[AccessToken] [varchar](300) NULL,
	[AccessTokenExpiryTime] [datetime] NULL,
	[JsApiTicket] [varchar](300) NULL,
	[JsApiTicketExpiryTime] [datetime] NULL,
	[NickName] [varchar](100) NULL,
	[HeadImg] [varchar](1000) NULL,
	[ServiceType] [smallint] NULL,
	[VerifyType] [smallint] NULL,
	[UserName] [varchar](50) NULL,
	[Alias] [varchar](50) NULL,
	[Store] [bit] NULL,
	[Scan] [bit] NULL,
	[Pay] [bit] NULL,
	[Card] [bit] NULL,
	[Shake] [bit] NULL,
	[QRCodeUrl] [varchar](1000) NULL,
	[FuncScopeCategory] [varchar](50) NULL,
 CONSTRAINT [PK_Authorizer] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC,
	[Domain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorizerPayConfig]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorizerPayConfig](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[MchId] [varchar](32) NOT NULL,
	[CertificatePath] [varchar](500) NOT NULL,
	[CertificatePassword] [varchar](50) NOT NULL,
	[Key] [varchar](50) NOT NULL,
	[AppSecret] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AuthorizerPayConfig] PRIMARY KEY CLUSTERED 
(
	[Domain] ASC,
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutoReplyOnKeyWordsContent]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoReplyOnKeyWordsContent](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[RuleId] [uniqueidentifier] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Content] [varchar](1200) NULL,
	[Name] [varchar](100) NULL,
	[Url] [varchar](300) NULL,
	[MediaId] [varchar](100) NULL,
	[ArticleId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AutoReplyOnKeyWordsContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutoReplyOnKeyWordsRule]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoReplyOnKeyWordsRule](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[RuleName] [varchar](120) NOT NULL,
	[Keyword] [varchar](max) NOT NULL,
	[ReplyAll] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AutoReplyOnKeyWordsRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutoReplyOnMessage]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoReplyOnMessage](
	[Domain] [uniqueidentifier] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Content] [varchar](1200) NULL,
	[Name] [varchar](100) NULL,
	[Url] [varchar](300) NULL,
	[MediaId] [varchar](100) NULL,
	[MaterialId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AutoReplyOnMessage] PRIMARY KEY CLUSTERED 
(
	[Domain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutoReplyOnSubscribe]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoReplyOnSubscribe](
	[Domain] [uniqueidentifier] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Content] [varchar](1200) NULL,
	[Name] [varchar](100) NULL,
	[Url] [varchar](300) NULL,
	[MediaId] [varchar](100) NULL,
	[MaterialId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AutoReplyOnSubscribe] PRIMARY KEY CLUSTERED 
(
	[Domain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[Description] [varchar](max) NULL,
	[ShareImageUrl] [varchar](300) NULL,
	[ImageUrl] [varchar](300) NOT NULL,
	[ShareTimelineTitle] [varchar](100) NULL,
	[ShareAppMessageTitle] [varchar](100) NULL,
	[ShareAppMessageDescription] [varchar](200) NULL,
	[Status] [tinyint] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[AutoOngoing] [bit] NOT NULL,
	[OnlyMember] [bit] NOT NULL,
	[GuideSubscribeUrl] [varchar](1000) NULL,
	[ShareTimelinePoint] [int] NOT NULL,
	[ShareAppMessagePoint] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[Remark] [varchar](500) NULL,
	[MaxParticipant] [int] NOT NULL,
	[PageVisitCount] [int] NOT NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Donation]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Donation](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Campaign_Donation] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_DonationLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_DonationLog](
	[Id] [uniqueidentifier] NOT NULL,
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[PayOrder] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Contact] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Campaign_DonationLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Lottery]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Lottery](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Point] [int] NOT NULL,
	[Mode] [tinyint] NOT NULL,
	[DrawCount] [int] NOT NULL,
 CONSTRAINT [PK_Campaign_Lottery] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_LotteryPeriod]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_LotteryPeriod](
	[Id] [uniqueidentifier] NOT NULL,
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[LogQuantity] [int] NOT NULL,
	[Drawn] [bit] NOT NULL,
 CONSTRAINT [PK_Campaign_LotteryPeriod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_LotterySignLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_LotterySignLog](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Period] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[SignTime] [datetime] NOT NULL,
	[LucklyNumber] [int] NOT NULL,
	[Win] [bit] NOT NULL,
 CONSTRAINT [PK_Campaign_LotterySignLog] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC,
	[Period] ASC,
	[Member] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_LuckyTicket]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_LuckyTicket](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[LastDrawTime] [datetime] NULL,
 CONSTRAINT [PK_Campaign_LuckyTicket] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_LuckyTicketLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_LuckyTicketLog](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[TicketNumber] [varchar](30) NOT NULL,
	[FromOpenId] [varchar](32) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Win] [bit] NOT NULL,
	[WinTime] [datetime] NULL,
	[WinRemark] [nvarchar](50) NULL,
 CONSTRAINT [PK_Campaign_LuckyTicketLog] PRIMARY KEY CLUSTERED 
(
	[TicketNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_MemberQRCode]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_MemberQRCode](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[BackgroundImageUrl] [varchar](300) NOT NULL,
	[BackgroundImageId] [uniqueidentifier] NOT NULL,
	[LandingUrl] [varchar](300) NOT NULL,
	[LandingPoint] [int] NOT NULL,
 CONSTRAINT [PK_Campaign_MemberQRCode] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_MemberQRCodeItem]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_MemberQRCodeItem](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[QRCodeUrl] [varchar](300) NOT NULL,
	[MediaId] [varchar](100) NULL,
	[CreateTime] [datetime] NOT NULL,
	[LandingCount] [int] NOT NULL,
	[LandingPersonCount] [int] NOT NULL,
 CONSTRAINT [PK_Campaign_MemberQRCodeItem] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC,
	[Member] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_MemberQRCodeLandingLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_MemberQRCodeLandingLog](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[QRCodeOwnMember] [uniqueidentifier] NOT NULL,
	[VisitorOpenId] [varchar](32) NOT NULL,
	[LandingTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_PictureVote]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_PictureVote](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[PublishType] [tinyint] NOT NULL,
	[MaxPublishTimes] [int] NOT NULL,
	[MaxVoteTimes] [int] NOT NULL,
	[ApprovedPoint] [int] NOT NULL,
	[ShareTimelineVote] [int] NOT NULL,
	[ShareAppMessageVote] [int] NOT NULL,
	[VoteType] [int] NOT NULL,
	[AllowedNoAttentionVote] [bit] NOT NULL,
	[AllowedNewItem] [bit] NOT NULL,
 CONSTRAINT [PK_Campaign_PictureVote] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_PictureVoteItem]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_PictureVoteItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NULL,
	[User] [uniqueidentifier] NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Url] [varchar](300) NOT NULL,
	[UploadTime] [datetime] NOT NULL,
	[SerialNumber] [varchar](30) NOT NULL,
	[ApproveStatus] [tinyint] NOT NULL,
	[VoteQuantity] [int] NOT NULL,
	[Lock] [bit] NOT NULL,
	[RejectedMessage] [varchar](200) NULL,
 CONSTRAINT [PK_Campaign_PictureVoteItem_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_PictureVoteLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_PictureVoteLog](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[OpenId] [varchar](32) NOT NULL,
	[Member] [uniqueidentifier] NULL,
	[VoteTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_ShakingLottery]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_ShakingLottery](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Point] [int] NOT NULL,
	[Mode] [tinyint] NOT NULL,
	[ChanceTimes] [int] NOT NULL,
	[Started] [bit] NOT NULL,
	[Period] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Campaign_ShakingLottery] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_ShakingLotteryGift]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_ShakingLotteryGift](
	[Id] [uniqueidentifier] NOT NULL,
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Period] [uniqueidentifier] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ImageUrl] [varchar](1000) NULL,
	[Probability] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[IsGift] [bit] NOT NULL,
 CONSTRAINT [PK_Campaign_ShakingLotteryGift] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_ShakingLotteryLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_ShakingLotteryLog](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Period] [uniqueidentifier] NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Win] [bit] NOT NULL,
	[Gift] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_ShakingLotteryPeriod]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_ShakingLotteryPeriod](
	[Id] [uniqueidentifier] NOT NULL,
	[CampaignId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Campaign_ShakingLotteryPeriod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashAccountTrack]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashAccountTrack](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[Fee] [int] NOT NULL,
	[Balances] [int] NOT NULL,
	[ChangeTime] [datetime] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[OperatorUser] [uniqueidentifier] NULL,
	[IP] [varchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[TagName] [nvarchar](100) NULL,
	[TagId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CashAccountTrack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ImageUrl] [varchar](1000) NULL,
	[Condition] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[InfiniteStock] [bit] NOT NULL,
	[Stock] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[DistributedCount] [int] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponRecord]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponRecord](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Coupon] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[SerialNumber] [varchar](30) NOT NULL,
	[QRCodeImageUrl] [varchar](1000) NULL,
	[DistributeUser] [uniqueidentifier] NOT NULL,
	[DistributeTime] [datetime] NOT NULL,
	[DistributeIP] [varchar](50) NOT NULL,
	[LimitedTime] [datetime] NULL,
	[ChargeTime] [datetime] NULL,
	[ChargeUser] [uniqueidentifier] NULL,
	[ChargeIP] [varchar](50) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_CouponRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponSerialNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponSerialNumber](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomForm]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomForm](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Introduction] [nvarchar](max) NULL,
	[SuccessfulDescription] [nvarchar](max) NULL,
	[ShareImageUrl] [varchar](300) NULL,
	[ShareTimelineTitle] [varchar](100) NULL,
	[ShareAppMessageTitle] [varchar](100) NULL,
	[ShareAppMessageDescription] [varchar](200) NULL,
	[ImageUrl] [varchar](1000) NULL,
	[OnlyMember] [bit] NOT NULL,
	[GuideSubscribeUrl] [varchar](1000) NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[Remark] [varchar](500) NULL,
	[FieldName] [bit] NOT NULL,
	[FieldNameRequired] [bit] NOT NULL,
	[FieldBirthday] [bit] NOT NULL,
	[FieldBirthdayRequired] [bit] NOT NULL,
	[FieldMobilePhone] [bit] NOT NULL,
	[FieldMobilePhoneRequired] [bit] NOT NULL,
	[FieldEmail] [bit] NOT NULL,
	[FieldEmailRequired] [bit] NOT NULL,
	[PageVisitCount] [int] NOT NULL,
	[FillinCount] [int] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_CustomForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomFormContent]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomFormContent](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Form] [uniqueidentifier] NOT NULL,
	[MemberOpenId] [varchar](32) NOT NULL,
	[FillinTime] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_CustomFormContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domain]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domain](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[LimitedDate] [smalldatetime] NULL,
	[PayLimitedDate] [smalldatetime] NULL,
	[LastUpdateTime] [datetime] NOT NULL,
	[LastDockingTime] [datetime] NULL,
 CONSTRAINT [PK_Domain] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMessage]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMessage](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[IsToAll] [bit] NOT NULL,
	[GroupId] [int] NULL,
	[Type] [tinyint] NOT NULL,
	[Content] [varchar](1200) NULL,
	[Name] [varchar](100) NULL,
	[Url] [varchar](300) NULL,
	[MediaId] [varchar](100) NULL,
	[ArticleId] [uniqueidentifier] NULL,
	[MsgId] [bigint] NULL,
	[MsgDataId] [bigint] NULL,
	[Status] [varchar](100) NULL,
	[TotalCount] [int] NULL,
	[FilterCount] [int] NULL,
	[SentCount] [int] NULL,
	[ErrorCount] [int] NULL,
	[SubmitTime] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Information]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Information](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Information] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformationCategory]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformationCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Information] [uniqueidentifier] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Image] [varchar](1000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_InformationCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformationItem]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformationItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Information] [uniqueidentifier] NOT NULL,
	[Category] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Image] [varchar](1000) NOT NULL,
	[ImageList] [varchar](max) NULL,
	[Introduction] [nvarchar](300) NULL,
	[Description] [nvarchar](max) NULL,
	[PhoneNumber] [varchar](30) NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_InformationItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NULL,
	[OpenId] [varchar](32) NOT NULL,
	[NickName] [nvarchar](200) NULL,
	[Sex] [tinyint] NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[Headimgurl] [varchar](500) NULL,
	[SubscribeTime] [datetime] NULL,
	[Remark] [varchar](60) NULL,
	[GroupId] [int] NULL,
	[TagList] [varchar](50) NULL,
	[UnsubscribeTime] [datetime] NULL,
	[CardNumber] [varchar](30) NOT NULL,
	[CardLevel] [uniqueidentifier] NULL,
	[ScenicQRCodeId] [uniqueidentifier] NULL,
	[RefereeMemberId] [uniqueidentifier] NULL,
	[Attention] [bit] NOT NULL,
	[Point] [int] NOT NULL,
	[CashAccount] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [smalldatetime] NULL,
	[MobilePhone] [varchar](30) NULL,
	[Email] [varchar](60) NULL,
	[MemberCenterQRCodeImageUrl] [varchar](1000) NULL,
	[SignInDate] [smalldatetime] NULL,
	[SyncFlag] [datetime] NULL,
	[NeedUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberCardLevel]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCardLevel](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[ImageUrl] [varchar](1000) NOT NULL,
	[PrivilegeUrl] [varchar](1000) NULL,
	[CardNumberColor] [char](7) NOT NULL,
 CONSTRAINT [PK_MemberCardLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberCardSerialNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCardSerialNumber](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MemberCardSerialNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberGroup]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberGroup](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Name] [varchar](12) NOT NULL,
 CONSTRAINT [PK_MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPointTrack]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPointTrack](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Point] [int] NOT NULL,
	[ChangeTime] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[TagName] [varchar](100) NULL,
	[TagId] [uniqueidentifier] NULL,
	[OperatorUser] [uniqueidentifier] NULL,
	[Remark] [varchar](500) NULL,
 CONSTRAINT [PK_MemberPointTrack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberTag]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberTag](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[TagId] [int] NOT NULL,
	[Name] [varchar](12) NOT NULL,
 CONSTRAINT [PK_MemberTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[DomainId] [uniqueidentifier] NOT NULL,
	[Menu] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Receive] [bit] NOT NULL,
	[OfficalWeixinId] [varchar](50) NOT NULL,
	[MemberOpenId] [varchar](32) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ReceivingMessageType] [varchar](20) NULL,
	[ReplyMessageType] [varchar](20) NULL,
	[Content] [varchar](1200) NULL,
	[MediaId] [varchar](100) NULL,
	[Image_PicUrl] [varchar](300) NULL,
	[Voice_Format] [varchar](20) NULL,
	[Voice_Recognition] [varchar](1200) NULL,
	[ThumbMediaId] [varchar](100) NULL,
	[Location_X] [decimal](18, 6) NULL,
	[Location_Y] [decimal](18, 6) NULL,
	[Location_Scale] [int] NULL,
	[Location_Label] [varchar](300) NULL,
	[Link_Title] [varchar](300) NULL,
	[Link_Description] [varchar](1200) NULL,
	[Link_Url] [varchar](1000) NULL,
	[MsgId] [bigint] NULL,
	[ReplyUser] [uniqueidentifier] NULL,
	[ContentType] [varchar](50) NULL,
	[FileUrl] [varchar](1000) NULL,
	[FileLength] [int] NULL,
	[ThumbContentType] [varchar](50) NULL,
	[ThumbUrl] [varchar](1000) NULL,
	[ThumbLength] [int] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Image] [varchar](1000) NULL,
	[Director] [varchar](50) NULL,
	[Actor] [varchar](1000) NULL,
	[Time] [varchar](50) NULL,
	[Type] [varchar](200) NULL,
	[MtimeId] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoviePlan]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviePlan](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Movie] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieSettings]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieSettings](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[MTimeUrl] [varchar](1000) NULL,
	[ShareImageUrl] [varchar](300) NULL,
	[ShareTimelineTitle] [varchar](100) NULL,
	[ShareAppMessageTitle] [varchar](100) NULL,
	[ShareAppMessageDescription] [varchar](200) NULL,
	[SyncTime] [datetime] NULL,
 CONSTRAINT [PK_MovieSettings] PRIMARY KEY CLUSTERED 
(
	[Domain] ASC,
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieTimes]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieTimes](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Movie] [uniqueidentifier] NOT NULL,
	[Time] [smalldatetime] NOT NULL,
	[EndTime] [varchar](30) NULL,
	[ShowType] [varchar](30) NULL,
	[Language] [varchar](30) NULL,
	[ScreeningRoom] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NormalMaterial]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NormalMaterial](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[MediaId] [varchar](100) NOT NULL,
	[WeixinUrl] [varchar](300) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Url] [varchar](300) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[OperatorUser] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MaterialImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OneDollarBuyingCommodity]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OneDollarBuyingCommodity](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[ForSale] [bit] NOT NULL,
	[InfiniteStock] [bit] NOT NULL,
	[Stock] [int] NOT NULL,
	[ImageUrl] [varchar](1000) NULL,
	[Introduction] [varchar](1000) NULL,
	[Sold] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
	[Remove] [bit] NOT NULL,
 CONSTRAINT [PK_OneDollarBuyingCommodity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OneDollarBuyingCommodityForSale]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OneDollarBuyingCommodityForSale](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[CommodityId] [uniqueidentifier] NOT NULL,
	[PeriodNumber] [varchar](30) NOT NULL,
	[TotalPart] [int] NOT NULL,
	[SoldPart] [int] NOT NULL,
	[ForSaleTime] [datetime] NOT NULL,
	[SoldOutTime] [datetime] NULL,
	[LuckyPartNumber] [varchar](30) NULL,
	[LuckyMember] [uniqueidentifier] NULL,
	[LuckyMemberPartNumberCount] [int] NULL,
	[DrawTime] [datetime] NULL,
	[Deal] [bit] NOT NULL,
	[DealTime] [datetime] NULL,
	[DealUser] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OneDollarBuyingCommodityForSale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OneDollarBuyingCommoditySoldPart]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OneDollarBuyingCommoditySoldPart](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[CommodityId] [uniqueidentifier] NOT NULL,
	[SaleId] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[PartNumber] [int] NOT NULL,
	[SoldTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperatedLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatedLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NULL,
	[Time] [datetime] NOT NULL,
	[User] [uniqueidentifier] NOT NULL,
	[IP] [varchar](50) NULL,
	[Description] [varchar](300) NULL,
	[Module] [smallint] NOT NULL,
	[Detail] [varchar](max) NULL,
 CONSTRAINT [PK_OperatedLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[ShareImageUrl] [varchar](1000) NULL,
	[ShareTimelineTitle] [varchar](100) NULL,
	[ShareAppMessageTitle] [varchar](100) NULL,
	[ShareAppMessageDescription] [varchar](200) NULL,
	[ShareTimelinePoint] [int] NOT NULL,
	[ShareAppMessagePoint] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[PageVisitCount] [int] NOT NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayOrder]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayOrder](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[OpenId] [varchar](32) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[MchId] [varchar](32) NOT NULL,
	[DeviceInfo] [varchar](32) NULL,
	[Body] [nvarchar](128) NOT NULL,
	[Detail] [nvarchar](max) NULL,
	[Attach] [nvarchar](128) NULL,
	[OutTradeNo] [varchar](32) NOT NULL,
	[TotalFee] [int] NOT NULL,
	[SpbillCreateIp] [varchar](50) NOT NULL,
	[TimeStart] [datetime] NULL,
	[TimeExpire] [datetime] NULL,
	[GoodsTag] [varchar](32) NULL,
	[TradeType] [varchar](16) NOT NULL,
	[ProductId] [varchar](32) NULL,
	[LimitPay] [varchar](32) NULL,
	[PrepayId] [varchar](64) NULL,
	[TradeState] [tinyint] NULL,
	[TradeStateDesc] [nvarchar](256) NULL,
	[BankType] [varchar](16) NULL,
	[FeeType] [varchar](8) NULL,
	[CouponFee] [int] NULL,
	[CouponCount] [int] NULL,
	[TransactionId] [varchar](32) NULL,
	[TimeEnd] [datetime] NULL,
	[Notify] [bit] NOT NULL,
	[Notify_ReturnCode] [varchar](16) NULL,
	[Notify_ReturnMsg] [nvarchar](128) NULL,
	[Notify_ResultCode] [varchar](16) NULL,
	[Notify_ErrCode] [varchar](32) NULL,
	[Notify_ErrCodeDes] [nvarchar](128) NULL,
	[Finish] [bit] NOT NULL,
 CONSTRAINT [PK_PayOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayOrderCoupon]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayOrderCoupon](
	[PayOrderId] [uniqueidentifier] NOT NULL,
	[CouponBatchId] [varchar](20) NULL,
	[CouponType] [varchar](20) NULL,
	[CouponId] [varchar](20) NULL,
	[CouponFee] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointCommodity]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointCommodity](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Point] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[ImageUrl] [varchar](1000) NULL,
	[ImageList] [varchar](max) NULL,
	[Introduction] [varchar](1000) NULL,
	[ForSale] [bit] NOT NULL,
	[Stock] [int] NOT NULL,
	[Sold] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Sort] [int] NOT NULL,
	[Remove] [bit] NOT NULL,
 CONSTRAINT [PK_PointCommodity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointCommodityOrder]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointCommodityOrder](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[OrderNumber] [varchar](30) NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[Point] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[ExpireTime] [datetime] NULL,
	[DealTime] [datetime] NULL,
	[Status] [tinyint] NOT NULL,
	[PayOrder] [uniqueidentifier] NULL,
	[OperatorUser] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PointCommodityOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointCommodityOrderItem]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointCommodityOrderItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Order] [uniqueidentifier] NOT NULL,
	[PointCommodity] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Point] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[ImageUrl] [varchar](1000) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_PointCommodityOrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointCommodityOrderLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointCommodityOrderLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Order] [uniqueidentifier] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Message] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_PointCommodityOrderLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointCommodityShoppingCart]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointCommodityShoppingCart](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[PointCommodity] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[AddedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PointCommodityShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortalPresetTemplate]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortalPresetTemplate](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PreviewImageUrl] [varchar](1000) NOT NULL,
	[BackgroundImageUrl] [varchar](1000) NOT NULL,
	[Template] [varchar](max) NOT NULL,
	[PreviewHtml] [varchar](max) NULL,
	[PayRequired] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PortalPresetTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecommendUrl]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecommendUrl](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Member] [uniqueidentifier] NOT NULL,
	[Url] [varchar](500) NOT NULL,
	[ShortUrl] [varchar](100) NOT NULL,
	[LandingCount] [int] NOT NULL,
 CONSTRAINT [PK_RecommendUrl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecommendUrlLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecommendUrlLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[UrlOwnMember] [uniqueidentifier] NOT NULL,
	[VisitOpenId] [varchar](32) NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_RecommendUrlLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecommendUrlSettings]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecommendUrlSettings](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[LandingUrl] [varchar](1000) NULL,
	[AttentionPoint] [int] NOT NULL,
	[Level2AttentionPoint] [int] NOT NULL,
 CONSTRAINT [PK_RecommendUrlSettings_1] PRIMARY KEY CLUSTERED 
(
	[Domain] ASC,
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Redpack]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Redpack](
	[Domain] [uniqueidentifier] NOT NULL,
	[Member] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleAuthorization]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAuthorization](
	[Domain] [uniqueidentifier] NOT NULL,
	[Role] [uniqueidentifier] NOT NULL,
	[AuthorizationKey] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUser](
	[Domain] [uniqueidentifier] NOT NULL,
	[Role] [uniqueidentifier] NOT NULL,
	[User] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScenicQRCode]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScenicQRCode](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[Ticket] [varchar](200) NOT NULL,
	[Url] [varchar](300) NOT NULL,
	[QRCodeImageUrl] [varchar](1000) NOT NULL,
	[Remark] [varchar](1000) NULL,
	[LandingCount] [int] NOT NULL,
	[AttentionPersonCount] [int] NOT NULL,
 CONSTRAINT [PK_ScenicQRCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScenicQRCodeLandingLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScenicQRCodeLandingLog](
	[QRCodeId] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[VisitorOpenId] [varchar](32) NOT NULL,
	[LandingTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SerialNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialNumber](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[Module] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SerialNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[DefaultMemberCardLevel] [uniqueidentifier] NULL,
	[InitialMemberPoint] [int] NOT NULL,
	[SignInPoint] [int] NOT NULL,
	[PointCommodityGetWay] [varchar](500) NULL,
	[GuideSubscribeUrl] [varchar](1000) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Domain] ASC,
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShareLog]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShareLog](
	[Member] [uniqueidentifier] NULL,
	[OpenId] [varchar](32) NOT NULL,
	[PageId] [uniqueidentifier] NOT NULL,
	[ShareTimeline] [bit] NOT NULL,
	[ShareAppMessage] [bit] NOT NULL,
 CONSTRAINT [PK_ShareLog] PRIMARY KEY CLUSTERED 
(
	[OpenId] ASC,
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShortcutMenu]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShortcutMenu](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[Menu] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ShortcutMenu] PRIMARY KEY CLUSTERED 
(
	[Domain] ASC,
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StyleSettings]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StyleSettings](
	[Domain] [uniqueidentifier] NOT NULL,
	[AppId] [varchar](50) NOT NULL,
	[PortalMode] [tinyint] NOT NULL,
	[PortalImageUrl] [varchar](1000) NULL,
	[PortalPresetTemplateId] [uniqueidentifier] NULL,
	[PortalCustomTemplate] [varchar](max) NULL,
	[Theme] [varchar](20) NULL,
 CONSTRAINT [PK_StyleSettings] PRIMARY KEY CLUSTERED 
(
	[Domain] ASC,
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThirdParty]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThirdParty](
	[ComponentVerifyTicket] [varchar](200) NULL,
	[AccessToken] [varchar](300) NULL,
	[AccessTokenExpiryTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Account] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](200) NULL,
	[Telphone] [varchar](100) NULL,
	[MobilePhone] [varchar](30) NULL,
	[RegisterTime] [datetime] NOT NULL,
	[MemberId] [uniqueidentifier] NULL,
	[Remark] [nvarchar](200) NULL,
	[DomainOwner] [bit] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdvancedArticle] ADD  CONSTRAINT [DF_AdvancedArticle_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[AdvancedArticle] ADD  CONSTRAINT [DF_AdvancedArticle_ShareTimelinePoint]  DEFAULT ((0)) FOR [ShareTimelinePoint]
GO
ALTER TABLE [dbo].[AdvancedArticle] ADD  CONSTRAINT [DF_AdvancedArticle_ShareAppMessagePoint]  DEFAULT ((0)) FOR [ShareAppMessagePoint]
GO
ALTER TABLE [dbo].[AdvancedArticle] ADD  CONSTRAINT [DF_AdvancedArticle_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[AdvancedArticle] ADD  CONSTRAINT [DF_AdvancedArticle_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[AdvancedArticle] ADD  CONSTRAINT [DF_AdvancedArticle_PageVisitCount]  DEFAULT ((0)) FOR [PageVisitCount]
GO
ALTER TABLE [dbo].[Advertising] ADD  CONSTRAINT [DF_Advertising_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Advertising] ADD  CONSTRAINT [DF_Advertising_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[ArticleMaterial] ADD  CONSTRAINT [DF_ArticleMaterial_WeixinStatus]  DEFAULT ((0)) FOR [WeixinStatus]
GO
ALTER TABLE [dbo].[ArticleMaterialItem] ADD  CONSTRAINT [DF_ArticleMaterialItem_ShowCoverPic]  DEFAULT ((0)) FOR [ShowCoverPic]
GO
ALTER TABLE [dbo].[Authorizer] ADD  CONSTRAINT [DF_Authorizer_Online]  DEFAULT ((0)) FOR [Online]
GO
ALTER TABLE [dbo].[Authorizer] ADD  CONSTRAINT [DF_Authorizer_RefreshTokenGetTime]  DEFAULT (getdate()) FOR [RefreshTokenGetTime]
GO
ALTER TABLE [dbo].[AutoReplyOnKeyWordsContent] ADD  CONSTRAINT [DF_AutoReplyOnKeyWordsContent_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[AutoReplyOnKeyWordsRule] ADD  CONSTRAINT [DF_AutoReplyOnKeyWordsRule_ReplyAll]  DEFAULT ((0)) FOR [ReplyAll]
GO
ALTER TABLE [dbo].[AutoReplyOnKeyWordsRule] ADD  CONSTRAINT [DF_AutoReplyOnKeyWordsRule_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_AutoOngoing]  DEFAULT ((0)) FOR [AutoOngoing]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_OnlyMember]  DEFAULT ((1)) FOR [OnlyMember]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_ShareTimelinePoint]  DEFAULT ((1)) FOR [ShareTimelinePoint]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_ShareAppMessagePoint]  DEFAULT ((1)) FOR [ShareAppMessagePoint]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_MaxParticipant]  DEFAULT ((0)) FOR [MaxParticipant]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_PageVisitCount]  DEFAULT ((0)) FOR [PageVisitCount]
GO
ALTER TABLE [dbo].[Campaign_DonationLog] ADD  CONSTRAINT [DF_Campaign_DonationLog_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Campaign_Lottery] ADD  CONSTRAINT [DF_Campaign_Lottery_Point]  DEFAULT ((0)) FOR [Point]
GO
ALTER TABLE [dbo].[Campaign_Lottery] ADD  CONSTRAINT [DF_Campaign_Lottery_Mode]  DEFAULT ((0)) FOR [Mode]
GO
ALTER TABLE [dbo].[Campaign_Lottery] ADD  CONSTRAINT [DF_Campaign_Lottery_WinCount]  DEFAULT ((0)) FOR [DrawCount]
GO
ALTER TABLE [dbo].[Campaign_LotteryPeriod] ADD  CONSTRAINT [DF_Campaign_LotteryPeriod_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Campaign_LotteryPeriod] ADD  CONSTRAINT [DF_Campaign_LotteryPeriod_LogQuantity]  DEFAULT ((0)) FOR [LogQuantity]
GO
ALTER TABLE [dbo].[Campaign_LotteryPeriod] ADD  CONSTRAINT [DF_Campaign_LotteryPeriod_Drawn]  DEFAULT ((0)) FOR [Drawn]
GO
ALTER TABLE [dbo].[Campaign_LotterySignLog] ADD  CONSTRAINT [DF_Campaign_LotterySignLog_SignTime]  DEFAULT (getdate()) FOR [SignTime]
GO
ALTER TABLE [dbo].[Campaign_LotterySignLog] ADD  CONSTRAINT [DF_Campaign_LotterySignLog_LucklyNumber]  DEFAULT (round(rand()*(100000),(0))) FOR [LucklyNumber]
GO
ALTER TABLE [dbo].[Campaign_LotterySignLog] ADD  CONSTRAINT [DF_Campaign_LotterySignLog_Win]  DEFAULT ((0)) FOR [Win]
GO
ALTER TABLE [dbo].[Campaign_LuckyTicketLog] ADD  CONSTRAINT [DF_Campaign_LuckyTicketLog_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Campaign_LuckyTicketLog] ADD  CONSTRAINT [DF_Campaign_LuckyTicketLog_Win]  DEFAULT ((0)) FOR [Win]
GO
ALTER TABLE [dbo].[Campaign_MemberQRCode] ADD  CONSTRAINT [DF_Campaign_MemberQRCode_ScanPoint]  DEFAULT ((1)) FOR [LandingPoint]
GO
ALTER TABLE [dbo].[Campaign_MemberQRCodeItem] ADD  CONSTRAINT [DF_Campaign_MemberQRCodeItem_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Campaign_MemberQRCodeItem] ADD  CONSTRAINT [DF_Campaign_MemberQRCodeItem_LandingCount]  DEFAULT ((0)) FOR [LandingCount]
GO
ALTER TABLE [dbo].[Campaign_MemberQRCodeItem] ADD  CONSTRAINT [DF_Campaign_MemberQRCodeItem_LandingPersonCount]  DEFAULT ((0)) FOR [LandingPersonCount]
GO
ALTER TABLE [dbo].[Campaign_MemberQRCodeLandingLog] ADD  CONSTRAINT [DF_Campaign_MemberQRCodeScanLog_ScanningTime]  DEFAULT (getdate()) FOR [LandingTime]
GO
ALTER TABLE [dbo].[Campaign_PictureVote] ADD  CONSTRAINT [DF_Campaign_PictureVote_MultiPublish]  DEFAULT ((1)) FOR [MaxPublishTimes]
GO
ALTER TABLE [dbo].[Campaign_PictureVote] ADD  CONSTRAINT [DF_Campaign_PictureVote_MultiVote]  DEFAULT ((1)) FOR [MaxVoteTimes]
GO
ALTER TABLE [dbo].[Campaign_PictureVote] ADD  CONSTRAINT [DF_Campaign_PictureVote_ApprovedPoint]  DEFAULT ((1)) FOR [ApprovedPoint]
GO
ALTER TABLE [dbo].[Campaign_PictureVote] ADD  CONSTRAINT [DF_Campaign_PictureVote_ShareTimelineVote]  DEFAULT ((1)) FOR [ShareTimelineVote]
GO
ALTER TABLE [dbo].[Campaign_PictureVote] ADD  CONSTRAINT [DF_Campaign_PictureVote_ShareAppMessageVote]  DEFAULT ((1)) FOR [ShareAppMessageVote]
GO
ALTER TABLE [dbo].[Campaign_PictureVote] ADD  CONSTRAINT [DF_Campaign_PictureVote_VoteType]  DEFAULT ((0)) FOR [VoteType]
GO
ALTER TABLE [dbo].[Campaign_PictureVote] ADD  CONSTRAINT [DF_Campaign_PictureVote_AllowedNoAttentionVote]  DEFAULT ((1)) FOR [AllowedNoAttentionVote]
GO
ALTER TABLE [dbo].[Campaign_PictureVote] ADD  CONSTRAINT [DF_Campaign_PictureVote_AllowedNewItem]  DEFAULT ((1)) FOR [AllowedNewItem]
GO
ALTER TABLE [dbo].[Campaign_PictureVoteItem] ADD  CONSTRAINT [DF_Campaign_PictureVoteItem_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Campaign_PictureVoteItem] ADD  CONSTRAINT [DF_Campaign_PictureVoteItem_UploadTime]  DEFAULT (getdate()) FOR [UploadTime]
GO
ALTER TABLE [dbo].[Campaign_PictureVoteItem] ADD  CONSTRAINT [DF_Campaign_PictureVoteItem_Approved]  DEFAULT ((0)) FOR [ApproveStatus]
GO
ALTER TABLE [dbo].[Campaign_PictureVoteItem] ADD  CONSTRAINT [DF_Campaign_PictureVoteItem_VoteQuantity]  DEFAULT ((0)) FOR [VoteQuantity]
GO
ALTER TABLE [dbo].[Campaign_PictureVoteItem] ADD  CONSTRAINT [DF_Campaign_PictureVoteItem_Lock]  DEFAULT ((0)) FOR [Lock]
GO
ALTER TABLE [dbo].[Campaign_PictureVoteLog] ADD  CONSTRAINT [DF_Campaign_PictureVoteLog_VoteTime]  DEFAULT (getdate()) FOR [VoteTime]
GO
ALTER TABLE [dbo].[Campaign_ShakingLottery] ADD  CONSTRAINT [DF_Campaign_ShakingLottery_Point]  DEFAULT ((0)) FOR [Point]
GO
ALTER TABLE [dbo].[Campaign_ShakingLottery] ADD  CONSTRAINT [DF_Campaign_ShakingLottery_Mode]  DEFAULT ((0)) FOR [Mode]
GO
ALTER TABLE [dbo].[Campaign_ShakingLottery] ADD  CONSTRAINT [DF_Campaign_ShakingLottery_ChanceTimes]  DEFAULT ((0)) FOR [ChanceTimes]
GO
ALTER TABLE [dbo].[Campaign_ShakingLottery] ADD  CONSTRAINT [DF_Campaign_ShakingLottery_Started]  DEFAULT ((0)) FOR [Started]
GO
ALTER TABLE [dbo].[Campaign_ShakingLotteryGift] ADD  CONSTRAINT [DF_Campaign_ShakingLotteryGift_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Campaign_ShakingLotteryGift] ADD  CONSTRAINT [DF_Campaign_ShakingLotteryGift_Probabilitity]  DEFAULT ((0)) FOR [Probability]
GO
ALTER TABLE [dbo].[Campaign_ShakingLotteryGift] ADD  CONSTRAINT [DF_Campaign_ShakingLotteryGift_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Campaign_ShakingLotteryGift] ADD  CONSTRAINT [DF_Campaign_ShakingLotteryGift_NoGift]  DEFAULT ((0)) FOR [IsGift]
GO
ALTER TABLE [dbo].[Campaign_ShakingLotteryLog] ADD  CONSTRAINT [DF_Campaign_ShakingLotteryLog_Time]  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[Campaign_ShakingLotteryLog] ADD  CONSTRAINT [DF_Campaign_ShakingLotteryLog_Win]  DEFAULT ((0)) FOR [Win]
GO
ALTER TABLE [dbo].[Campaign_ShakingLotteryPeriod] ADD  CONSTRAINT [DF_Campaign_ShakingLotteryPeriod_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Campaign_ShakingLotteryPeriod] ADD  CONSTRAINT [DF_Campaign_ShakingLotteryPeriod_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[CashAccountTrack] ADD  CONSTRAINT [DF_CashAccountTrack_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[CashAccountTrack] ADD  CONSTRAINT [DF_CashAccountTrack_ChangeTime]  DEFAULT (getdate()) FOR [ChangeTime]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_InfiniteStock]  DEFAULT ((0)) FOR [InfiniteStock]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_DistributedCount]  DEFAULT ((0)) FOR [DistributedCount]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_Removed]  DEFAULT ((0)) FOR [Removed]
GO
ALTER TABLE [dbo].[CouponRecord] ADD  CONSTRAINT [DF_CouponRecord_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[CouponRecord] ADD  CONSTRAINT [DF_CouponRecord_DistributeTime]  DEFAULT (getdate()) FOR [DistributeTime]
GO
ALTER TABLE [dbo].[CouponRecord] ADD  CONSTRAINT [DF_CouponRecord_Charge]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_OnlyMember]  DEFAULT ((1)) FOR [OnlyMember]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FieldName]  DEFAULT ((1)) FOR [FieldName]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FieldNameRequired]  DEFAULT ((1)) FOR [FieldNameRequired]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FieldBirthday]  DEFAULT ((1)) FOR [FieldBirthday]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FieldBirthdayRequired]  DEFAULT ((0)) FOR [FieldBirthdayRequired]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FieldMobilePhone]  DEFAULT ((1)) FOR [FieldMobilePhone]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FieldMobilePhoneRequired]  DEFAULT ((1)) FOR [FieldMobilePhoneRequired]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FieldEmail]  DEFAULT ((0)) FOR [FieldEmail]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FieldEmailRequired]  DEFAULT ((0)) FOR [FieldEmailRequired]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_PageVisitCount]  DEFAULT ((0)) FOR [PageVisitCount]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_FillinCount]  DEFAULT ((0)) FOR [FillinCount]
GO
ALTER TABLE [dbo].[CustomForm] ADD  CONSTRAINT [DF_CustomForm_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[CustomFormContent] ADD  CONSTRAINT [DF_CustomFormContent_FillinTime]  DEFAULT (getdate()) FOR [FillinTime]
GO
ALTER TABLE [dbo].[CustomFormContent] ADD  CONSTRAINT [DF_CustomFormContent_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Domain] ADD  CONSTRAINT [DF_Domain_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Domain] ADD  CONSTRAINT [DF_Domain_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Domain] ADD  CONSTRAINT [DF_Domain_LastUpdateTime]  DEFAULT (getdate()) FOR [LastUpdateTime]
GO
ALTER TABLE [dbo].[GroupMessage] ADD  CONSTRAINT [DF_GroupMessage_SubmitTime]  DEFAULT (getdate()) FOR [SubmitTime]
GO
ALTER TABLE [dbo].[Information] ADD  CONSTRAINT [DF_Information_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[InformationCategory] ADD  CONSTRAINT [DF_InformationCategory_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[InformationItem] ADD  CONSTRAINT [DF_InformationItem_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_Attention]  DEFAULT ((1)) FOR [Attention]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_CashAccount]  DEFAULT ((0)) FOR [CashAccount]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_NeedUpdate]  DEFAULT ((0)) FOR [NeedUpdate]
GO
ALTER TABLE [dbo].[MemberGroup] ADD  CONSTRAINT [DF_MemberGroup_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[MemberPointTrack] ADD  CONSTRAINT [DF_MemberPointTrack_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[MemberPointTrack] ADD  CONSTRAINT [DF_MemberPointTrack_ChangeTime]  DEFAULT (getdate()) FOR [ChangeTime]
GO
ALTER TABLE [dbo].[MemberPointTrack] ADD  CONSTRAINT [DF_MemberPointTrack_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[MemberTag] ADD  CONSTRAINT [DF_MemberTag_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[NormalMaterial] ADD  CONSTRAINT [DF_MaterialImage_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[NormalMaterial] ADD  CONSTRAINT [DF_NormalMaterial_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_ForSale]  DEFAULT ((1)) FOR [ForSale]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_InfiniteStock]  DEFAULT ((0)) FOR [InfiniteStock]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_Sold]  DEFAULT ((0)) FOR [Sold]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodity] ADD  CONSTRAINT [DF_OneDollarBuyingCommodity_Remove]  DEFAULT ((0)) FOR [Remove]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodityForSale] ADD  CONSTRAINT [DF_OneDollarBuyingCommodityForSale_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodityForSale] ADD  CONSTRAINT [DF_OneDollarBuyingCommodityForSale_TotalPart]  DEFAULT ((0)) FOR [TotalPart]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodityForSale] ADD  CONSTRAINT [DF_OneDollarBuyingCommodityForSale_SoldPart]  DEFAULT ((0)) FOR [SoldPart]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodityForSale] ADD  CONSTRAINT [DF_OneDollarBuyingCommodityForSale_ForSaleTime]  DEFAULT (getdate()) FOR [ForSaleTime]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommodityForSale] ADD  CONSTRAINT [DF_OneDollarBuyingCommodityForSale_Deal]  DEFAULT ((0)) FOR [Deal]
GO
ALTER TABLE [dbo].[OneDollarBuyingCommoditySoldPart] ADD  CONSTRAINT [DF_OneDollarBuyingCommoditySoldPart_SoldTime]  DEFAULT (getdate()) FOR [SoldTime]
GO
ALTER TABLE [dbo].[OperatedLog] ADD  CONSTRAINT [DF_OperatedLog_Time]  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_ShareTimelinePoint_1]  DEFAULT ((0)) FOR [ShareTimelinePoint]
GO
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_ShareAppMessagePoint_1]  DEFAULT ((0)) FOR [ShareAppMessagePoint]
GO
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [DF_Page_PageVisitCount_1]  DEFAULT ((0)) FOR [PageVisitCount]
GO
ALTER TABLE [dbo].[PayOrder] ADD  CONSTRAINT [DF_PayOrder_Notify]  DEFAULT ((0)) FOR [Notify]
GO
ALTER TABLE [dbo].[PayOrder] ADD  CONSTRAINT [DF_PayOrder_Finish]  DEFAULT ((0)) FOR [Finish]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_Price]  DEFAULT ((0)) FOR [Point]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_Price_1]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_ForSale]  DEFAULT ((1)) FOR [ForSale]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_Sold]  DEFAULT ((0)) FOR [Sold]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[PointCommodity] ADD  CONSTRAINT [DF_PointCommodity_Remove]  DEFAULT ((0)) FOR [Remove]
GO
ALTER TABLE [dbo].[PointCommodityOrder] ADD  CONSTRAINT [DF_PointOrder_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PointCommodityOrder] ADD  CONSTRAINT [DF_PointCommodityOrder_Point]  DEFAULT ((0)) FOR [Point]
GO
ALTER TABLE [dbo].[PointCommodityOrder] ADD  CONSTRAINT [DF_PointCommodityOrder_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[PointCommodityOrder] ADD  CONSTRAINT [DF_PointCommodityOrder_OrderTime]  DEFAULT (getdate()) FOR [OrderTime]
GO
ALTER TABLE [dbo].[PointCommodityOrder] ADD  CONSTRAINT [DF_PointCommodityOrder_Status]  DEFAULT ((4)) FOR [Status]
GO
ALTER TABLE [dbo].[PointCommodityOrderItem] ADD  CONSTRAINT [DF_PointCommodityOrderItem_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PointCommodityOrderItem] ADD  CONSTRAINT [DF_PointCommodityOrderItem_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PointCommodityOrderLog] ADD  CONSTRAINT [DF_PointCommodityOrderLog_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PointCommodityOrderLog] ADD  CONSTRAINT [DF_PointCommodityOrderLog_Time]  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[PointCommodityShoppingCart] ADD  CONSTRAINT [DF_PointCommodityShoppingCart_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PointCommodityShoppingCart] ADD  CONSTRAINT [DF_PointCommodityShoppingCart_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PointCommodityShoppingCart] ADD  CONSTRAINT [DF_PointCommodityShoppingCart_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[PortalPresetTemplate] ADD  CONSTRAINT [DF_PortalPresetTemplate_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PortalPresetTemplate] ADD  CONSTRAINT [DF_PortalPresetTemplate_PayRequired]  DEFAULT ((0)) FOR [PayRequired]
GO
ALTER TABLE [dbo].[PortalPresetTemplate] ADD  CONSTRAINT [DF_PortalPresetTemplate_LastUpdateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[PortalPresetTemplate] ADD  CONSTRAINT [DF_PortalPresetTemplate_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[RecommendUrl] ADD  CONSTRAINT [DF_RecommendUrl_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[RecommendUrl] ADD  CONSTRAINT [DF_RecommendUrl_VisitCount]  DEFAULT ((0)) FOR [LandingCount]
GO
ALTER TABLE [dbo].[RecommendUrlLog] ADD  CONSTRAINT [DF_RecommendUrlLog_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[RecommendUrlLog] ADD  CONSTRAINT [DF_RecommendUrlLog_Time]  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[RecommendUrlSettings] ADD  CONSTRAINT [DF_RecommendUrlSettings_AwardPoint]  DEFAULT ((0)) FOR [AttentionPoint]
GO
ALTER TABLE [dbo].[RecommendUrlSettings] ADD  CONSTRAINT [DF_RecommendUrlSettings_Level2AttentionPoint]  DEFAULT ((0)) FOR [Level2AttentionPoint]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ScenicQRCode] ADD  CONSTRAINT [DF_ScenicQRCode_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ScenicQRCodeLandingLog] ADD  CONSTRAINT [DF_ScenicQRCodeLandingLog_LandingTime]  DEFAULT (getdate()) FOR [LandingTime]
GO
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_InitialMemberPoint]  DEFAULT ((0)) FOR [InitialMemberPoint]
GO
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_SignInPoint]  DEFAULT ((0)) FOR [SignInPoint]
GO
ALTER TABLE [dbo].[ShareLog] ADD  CONSTRAINT [DF_CampaignLog_ShareTimeline]  DEFAULT ((0)) FOR [ShareTimeline]
GO
ALTER TABLE [dbo].[ShareLog] ADD  CONSTRAINT [DF_CampaignLog_ShareAppMessage]  DEFAULT ((0)) FOR [ShareAppMessage]
GO
ALTER TABLE [dbo].[StyleSettings] ADD  CONSTRAINT [DF_StyleSettings_PortalMode]  DEFAULT ((0)) FOR [PortalMode]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_RegisterTime]  DEFAULT (getdate()) FOR [RegisterTime]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DomainOwner]  DEFAULT ((0)) FOR [DomainOwner]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Removed]  DEFAULT ((0)) FOR [Removed]
GO
/****** Object:  StoredProcedure [dbo].[_remove_OrderPointCommodity]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_remove_OrderPointCommodity]
	-- Add the parameters for the stored procedure here
	--商品ID
	@id uniqueidentifier,
	@appId varchar(50),
	@memberId uniqueidentifier
AS
BEGIN
	--返回值：0.成功 1.无库存 2.商品未上架 3.用户活力值不足
	
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN
	
	DECLARE @pointCommodityName varchar(100)
	DECLARE @imageUrl varchar(300)
	DECLARE @forSale bit
	DECLARE @removed bit
	DECLARE @stock int
	DECLARE @price int
	DECLARE @memberPoint int
	DECLARE @domain uniqueidentifier

	SELECT  @pointCommodityName=[Name],@imageUrl=[ImageUrl], @forSale=[ForSale],@removed=[Remove], @price = [Price],@stock = [Stock] 
		FROM [PointCommodity] WITH(ROWLOCK) where [Id] = @id
	SELECT @domain =[Domain], @memberPoint = [Point] FROM [Member] WITH(ROWLOCK) where [Id] = @memberId
	
	IF(@stock<=0)
	BEGIN
		SELECT 1 AS Result
		COMMIT TRAN
		RETURN
	END
	
	IF(@forSale = 0 OR @removed = 1)
	BEGIN
		SELECT 2 AS Result
		COMMIT TRAN
		RETURN
	END
	
	IF(@price>@memberPoint)
	BEGIN
		SELECT 3  AS Result
		COMMIT TRAN
		RETURN
	END
	
	--创建订单
	DECLARE @orderNumber varchar(30)
	DECLARE @dateNumber  char(6)
	DECLARE @serialNumber varchar(50)
	DECLARE @randNumber char(3)
	SELECT @dateNumber = SUBSTRING(convert(char(12),getdate(),112),3,6)
	SELECT @randNumber = cast(rand()*(999-100)+100 as int) 

	INSERT INTO [SerialNumber] ([Module]) VALUES('PointCommodity')
	select @serialNumber = SCOPE_IDENTITY()

	SET @orderNumber = 'A' + SUBSTRING(@dateNumber,1,1) + SUBSTRING(@serialNumber,1,1)
	+  SUBSTRING(@dateNumber,2,1) + SUBSTRING(@serialNumber,2,1)
	+  SUBSTRING(@dateNumber,3,1) + SUBSTRING(@serialNumber,3,1)
	+  SUBSTRING(@dateNumber,4,1) + SUBSTRING(@serialNumber,4,LEN(@serialNumber) - 3)
	+ SUBSTRING(@dateNumber,5,1) + SUBSTRING(@randNumber,1,1)
	+ SUBSTRING(@dateNumber,6,1) + SUBSTRING(@randNumber,2,2)
	
	DECLARE @orderId uniqueidentifier
	SET @orderId = NEWID()
	INSERT INTO [PointCommodityOrder] ([Id],[Domain],[AppId],[OrderNumber],[Member],[PointCommodity],[PointCommodityName],[PointCommodityImageUrl],[PointCommodityPrice])
	VALUES (@orderId,@domain,@appId,@orderNumber,@memberId,@id,@pointCommodityName, @imageUrl,@price)
	
	--库存减1,已售加1
	UPDATE [PointCommodity] SET [Stock] = [Stock]-1,[Sold] = [Sold] +1 WHERE [Id] = @id
	
	--消减用户活力值
	UPDATE [Member] SET [Point] = [Point] - @price WHERE [Id] = @memberId
	
	--记录用户消费记录
	DECLARE @leftPoint INT
	SELECT @leftPoint = [Point] FROM [Member] WHERE [Id] = @memberId
	
	INSERT INTO [MemberPointTrack] ([Domain],[Member],[Quantity],[Point],[Type],[TagName],[TagId]) 
	VALUES(@domain,@memberId,0 - @price,@leftPoint,1,@pointCommodityName,@orderId)
	
	SELECT 0 AS Result,@orderNumber AS OrderNumber, @orderId as OrderId
	
	COMMIT TRAN
	
END


--OrderPointCommodity '9EF4F2AE-9F71-4C26-9F04-2F84570465AC','2C1BCB5D-8E9C-4EF7-9078-811CF27CB238'
GO
/****** Object:  StoredProcedure [dbo].[AddPointCommodityToCart]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 添加商品到购物车，如果已经有了就增加数量 ，没有就新建一条
-- 不判断库存数量，库存数量可在提交订单时判断
-- =============================================
CREATE PROCEDURE [dbo].[AddPointCommodityToCart]
	@domainId uniqueidentifier,
	@appId varchar(50),
	@memberId uniqueidentifier,
	@pointCommodity uniqueidentifier,
	@quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --返回值：0.成功 
    
    --出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN
	
	--当前库存数量
	DECLARE @currentQuantity int
	DECLARE @cartItemId uniqueidentifier
	
	SELECT @cartItemId=[Id],@currentQuantity=[Quantity]
		FROM [PointCommodityShoppingCart] WITH(ROWLOCK) 
		WHERE [Domain] = @domainId AND [AppId]=@appId
		AND [Member]=@memberId AND [PointCommodity] = @pointCommodity
		
	IF @currentQuantity IS NULL
	BEGIN
		INSERT INTO [PointCommodityShoppingCart] ([Domain],[AppId],[Member],[PointCommodity],
		[Quantity]) VALUES (@domainId,@appId,@memberId,@pointCommodity,@quantity)
	END
	ELSE
	BEGIN
		SET @quantity = @quantity + @currentQuantity
		UPDATE [PointCommodityShoppingCart] SET [Quantity] = @quantity WHERE [Id] = @cartItemId
	END
	
	COMMIT TRAN
	
	DECLARE @pointCommodityCount int
	SELECT @pointCommodityCount = COUNT(1) FROM [PointCommodityShoppingCart]
	WHERE [Domain] = @domainId AND [AppId] = @appId AND [Member] = @memberId
	
	SELECT 0 AS Result
	
	SELECT @quantity AS [Quantity], @pointCommodityCount AS [PointCommodityCount]
	
END
GO
/****** Object:  StoredProcedure [dbo].[Campaign_LotteryDraw]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--http://www.cnblogs.com/zengen/archive/2011/08/10/2133423.html
-- =============================================
CREATE PROCEDURE [dbo].[Campaign_LotteryDraw]
	
	@campaignId uniqueidentifier,
	@periodId uniqueidentifier
	
AS
BEGIN

	--获取要抽出的人数
	DECLARE @drawCount INT
	SELECT @drawCount = [DrawCount] FROM [Campaign_Lottery] WHERE [CampaignId] = @campaignId

	--使用游标抽奖
	DECLARE My_Cursor CURSOR --定义游标
	FOR (
	SELECT * FROM(
		SELECT TOP (@drawCount) * FROM [Campaign_LotterySignLog] WHERE [Period] = @periodId ORDER BY LucklyNumber ASC 
	) t
	) --查出需要的集合放到游标中
	OPEN My_Cursor; --打开游标
	FETCH NEXT FROM My_Cursor ; --读取第一行数据
	WHILE @@FETCH_STATUS = 0
		BEGIN
			UPDATE [Campaign_LotterySignLog] SET [Win] = 1 WHERE CURRENT OF My_Cursor; --更新
			FETCH NEXT FROM My_Cursor; --读取下一行数据
		END
	CLOSE My_Cursor; --关闭游标
	DEALLOCATE My_Cursor; --释放游标
	
	--更新周期开奖状态
	UPDATE [Campaign_LotteryPeriod] SET [Drawn] = 1 WHERE [Id] = @periodId --更新
	
END
GO
/****** Object:  StoredProcedure [dbo].[Campaign_LotterySign]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Campaign_LotterySign]
	
	@campaignId uniqueidentifier,
	@domain uniqueidentifier,
	@period uniqueidentifier,
	@member uniqueidentifier
	
AS
BEGIN
	
	--返回值：0.成功 1.失败 2.活动或周期不在进行中 3.已经报过名了 4.活动或者周期不存在 5.活力值不足
	
	--出错时回滚
	SET XACT_ABORT ON
	
	DECLARE @logged int
		
	--判断是否已经报过名了
	SELECT @logged = COUNT(1) FROM [Campaign_LotterySignLog]
	WHERE [CampaignId] = @campaignId AND [Period] = @period AND [Member] = @member
	
	IF @logged>0
	BEGIN
		SELECT 3 AS Result
		RETURN
	END
	
	DECLARE @exist int
	
	--判断活动是否存在是否正在进行
	SELECT @exist = COUNT(1) FROM [Campaign]
	WHERE [Id] = @campaignId
	
	IF @exist=0
	BEGIN
		SELECT 4 AS Result
		RETURN
	END

	DECLARE @campaignStatus tinyint
	SELECT @campaignStatus = [Status] FROM [Campaign]
	WHERE [Id] = @campaignId
	
	IF @campaignStatus<>1
	BEGIN
		SELECT 2 AS Result
		RETURN
	END

    --判断周期是否存在是否正在进行
    SELECT @exist = COUNT(1) FROM [Campaign_LotteryPeriod]
	WHERE [Id] = @period
	
	IF @exist=0
	BEGIN
		SELECT 4 AS Result
		RETURN
	END
	
    --判断周期是否在进行中
    --根据当前日期时间进行对比判断
    DECLARE @periodStartTime smalldatetime
    DECLARE @periodEndTime smalldatetime
    DECLARE @currentTime smalldatetime
    
    SELECT @periodStartTime = [StartTime],@periodEndTime=[EndTime] FROM [Campaign_LotteryPeriod]
    WHERE [Id] = @period
    SET @currentTime = GETDATE()
    
    IF @currentTime < @periodStartTime OR @currentTime > @periodEndTime
    BEGIN
		SELECT 2 AS Result
		RETURN
    END
    
    --判断是否达到报名人数限制
    DECLARE @maxParticipant int
    SELECT @maxParticipant = [MaxParticipant] FROM [Campaign]
	WHERE [Id] = @campaignId
	
	IF @maxParticipant > 0
	BEGIN
		DECLARE @currentParticipant int
		SELECT @currentParticipant = COUNT(1) FROM [Campaign_LotterySignLog]
		WHERE [Period] = @period
		
		IF @currentParticipant >= @maxParticipant
		BEGIN
			SELECT 6 AS Result
			RETURN
		END
	END
    
    BEGIN TRAN
    
    --判断活力值是否足够并扣除活力值(如果需要）
    DECLARE @price int
    SELECT @price = [Point] FROM [Campaign_Lottery] where [CampaignId] = @campaignId
 
	IF @price > 0
	BEGIN
		DECLARE @memberPoint int
		SELECT @memberPoint = [Point] FROM [Member] WITH(ROWLOCK) where [Id] = @member
	    
		IF(@price>@memberPoint)
		BEGIN
			SELECT 5  AS Result
			COMMIT TRAN
			RETURN
		END
	END
	
	--报名
	INSERT INTO [Campaign_LotterySignLog] ([CampaignId],[Domain],[Period],[Member])
	VALUES (@campaignId,@domain,@period,@member)
	
	IF @price > 0
	BEGIN
		--消减用户活力值
		UPDATE [Member] SET [Point] = [Point] - @price WHERE [Id] = @member
		
		--记录用户消费记录
		DECLARE @campaignName VARCHAR(100)
		SELECT @campaignName = [Name] FROM [Campaign] WHERE [Id] = @campaignId
		
		DECLARE @leftPoint INT
		SELECT @leftPoint = [Point] FROM [Member] WHERE [Id] = @member
		
		INSERT INTO [MemberPointTrack] ([Domain],[Member],[Quantity],[Point],[Type],[TagName],[TagId]) 
		VALUES(@domain,@member,0 - @price,@leftPoint,6,@campaignName,@campaignId)
    END
    
    SELECT 0 AS Result
    
    COMMIT TRAN
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[Campaign_LuckyTicketDraw]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Campaign_LuckyTicketDraw]
	@domainId uniqueidentifier,
	@campaignId uniqueidentifier,
	@count int,
	@winRemark nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   --使用游标抽奖
	DECLARE My_Cursor CURSOR --定义游标
	FOR (
		SELECT * FROM(
			/****** Script for SelectTopNRows command from SSMS  ******/
			  SELECT TOP (@count) * 
				FROM [Campaign_LuckyTicketLog]
				where [Domain] = @domainId AND [CampaignId] = @campaignId AND [Win] = 0
				ORDER BY NEWID()
		
		) t
	) --查出需要的集合放到游标中
	OPEN My_Cursor; --打开游标
	FETCH NEXT FROM My_Cursor ; --读取第一行数据
	WHILE @@FETCH_STATUS = 0
		BEGIN
			UPDATE [Campaign_LuckyTicketLog] SET [Win] = 1,[WinTime]=GETDATE(),[WinRemark]=@winRemark WHERE CURRENT OF My_Cursor; --更新
			FETCH NEXT FROM My_Cursor; --读取下一行数据
		END
	CLOSE My_Cursor; --关闭游标
	DEALLOCATE My_Cursor; --释放游标
	
	UPDATE [Campaign_LuckyTicket] SET [LastDrawTime] = GETDATE() WHERE [CampaignId] = @campaignId
	
END

GO
/****** Object:  StoredProcedure [dbo].[CouponCharge]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 卡券核销
-- 0 核销成功 1 域或appid不对应 2 卡券已过期 3 卡券已被核销过
-- =============================================
CREATE PROCEDURE [dbo].[CouponCharge]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@couponRecordId uniqueidentifier,
	@chargeUser uniqueidentifier,
	@chargeIP varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRAN

    -- 获取卡券信息，并行锁定
    DECLARE @couponDomainId uniqueidentifier
    DECLARE @couponAppId varchar(50)
    DECLARE @status tinyint
    DECLARE @limitedTime datetime
	SELECT  @couponDomainId=[Domain],@couponAppId=[AppId],@status=[Status],
		@limitedTime = [limitedTime]
		FROM [CouponRecord] WITH(ROWLOCK) where [Id] = @couponRecordId
		
	--判断域，APPID是否对应
    IF @domainId <> @couponDomainId OR @appId <> @couponAppId
    BEGIN
		SELECT 1 AS [Result]
		COMMIT TRAN
		RETURN
	END
	
	--判断是否已经被核销过或其它不可使用状态
	IF @status <> 0
	BEGIN
		SELECT 3 AS [Result]
		COMMIT TRAN
		RETURN
	END
	
	--判断卡券是否已过期
	IF @limitedTime < GETDATE()
	BEGIN
		SELECT 2 AS [Result]
		COMMIT TRAN
		RETURN
	END
	
	--更新核销信息
	UPDATE [CouponRecord] 
	SET [Status] = 1,[ChargeUser] = @chargeUser,[ChargeTime] = GETDATE(),[ChargeIP] = @chargeIP
	WHERE [Id] = @couponRecordId
	
	SELECT 0 AS [Result]
	
	COMMIT TRAN
		
END
GO
/****** Object:  StoredProcedure [dbo].[CouponDistribute]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 卡券分发
-- 0 分发成功 1 域或APPID不对应 2 库存不足 3 卡券已删除 4 卡券不存在 5 派发张数无效
-- =============================================
CREATE PROCEDURE [dbo].[CouponDistribute]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@couponId uniqueidentifier,
	@memberId uniqueidentifier,
	@distributeUser uniqueidentifier,
	@distributeIP varchar(50),
	@limitedTime datetime,
	@count int --派发张数
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @count <= 0
    BEGIN
		SELECT 5 AS [Result]
		COMMIT TRAN
		RETURN
	END
	
	BEGIN TRAN

    -- 获取卡券信息，并行锁定
    DECLARE @couponDomainId uniqueidentifier
    DECLARE @couponAppId varchar(50)
    DECLARE @infiniteStock bit
    DECLARE @stock INT
    DECLARE @removed bit
	SELECT  @couponDomainId=[Domain],@couponAppId=[AppId],@infiniteStock=[InfiniteStock],
		@stock = [Stock],@removed=[Removed]
		FROM [Coupon] WITH(ROWLOCK) where [Id] = @couponId
		
	--判断卡券是否存在
	IF @couponDomainId IS NULL
	 BEGIN
		SELECT 4 AS [Result]
		COMMIT TRAN
		RETURN
	END
    
    --判断域，APPID是否对应
    IF @domainId <> @couponDomainId OR @appId <> @couponAppId
    BEGIN
		SELECT 1 AS [Result]
		COMMIT TRAN
		RETURN
	END
	
	--判断卡券是否已删除
	IF @removed = 1
    BEGIN
		SELECT 3 AS [Result]
		COMMIT TRAN
		RETURN
	END
 
	--判断库存
	DECLARE @leftStock int
	SET @leftStock = @stock - @count
	IF @infiniteStock = 0 AND @leftStock <= 0
    BEGIN
		SELECT 2 AS [Result]
		COMMIT TRAN
		RETURN
	END
 
	DECLARE @serialNumber VARCHAR(30)
    DECLARE @i INT   
	SET @i=0
	WHILE @i<@count 
	BEGIN
	
		EXECUTE OutputCouponSerialNumber @domainId,@appId,@serialNumber OUT
		
		--写入分发记录表
		 INSERT INTO [CouponRecord] 
		([Domain],[AppId],[Coupon],[Member],[SerialNumber],[DistributeUser],[DistributeIP],[LimitedTime])
		VALUES (@domainId,@appId,@couponId,@memberId,@serialNumber,@distributeUser,@distributeIP,@limitedTime)
		
		SET @i=@i+1
	END
    
    --消减库存
    IF @infiniteStock = 0
    BEGIN
		UPDATE [Coupon] SET [Stock] = @leftStock where [Id] = @couponId
    END
    
    UPDATE [Coupon] SET [DistributedCount] = [DistributedCount] + @count WHERE [Id] = @couponId
    
    SELECT 0 AS [Result]
	
	COMMIT TRAN
	
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRecommendUrl]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateRecommendUrl] 
	-- Add the parameters for the stored procedure here
	@domainId UNIQUEIDENTIFIER,
	@appId VARCHAR(50),
	@memberId UNIQUEIDENTIFIER,
	@id UNIQUEIDENTIFIER,
	@url VARCHAR(500),
	@shortUrl VARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRAN
		IF NOT EXISTS (SELECT * FROM [RecommendUrl] WITH (UPDLOCK,SERIALIZABLE)
		WHERE [Domain] = @domainId AND [AppId] = @appId AND [Member] = @memberId)
		BEGIN
		  INSERT INTO [RecommendUrl] ([Id],[Domain],[AppId],[Member],[Url],[ShortUrl])
		  VALUES (@id,@domainId,@appId,@memberId,@url,@shortUrl)
		END
	COMMIT TRAN

END
GO
/****** Object:  StoredProcedure [dbo].[CreateRecommendUrlSettings]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateRecommendUrlSettings] 
	-- Add the parameters for the stored procedure here
	@domainId UNIQUEIDENTIFIER,
	@appId VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRAN
		IF NOT EXISTS (SELECT * FROM [RecommendUrlSettings] WITH (UPDLOCK,SERIALIZABLE)
		WHERE [Domain] = @domainId AND [AppId] = @appId)
		BEGIN
		  INSERT INTO [RecommendUrlSettings] ([Domain],[AppId])
		  VALUES (@domainId,@appId)
		END
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[DealPointCommodityOrder]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DealPointCommodityOrder]
	-- Add the parameters for the stored procedure here
	@orderId uniqueidentifier,  --订单id
	@operatorUserId uniqueidentifier  --操作者id
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @status int
	
	SELECT @status =[Status] FROM [PointCommodityOrder] WITH(ROWLOCK) WHERE [Id] = @orderId
	
	--该订单已兑换过
	IF(@status = 2)
	BEGIN
		SELECT 2 AS Result
		RETURN
	END
	
	--该订单已取消
	IF(@status = 3)
	BEGIN
		SELECT 3 AS Result
		RETURN
	END
	
	--待领取
	IF(@status = 1)
	BEGIN
		UPDATE [PointCommodityOrder] SET [Status] = 2,[DealTime] = GETDATE(),[OperatorUser] = @operatorUserId
		WHERE [Id] = @orderId
		SELECT 0 AS Result
		RETURN
	END
	--未知状态
	ELSE
	BEGIN
		SELECT 1 AS Result
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[DecrementShakingLotteryGiftStock]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DecrementShakingLotteryGiftStock] 
	@giftId uniqueidentifier
AS
BEGIN
	
	--出错时回滚
	SET XACT_ABORT ON
	BEGIN TRAN

	--得到当前库存
	DECLARE @stock int
	SELECT @stock = [Stock] FROM [Campaign_ShakingLotteryGift] WITH(ROWLOCK) where [Id] = @giftId

	IF(@stock IS NULL)
	BEGIN
		SELECT 2 AS Result
		COMMIT TRAN
		RETURN
	END


	IF(@stock <= 0)
	BEGIN
		SELECT 1 AS [Result],@stock AS [Stock]
		COMMIT TRAN
		RETURN
	END

	UPDATE [Campaign_ShakingLotteryGift] SET [Stock] = [Stock]-1
	WHERE [Id] = @giftId

	SELECT 0 AS [Result],@stock-1 AS [Stock]
	COMMIT TRAN

END

GO
/****** Object:  StoredProcedure [dbo].[EndCampaign]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EndCampaign]
	-- Add the parameters for the stored procedure here
	@id uniqueidentifier
	--@operatorId uniqueidentifier
AS
BEGIN
	
	--返回值：0.成功 1.已经结束过了 2.还没开始
	
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN
	
	DECLARE @status tinyint
	DECLARE @result tinyint
	
	SELECT @status =[Status] FROM [Campaign] WITH(ROWLOCK) where [Id] = @id
	
	IF(@status=0)
	BEGIN
		SET @result = 2
	END
	ELSE IF(@status=1)
	BEGIN
		UPDATE [Campaign] SET [Status] = 2,[EndTime] = GETDATE() WHERE [Id] = @id
		SET @result = 0
	END
	ELSE IF(@status=2)
	BEGIN
		SET @result = 1
	END
	
	SELECT @result AS Result
	
	COMMIT TRAN
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetAdvancedArticleList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAdvancedArticleList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''

	 set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum, * FROM [AdvancedArticle]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM [AdvancedArticle]
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdvertisingList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAdvertisingList] 
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@name IS NOT NULL AND LEN(@name) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Name] LIKE ''%' + @name + '%'''
	  end
	  
	 set @sql = '
	 SELECT * FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
			SELECT tAdvertising.*,[User].[Name] AS [CreateUserName] FROM(
				SELECT * FROM [Advertising]
				WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) tAdvertising
			LEFT JOIN [User]
			ON tAdvertising.[CreateUser] = [User].[Id]
		) AllData
	)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	 
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [Advertising]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
		) tAdvertising'
		
	exec (@sql)
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_DonationList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_DonationList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@status TINYINT
AS
BEGIN
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
				SELECT tCampaign.*,[User].[Name] AS [CreateUserName] FROM (
					SELECT * FROM [Campaign] 
					WHERE [Type] = 6 AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tCampaign
				LEFT JOIN [Campaign_Donation]
				ON tCampaign.Id = [Campaign_Donation].[CampaignId]
				LEFT JOIN [User]
				ON tCampaign.CreateUser = [User].[Id]
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	  
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT Count(1) AS TotalCount FROM [Campaign]
		WHERE [Type] = 6  AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND  [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
END

GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_DonationLogList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_DonationLogList]
	-- Add the parameters for the stored procedure here
	@page INT,
	@pageSize INT,
	@campaignId uniqueidentifier,
	@member uniqueidentifier,
	@finished bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''

	   if(@member IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Member] = ''' + CONVERT(char(36),@member) + ''''
	  end

	   if(@finished = 1)
	  begin 
		set @whereSql2 = @whereSql2 + ' AND [PayOrder].[Finish] = 1 '
	  end

	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
				SELECT tCampaign.*,[PayOrder].[TotalFee],[PayOrder].[Finish] FROM (
					SELECT * FROM [Campaign_DonationLog] 
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + ''''
					+ @whereSql + '
				) tCampaign
				JOIN [PayOrder]
				ON tCampaign.[PayOrder] = [PayOrder].[Id]
				
				WHERE  1 = 1 ' + @whereSql2 +  '
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	  
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT Count(1) AS TotalCount FROM 
		(
			SELECT tCampaign.* FROM (
					SELECT * FROM [Campaign_DonationLog] 
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + ''''
					+ @whereSql + '
				) tCampaign
				JOIN [PayOrder]
				ON tCampaign.[PayOrder] = [PayOrder].[Id]
				
				WHERE  1 = 1 ' + @whereSql2 +  '
		) t'
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LotteryDataReport]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LotteryDataReport]
	-- Add the parameters for the stored procedure here
	@campaignId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --参与人数
	SELECT COUNT(1) AS [MemberCount] FROM [Campaign_LotterySignLog]
	WHERE [CampaignId] = @campaignId
	--GROUP BY [Member] 不要GROUP BY ，使数据更大些好看

	--总中奖人数
	SELECT COUNT(1) AS [LuckyMemberCount] FROM [Campaign_LotterySignLog]
	WHERE [CampaignId] = @campaignId AND [Win] = 1

	--活动页面PV
	SELECT [PageVisitCount] FROM [Campaign] WHERE [Id] = @campaignId
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LotteryList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LotteryList]
	
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@status TINYINT
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	set @sql = '
		SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,tCampaign.*,[Campaign_Lottery].[Point],[Campaign_Lottery].[Mode],[User].[Name] AS [CreateUserName] FROM (
					SELECT * FROM [Campaign] 
					WHERE [Type] = 3 AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tCampaign
				LEFT JOIN [Campaign_Lottery]
				ON tCampaign.Id = [Campaign_Lottery].[CampaignId]
				LEFT JOIN [User]
				ON tCampaign.CreateUser = [User].[Id]
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT Count(1) AS TotalCount FROM [Campaign]
		WHERE [Type] = 3  AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND  [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LotteryPeriodList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LotteryPeriodList]
	
	@campaignId uniqueidentifier,
	@page INT,
	@pageSize INT,
	@startTime SMALLDATETIME,
	@endTime SMALLDATETIME
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @campaignWhereSql varchar(500)
	declare @whereSql varchar(500)
	
	set @campaignWhereSql = ''
	set @whereSql = ''
	
	if(@startTime IS NOT NULL)
	  begin 
		set @campaignWhereSql = @campaignWhereSql + ' AND [StartTime] >= ''' + convert(varchar(20),@startTime) + ''''
	  end
	  
	if(@endTime IS NOT NULL)
	  begin 
		set @campaignWhereSql = @campaignWhereSql + ' AND [EndTime] <= ''' + convert(varchar(20),@endTime) + ''''
	  end
	  
	   set @sql = '
		SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [StartTime] DESC) AS rownum,tPeriod.* FROM (
					SELECT * FROM [Campaign_LotteryPeriod]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + '''' + @campaignWhereSql + '
				) tPeriod
				WHERE 1=1 ' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		set @sql = '
		SELECT COUNT(1) AS TotalCount
		 FROM [Campaign_LotteryPeriod]
		WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + '''' + @campaignWhereSql
  
		exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LotteryPeriodListByEndTime]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LotteryPeriodListByEndTime]
	
	@campaignId uniqueidentifier,
	@page INT,
	@pageSize INT,
	@endTime SMALLDATETIME,
	@type TINYINT  -- 0 全部 -- 1 正在进行 -- 2 已结束
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @campaignWhereSql varchar(500)
	declare @whereSql varchar(500)
	
	set @campaignWhereSql = ''
	set @whereSql = ''
	
	IF @type = 1
	BEGIN
		set @campaignWhereSql = @campaignWhereSql + ' AND [StartTime] <= ''' + convert(varchar(20),@endTime) + ''''
		set @campaignWhereSql = @campaignWhereSql + ' AND [EndTime] > ''' + convert(varchar(20),@endTime) + ''''
	END
	ELSE IF @type = 2
	BEGIN
		set @campaignWhereSql = @campaignWhereSql + ' AND [EndTime] <= ''' + convert(varchar(20),@endTime) + ''''
	END
	  
	   set @sql = '
		SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [StartTime] DESC) AS rownum,tPeriod.* FROM (
					SELECT * FROM [Campaign_LotteryPeriod]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + '''' + @campaignWhereSql + '
				) tPeriod
				WHERE 1=1 ' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		set @sql = '
		SELECT COUNT(1) AS TotalCount
		 FROM [Campaign_LotteryPeriod]
		WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + '''' + @campaignWhereSql
  
		exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LotteryPeriodSignLogList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LotteryPeriodSignLogList]
	
	@periodId uniqueidentifier,
	@page INT,
	@pageSize INT,
	@winner bit

AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @campaignWhereSql varchar(500)
	declare @whereSql varchar(500)
	
	set @campaignWhereSql = ''
	set @whereSql = ''
	
	if(@winner IS NOT NULL)
	  begin 
		set @campaignWhereSql = @campaignWhereSql + ' AND [Win] = ' + convert(varchar(1),@winner)
	  end
	  
	 set @sql = '
		SELECT * FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY [SignTime] DESC) AS rownum,tLog.SignTime,tLog.Win,[Member].* FROM (
				SELECT * FROM [Campaign_LotterySignLog] 
				WHERE [Period] = ''' + CONVERT(char(36),@periodId) + '''' + @campaignWhereSql + '
			) tLog
			INNER JOIN [Member]
			ON tLog.[Member] = [Member].[Id]
			WHERE 1=1 ' + @whereSql + '
		) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
		   
		exec (@sql)
		
		set @sql = '
		SELECT COUNT(1) AS TotalCount FROM (
			SELECT * FROM [Campaign_LotterySignLog]
			WHERE [Period] = ''' + CONVERT(char(36),@periodId) + '''' + @campaignWhereSql + '
		) tLog
		INNER JOIN [Member]
		ON tLog.[Member] = [Member].[Id]
		WHERE 1=1 ' + @whereSql
  
		exec (@sql)
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LotteryWinnerList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LotteryWinnerList]
	
	@period uniqueidentifier
	
AS
BEGIN
	
	SELECT [Member].* FROM
	(
		SELECT [Member] FROM [Campaign_LotterySignLog]
		WHERE [Period]=@period AND [Win] = 1
	) tLog
	LEFT JOIN [Member]
	ON tLog.[Member] = [Member].[Id]

END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LuckyTicketDataReport]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LuckyTicketDataReport]
	-- Add the parameters for the stored procedure here
	@campaignId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --参与人数
	SELECT SUM([MemberCount]) AS [MemberCount] FROM(
		SELECT 1 AS [MemberCount] FROM [Campaign_LuckyTicketLog]
		WHERE [CampaignId] = @campaignId
		GROUP BY [Member]
	) t


	--总号码数量
	SELECT COUNT(1) AS [LuckyTicketCount] FROM [Campaign_LuckyTicketLog]
	WHERE [CampaignId] = @campaignId

	--活动页面PV
	SELECT [PageVisitCount] FROM [Campaign] WHERE [Id] = @campaignId
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LuckyTicketList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LuckyTicketList] 
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@status TINYINT
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
				SELECT tCampaign.*,[User].[Name] AS [CreateUserName] FROM (
					SELECT * FROM [Campaign] 
					WHERE [Type] = 4 AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tCampaign
				LEFT JOIN [Campaign_LuckyTicket]
				ON tCampaign.Id = [Campaign_LuckyTicket].[CampaignId]
				LEFT JOIN [User]
				ON tCampaign.CreateUser = [User].[Id]
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	  
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT Count(1) AS TotalCount FROM [Campaign]
		WHERE [Type] = 4  AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND  [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LuckyTicketLogList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LuckyTicketLogList]
	-- Add the parameters for the stored procedure here
	@page INT,
	@pageSize INT,
	@campaignId uniqueidentifier,
	@nickName varchar(30),
	@mobilePhone varchar(30)
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@nickName IS NOT NULL AND LEN(@nickName) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Member].[NickName] LIKE ''%' + @nickName + '%'''
	  end
	  
	  if(@mobilePhone IS NOT NULL AND LEN(@mobilePhone) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Member].[MobilePhone] LIKE ''%' + @mobilePhone + '%'''
	  end
	
		set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
				SELECT tItem.*,[Member].[NickName],[MobilePhone],[Email] FROM (
					SELECT * FROM [Campaign_LuckyTicketLog]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + ''' 
				) tItem
				LEFT JOIN [Member]
				ON tItem.[Member] = [Member].[Id]
				WHERE 1=1' + @whereSql + '
			) AllData
		)as ResultTable 
		WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)

		exec (@sql)
		
		--返回符合条件的记录总数
			set @sql = '
		
		SELECT Count(1) AS TotalCount FROM (
			SELECT [Member].[NickName] FROM (
				SELECT * FROM [Campaign_LuckyTicketLog]
				WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + ''' 
			) tItem
			LEFT JOIN [Member]
			ON tItem.[Member] = [Member].[Id]
			WHERE 1=1' + @whereSql + '
		) AllData'
				
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LuckyTicketLogListByMember]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LuckyTicketLogListByMember]
	-- Add the parameters for the stored procedure here
	@page INT,
	@pageSize INT,
	@campaignId uniqueidentifier,
	@memberId uniqueidentifier
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
				SELECT * FROM [Campaign_LuckyTicketLog]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + ''' AND [Member] = ''' + CONVERT(char(36),@memberId)  + '''
			) AllData 
		)as ResultTable 
		WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	  		  
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT Count(1) AS TotalCount FROM [Campaign_LuckyTicketLog]
		WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + ''' AND [Member] = ''' + CONVERT(char(36),@memberId)  + ''''
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_LuckyTicketWinLogList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_LuckyTicketWinLogList]
	@page INT,
	@pageSize INT,
	@campaignId uniqueidentifier
AS
BEGIN

	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [WinTime] DESC) AS rownum,* FROM (
				SELECT tItem.*,[Member].[NickName],[Member].[Sex],[Member].[Headimgurl],[Member].[Attention],
			[Member].[Point],[Member].[MobilePhone],[Member].[Email] FROM (
					SELECT * FROM [Campaign_LuckyTicketLog]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + ''' AND [Win] = 1 
				) tItem
				LEFT JOIN [Member]
				ON tItem.[Member] = [Member].[Id]
			) AllData
		)as ResultTable 
		WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)

		exec (@sql)
		
		--返回符合条件的记录总数
		
		set @sql = '
		SELECT Count(1) AS TotalCount FROM (
			SELECT [Member].[NickName] FROM (
				SELECT * FROM [Campaign_LuckyTicketLog]
				WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + ''' AND [Win] = 1 
			) tItem
			LEFT JOIN [Member]
			ON tItem.[Member] = [Member].[Id]
		) AllData'
				
		exec (@sql)

    
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_MemberQRCodeDataAnalyse]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_MemberQRCodeDataAnalyse] 
	@campaignId uniqueidentifier,
	@startDate smalldatetime,
	@endDate smalldatetime
AS
BEGIN

	DECLARE @dayCount int
	SET @dayCount = DATEDIFF (d, @startDate,@endDate) + 1
	
	--日生成量
	;WITH cte AS
	(
		SELECT TOP(@dayCount) 
			[Date]= CONVERT(CHAR(10),DATEADD(DAY, -number, @endDate),120)
		from master.dbo.spt_values
		WHERE type = 'p'
	)
	SELECT cte.[Date],COUNT(t.CreateTime) AS TotalCount FROM (
		SELECT CONVERT(CHAR(10),[CreateTime],120) AS CreateTime
		FROM [Campaign_MemberQRCodeItem]
		WHERE [CampaignId] = @campaignId AND [CreateTime] >= @startDate AND [CreateTime] < @endDate + 1
	) t RIGHT JOIN cte
	ON t.CreateTime = cte.[Date]
	GROUP BY cte.[Date]
	
	--日落地总量
	;WITH cte AS
	(
		SELECT TOP(@dayCount) 
			[Date]= CONVERT(CHAR(10),DATEADD(DAY, -number, @endDate),120)
		from master.dbo.spt_values
		WHERE type = 'p'
	)
	SELECT cte.[Date],COUNT(t.LandingTime) AS TotalCount FROM (
		SELECT CONVERT(CHAR(10),[LandingTime],120) AS LandingTime
		FROM [Campaign_MemberQRCodeLandingLog]
		WHERE [CampaignId] = @campaignId AND [LandingTime] >= @startDate AND [LandingTime] < @endDate + 1
	) t RIGHT JOIN cte
	ON t.LandingTime = cte.[Date]
	GROUP BY cte.[Date]
	
	--日落地人数
	;WITH cte AS
	(
		SELECT TOP(@dayCount) 
			[Date]= CONVERT(CHAR(10),DATEADD(DAY, -number, @endDate),120)
		from master.dbo.spt_values
		WHERE type = 'p'
	)
	SELECT cte.[Date],COUNT(t.LandingTime) AS TotalCount FROM (
		SELECT CONVERT(CHAR(10),[LandingTime],120) AS LandingTime
		FROM [Campaign_MemberQRCodeLandingLog]
		WHERE [CampaignId] = @campaignId AND [LandingTime] >= @startDate AND [LandingTime] < @endDate + 1
		GROUP BY [VisitorOpenId], CONVERT(CHAR(10),[LandingTime],120)
	) t RIGHT JOIN cte
	ON t.LandingTime = cte.[Date]
	GROUP BY cte.[Date]


	
	--总落地次数
	SELECT SUM(LandingCount) AS TotalCount
	FROM [Campaign_MemberQRCodeItem] 
	WHERE [CampaignId] = @campaignId


	--总落地人数	
	--这里不能用 [Campaign_MemberQRCodeItem] 表中的数据累加，因为会有重复
	--比如同一个人扫两个粉丝二维码
	SELECT COUNT(1) AS TotalCount
	FROM (
		SELECT [VisitorOpenId] 
		FROM [Campaign_MemberQRCodeLandingLog] 
		WHERE [CampaignId] = @campaignId
		GROUP BY [VisitorOpenId]
	) t
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_MemberQRCodeDataReport]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_MemberQRCodeDataReport]
	@campaignId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --参与人数
	SELECT COUNT(1) AS [MemberCount] FROM [Campaign_MemberQRCodeItem]
	WHERE [CampaignId] = @campaignId

	--总落地次数
	SELECT COUNT(1) AS [LandingCount] FROM [Campaign_MemberQRCodeLandingLog]
	WHERE [CampaignId] = @campaignId

	--活动页面PV
	SELECT [PageVisitCount] FROM [Campaign] WHERE [Id] = @campaignId
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_MemberQRCodeItemList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_MemberQRCodeItemList]
	
	@campaignId uniqueidentifier,
	@page INT,
	@pageSize INT,
	@memberName varchar(200),
	@orderby varchar(50),
	@sort varchar(50)
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @campaignWhereSql varchar(500)
	declare @whereSql varchar(500)
	
	set @campaignWhereSql = ''
	set @whereSql = ''
	  
	  if(@memberName IS NOT NULL AND LEN(@memberName) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Member].[NickName] LIKE ''%' + @memberName + '%'''
	  end
	  
	  set @sql = '
		SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [' + @orderby + '] ' + @sort + ') AS rownum, tItem.*,[Member].[NickName] AS [MemberNickName] FROM(
					SELECT * FROM [Campaign_MemberQRCodeItem]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + '''' + @campaignWhereSql + '
				) tItem
				LEFT JOIN [Member]
				ON tItem.[Member]= [Member].[Id]
				WHERE 1=1 ' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
				--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM (
				SELECT tItem.* FROM(
					SELECT * FROM [Campaign_MemberQRCodeItem]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + '''' + @campaignWhereSql + '
				) tItem
				LEFT JOIN [Member]
				ON tItem.[Member]= [Member].[Id]
				WHERE 1=1 ' + @whereSql + '
			) AllData'
  
		exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_MemberQRCodeList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_MemberQRCodeList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@status TINYINT
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	set @sql = '
		SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,tCampaign.*,[Campaign_MemberQRCode].[BackgroundImageUrl],[Campaign_MemberQRCode].[LandingUrl],[Campaign_MemberQRCode].[LandingPoint],[User].[Name] AS [CreateUserName] FROM (
					SELECT * FROM [Campaign] 
					WHERE [Type] = 2 AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tCampaign
				LEFT JOIN [Campaign_MemberQRCode]
				ON tCampaign.Id = [Campaign_MemberQRCode].[CampaignId]
				LEFT JOIN [User]
				ON tCampaign.CreateUser = [User].[Id]
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT Count(1) AS TotalCount FROM [Campaign]
		WHERE [Type] = 2  AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND  [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_PictureVoteDataAnalyse]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_PictureVoteDataAnalyse]
	@campaignId uniqueidentifier,
	@startDate smalldatetime,
	@endDate smalldatetime
AS
BEGIN

	--SET @endDate = @endDate + 1

	DECLARE @dayCount int
	SET @dayCount = DATEDIFF (d, @startDate,@endDate) + 1
	
	--日上传量
	;WITH cte AS
	(
		SELECT TOP(@dayCount) 
			[Date]= CONVERT(CHAR(10),DATEADD(DAY, -number, @endDate),120)
		from master.dbo.spt_values
		WHERE type = 'p'
	)
	SELECT cte.[Date],COUNT(t.UploadDate) AS TotalCount FROM (
		SELECT CONVERT(CHAR(10),[UploadTime],120) AS UploadDate
		FROM [Campaign_PictureVoteItem]
		WHERE [CampaignId] = @campaignId AND [UploadTime] >= @startDate AND [UploadTime] < @endDate + 1
	) t RIGHT JOIN cte
	ON t.UploadDate = cte.[Date]
	GROUP BY cte.[Date]
 
 --日投票量
	 ;WITH cte AS
	(
		SELECT TOP(@dayCount) 
			[Date]= CONVERT(CHAR(10),DATEADD(DAY, -number, @endDate),120)
		from master.dbo.spt_values
		WHERE type = 'p'
	)
	SELECT cte.[Date],COUNT(t.VoteDate) AS TotalCount FROM (
		SELECT CONVERT(CHAR(10),[VoteTime],120) AS VoteDate
		FROM [Campaign_PictureVoteLog]
		WHERE [CampaignId] = @campaignId AND [VoteTime] >= @startDate AND [VoteTime] < @endDate + 1
	) t RIGHT JOIN cte
	ON t.VoteDate = cte.[Date]
	GROUP BY cte.[Date]

 --审核状态
  select * from  
	(
		SELECT COUNT(1) as TotalCount,[ApproveStatus] FROM [Campaign_PictureVoteItem]
		  WHERE [CampaignId] = @campaignId
		  GROUP BY [ApproveStatus]
	) t
	pivot ( sum(TotalCount) for t.[ApproveStatus] in ([0],[1],[2])) as ourpivot
 
	
END



--EXEC GetPictureVoteDataAnalyse '1239AC47-4FA9-418A-841A-E0216B6FD70A','2016-1-21','2016-1-30'
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_PictureVoteDataReport]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_PictureVoteDataReport] 
	@campaignId uniqueidentifier
AS
BEGIN
	--审核通过的项目数量 
	SELECT COUNT(1) FROM [Campaign_PictureVoteItem] WHERE [CampaignId] = @campaignId AND [ApproveStatus] = 1
	
	--总投票数量
	SELECT SUM(VoteQuantity) FROM [Campaign_PictureVoteItem] WHERE [CampaignId] = @campaignId 
	
	--活动页面PV
	SELECT [PageVisitCount] FROM [Campaign] WHERE [Id] = @campaignId 
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_PictureVoteItemList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_PictureVoteItemList] 
	
	@campaignId uniqueidentifier,
	@page INT,
	@pageSize INT,
	@approveStatus tinyint,
	@title varchar(30),
	@memberName varchar(200),
	@userName varchar(200),
	@orderby varchar(50),
	@sort varchar(50)
	
AS
BEGIN
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @campaignWhereSql varchar(500)
	declare @whereSql varchar(500)
	
	set @campaignWhereSql = ''
	set @whereSql = ''
	
	if(@approveStatus IS NOT NULL)
	  begin 
		set @campaignWhereSql = @campaignWhereSql + ' AND [ApproveStatus] = ' + convert(varchar(3),@approveStatus)
	  end
	  
	  if(@title IS NOT NULL AND LEN(@title) > 0)
	  begin 
		set @campaignWhereSql = @campaignWhereSql + ' AND [Title] LIKE ''%' + @title + '%'''
	  end
	  
	  if(@memberName IS NOT NULL AND LEN(@memberName) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Member].[NickName] LIKE ''%' + @memberName + '%'''
	  end
	  
	  if(@userName IS NOT NULL AND LEN(@userName) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [User].[Name] LIKE ''%' + @userName + '%'''
	  end
	  
	  
	  set @sql = '
		SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [' + @orderby + '] ' + @sort + ') AS rownum, tItem.*,[Member].[NickName] AS [MemberNickName],[User].[Name] AS [UserName] FROM(
					SELECT * FROM [Campaign_PictureVoteItem]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + '''' + @campaignWhereSql + '
				) tItem
				LEFT JOIN [Member]
				ON tItem.[Member]= [Member].[Id]
				LEFT JOIN [User]
				ON tItem.[User] = [User].[Id]
				WHERE 1=1 ' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
				--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM (
				SELECT tItem.* FROM(
					SELECT * FROM [Campaign_PictureVoteItem]
					WHERE [CampaignId] = ''' + CONVERT(char(36),@campaignId) + '''' + @campaignWhereSql + '
				) tItem
				LEFT JOIN [Member]
				ON tItem.[Member]= [Member].[Id]
				LEFT JOIN [User]
				ON tItem.[User] = [User].[Id]
				WHERE 1=1 ' + @whereSql + '
			) AllData'
  
		exec (@sql)
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_PictureVoteItemMemberList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_PictureVoteItemMemberList]
	@itemId uniqueidentifier,
	@page INT,
	@pageSize INT
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	
	SELECT * FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY [VoteTime] DESC) AS rownum,tLog.*,
		[Member].[NickName], [Member].[City],[Member].[Province],[Member].[Country],[Member].[Headimgurl]
		FROM (
			SELECT [CampaignId],[OpenId],[Member],[VoteTime] FROM [Campaign_PictureVoteLog]
			WHERE [ItemId] = @itemId
		) tLog
		LEFT JOIN [Member]
		ON tLog.[OpenId] = [Member].[OpenId]
		--用OpenId连接，因为可能出现先投票，再关注的情况
	) AllData
	WHERE rownum between @rowStart and @rowEnd
	
	SELECT COUNT(1) AS TotalCount  FROM [Campaign_PictureVoteLog]
		WHERE [ItemId] = @itemId
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_PictureVoteList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_PictureVoteList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@status TINYINT
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	set @sql = '
		SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,tCampaign.*,[Campaign_PictureVote].[MaxPublishTimes],[Campaign_PictureVote].[MaxVoteTimes],[Campaign_PictureVote].PublishType,[User].[Name] AS [CreateUserName] FROM (
					SELECT * FROM [Campaign] 
					WHERE [Type] = 1 AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tCampaign
				LEFT JOIN [Campaign_PictureVote]
				ON tCampaign.Id = [Campaign_PictureVote].[CampaignId]
				LEFT JOIN [User]
				ON tCampaign.CreateUser = [User].[Id]
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT Count(1) AS TotalCount FROM [Campaign]
		WHERE [Type] = 1  AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND  [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_ShakingLottery_MemberObtainedGiftList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_ShakingLottery_MemberObtainedGiftList]
	-- Add the parameters for the stored procedure here
	@campaignId uniqueidentifier,
	@memberId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT [Campaign_ShakingLotteryGift].* FROM(
		SELECT * FROM Campaign_ShakingLotteryLog 
		WHERE [CampaignId] = @campaignId
		AND [Member] = @memberId AND [Win] = 1
	) tLog
	LEFT JOIN [Campaign_ShakingLotteryGift]
	ON tLog.Gift = [Campaign_ShakingLotteryGift].[Id]
	Where [Campaign_ShakingLotteryGift].[IsGift] = 1
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_ShakingLotteryDataReport]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_ShakingLotteryDataReport] 
	-- Add the parameters for the stored procedure here
	@campaignId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

      --参与人次数
	SELECT SUM([MemberCount]) AS [MemberCount] FROM(
		SELECT 1 AS [MemberCount] FROM [Campaign_ShakingLotteryLog]
		WHERE [CampaignId] = @campaignId
		--GROUP BY [Member]
	) t

	--中奖人数
	SELECT COUNT(1) AS [LuckyTicketCount] FROM (
		SELECT [Gift] FROM [Campaign_ShakingLotteryLog]
		WHERE [Win] = 1
	) tLog
	LEFT JOIN [Campaign_ShakingLotteryGift]
	ON tLog.[Gift] = [Campaign_ShakingLotteryGift].[Id]
	Where [Campaign_ShakingLotteryGift].[IsGift] = 1

	--活动页面PV
	SELECT [PageVisitCount] FROM [Campaign] WHERE [Id] = @campaignId
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_ShakingLotteryGiftList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_ShakingLotteryGiftList]
	-- Add the parameters for the stored procedure here
	@campaignId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	SELECT [Campaign_ShakingLotteryGift].*,[Campaign_ShakingLotteryPeriod].[Name] AS [PeriodName]
	FROM [Campaign_ShakingLotteryGift]
	LEFT JOIN [Campaign_ShakingLotteryPeriod]
	ON [Campaign_ShakingLotteryGift].[Period] = [Campaign_ShakingLotteryPeriod].[Id]
	WHERE [Campaign_ShakingLotteryGift].[CampaignId] = @campaignId
	ORDER BY [Campaign_ShakingLotteryGift].[Period]
END

GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_ShakingLotteryGiftWinningList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_ShakingLotteryGiftWinningList] 
	-- Add the parameters for the stored procedure here
	@domainId UNIQUEIDENTIFIER,
	@appId VARCHAR(50),
	@page INT,
	@pageSize INT,
	@campaignId UNIQUEIDENTIFIER,
	@periodId UNIQUEIDENTIFIER
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@periodId IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Period] = ''' + convert(varchar(36),@periodId) + ''''
	  end
	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [Time] DESC) AS rownum,tLog.*,
			[Campaign_ShakingLotteryGift].[Name] AS [GiftName],[Member].[NickName] AS [MemberNickName],
			[Member].[MobilePhone] AS [MemberMobilePhone],[Member].[Email] AS [MemberEmail]
				FROM (
				SELECT * FROM [Campaign_ShakingLotteryLog] 
				WHERE [Win] = 1 AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) tLog
			LEFT JOIN [Campaign_ShakingLotteryGift]
			ON tLog.[Gift] = [Campaign_ShakingLotteryGift].[Id]
			LEFT JOIN [Member]
			ON tLog.[Member] = [Member].[Id]
			Where [Campaign_ShakingLotteryGift].[IsGift] = 1
		) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
		 
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM (
			SELECT [Gift] FROM [Campaign_ShakingLotteryLog]
			WHERE [Win] = 1 AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			AND [Win] = 1
		) tLog
		LEFT JOIN [Campaign_ShakingLotteryGift]
		ON tLog.[Gift] = [Campaign_ShakingLotteryGift].[Id]
		Where [Campaign_ShakingLotteryGift].[IsGift] = 1'
		
	exec (@sql)
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetCampaign_ShakingLotteryList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaign_ShakingLotteryList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@status TINYINT
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	set @sql = '
		SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,tCampaign.*,[Campaign_ShakingLottery].[Point],[Campaign_ShakingLottery].[Mode],[User].[Name] AS [CreateUserName] FROM (
					SELECT * FROM [Campaign] 
					WHERE [Type] = 5 AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tCampaign
				LEFT JOIN [Campaign_ShakingLottery]
				ON tCampaign.Id = [Campaign_ShakingLottery].[CampaignId]
				LEFT JOIN [User]
				ON tCampaign.CreateUser = [User].[Id]
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT Count(1) AS TotalCount FROM [Campaign]
		WHERE [Type] = 5  AND [Status] = ' + CONVERT(VARCHAR(3),@status) + ' AND  [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaignCount]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaignCount]
	@domainId uniqueidentifier,
	@appId varchar(50),
	@type tinyint
AS
BEGIN
	
	select * from  
	(
		SELECT [Status],COUNT(1) AS [Count] FROM [Campaign] 
		WHERE [Type] = @type AND [Domain] = @domainId AND [AppId] = @appId
		GROUP BY [Status]
	) t
	pivot ( sum(count) for t.[Status] in ([0],[1],[2])) as ourpivot
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampaignList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampaignList]

	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@type TINYINT,
	@status TINYINT,
	@orderby varchar(50),
	@sort varchar(50)
	
AS
BEGIN

	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@type IS NOT NULL AND @type <> 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Type] = ' + convert(varchar(3),@type)
	  end
	
	if(@status IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Status] = ' + convert(varchar(3),@status)
	  end
	  
	  
	 set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [' + @orderby + '] ' + @sort + ') AS rownum, * FROM [Campaign]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM [Campaign]
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
		
END
GO
/****** Object:  StoredProcedure [dbo].[GetCashAccountTrackList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCashAccountTrackList]
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@memberId uniqueidentifier
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''
	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [ChangeTime] DESC) AS rownum,* FROM (
				SELECT tCashAccountTrack.*,[User].[Name] AS [OperatorUserName] FROM(
					SELECT * FROM [CashAccountTrack]
					WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + ''' AND [Member] = ''' + CONVERT(char(36),@memberId) + '''' + @whereSql + '
				) tCashAccountTrack
				LEFT JOIN [User]
				ON tCashAccountTrack.[OperatorUser]= [User].[Id]
				WHERE 1=1 ' + @whereSql2 + '
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
            
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
			SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [CashAccountTrack]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + ''' AND [Member] = ''' + CONVERT(char(36),@memberId) + '''' + @whereSql + '
		) tCashAccountTrack
		LEFT JOIN [User]
		ON tCashAccountTrack.[OperatorUser]= [User].[Id]
		WHERE 1=1 ' + @whereSql2
		
			
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCouponList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCouponList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@name IS NOT NULL AND LEN(@name) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Name] LIKE ''%' + @name + '%'''
	  end
	  
	 set @sql = '
	 SELECT * FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
			SELECT tCoupon.*,[User].[Name] AS [CreateUserName] FROM(
				SELECT * FROM [Coupon]
				WHERE [Removed] = 0 AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) tCoupon
			LEFT JOIN [User]
			ON tCoupon.[CreateUser] = [User].[Id]
		) AllData
	)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	 
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [Coupon]
			WHERE [Removed] = 0 AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
		) tCoupon'
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomFormContentList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomFormContentList]
	@page INT,
	@pageSize INT,
	@form uniqueidentifier,
	@name nvarchar(20),
	@nickName nvarchar(200)
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''
	
	if(@name IS NOT NULL AND LEN(@name) > 0)
	  begin 
		set @whereSql2 = @whereSql2 + ' AND [Name] LIKE ''%' + @name + '%'''
	  end
	  
	  if(@nickName IS NOT NULL AND LEN(@nickName) > 0)
	  begin 
		set @whereSql2 = @whereSql2 + ' AND [NickName] LIKE ''%' + @nickName + '%'''
	  end
	  
	   set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [FillinTime] DESC) AS rownum,* FROM (
				SELECT tFormContent.*,[Member].[NickName],
				[Member].[Name],[Member].[MobilePhone],[Member].[Email],[Member].[Birthday] FROM(
					SELECT * FROM [CustomFormContent]
					WHERE [Form] = ''' + CONVERT(char(36),@form) + '''
				) tFormContent
				LEFT JOIN [Member]
				ON tFormContent.[MemberOpenId] = [Member].[OpenId] 
				AND tFormContent.[Domain] = [Member].[Domain] AND tFormContent.[AppId] = [Member].[AppId]
				WHERE 1=1 ' + @whereSql2 + '
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
      
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
			SELECT COUNT(1) AS TotalCount FROM(
				SELECT * FROM [CustomFormContent]
				WHERE [Form] = ''' + CONVERT(char(36),@form) + '''
			) tFormContent
			LEFT JOIN [Member]
			ON tFormContent.[MemberOpenId] = [Member].[OpenId] 
			AND tFormContent.[Domain] = [Member].[Domain] AND tFormContent.[AppId] = [Member].[AppId]
			WHERE 1=1 ' + @whereSql2
		
			
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomFormList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomFormList]
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@name nvarchar(100)
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''
	
	if(@name IS NOT NULL AND LEN(@name) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Name] LIKE ''%' + @name + '%'''
	  end
	  
	  set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
				SELECT tCustomForm.*,[User].[Name] AS [CreateUserName] FROM(
					SELECT * FROM [CustomForm]
					WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tCustomForm
				LEFT JOIN [User]
				ON tCustomForm.[CreateUser] = [User].[Id]
				WHERE 1=1 ' + @whereSql2 + '
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
      
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [CustomForm]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
		) tCustomForm
		LEFT JOIN [User]
		ON tCustomForm.[CreateUser] = [User].[Id]
		WHERE 1=1 ' + @whereSql2
		
			
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetDistributedCouponList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDistributedCouponList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@couponId uniqueidentifier,
	@serialNumber varchar(30),
	@memberNickName nvarchar(200),
	@status int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(4000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''

	if(@serialNumber IS NOT NULL AND LEN(@serialNumber) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [SerialNumber] LIKE ''%' + @serialNumber + '%'''
	  end
	  
	  if(@status IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Status] = ' + CONVERT(VARCHAR(3),@status)
	  end
	  
	  if(@memberNickName IS NOT NULL AND LEN(@memberNickName) > 0)
	  begin 
		set @whereSql2 = @whereSql2 + ' AND [Member].[NickName] LIKE ''%' + @memberNickName + '%'''
	  end
	 
	  set @sql='
	  SELECT * FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY [DistributeTime] DESC) AS rownum,* FROM (
			SELECT tCouponRecord.*,[User].[Name] AS [DistributeUserName],[Member].[NickName] as [MemberNickName] FROM(
				SELECT * FROM [CouponRecord]
				WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + ''' AND [Coupon] = ''' + CONVERT(char(36),@couponId) + '''' + @whereSql + '
			) tCouponRecord
			LEFT JOIN [User]
			ON tCouponRecord.[DistributeUser] = [User].[Id]
			LEFT JOIN [Member]
			ON tCouponRecord.[Member] = [Member].[Id]
			WHERE 1=1 ' + @whereSql2 + '
		) AllData
	)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	
		exec (@sql)
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [CouponRecord]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + ''' AND [Coupon] = ''' + CONVERT(char(36),@couponId) + '''' + @whereSql + '
		) tCouponRecord
		LEFT JOIN [User]
		ON tCouponRecord.[DistributeUser] = [User].[Id]
		LEFT JOIN [Member]
		ON tCouponRecord.[Member] = [Member].[Id]
		WHERE 1=1 ' + @whereSql2
		
	exec (@sql)
	
END


--exec GetDistributedCouponList '2a58d820-de07-4c8f-80b9-b5cb5a1028b4','wx8c36b3c0000a0a49',1,10,'50e2f19c-6c8c-48c9-a4d6-35807a8e1c08','','',NULL
GO
/****** Object:  StoredProcedure [dbo].[GetInformationCategoryList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInformationCategoryList] 
	
	@informationId uniqueidentifier,
	@page INT,
	@pageSize INT
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''

	 set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum, * FROM [InformationCategory]
			WHERE [Information] = ''' + CONVERT(char(36),@informationId) + '''' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM [InformationCategory]
		WHERE [Information] = ''' + CONVERT(char(36),@informationId) + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetInformationItemList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInformationItemList] 
	
	@page INT,
	@pageSize INT,
	@categoryId uniqueidentifier,
	@keyword VARCHAR(20)
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''

	if(@keyword IS NOT NULL AND LEN(@keyword) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND ( [Name] LIKE ''%' + @keyword + '%'' OR [Description] LIKE ''%' + @keyword + '%'' )'
	  end
	  
	   set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum, * FROM [InformationItem]
			WHERE [Category] = ''' + CONVERT(char(36),@categoryId) + '''' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT  COUNT(1) AS TotalCount FROM [InformationItem] 
		WHERE [Category] = ''' + CONVERT(char(36),@categoryId) + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetInformationList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInformationList] 
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''

	 set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum, * FROM [Information]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM [Information]
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetMemberCardNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		生成一个随机的会员卡号
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMemberCardNumber]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @result varchar(30)
	DECLARE @dateNumber  char(6)
	DECLARE @serialNumber varchar(50)
	DECLARE @randNumber char(3)

	SELECT @dateNumber = SUBSTRING(convert(char(12),getdate(),112),3,6)
	SELECT @randNumber = cast(rand()*(999-100)+100 as int) 

	INSERT INTO [MemberCardSerialNumber] ([Domain],[AppId]) VALUES(@domainId,@appId)
	select @serialNumber = SCOPE_IDENTITY()

	SET @result = SUBSTRING(@dateNumber,1,1) + SUBSTRING(@serialNumber,1,1)
	+  SUBSTRING(@dateNumber,2,1) + SUBSTRING(@serialNumber,2,1)
	+  SUBSTRING(@dateNumber,3,1) + SUBSTRING(@serialNumber,3,1)
	+  SUBSTRING(@dateNumber,4,1) + SUBSTRING(@serialNumber,4,LEN(@serialNumber) - 3)
	+ SUBSTRING(@dateNumber,5,1) + SUBSTRING(@randNumber,1,1)
	+ SUBSTRING(@dateNumber,6,1) + SUBSTRING(@randNumber,2,2)

	SELECT @result
END

GO
/****** Object:  StoredProcedure [dbo].[GetMemberCouponList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMemberCouponList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@memberId uniqueidentifier,
	@status TINYINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@status IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Status] = ' + CONVERT(VARCHAR(3),@status)
	  end
	  
	  set @sql = '
	  SELECT * FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY [DistributeTime] DESC) AS rownum,* FROM (
			SELECT t.*,[User].[Name] AS [ChargeUserName] FROM (
				SELECT tCouponRecord.*,[User].[Name] AS [DistributeUserName],[Coupon].[Name] AS [CouponName]  FROM(
					SELECT * FROM [CouponRecord]
					WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId 
					+ ''' AND [Member] = ''' + CONVERT(char(36),@memberId) + '''' + @whereSql + '
				) tCouponRecord
				LEFT JOIN [User]
				ON tCouponRecord.[DistributeUser]= [User].[Id]
				LEFT JOIN [Coupon]
				ON tCouponRecord.[Coupon] = [Coupon].[Id]
			) t
			LEFT JOIN [User]
			ON t.[ChargeUser]= [User].[Id]
		) AllData
	)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	  
	exec (@sql)
		
		
	--返回符合条件的记录总数
	set @sql = '
	SELECT COUNT(1) AS [TotalCount] FROM [CouponRecord]
	WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId 
	+ ''' AND [Member] = ''' + CONVERT(char(36),@memberId) + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetMemberList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMemberList]
	
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@groupId INT,
	@nickName VARCHAR(20),
	@mobilePhone VARCHAR(20),
	@cardNumber VARCHAR(30)
	
AS
BEGIN

	if(@appId is null)
	begin
		set @appId=''
	end
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@groupId IS NOT NULL AND @groupId != -1)
	  begin 
		set @whereSql = @whereSql + ' AND [GroupId] = ' + convert(varchar(10),@groupId)
	  end
	
	if(@nickName IS NOT NULL AND LEN(@nickName) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [NickName] LIKE ''%' + @nickName + '%'''
	  end
	  
	  if(@mobilePhone IS NOT NULL AND LEN(@mobilePhone) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [MobilePhone] LIKE ''%' + @mobilePhone + '%'''
	  end
	  
	   if(@cardNumber IS NOT NULL AND LEN(@cardNumber) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [CardNumber] LIKE ''%' + @cardNumber + '%'''
	  end
	  
	   set @sql = '
		SELECT * FROM (
			SELECT  ROW_NUMBER() OVER(ORDER BY [SubscribeTime] DESC) AS rownum, * FROM [Member] 
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT  COUNT(1) AS TotalCount FROM [Member] 
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetMemberStatisticData]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMemberStatisticData] 
	@domainId uniqueidentifier,
	@appId varchar(50),
	@startDate datetime,
	@endDate datetime --可以是同一天
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --关注人数
    DECLARE @subscribeCount INT
	SELECT @subscribeCount = COUNT(1) FROM [Member]
	WHERE  [Domain] = @domainId
	AND [AppId] = @appId
	AND [Attention] = 1
	AND [SubscribeTime] >= CONVERT(datetime,CONVERT(varchar(10),@startDate) + ' 00:00:00')
	AND [SubscribeTime] <= CONVERT(datetime,CONVERT(varchar(10),@startDate) + ' 23:59:59')
    SELECT @subscribeCount AS TotalCount
    
    --取消关注人数
    DECLARE @unsubscribeCount INT
	SELECT @unsubscribeCount = COUNT(1)FROM [Member]
	WHERE  [Domain] = @domainId
	AND [AppId] = @appId
	AND [Attention] = 0
	AND [UnsubscribeTime] >= CONVERT(datetime,CONVERT(varchar(10),@startDate) + ' 00:00:00')
	AND [UnsubscribeTime] <= CONVERT(datetime,CONVERT(varchar(10),@startDate) + ' 23:59:59')
	SELECT @unsubscribeCount AS TotalCount
	
	--净增关注人数
	SELECT @subscribeCount - @unsubscribeCount AS TotalCount FROM [Member]
	
	--会员总数
	SELECT COUNT(1) AS TotalCount FROM [Member]
	WHERE  [Domain] = @domainId
	AND [AppId] = @appId
	AND [Attention] = 1
	
	--今日签到人数
	SELECT Count(1) FROM [Member]
	WHERE  [Domain] = @domainId AND [AppId] = @appId
	AND CONVERT(datetime,CONVERT(varchar(10),[SignInDate])) = CONVERT(datetime,CONVERT(varchar(10),GETDATE()))
    
END

GO
/****** Object:  StoredProcedure [dbo].[GetMessageList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMessageList]
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@receivingMessageType varchar(20),
	@content varchar(20),
	@memberOpenId varchar(32),
	@memberNickName varchar(20)
AS
BEGIN
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''
	
	if(@receivingMessageType IS NOT NULL AND LEN(@receivingMessageType) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [ReceivingMessageType] = ''' + @receivingMessageType + ''''
	  end
	  
	  if(@content IS NOT NULL AND LEN(@content) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Content] LIKE ''%' + @receivingMessageType + '%'''
	  end
	  
	  if(@memberOpenId IS NOT NULL AND LEN(@memberOpenId) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [MemberOpenId] = ''' + @memberOpenId + ''''
	  end
	  
	   if(@memberNickName IS NOT NULL AND LEN(@memberNickName) > 0)
	  begin 
		set @whereSql2 = @whereSql2 + ' AND [Member].[Name] LIKE ''%' + @memberNickName + '%'''
	  end

	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
				SELECT tItem.*,[Member].[NickName] AS [MemberNickName] FROM(
					SELECT * FROM [Message]
					WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tItem
				LEFT JOIN [Member]
				ON tItem.[MemberOpenId]= [Member].[OpenId]
				WHERE 1=1 ' + @whereSql2 + '
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
    
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [Message]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
		) tItem
		LEFT JOIN [Member]
		ON tItem.[MemberOpenId]= [Member].[OpenId]
		WHERE 1=1 ' + @whereSql2 
		
			
	exec (@sql)
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetMovieTimes]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMovieTimes]
	
	@domainId uniqueidentifier,
	@appId varchar(50),
	@date smalldatetime
	
AS
BEGIN
	
	SELECT [Movie].* FROM
	(
		SELECT * FROM MoviePlan
		WHERE [Domain] = @domainId AND [AppId] = @appId
		AND [Date] = @date
	) t
	JOIN [Movie]
	ON t.[Movie] = [Movie].[Id]
	ORDER BY [Sort] ASC


	SELECT * FROM MovieTimes
		WHERE [Domain] = @domainId AND [AppId] = @appId
		AND CONVERT(CHAR(10),[Time],120) = CONVERT(CHAR(10),@date,120)
		ORDER BY [Time] ASC
END

GO
/****** Object:  StoredProcedure [dbo].[GetOneDollarBuyingCommodityForSaleList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOneDollarBuyingCommodityForSaleList]
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@commodityId uniqueidentifier
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''

	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [ForSaleTime] DESC) AS rownum,* FROM (
				SELECT tCommodity.*,CASE WHEN [SoldPart]<[TotalPart] THEN 1 ELSE 0 END AS [ForSale],
				[Member].[NickName] AS [LuckyMemberNickName] FROM(
					SELECT * FROM [OneDollarBuyingCommodityForSale]
					WHERE [CommodityId]= ''' + CONVERT(char(36),@commodityId) + '''
				) tCommodity
				LEFT JOIN [Member]
				ON tCommodity.[LuckyMember] = [Member].[Id]
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
      
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
			SELECT COUNT(1) AS TotalCount FROM(
			SELECT *,CASE WHEN [SoldPart]<[TotalPart] THEN 1 ELSE 0 END AS [ForSale] FROM [OneDollarBuyingCommodityForSale]
			WHERE [CommodityId]= ''' + CONVERT(char(36),@commodityId) + '''
				) tCommodity
			LEFT JOIN [Member]
			ON tCommodity.[LuckyMember] = [Member].[Id]'
		
			
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneDollarBuyingCommodityList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOneDollarBuyingCommodityList] 
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@name nvarchar(100),
	@forSale bit
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''
	
	if(@name IS NOT NULL AND LEN(@name) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Name] LIKE ''%' + @name + '%'''
	  end
	  
	  if(@forSale IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [ForSale] = ' + CONVERT(char(1),@forSale)
	  end

		set @sql = '
			SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum,* FROM (
					SELECT tCommodity.*,[User].[Name] AS [CreateUserName] FROM(
						SELECT * FROM [OneDollarBuyingCommodity]
						WHERE  [Remove] = 0 AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
					) tCommodity
					LEFT JOIN [User]
					ON tCommodity.[CreateUser] = [User].[Id]
					WHERE 1=1 ' + @whereSql2 + '
				) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
      
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [OneDollarBuyingCommodity]
			WHERE [Remove] = 0 AND [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
		) tCommodity
		LEFT JOIN [User]
		ON tCommodity.[CreateUser] = [User].[Id]
		WHERE 1=1 ' + @whereSql2
		
			
	exec (@sql)

   
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneDollarBuyingCommodityParticipatedList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOneDollarBuyingCommodityParticipatedList] 
	-- Add the parameters for the stored procedure here
	@page INT,
	@pageSize INT,
	@memberId uniqueidentifier,
	@lucky bit
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	--set @whereSql = ''
	set @whereSql2 = ''
	
	if(@lucky = 1)
	  begin 
		set @whereSql2 = @whereSql2 + ' AND [OneDollarBuyingCommodityForSale].[LuckyMember] = ''' + CONVERT(char(36),@memberId) + ''' '
	  end

		set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [ForSaleTime] DESC) AS rownum,* FROM (
				SELECT tForSale.[MyPartNumberCount],[OneDollarBuyingCommodityForSale].*,[Member].[NickName] AS [LuckyMemberNickName]
				,[OneDollarBuyingCommodity].[Name] AS [Name],[OneDollarBuyingCommodity].[ImageUrl]  FROM(
					SELECT [SaleId],[CommodityId],COUNT(1) AS [MyPartNumberCount] FROM [OneDollarBuyingCommoditySoldPart]
					WHERE [Member] = ''' + CONVERT(char(36),@memberId) + '''
					GROUP BY [SaleId],[CommodityId]
				) tForSale
				LEFT JOIN [OneDollarBuyingCommodityForSale]
				ON tForSale.[SaleId] = [OneDollarBuyingCommodityForSale].[Id]
				LEFT JOIN [OneDollarBuyingCommodity]
				ON tForSale.[CommodityId] = [OneDollarBuyingCommodity].[Id]
				LEFT JOIN [Member]
				ON [OneDollarBuyingCommodityForSale].[LuckyMember] = [Member].[Id]
				WHERE 1=1 ' + @whereSql2 + '
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
      
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT [SaleId] FROM [OneDollarBuyingCommoditySoldPart]
			WHERE [Member] = ''' + CONVERT(char(36),@memberId) + '''
			GROUP BY [SaleId]
		) tForSale
		LEFT JOIN [OneDollarBuyingCommodityForSale]
		ON tForSale.[SaleId] = [OneDollarBuyingCommodityForSale].[Id]
		WHERE 1=1 ' + @whereSql2
		
			
	exec (@sql)

   
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneDollarBuyingForSaleCommodityList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOneDollarBuyingForSaleCommodityList]
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT
AS
BEGIN
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)

	
	set @whereSql = ''
	

	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [ForSaleTime] DESC) AS rownum,* FROM (
				SELECT tForSaleCommodity.*,OneDollarBuyingCommodity.[Name],OneDollarBuyingCommodity.[ImageUrl],OneDollarBuyingCommodity.[Introduction] FROM(
					SELECT * FROM [OneDollarBuyingCommodityForSale]
					WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + ' AND [SoldPart] < [TotalPart]
				) tForSaleCommodity
				LEFT JOIN [OneDollarBuyingCommodity]
				ON tForSaleCommodity.[CommodityId] = [OneDollarBuyingCommodity].[Id]
				
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
      
	
		exec (@sql)
		
		--返回符合条件的记录总数
				set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [OneDollarBuyingCommodityForSale]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + ' AND [SoldPart] < [TotalPart]
		) tForSaleCommodity'
		
		
			
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneDollarBuyingForSaleCommodityMemberPartNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOneDollarBuyingForSaleCommodityMemberPartNumber] 
	@page INT,
	@pageSize INT,
	@saleId uniqueidentifier
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)

	
	set @whereSql = ''
	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [SoldPart] DESC) AS rownum,* FROM (
				SELECT tSoldPart.*,[Member].[Id],[Member].[NickName],[Member].[Headimgurl],[Member].[Attention],[Member].[MobilePhone],[Member].[Email] FROM(
					SELECT [Member] AS [SoldMember] ,COUNT(1) AS [SoldPart] FROM [OneDollarBuyingCommoditySoldPart] 
					WHERE [SaleId] = ''' + CONVERT(char(36),@saleId) + '''
					GROUP BY [Member]
				) tSoldPart
				LEFT JOIN [Member]
				ON tSoldPart.[SoldMember] = [Member].[Id]
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)

		exec (@sql)
		
		--返回符合条件的记录总数
				set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT [Member] AS [SoldMember] ,COUNT(1) AS [SoldPart] FROM [OneDollarBuyingCommoditySoldPart] 
			WHERE [SaleId] = ''' + CONVERT(char(36),@saleId) + '''
			GROUP BY [Member]
		) tForSaleCommodity'
		
		
			
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneDollarBuyingLuckyList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOneDollarBuyingLuckyList] 
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''

set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [SoldOutTime] DESC) AS rownum,* FROM (
				SELECT tCommodity.*,
				[Member].[NickName] AS [LuckyMemberNickName],
				[OneDollarBuyingCommodity].[Name] AS [CommodityName],
				[OneDollarBuyingCommodity].[ImageUrl] AS [ImageUrl]  FROM(
					SELECT * FROM [OneDollarBuyingCommodityForSale]
					WHERE  [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
					AND [SoldPart] >= [TotalPart]
				) tCommodity
				LEFT JOIN [Member]
				ON tCommodity.[LuckyMember] = [Member].[Id]
				LEFT JOIN [OneDollarBuyingCommodity]
				ON tCommodity.[CommodityId] = [OneDollarBuyingCommodity].[Id]
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
      
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [OneDollarBuyingCommodityForSale]
					WHERE  [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
					AND [SoldPart] >= [TotalPart]
				) tCommodity'
		
			
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetOperatedLogList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOperatedLogList] 
	
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
  
  	 set @sql = '
  		 SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [Time] DESC) AS rownum, tItem.*,[User].[Name] AS [UserName] FROM(
					SELECT * FROM [OperatedLog]
					WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tItem
				LEFT JOIN [User]
				ON tItem.[User]= [User].[Id]
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
  
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM [OperatedLog]
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetOperationData]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOperationData]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --日净新增人数
	SELECT COUNT(1) AS TotalCount FROM Member 
	WHERE [Domain] = @domainId AND [AppId] = @appId
	AND [Attention] = 1 AND CONVERT(CHAR(10),[SubscribeTime],101) = CONVERT(CHAR(10),@date,101)

	--总用户数
	SELECT COUNT(1) AS TotalCount FROM Member 
	WHERE [Domain] = @domainId AND [AppId] = @appId
	AND [Attention] = 1 
END

GO
/****** Object:  StoredProcedure [dbo].[GetPageList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPageList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''

	 set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum, * FROM [Page]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM [Page]
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetPayOrderList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPayOrderList] 
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@memberId uniqueidentifier,
	@tradeState tinyint
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	declare @whereSql2 varchar(500)
	
	set @whereSql = ''
	set @whereSql2 = ''
	
	if(@memberId IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Member] = ''' + CONVERT(char(36),@memberId) + ''''
	  end
	  
	  if(@tradeState IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [TradeState] = ' + CONVERT(varchar(3),@tradeState)
	  end

	set @sql = '
			SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [TimeStart] DESC) AS rownum,* FROM (
				SELECT tPayOrder.*,[Member].[NickName] AS [MemberNickName] FROM(
					SELECT * FROM [PayOrder]
					WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) tPayOrder
				LEFT JOIN [Member]
				ON tPayOrder.[Member]= [Member].[Id]
				WHERE 1=1 ' + @whereSql2 + '
			) AllData
		)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
      
		exec (@sql)
		
		
			--返回符合条件的记录总数
				set @sql = '
		SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [PayOrder]
			WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
		) tPayOrder
		LEFT JOIN [Member]
		ON tPayOrder.[Member]= [Member].[Id]
		WHERE 1=1 ' + @whereSql2
		
			
	exec (@sql)

    
    
END
GO
/****** Object:  StoredProcedure [dbo].[GetPointAccount]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPointAccount]

	@memberId uniqueidentifier,
	@page INT,
	@pageSize INT
	
AS
BEGIN
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	
	 set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [ChangeTime] DESC) AS rownum, * FROM [MemberPointTrack] 
			WHERE [Member] = ''' + CONVERT(char(36),@memberId) + '''
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
	exec (@sql)
	
	set @sql = '
		SELECT  COUNT(1) AS TotalCount  FROM [MemberPointTrack] 
			WHERE [Member] = ''' + CONVERT(char(36),@memberId) + ''''
		
	exec (@sql)
	
END


--exec GetPointAccount '2C1BCB5D-8E9C-4EF7-9078-811CF27CB238',1,5
GO
/****** Object:  StoredProcedure [dbo].[GetPointCommodityCartItemList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPointCommodityCartItemList]
	-- Add the parameters for the stored procedure here
	@memberId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [PointCommodityShoppingCart].*,[PointCommodity].[Name],
    [PointCommodity].[Point], [PointCommodity].[Price],[PointCommodity].[ImageUrl]
	FROM [PointCommodityShoppingCart]
	LEFT JOIN [PointCommodity]
	ON [PointCommodityShoppingCart].[PointCommodity] = [PointCommodity].[Id]
	WHERE [Member] = @memberId
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetPointCommodityOrderList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPointCommodityOrderList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@orderNumber VARCHAR(30),
	@memberNickName VARCHAR(200),
	@status INT
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if(@appId is null)
	begin
		set @appId=''
	end

	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@orderNumber IS NOT NULL AND LEN(@orderNumber) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [OrderNumber] LIKE ''%' + @orderNumber + '%'''
	  end
	  
	  if(@memberNickName IS NOT NULL AND LEN(@memberNickName) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Member].[NickName] LIKE ''%' + @memberNickName + '%'''
	  end
	  
	  if(@status <> 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Status] = ' + CONVERT(VARCHAR(2),@status);
	  end
	
	 set @sql = '
	 SELECT t.*,t2.[ImageUrl] FROM
	(
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [OrderTime] DESC) AS rownum, 
			[PointCommodityOrder].*,[Member].[NickName] AS [MemberNickName] FROM [PointCommodityOrder]
			LEFT JOIN [Member] 
			ON [PointCommodityOrder].[Member] = [Member].[Id]
			WHERE [PointCommodityOrder].[Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [PointCommodityOrder].[AppId] = ''' + @appId + '''' + @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd) + '
		 ) t OUTER APPLY 
(SELECT TOP(1) * FROM [PointCommodityOrderItem] 
WHERE [Order]=t.[Id] AND [ImageUrl] IS NOT NULL AND [ImageUrl] <> '''') t2
		 '
  
		exec (@sql)
		
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount  FROM [PointCommodityOrder]
		LEFT JOIN [Member] 
		ON [PointCommodityOrder].[Member] = [Member].[Id]
		WHERE [PointCommodityOrder].[Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [PointCommodityOrder].[AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END


--exec [GetPointCommodityOrderList] 1,5,null,null,null

GO
/****** Object:  StoredProcedure [dbo].[GetPointCommodityOrderListByMember]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPointCommodityOrderListByMember]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@member uniqueidentifier
	--@orderNumber VARCHAR(30),
	--@memberNickName VARCHAR(200),
	--@status INT
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if(@appId is null)
	begin
		set @appId=''
	end

	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	  
	 -- if(@status <> 0)
	 -- begin 
		--set @whereSql = @whereSql + ' AND [Status] = ' + CONVERT(VARCHAR(2),@status);
	 -- end
	
	 set @sql = '
	 SELECT t.*,t2.[ImageUrl] FROM
	(
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [OrderTime] DESC) AS rownum, 
			[PointCommodityOrder].*,[Member].[NickName] AS [MemberNickName] FROM [PointCommodityOrder]
			LEFT JOIN [Member] 
			ON [PointCommodityOrder].[Member] = [Member].[Id]
			WHERE [PointCommodityOrder].[Domain] = ''' + CONVERT(char(36),@domainId) 
			+ ''' AND [PointCommodityOrder].[AppId] = ''' + @appId + ''' AND [PointCommodityOrder].[Member] = ''' + CONVERT(char(36),@member) +  ''''
			+ @whereSql + '
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd) + '
		 ) t OUTER APPLY 
(SELECT TOP(1) * FROM [PointCommodityOrderItem] 
WHERE [Order]=t.[Id] AND [ImageUrl] IS NOT NULL AND [ImageUrl] <> '''') t2'
  
  --PRINT(@sql)
  
		exec (@sql)
		
		
		--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount  FROM [PointCommodityOrder]
		LEFT JOIN [Member] 
		ON [PointCommodityOrder].[Member] = [Member].[Id]
		WHERE [PointCommodityOrder].[Domain] = ''' + CONVERT(char(36),@domainId) 
		+ ''' AND [PointCommodityOrder].[AppId] = ''' + @appId + ''' AND [PointCommodityOrder].[Member] = ''' + CONVERT(char(36),@member) +  ''''
		+ @whereSql
		
	exec (@sql)
	
END


--EXEC GetPointCommodityOrderListByMember '2A58D820-DE07-4C8F-80B9-B5CB5A1028B4','wx8c36b3c0000a0a49',1,10,'ED638A09-F7AA-4D24-850E-A889A95BD454'
GO
/****** Object:  StoredProcedure [dbo].[GetPointCommodityOrderStatisticData]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPointCommodityOrderStatisticData]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@startDate datetime,
	@endDate datetime --可以是同一天
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     --订单总数
	  SELECT COUNT(1) FROM [PointCommodityOrder]
	 WHERE  [Domain] = @domainId
	AND [AppId] = @appId
	--AND [OrderTime] >= CONVERT(datetime,CONVERT(varchar(10),@startDate) + ' 00:00:00')
	--AND [OrderTime] <= CONVERT(datetime,CONVERT(varchar(10),@startDate) + ' 23:59:59')
	  
		--待支付
	  SELECT COUNT(1) FROM [PointCommodityOrder]
	  WHERE  [Domain] = @domainId
	AND [AppId] = @appId
	 AND [Status] = 4
	 
		--已支付
	  SELECT COUNT(1) FROM [PointCommodityOrder]
	  WHERE  [Domain] = @domainId
	AND [AppId] = @appId
	 AND [Status] = 1
	 
		--已发货
	  SELECT COUNT(1) FROM [PointCommodityOrder]
	  WHERE  [Domain] = @domainId
	AND [AppId] = @appId
	 AND [Status] = 2
	 
	 --已取消
	  SELECT COUNT(1) FROM [PointCommodityOrder]
	  WHERE  [Domain] = @domainId
	AND [AppId] = @appId
	 AND [Status] = 3
END

GO
/****** Object:  StoredProcedure [dbo].[GetPortalPresetTemplateDigestList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPortalPresetTemplateDigestList]
	-- Add the parameters for the stored procedure here
	@page INT,
	@pageSize INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)

	 set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum, * FROM [PortalPresetTemplate]
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = 'SELECT COUNT(1) AS TotalCount FROM [PortalPresetTemplate]'
		
	exec (@sql)
END

GO
/****** Object:  StoredProcedure [dbo].[GetRandomSerialNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 获取加入了日期和随机数的流水号
-- =============================================
CREATE PROCEDURE [dbo].[GetRandomSerialNumber]
	@module varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	DECLARE @result varchar(30)
	DECLARE @dateNumber  char(6)
	DECLARE @serialNumber varchar(50)
	DECLARE @randNumber char(3)

	SELECT @dateNumber = SUBSTRING(convert(char(12),getdate(),112),3,6)
	SELECT @randNumber = cast(rand()*(999-100)+100 as int) 

	INSERT INTO SerialNumber ([Module]) VALUES(@module)
	select @serialNumber = SCOPE_IDENTITY()

	SET @result = SUBSTRING(@dateNumber,1,1) + SUBSTRING(@serialNumber,1,1)
	+  SUBSTRING(@dateNumber,2,1) + SUBSTRING(@serialNumber,2,1)
	+  SUBSTRING(@dateNumber,3,1) + SUBSTRING(@serialNumber,3,1)
	+  SUBSTRING(@dateNumber,4,1) + SUBSTRING(@serialNumber,4,LEN(@serialNumber) - 3)
	+ SUBSTRING(@dateNumber,5,1) + SUBSTRING(@randNumber,1,1)
	+ SUBSTRING(@dateNumber,6,1) + SUBSTRING(@randNumber,2,2)

	SELECT @result
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetRecommendSubLevelDownlineCount]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRecommendSubLevelDownlineCount] 
	-- Add the parameters for the stored procedure here
	@memberId UNIQUEIDENTIFIER,
	@level INT -- 0级表示自己
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   --http://www.cnblogs.com/downmoon/archive/2009/10/23/1588405.html
	WITH Tree (Id,[RefereeMemberId],Sublevel)
	AS
	(
		SELECT Id,[RefereeMemberId],0 FROM [Member] P WHERE P.Id = @memberId -- parent id
		UNION ALL
		SELECT C.Id,C.[RefereeMemberId],Sublevel+1 FROM [Member] C
		INNER JOIN Tree T ON C.[RefereeMemberId] = T.Id
		WHERE [Attention] = 1
	)
	SELECT  COUNT(1) AS TotalCount FROM Tree WHERE Sublevel = @level

END

GO
/****** Object:  StoredProcedure [dbo].[GetScenicQRCodeList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetScenicQRCodeList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@name VARCHAR(20)
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@name IS NOT NULL AND LEN(@name) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Name] LIKE ''%' + @name + '%'''
	  end
	
	set @sql = '
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [CreateTime] DESC) AS rownum, tItem.*,[User].[Name] AS [CreateUserName] FROM(
				SELECT * FROM [ScenicQRCode]
				WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
			) tItem
			LEFT JOIN [User]
			ON tItem.[CreateUser]= [User].[Id]
		) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM [ScenicQRCode]
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetSentGroupMessageList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSentGroupMessageList] 
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT
AS
BEGIN

	if(@appId is null)
	begin
		set @appId=''
	end
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	set @sql = '
	
	SELECT * FROM (
				SELECT ROW_NUMBER() OVER(ORDER BY [SubmitTime] DESC) AS rownum, 
				t.*,[MemberGroup].[Name] AS [GroupName] FROM (
				SELECT * FROM [GroupMessage] 
				WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql + '
				) t LEFT JOIN
				[MemberGroup]
				ON t.GroupId = [MemberGroup].[GroupId]  AND t.[Domain] = [MemberGroup].[Domain]
			) AllData
		 WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  
		exec (@sql)
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1) AS TotalCount FROM [GroupMessage] 
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [AppId] = ''' + @appId + '''' + @whereSql
		
	exec (@sql)
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetSerialNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 获取一个唯一的流水号
-- =============================================
CREATE PROCEDURE [dbo].[GetSerialNumber]
	@module varchar(30)
AS
BEGIN

	DECLARE @serialNumber varchar(50)

	INSERT INTO [SerialNumber] ([Module]) VALUES(@module)
	select @serialNumber = SCOPE_IDENTITY()
	
	SELECT @serialNumber AS Result
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetUserList]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserList] 
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@page INT,
	@pageSize INT,
	@name varchar(50),
	@account varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@name IS NOT NULL AND LEN(@name) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Name] LIKE ''%' + @name + '%'''
	  end
	  
	  if(@account IS NOT NULL AND LEN(@account) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Account] LIKE ''%' + @account + '%'''
	  end
	  
	  set @sql = '
	 SELECT * FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY [RegisterTime] DESC) AS rownum,* FROM (
		SELECT tUser.*,[Member].[NickName] AS [MemberNickName] FROM(
			SELECT * FROM [User]
			WHERE [Removed] = 0 AND [Domain] = ''' + CONVERT(char(36),@domainId) + '''' + @whereSql + '
		) tUser
		LEFT JOIN [Member]
		ON tUser.[MemberId] = [Member].[Id]
		
	) AllData
	)as ResultTable WHERE rownum between ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
	   
		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
			
	SELECT COUNT(1) AS TotalCount FROM(
			SELECT * FROM [User]
			WHERE [Removed] = 0 AND [Domain] = ''' + CONVERT(char(36),@domainId) + '''' + @whereSql + '
		) tUser'
		
	exec (@sql)
	
END

GO
/****** Object:  StoredProcedure [dbo].[MemberSignIn]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MemberSignIn]
	-- Add the parameters for the stored procedure here
	@id uniqueidentifier,
	@domainId uniqueidentifier,
	@appId varchar(50)
AS
BEGIN
	--返回值：0.成功 1.已签过到了
	
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN

	DECLARE @lastSignInDate smalldatetime
	
	SELECT @lastSignInDate =convert(varchar(10),[SignInDate],101) FROM [Member] WITH(ROWLOCK) where [Id] = @id
	
	--判断是否今天已经签到过了
	IF(@lastSignInDate >= convert(smalldatetime,convert(varchar(10),getdate(),101)))
	BEGIN
		SELECT 1 AS Result
		COMMIT TRAN
		RETURN
	END
	
	DECLARE @signInPoint int --签到可得活力值
	SELECT @signInPoint = [SignInPoint] FROM [Settings] WHERE [Domain] = @domainId AND [AppId] = @appId
	
	--更新最新签到时间，并增加活力值
	UPDATE [Member] SET [Point] = [Point] + @signInPoint, [SignInDate] = GETDATE() where [Id] = @id
	
	--记录帐户信息
	DECLARE @leftPoint INT
	SELECT @leftPoint = [Point] FROM [Member] WHERE [Id] = @id
	
	INSERT INTO [MemberPointTrack] ([Domain],[Member],[Quantity],[Point],[Type]) 
	VALUES(@domainId,@id, @signInPoint,@leftPoint,3)
	
	SELECT 0 AS Result,@signInPoint AS SignInPoint, @leftPoint AS Point
	
	COMMIT TRAN
	
END


--exec MemberSignIn '6D1C1FBF-9F0C-47AB-AEE6-4281AD5AB7D1'
GO
/****** Object:  StoredProcedure [dbo].[OneDollarBuyingCommodityDraw]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 一元抢购商品抽奖
-- =============================================
CREATE PROCEDURE [dbo].[OneDollarBuyingCommodityDraw]
	
AS
BEGIN
	
	DECLARE @forSaleCommodityId uniqueidentifier
	DECLARE @member uniqueidentifier
	DECLARE @partNumber varchar(30)
	DECLARE @luckyMemberPartNumberCount int

    DECLARE My_Cursor CURSOR --定义游标
	FOR (
	SELECT * FROM(
		SELECT [Id] FROM [OneDollarBuyingCommodityForSale] WHERE [LuckyMember] IS NULL AND [SoldPart] >= [TotalPart] 
	) t
	) --查出需要的集合放到游标中
	OPEN My_Cursor; --打开游标
	FETCH NEXT FROM My_Cursor INTO @forSaleCommodityId; --读取第一行数据
	WHILE @@FETCH_STATUS = 0
		BEGIN
				--抽取幸运人
				SELECT TOP 1 @member=[Member],@partNumber=[PartNumber]
				FROM [OneDollarBuyingCommoditySoldPart]
				WHERE [SaleId] = @forSaleCommodityId
				ORDER BY NEWID()
				
				--幸运人参与人次数
				SELECT @luckyMemberPartNumberCount = COUNT(1) 
				FROM [OneDollarBuyingCommoditySoldPart]
				WHERE [SaleId] = @forSaleCommodityId AND [Member] = @member
				
				--更新ForSale表
				UPDATE [OneDollarBuyingCommodityForSale] 
				SET [LuckyMember] = @member,[LuckyPartNumber] = @partNumber,[LuckyMemberPartNumberCount] = @luckyMemberPartNumberCount,
				[DrawTime] = GETDATE()
				WHERE CURRENT OF My_Cursor; 
			
			FETCH NEXT FROM My_Cursor INTO @forSaleCommodityId; --读取下一行数据
		END
	CLOSE My_Cursor; --关闭游标
	DEALLOCATE My_Cursor; --释放游标
    
END
GO
/****** Object:  StoredProcedure [dbo].[OneDollarBuyingCommodityPutOnSale]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 一元抢购商品上架
-- =============================================
CREATE PROCEDURE [dbo].[OneDollarBuyingCommodityPutOnSale]
	
AS
BEGIN
	
	DECLARE @domain uniqueidentifier
	DECLARE @appId varchar(50)
	DECLARE @commodityId uniqueidentifier
	DECLARE @totalPart int
	DECLARE @infiniteStock bit
	DECLARE @serialNumber varchar(30)
	
	DECLARE My_Cursor CURSOR --定义游标
	FOR (
	SELECT * FROM(
		SELECT [Id],[Domain],[AppId],[Price],[InfiniteStock] FROM [OneDollarBuyingCommodity] WHERE [Remove] = 0 AND [ForSale] = 1 AND ([Stock] > 0 OR [InfiniteStock] = 1)
	) t
	) --查出需要的集合放到游标中
	OPEN My_Cursor; --打开游标
	FETCH NEXT FROM My_Cursor INTO @commodityId,@domain,@appId,@totalPart,@infiniteStock ; --读取第一行数据
	WHILE @@FETCH_STATUS = 0
		BEGIN
			--更新待上架状态
			--UPDATE [OneDollarBuyingCommodity] SET [PeddingForSale] = 0 WHERE CURRENT OF My_Cursor; 
			
			--消减库存
			IF(@infiniteStock = 0)
			BEGIN
				UPDATE [OneDollarBuyingCommodity] SET [Stock] = [Stock] - 1,[Sold] = [Sold] +1 WHERE CURRENT OF My_Cursor; 
			END
			ELSE
			BEGIN
				UPDATE [OneDollarBuyingCommodity] SET [Sold] = [Sold] +1 WHERE CURRENT OF My_Cursor; 
			END
			
			EXECUTE OutputRandomSerialNumber 'OneDollarBuying',@serialNumber OUT
			
			--向 OneDollarBuyingCommodityForSale 表写入记录
			INSERT INTO [OneDollarBuyingCommodityForSale] 
			([Domain],[AppId],[CommodityId],[PeriodNumber],[TotalPart]) 
			VALUES(@domain,@appId,@commodityId,@serialNumber,@totalPart)
			
			FETCH NEXT FROM My_Cursor INTO @commodityId,@domain,@appId,@totalPart,@infiniteStock; --读取下一行数据
		END
	CLOSE My_Cursor; --关闭游标
	DEALLOCATE My_Cursor; --释放游标
    
END
GO
/****** Object:  StoredProcedure [dbo].[OneDollarBuyingDrawCommodity]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OneDollarBuyingDrawCommodity]
	@saleId uniqueidentifier
AS
BEGIN
	
	DECLARE @member uniqueidentifier
	DECLARE @partNumber varchar(30)
	DECLARE @luckyMemberPartNumberCount int
	
	--抽取幸运人
				SELECT TOP 1 @member=[Member],@partNumber=[PartNumber]
				FROM [OneDollarBuyingCommoditySoldPart]
				WHERE [SaleId] = @saleId
				ORDER BY NEWID()
				
				--幸运人参与人次数
				SELECT @luckyMemberPartNumberCount = COUNT(1) 
				FROM [OneDollarBuyingCommoditySoldPart]
				WHERE [SaleId] = @saleId AND [Member] = @member
				
				--更新ForSale表
				UPDATE [OneDollarBuyingCommodityForSale] 
				SET [LuckyMember] = @member,[LuckyPartNumber] = @partNumber,[LuckyMemberPartNumberCount] = @luckyMemberPartNumberCount,
				[DrawTime] = GETDATE()
				WHERE [Id] = @saleId
				
END
GO
/****** Object:  StoredProcedure [dbo].[OneDollarBuyingPutOnSaleCommodity]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 上架指定的商品
-- 已存在在售期数则不上架
-- 0 成功 1商品未上架 2无库存 3 存在在售期数 4商品已被删除
-- =============================================
CREATE PROCEDURE [dbo].[OneDollarBuyingPutOnSaleCommodity]
	@commodityId uniqueidentifier
AS
BEGIN

	DECLARE @forSaleCount int
	SELECT @forSaleCount=COUNT(1) FROM OneDollarBuyingCommodityForSale 
	WHERE [CommodityId] = @commodityId AND [SoldPart] < [TotalPart]
	
	IF(@forSaleCount > 0)
	BEGIN
		SELECT 3 AS Result
		RETURN
	END
	

	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN

	DECLARE @domain uniqueidentifier
	DECLARE @appId varchar(50)
	DECLARE @forSale bit
	DECLARE @stock int
	DECLARE @totalPart int
	DECLARE @infiniteStock bit
	DECLARE @remove bit
	DECLARE @serialNumber varchar(30)
	
	SELECT @domain=[Domain],@appId=[AppId],@forSale=[ForSale],@stock=[Stock], 
	@infiniteStock = [InfiniteStock],@totalPart=[Price],@remove=[Remove]
	FROM [OneDollarBuyingCommodity] WITH(ROWLOCK) WHERE [Id] = @commodityId
	
	IF(@remove = 1)
	BEGIN
		SELECT 4 AS Result
		COMMIT TRAN
		RETURN
	END
	
	IF(@forSale = 0)
	BEGIN
		SELECT 1 AS Result
		COMMIT TRAN
		RETURN
	END
	
	IF(@infiniteStock = 0 AND @stock <= 0)
	BEGIN
		SELECT 2 AS Result
		COMMIT TRAN
		RETURN
	END
	
	--消减库存
			IF(@infiniteStock = 0)
			BEGIN
				UPDATE [OneDollarBuyingCommodity] SET [Stock] = [Stock] - 1,[Sold] = [Sold] +1 WHERE [Id] = @commodityId 
			END
			ELSE
			BEGIN
				UPDATE [OneDollarBuyingCommodity] SET [Sold] = [Sold] +1 WHERE [Id] = @commodityId 
			END
			
			EXECUTE OutputRandomSerialNumber 'OneDollarBuying',@serialNumber OUT
			
			--向 OneDollarBuyingCommodityForSale 表写入记录
			INSERT INTO [OneDollarBuyingCommodityForSale] 
			([Domain],[AppId],[CommodityId],[PeriodNumber],[TotalPart]) 
			VALUES(@domain,@appId,@commodityId,@serialNumber,@totalPart)
	
	SELECT 0 AS Result
	COMMIT TRAN
		
END
GO
/****** Object:  StoredProcedure [dbo].[OrderOneDollarBuyingCommodity]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrderOneDollarBuyingCommodity]
	-- Add the parameters for the stored procedure here
	@saleId uniqueidentifier,
	@memberId uniqueidentifier,
	@quantity int --欲购买数量
AS
BEGIN

	--返回值：0.成功 1.无库存（卖完了或已揭晓） 2.用户余额不足 3.无效商品（不在同一个appid下）
	-- OrderQuantity 实际买入份数

	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN
	
	DECLARE @commodityDomain uniqueidentifier
	DECLARE @commodityAppId varchar(50)
	
	DECLARE @domain uniqueidentifier
	DECLARE @appId varchar(50)
	DECLARE @commodityId uniqueidentifier
	DECLARE @commodityName nvarchar(100)
	DECLARE @periodNumber varchar(20)
	DECLARE @totalPart int
	DECLARE @restPart int
	DECLARE @memberCashAccount int
	DECLARE @orderQuantity int --实际购买数量
	
	SELECT  @commodityDomain=[Domain],@commodityAppId=[AppId], @commodityId = [CommodityId], @periodNumber = [PeriodNumber],@totalPart=[TotalPart],@restPart=[TotalPart]-[SoldPart]
		FROM [OneDollarBuyingCommodityForSale] WITH(ROWLOCK) where [Id] = @saleId
		
	SELECT @domain =[Domain],@appId=[AppId],@memberCashAccount = [CashAccount] 
	FROM [Member] WITH(ROWLOCK) where [Id] = @memberId
    
    IF(@commodityDomain <> @domain OR @commodityAppId <> @appId)
    BEGIN
		SELECT 3 AS Result
		COMMIT TRAN
		RETURN
    END
    
    IF(@restPart <=0)
    BEGIN
		SELECT 1 AS Result
		COMMIT TRAN
		RETURN
    END
    
    SET @memberCashAccount = @memberCashAccount/100 -- 此处直接把小数位舍弃掉了
    
    IF(@memberCashAccount=0)
    BEGIN
		SELECT 2 AS Result
		COMMIT TRAN
		RETURN
    END
    
    SELECT @commodityName =[Name] FROM [OneDollarBuyingCommodity] where [Id] = @commodityId
    
    --计算实际可买数量
    SET @orderQuantity = @quantity
    
    IF(@orderQuantity > @restPart)
    BEGIN
		SET @orderQuantity = @restPart
    END
    
    IF(@orderQuantity>@memberCashAccount)
    BEGIN
		SET @orderQuantity = @memberCashAccount
    END
    
    --扣减账户余额
    UPDATE [Member] SET [CashAccount] = [CashAccount] - @orderQuantity*100 WHERE [Id] = @memberId
    
    --记录账户变化
	DECLARE @leftCashAccount INT
	SELECT @leftCashAccount = [CashAccount] FROM [Member] WHERE [Id] = @memberId
	
	INSERT INTO [CashAccountTrack] ([Domain],[AppId],[Member],[Fee],[Balances],[Type],[TagName],[TagId]) 
	VALUES(@domain,@appId,@memberId,0 - @orderQuantity*100,@leftCashAccount,5,@commodityName,@saleId)
    
    --生成幸运号码
    DECLARE @partNumber INT
    SELECT TOP 1 @partNumber = [PartNumber] FROM [OneDollarBuyingCommoditySoldPart]
	WHERE [SaleId] = @saleId ORDER BY [PartNumber] DESC
	
	IF(@partNumber IS NULL)
	BEGIN
		SET @partNumber = 0
	END
		
    DECLARE @i INT   
	SET @i=1
	WHILE @i<=@orderQuantity 
	BEGIN   
		SET @partNumber = @partNumber + 1
		
		--PRINT @commodityId
		INSERT INTO [OneDollarBuyingCommoditySoldPart] 
		([Domain],[AppId],[CommodityId],[SaleId],[Member],[PartNumber])
		VALUES (@domain,@appId,@commodityId,@saleId,@memberId,@partNumber)
		
		SET @i=@i+1
	END
	
	--更新在架商品售出份数
	UPDATE [OneDollarBuyingCommodityForSale] SET [SoldPart] = [SoldPart] + @orderQuantity WHERE [Id] = @saleId
    
    COMMIT TRAN
    
    --第一返回结果必须放在其它select之前
    --因为上架和抽奖也会返回数据集,C#以第一个table为order操作的结果
    SELECT 0 AS Result,@orderQuantity AS OrderQuantity
    
    SET @restPart = @restPart - @orderQuantity
    
  --  PRINT '@restPart:' + CONVERT(VARCHAR(10),@restPart)
  --  PRINT '@orderQuantity:' +  CONVERT(VARCHAR(10),@orderQuantity)
  --  PRINT '@totalPart:' +  CONVERT(VARCHAR(10),@totalPart)
    
    --如果商品份数售罄，则更新在架商品的待上架状态
    IF(@restPart<=0)
    BEGIN
		UPDATE [OneDollarBuyingCommodityForSale] SET [SoldOutTime] = GETDATE() WHERE [Id] = @saleId
		--UPDATE [OneDollarBuyingCommodity] SET [PeddingForSale] = 1 WHERE [Id] = @commodityId
		
		--直接上架新一期，不使用PeddingForSale
		EXECUTE OneDollarBuyingPutOnSaleCommodity @commodityId
		
		--直接对本期进行抽奖
		EXECUTE OneDollarBuyingDrawCommodity @saleId
		
    END
    
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[OutputCouponSerialNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OutputCouponSerialNumber]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(30),
	@result varchar(30) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @dateNumber  char(6)
	DECLARE @serialNumber varchar(30)
	DECLARE @randNumber char(3)

	SELECT @dateNumber = SUBSTRING(convert(char(12),getdate(),112),3,6)
	SELECT @randNumber = cast(rand()*(999-100)+100 as int) 

	INSERT INTO [CouponSerialNumber] ([Domain],[AppId]) VALUES(@domainId,@appId)
	select @serialNumber = SCOPE_IDENTITY()

	SET @result = SUBSTRING(@dateNumber,1,1) + SUBSTRING(@serialNumber,1,1)
	+  SUBSTRING(@dateNumber,2,1) + SUBSTRING(@serialNumber,2,1)
	+  SUBSTRING(@dateNumber,3,1) + SUBSTRING(@serialNumber,3,1)
	+  SUBSTRING(@dateNumber,4,1) + SUBSTRING(@serialNumber,4,LEN(@serialNumber) - 3)
	+ SUBSTRING(@dateNumber,5,1) + SUBSTRING(@randNumber,1,1)
	+ SUBSTRING(@dateNumber,6,1) + SUBSTRING(@randNumber,2,2)
	
END
GO
/****** Object:  StoredProcedure [dbo].[OutputRandomSerialNumber]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OutputRandomSerialNumber]
	@module varchar(50),
	@result varchar(30) OUTPUT
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	DECLARE @dateNumber  char(6)
	DECLARE @serialNumber varchar(50)
	DECLARE @randNumber char(3)

	SELECT @dateNumber = SUBSTRING(convert(char(12),getdate(),112),3,6)
	SELECT @randNumber = cast(rand()*(999-100)+100 as int) 

	INSERT INTO SerialNumber ([Module]) VALUES(@module)
	select @serialNumber = SCOPE_IDENTITY()

	SET @result = SUBSTRING(@dateNumber,1,1) + SUBSTRING(@serialNumber,1,1)
	+  SUBSTRING(@dateNumber,2,1) + SUBSTRING(@serialNumber,2,1)
	+  SUBSTRING(@dateNumber,3,1) + SUBSTRING(@serialNumber,3,1)
	+  SUBSTRING(@dateNumber,4,1) + SUBSTRING(@serialNumber,4,LEN(@serialNumber) - 3)
	+ SUBSTRING(@dateNumber,5,1) + SUBSTRING(@randNumber,1,1)
	+ SUBSTRING(@dateNumber,6,1) + SUBSTRING(@randNumber,2,2)

	
	
END
GO
/****** Object:  StoredProcedure [dbo].[PointCommodityCheckoutOrder]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 0 支付成功 1 积分不足 2 账户余额不足 4 订单状态不是待支付 5 订单已经过期 6 订单不存在
-- =============================================
CREATE PROCEDURE [dbo].[PointCommodityCheckoutOrder] 
	-- Add the parameters for the stored procedure here
	@orderId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--出错时回滚
	SET XACT_ABORT ON
	BEGIN TRAN

	DECLARE @orderPrice INT
	DECLARE @orderPoint INT
	DECLARE @orderExpireTime DATETIME
	DECLARE @orderStatus TINYINT
	DECLARE @orderNumber VARCHAR(30)
	DECLARE @memberId UNIQUEIDENTIFIER
	DECLARE @domainId UNIQUEIDENTIFIER
	DECLARE @appId VARCHAR(50)

	SELECT @orderPrice = [Price],@orderPoint = [Point],@orderExpireTime=[ExpireTime],@orderStatus=[Status],
	@orderNumber=[OrderNumber], @memberId = [Member],@domainId = [Domain],@appId=[AppId]
	FROM [PointCommodityOrder] WITH(ROWLOCK) WHERE [Id] = @orderId

    -- 判断订单是否存在
	IF(@memberId IS NULL)
	BEGIN
		SELECT 6 AS Result
		COMMIT TRAN
		RETURN
	END

	--判断订单状态
	IF(@orderStatus <> 4)
	BEGIN
		SELECT 4 AS Result
		COMMIT TRAN
		RETURN
	END

	--判断订单是否已过期
	IF(@orderExpireTime <= GETDATE())
	BEGIN
		SELECT 5 AS Result
		COMMIT TRAN
		RETURN
	END

	--获取用户积分、账户信息
	DECLARE @memberPoint INT
	DECLARE @memberCash INT

	SELECT @memberPoint = [Point],@memberCash = [CashAccount]
	FROM [Member] WITH(ROWLOCK) WHERE [Id] = @memberId

	--判断积分是否足够
	IF(@memberPoint < @orderPoint)
	BEGIN
		SELECT 1 AS Result
		COMMIT TRAN
		RETURN
	END

	--判断账户余额是否足够
	IF(@memberCash < @orderPrice)
	BEGIN
		SELECT 2 AS Result
		COMMIT TRAN
		RETURN
	END

	--消减用户积分
	IF(@orderPoint>0)
	BEGIN
		DECLARE @leftPoint INT
		SET @leftPoint = @memberPoint - @orderPoint
		UPDATE [Member] SET [Point] = @leftPoint WHERE [Id] = @memberId
			
		--记录用户消费记录
		INSERT INTO [MemberPointTrack] ([Domain],[Member],[Quantity],[Point],[Type],[TagName],[TagId]) 
		VALUES(@domainId,@memberId,0 - @orderPoint,@leftPoint,1,@orderNumber,@orderId)
	END

	--记录现金账户变化
	IF(@orderPrice >0)
	BEGIN
		DECLARE @leftCash INT
		SET @leftCash = @memberCash - @orderPrice
		UPDATE [Member] SET [CashAccount] = @leftCash WHERE [Id] = @memberId

		--向CashAccountTrack表写入记录
		INSERT INTO [CashAccountTrack] 
		([Domain],[AppId],[Member],[Fee],[Balances],[Type])
		VALUES (@domainId,@appId,@memberId,0 - @orderPrice,@leftCash,6)
    
	END

	--成单
	UPDATE [PointCommodityOrder] SET [Status] = 1 WHERE [Id] = @orderId

	SELECT 0 AS Result
	COMMIT TRAN

END
GO
/****** Object:  StoredProcedure [dbo].[PointCommodityCreateOrder]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 0 成功下单 1 积分不足 2 库存不足 3 已下架商品 
-- =============================================
CREATE PROCEDURE [dbo].[PointCommodityCreateOrder] 
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@memberId uniqueidentifier,
	@itemList xml
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @xmldata_id int 

	--出错时回滚
	SET XACT_ABORT ON
	BEGIN TRAN

	EXEC sp_xml_preparedocument @xmldata_id OUTPUT, @itemList, ''

	--不可以在此JOIN来判断库存是否足够
	--因为在不锁行的情况下，到下面下单的时候可能就超卖了

	--得到总共需要花费的积分和现金金额
	DECLARE @totalPoint int 
	DECLARE @totalPrice int 
	SELECT @totalPoint = SUM([TotalPoint]),@totalPrice = SUM([TotalPrice]) FROM(
	SELECT t1.[Quantity] * [PointCommodity].[Point] AS [TotalPoint],
	t1.[Quantity] * [PointCommodity].[Price] AS [TotalPrice]
	 FROM OPENXML(@xmldata_id, '//PointCommodity',2) WITH (Id uniqueidentifier, [Quantity] int) t1
	JOIN [PointCommodity] 
	ON t1.[Id] = [PointCommodity].[Id]
	) tTotalPoint


	--得到用户当前积分
	DECLARE @memberPoint int
	SELECT @memberPoint = [Point] FROM [Member] WITH(ROWLOCK) where [Id] = @memberId

	IF(@totalPoint > @memberPoint)
	BEGIN
		SELECT 1 AS Result
		COMMIT TRAN
		RETURN
	END


	DECLARE @pointCommodityId uniqueidentifier
	DECLARE @quantity int 

	DECLARE @pointCommodityName varchar(100)
	DECLARE @imageUrl varchar(300)
	DECLARE @forSale bit
	DECLARE @removed bit
	DECLARE @stock int
	DECLARE @point int
	DECLARE @price int

	DECLARE @orderId uniqueidentifier
	SET @orderId = NEWID()
		
	DECLARE My_Cursor CURSOR --定义游标
		FOR (
			SELECT * FROM(
				SELECT * FROM OPENXML(@xmldata_id, '//PointCommodity',2) WITH (Id uniqueidentifier, [Quantity] int) 
				
			) t
		) --查出需要的集合放到游标中
		
	OPEN My_Cursor; --打开游标
	FETCH NEXT FROM My_Cursor INTO @pointCommodityId,@quantity; --读取第一行数据
	WHILE @@FETCH_STATUS = 0
		BEGIN
			--PRINT(@pointCommodityId)
		
			SELECT  @pointCommodityName=[Name],@imageUrl=[ImageUrl], @forSale=[ForSale],@removed=[Remove], @point = [Point],@price=[Price], @stock = [Stock] 
			FROM [PointCommodity] WITH(ROWLOCK) where [Id] = @pointCommodityId
			
			--判断是否上架
			IF(@forSale = 0 OR @removed = 1)
			BEGIN
				ROLLBACK TRAN
				SELECT 3 AS Result
				RETURN
			END
			
			--判断是否有足够库存
			IF(@stock < @quantity)
			BEGIN
				ROLLBACK TRAN
				SELECT 2 AS Result
				RETURN
			END
			
			--库存减，已售加
			UPDATE [PointCommodity] SET [Stock] = [Stock]-@quantity,[Sold] = [Sold] +@quantity WHERE [Id] = @pointCommodityId
			
			--创建订单明细
			INSERT INTO [PointCommodityOrderItem] 
			([Domain],[AppId],[Order],[PointCommodity],[Name],[Point],[Price],[ImageUrl],[Quantity])
			VALUES(@domainId,@appId,@orderId,@pointCommodityId,@pointCommodityName,@point,@price,@imageUrl,@quantity)
			
			--移除购物车中对应的项目
			DELETE [PointCommodityShoppingCart] WHERE [Domain] = @domainId AND [AppId] = @appId AND [Member] = @memberId AND [PointCommodity] = @pointCommodityId
			
			FETCH NEXT FROM My_Cursor INTO @pointCommodityId,@quantity; --读取下一行数据
		END
	CLOSE My_Cursor; --关闭游标
	DEALLOCATE My_Cursor; --释放游标

	--生成订单号
	DECLARE @orderNumber varchar(30)
	DECLARE @dateNumber  char(6)
	DECLARE @serialNumber varchar(50)
	DECLARE @randNumber char(3)
	SELECT @dateNumber = SUBSTRING(convert(char(12),getdate(),112),3,6)
	SELECT @randNumber = cast(rand()*(999-100)+100 as int) 

	INSERT INTO [SerialNumber] ([Module]) VALUES('PointCommodity')
	select @serialNumber = SCOPE_IDENTITY()
		
	SET @orderNumber = SUBSTRING(@dateNumber,1,1) + SUBSTRING(@serialNumber,1,1)
		+  SUBSTRING(@dateNumber,2,1) + SUBSTRING(@serialNumber,2,1)
		+  SUBSTRING(@dateNumber,3,1) + SUBSTRING(@serialNumber,3,1)
		+  SUBSTRING(@dateNumber,4,1) + SUBSTRING(@serialNumber,4,LEN(@serialNumber) - 3)
		+ SUBSTRING(@dateNumber,5,1) + SUBSTRING(@randNumber,1,1)
		+ SUBSTRING(@dateNumber,6,1) + SUBSTRING(@randNumber,2,2)
	--PRINT(@orderNumber)
	
	--状态 1 待领取 2 已领取 3 已取消 4 待付款
	--如果不需要支付现金，则直接扣减积分
	--如果需要支付现金，则在完成支付后一起扣㓕
	DECLARE @orderStatus tinyint
	IF(@totalPrice = 0)
	BEGIN
		SET @orderStatus = 1
		
		--消减用户活力值
		UPDATE [Member] SET [Point] = [Point] - @totalPoint WHERE [Id] = @memberId
			
		--记录用户消费记录
		DECLARE @leftPoint INT
		SELECT @leftPoint = [Point] FROM [Member] WHERE [Id] = @memberId
			
		INSERT INTO [MemberPointTrack] ([Domain],[Member],[Quantity],[Point],[Type],[TagName],[TagId]) 
		VALUES(@domainId,@memberId,0 - @totalPoint,@leftPoint,1,@orderNumber,@orderId)
	END
	ELSE
	BEGIN
		SET @orderStatus = 4
	END

	--生成订单
	DECLARE @expireTime datetime
	SET @expireTime = dateadd(hh,1,GETDATE()) 
	INSERT INTO [PointCommodityOrder] ([Id],[Domain],[AppId],[OrderNumber],[Member],[Point],[Price],[ExpireTime],[Status])
		VALUES (@orderId,@domainId,@appId,@orderNumber,@memberId,@totalPoint,@totalPrice,@expireTime, @orderStatus)


	--返回结果
	SELECT 0 AS Result,@orderNumber AS OrderNumber, @orderId as OrderId
		
	COMMIT TRAN
		
	EXEC sp_xml_removedocument @xmldata_id 
	
END
GO
/****** Object:  StoredProcedure [dbo].[ReleaseOverduePointCommodityOrder]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReleaseOverduePointCommodityOrder] 
	-- Add the parameters for the stored procedure here
	@orderId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @domainId UNIQUEIDENTIFIER
	DECLARE @appId VARCHAR(50)
	
	SELECT @domainId = [Domain],@appId = [AppId] FROM [PointCommodityOrder] 
	WHERE [Id] = @orderId
	
	DECLARE @pointCommodityId UNIQUEIDENTIFIER
	DECLARE @quantity INT

    DECLARE My_Cursor CURSOR --定义游标
    FOR (
	SELECT * FROM(
		SELECT [PointCommodity],[Quantity] FROM [PointCommodityOrderItem] WHERE [Order] = @orderId 
	) t
	) --查出需要的集合放到游标中
	OPEN My_Cursor; --打开游标
	FETCH NEXT FROM My_Cursor INTO @pointCommodityId,@quantity; --读取第一行数据
	
	WHILE @@FETCH_STATUS = 0
		BEGIN
			
			UPDATE [PointCommodity] SET [Stock] = [Stock] + @quantity 
			WHERE [Id] = @pointCommodityId
			
			FETCH NEXT FROM My_Cursor INTO @pointCommodityId,@quantity; --读取下一行数据
		END
	CLOSE My_Cursor; --关闭游标
	DEALLOCATE My_Cursor; --释放游标
	
	UPDATE [PointCommodityOrder] SET [Status] = 3 WHERE [Id] = @orderId
	
	INSERT INTO [PointCommodityOrderLog] ([Domain],[AppId],[Order],[Message])
	VALUES (@domainId,@appId,@orderId,'过期释放。')
	
END
GO
/****** Object:  StoredProcedure [dbo].[RemovePointCommodityFromCart]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemovePointCommodityFromCart]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@memberId uniqueidentifier,
	@pointCommodity uniqueidentifier,
	@quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN

	--返回值：0.成功  1 购物车没有指定的商品
	
	--当前库存数量
	DECLARE @currentQuantity int
	DECLARE @cartItemId uniqueidentifier
	
	SELECT @cartItemId=[Id],@currentQuantity=[Quantity]
		FROM [PointCommodityShoppingCart] WITH(ROWLOCK) 
		WHERE [Domain] = @domainId AND [AppId]=@appId
		AND [Member]=@memberId AND [PointCommodity] = @pointCommodity
	
	IF(@currentQuantity IS NULL)
	BEGIN
		COMMIT TRAN
		SELECT 1 AS Result
		RETURN 
	END
	
		
	SET @quantity = @currentQuantity - @quantity
	
	IF(@quantity>0)
	BEGIN
		UPDATE [PointCommodityShoppingCart] SET [Quantity] = @quantity WHERE [Id] = @cartItemId
	END
	ELSE
	BEGIN
		DELETE FROM [PointCommodityShoppingCart] WHERE [Id] = @cartItemId
	END
	
	COMMIT TRAN
	
	SELECT 0 AS Result
	
	SELECT @quantity AS Quantity
	
END
GO
/****** Object:  StoredProcedure [dbo].[SetPointCommodityCartItemQuantity]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetPointCommodityCartItemQuantity]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@memberId uniqueidentifier,
	@pointCommodity uniqueidentifier,
	@quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN
	
	--返回值：0.成功  1 购物车没有指定的商品
	
	DECLARE @cartItemId uniqueidentifier
	
	SELECT @cartItemId=[Id]
		FROM [PointCommodityShoppingCart] WITH(ROWLOCK) 
		WHERE [Domain] = @domainId AND [AppId]=@appId
		AND [Member]=@memberId AND [PointCommodity] = @pointCommodity
	
	IF(@cartItemId IS NULL)
	BEGIN
		COMMIT TRAN
		SELECT 1 AS Result
		RETURN 
	END
	
	IF(@quantity>0)
	BEGIN
		UPDATE [PointCommodityShoppingCart] SET [Quantity] = @quantity WHERE [Id] = @cartItemId
	END
	ELSE
	BEGIN
		DELETE FROM [PointCommodityShoppingCart] WHERE [Id] = @cartItemId
	END
	
	COMMIT TRAN
	
	SELECT 0 AS Result
	
END
GO
/****** Object:  StoredProcedure [dbo].[StartCampaign]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StartCampaign]
	-- Add the parameters for the stored procedure here
	@id uniqueidentifier

AS
BEGIN
	--返回值：0.成功 1.已经开始过了 2.已经结束了
	
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN
	
	DECLARE @status tinyint
	
	SELECT @status =[Status] FROM [Campaign] WITH(ROWLOCK) where [Id] = @id
	
	IF(@status = 1)  --进行中
	BEGIN
		SELECT 1 AS Result --已经开始过了
		COMMIT TRAN
		RETURN
	END
	
	IF(@status = 2)  --已经结束
	BEGIN
		SELECT 2 AS Result --已经结束了
		COMMIT TRAN
		RETURN
	END
	
	--判断帐户类型，如果是免费的同时进行的活动数量不允许超过3个
	--DECLARE @domainId uniqueidentifier
	--DECLARE @appId varchar(50)
	--SELECT @domainId =[Domain],@appId=[AppId] FROM [Campaign] where [Id] = @id
	
	--DECLARE @type tinyint
	--SELECT @type =[Type] FROM [Domain] where [Id] = @domainId
	
	--IF(@type = 0)  --免费帐户 
	--BEGIN
	--	DECLARE @ongoingCount int
	--	SELECT @ongoingCount = Count(1) FROM [Campaign] where [Status] = 1 AND [Domain] = @domainId AND [AppId] = @appId
	
	--	IF(@ongoingCount >= 3) 
	--	BEGIN
	--		SELECT 3 AS Result --达到免费帐户限制数量
	--		COMMIT TRAN
	--		RETURN
	--	END
	--END
	
	
	UPDATE [Campaign] SET [Status] = 1,[StartTime] = GETDATE(),[EndTime] = NULL WHERE [Id] = @id
	
	SELECT 0 AS Result
	
	COMMIT TRAN
	
END

GO
/****** Object:  StoredProcedure [dbo].[TrackMemberCash]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 返回：0 成功 1 剩余金额不足（当fee为负时） 2 指定的用户不存在 3,4用户所属公众号非指定公众号
-- =============================================
CREATE PROCEDURE [dbo].[TrackMemberCash]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@appId varchar(50),
	@memberId uniqueidentifier,
	@fee int,
	@remark nvarchar(500),
	@type tinyint,
	@operatorUser uniqueidentifier,
	@ip	varchar(50)
	
AS
BEGIN
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN

	--首先要锁定Member表中的行
	DECLARE @leftCash INT
	DECLARE @memberDomainId uniqueidentifier
	DECLARE @memberAppId varchar(50)
	
	SELECT  @leftCash=[CashAccount],@memberDomainId = [Domain] ,@memberAppId=[AppId]
		FROM [Member] WITH(ROWLOCK) where [Id] = @memberId
    
    IF @leftCash IS NULL
    BEGIN
		SELECT 2 AS [Result],@leftCash AS [CashAccount]
		COMMIT TRAN
		RETURN
	END
	
	IF @memberDomainId <> @domainId
    BEGIN
		SELECT 3 AS [Result],@leftCash AS [CashAccount]
		COMMIT TRAN
		RETURN
	END
	
	IF @memberAppId <> @appId
    BEGIN
		SELECT 4 AS [Result],@leftCash AS [CashAccount]
		COMMIT TRAN
		RETURN
	END
    
    --计算活力值变化后的新余额
    SET @leftCash = @leftCash + @fee;
    
    IF @leftCash < 0
    BEGIN
		SELECT 1 AS [Result],@leftCash AS [CashAccount]
		COMMIT TRAN
		RETURN
	END
    
    --向CashAccountTrack表写入记录
    INSERT INTO [CashAccountTrack] 
    ([Domain],[AppId],[Member],[Fee],[Balances],[Type],[OperatorUser],[IP],[Remark])
    VALUES (@domainId,@appId,@memberId,@fee,@leftCash,@type,@operatorUser,@ip,@remark)
    
    --更新Member表中的余额
    UPDATE [Member] SET [CashAccount] = @leftCash where [Id] = @memberId
    
    SELECT 0 AS [Result],@leftCash AS [CashAccount]
	
	COMMIT TRAN
    
END


--exec TrackMemberCash '2a58d820-de07-4c8f-80b9-b5cb5a1028b4','wx8c36b3c0000a0a49',''
GO
/****** Object:  StoredProcedure [dbo].[TrackMemberPoint]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TrackMemberPoint]
	@domain uniqueidentifier,
	@memberId uniqueidentifier,
	@quantity int,
	@type tinyint,
	@tagName varchar(100),
	@tagId uniqueidentifier,
	@operatorUser uniqueidentifier,
	@remark varchar(500)
AS
BEGIN
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN

	--首先要锁定Member表中的行
	DECLARE @leftPoint INT
	SELECT  @leftPoint=[Point]
		FROM [Member] WITH(ROWLOCK) where [Id] = @memberId
    
    --计算活力值变化后的新活力值
    SET @leftPoint = @leftPoint + @quantity;
    
    IF @leftPoint < 0
    BEGIN
		SET @leftPoint = 0
	END
    
    --向MemberPointTrack表写入记录
    INSERT INTO [MemberPointTrack] 
    ([Domain],[Member],[Quantity],[Point],[Type],[TagName],[TagId],[OperatorUser],[Remark])
    VALUES (@domain,@memberId,@quantity,@leftPoint,@type,@tagName,@tagId,@operatorUser,@remark)
    
    --更新Member表中的活力值
    UPDATE [Member] SET [Point] = @leftPoint where [Id] = @memberId
    
    SELECT 0 AS [Result],@leftPoint AS [Point]
	
	COMMIT TRAN
END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePayNotifyStatus]    Script Date: 2017/9/22 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 更新订单中的支付通知接收状态，用行锁定防止并发
-- 0 更新通知状态成功 1 之前已经处理过了
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePayNotifyStatus] 
	-- Add the parameters for the stored procedure here
	@id uniqueidentifier
AS
BEGIN
	--出错时回滚
	SET XACT_ABORT ON
	
	BEGIN TRAN

	--首先要锁定PayOrder表中的行
	DECLARE @notify bit
	SELECT  @notify=[Notify]
		FROM [PayOrder] WITH(ROWLOCK) WHERE [Id] = @id
		
	IF @notify = 0
    BEGIN
		UPDATE [PayOrder] SET [Notify] = 1 WHERE [Id] = @id
		SELECT 0 AS [Result]
	END
	ELSE
	BEGIN
		SELECT 1 AS [Result]
	END
	
	COMMIT TRAN
   
END

GO
USE [master]
GO
ALTER DATABASE [WxConstruction] SET  READ_WRITE 
GO
