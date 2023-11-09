USE [master]
GO
/****** Object:  Database [Astronomy]    Script Date: 3/10/2023 2:36:24 AM ******/
CREATE DATABASE [Astronomy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Astronomy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Astronomy.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Astronomy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Astronomy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Astronomy] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Astronomy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Astronomy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Astronomy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Astronomy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Astronomy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Astronomy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Astronomy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Astronomy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Astronomy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Astronomy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Astronomy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Astronomy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Astronomy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Astronomy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Astronomy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Astronomy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Astronomy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Astronomy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Astronomy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Astronomy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Astronomy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Astronomy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Astronomy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Astronomy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Astronomy] SET  MULTI_USER 
GO
ALTER DATABASE [Astronomy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Astronomy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Astronomy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Astronomy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Astronomy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Astronomy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Astronomy] SET QUERY_STORE = ON
GO
ALTER DATABASE [Astronomy] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Astronomy]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comets]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comets](
	[CometID] [int] IDENTITY(1,1) NOT NULL,
	[CometName] [nvarchar](250) NULL,
	[EarthMOID] [nvarchar](50) NULL,
	[Dimensions] [nvarchar](250) NULL,
	[Meandiameter] [nvarchar](250) NULL,
	[Mass] [nvarchar](250) NULL,
	[Aphelion] [nvarchar](250) NULL,
	[Perihelion] [nvarchar](250) NULL,
	[DiscoveredBy] [nvarchar](250) NULL,
	[DiscoveredDate] [nvarchar](250) NULL,
	[EmployeeID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Comets] PRIMARY KEY CLUSTERED 
(
	[CometID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Constellations]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Constellations](
	[ConstellationID] [int] IDENTITY(1,1) NOT NULL,
	[ConstellationName] [nvarchar](250) NULL,
	[Abbreviation] [nvarchar](250) NULL,
	[Genitive] [nvarchar](250) NULL,
	[Symbolism] [nvarchar](250) NULL,
	[Declination] [nvarchar](250) NULL,
	[Area] [nvarchar](250) NULL,
	[MainStar] [nvarchar](250) NULL,
	[Meteor] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[EmployeeID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Constellations] PRIMARY KEY CLUSTERED 
(
	[ConstellationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nchar](20) NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackToComet]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackToComet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[bit] [bit] NULL,
	[CometID] [int] NULL,
 CONSTRAINT [PK_FeedbackToComet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbacktoConstellations]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbacktoConstellations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[ConstellationID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedbacktoConstellations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackToNews]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackToNews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[NewsID] [int] NOT NULL,
 CONSTRAINT [PK_FeedbackToNews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbacktoObservatory]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbacktoObservatory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[ObservatoryID] [int] NULL,
	[Date] [datetime] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedbacktoObservatory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackToPhenomena]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackToPhenomena](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[PhenomenaID] [int] NULL,
 CONSTRAINT [PK_FeedbackToPhenomena] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbacktoPlanets]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbacktoPlanets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[PlanetID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageOfComet]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageOfComet](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[CometID] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ImageOfComet] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageOfConstellation]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageOfConstellation](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ConstellationID] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ImageOfConstellation] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageOfNews]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageOfNews](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_ImageOfNews] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageOfObservatory]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageOfObservatory](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ObservatoryID] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ImageOfObservatory] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageOfPhenomena]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageOfPhenomena](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[PhenomenaID] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ImageOfPhenomena] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageOfPlanet]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageOfPlanet](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[PlanetID] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ImageOfPlanet] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[EmployeeID] [int] NULL,
	[Status] [bit] NULL,
	[PostDate] [datetime] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Observatories]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Observatories](
	[ObservatoryID] [int] IDENTITY(1,1) NOT NULL,
	[ObservatoryName] [nvarchar](250) NOT NULL,
	[Elevation] [nvarchar](50) NULL,
	[ObservatorySite] [nvarchar](250) NULL,
	[Location] [nvarchar](250) NULL,
	[coordinates] [nvarchar](250) NULL,
	[Established] [int] NULL,
	[TypeOfObservatory] [nvarchar](250) NULL,
	[MajorInstruments] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Observatories] PRIMARY KEY CLUSTERED 
(
	[ObservatoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phenomenas]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phenomenas](
	[PhenomenaID] [int] IDENTITY(1,1) NOT NULL,
	[PhenomenaName] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[status] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[PostDate] [datetime] NOT NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_Phenomenas] PRIMARY KEY CLUSTERED 
(
	[PhenomenaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planets]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planets](
	[PlanetID] [int] IDENTITY(1,1) NOT NULL,
	[PlanetName] [nvarchar](250) NULL,
	[RecordedBy] [nvarchar](250) NULL,
	[FirstRecord] [nvarchar](250) NULL,
	[SurfaceTemperature] [nvarchar](250) NULL,
	[OrbitPeriod] [nvarchar](250) NULL,
	[OrbitDistance] [nvarchar](250) NULL,
	[Rings] [nvarchar](50) NULL,
	[NotableMoons] [nvarchar](250) NULL,
	[KnownMoons] [nvarchar](250) NULL,
	[EquatorialCircumference] [nvarchar](250) NULL,
	[PolarDiameter] [nvarchar](250) NULL,
	[EquatorialDiameter] [nvarchar](250) NULL,
	[Mass] [nvarchar](250) NULL,
	[atmosphere] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_Planets] PRIMARY KEY CLUSTERED 
(
	[PlanetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/10/2023 2:36:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Planets', N'About Planets')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Observatories', N'about Observatories')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Phenomenas', N'about Phenomenas')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'News', N'about News astronomy')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Constellations', N'about Constellations')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Comets', N'about Comets')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comets] ON 

INSERT [dbo].[Comets] ([CometID], [CometName], [EarthMOID], [Dimensions], [Meandiameter], [Mass], [Aphelion], [Perihelion], [DiscoveredBy], [DiscoveredDate], [EmployeeID], [Description], [Status]) VALUES (1, N'Halley''s Comet', N'0.075 au (11.2 million km)', N'15 km × 8 km', N'	11 km', N'2.2×10^14 kg', N'35.14 au (aphelion: 9 December 2023)', N'0.59278 au (last perihelion: 9 February 1986)
(next perihelion: 28 July 2061)', N'Prehistoric (observation) and ', N'Edmond Halley (recognition of periodicity)', 4, N'Halley''s Comet, Comet Halley, or sometimes simply Halley, officially designated 1P/Halley, is a short-period comet visible from Earth every 75–79 years.[5] Halley is the only known short-period comet that is regularly visible to the naked eye from Earth, and thus the only naked-eye comet that can appear twice in a human lifetime.[13] It last appeared in the inner parts of the Solar System in 1986 and will next appear in mid-2061.

Halley''s periodic returns to the inner Solar System have been observed and recorded by astronomers around the world since at least 240 BC. But it was not until 1705 that the English astronomer Edmond Halley understood that these appearances were re-appearances of the same comet. As a result of this discovery, the comet is named after Edmond Halley.[14]

During its 1986 visit to the inner Solar System, Halley''s Comet became the first comet to be observed in detail by spacecraft, providing the first observational data on the structure of a comet nucleus and the mechanism of coma and tail formation.[15][16] These observations supported a number of longstanding hypotheses about comet construction, particularly Fred Whipple''s "dirty snowball" model, which correctly predicted that Halley would be composed of a mixture of volatile ices—such as water, carbon dioxide, ammonia, and dust. The missions also provided data that substantially reformed and reconfigured these ideas; for instance, it is now understood that the surface of Halley is largely composed of dusty, non-volatile materials, and that only a small portion of it is icy.', 0)
INSERT [dbo].[Comets] ([CometID], [CometName], [EarthMOID], [Dimensions], [Meandiameter], [Mass], [Aphelion], [Perihelion], [DiscoveredBy], [DiscoveredDate], [EmployeeID], [Description], [Status]) VALUES (2, N'Comet Hyakutake', NULL, N'	4.2 km (2.6 mi)', NULL, NULL, N'	~1320 AU (inbound), ~3500 AU', N'0.2301987 AU', N'	Yuji Hyakutake', N'	31 January 1996', 5, N'Comet Hyakutake (formally designated C/1996 B2 (Hyakutake)) is a comet discovered on 31 January 1996.[1] It was dubbed the Great Comet of 1996; its passage to within 0.1 AU (15 Gm) of the Earth on 25 March was one of the closest cometary approaches of the previous 200 years. Reaching an apparent visual magnitude of zero and spanning nearly 80°, Hyakutake appeared very bright in the night sky and was widely seen around the world. The comet temporarily upstaged the much anticipated Comet Hale–Bopp, which was approaching the inner Solar System at the time.

Hyakutake is a long-period comet that passed perihelion on 1 May 1996. Before its most recent passage through the Solar System, its orbital period was about 17,000 years,[2][5] but the gravitational perturbation of the giant planets has increased this period to 70,000 years.[2][5] This is the first comet to have an X-ray emission detected, which is most likely the result of ionised solar wind particles interacting with neutral atoms in the coma of the comet. The Ulysses spacecraft fortuitously crossed the comet''s tail at a distance of more than 500 million km (3.3 AU; 310 million mi) from the nucleus, showing that Hyakutake had the longest tail known for a comet.', 1)
INSERT [dbo].[Comets] ([CometID], [CometName], [EarthMOID], [Dimensions], [Meandiameter], [Mass], [Aphelion], [Perihelion], [DiscoveredBy], [DiscoveredDate], [EmployeeID], [Description], [Status]) VALUES (3, N'Comet Hale–Bopp', NULL, NULL, NULL, NULL, N'	354 au', N'	0.914 au', N'	
Alan Hale and Thomas Bopp', N'	July 23, 1995', 4, N'Comet Hale–Bopp (formally designated C/1995 O1) is a comet that was one of the most widely observed of the 20th century and one of the brightest seen for many decades.

Alan Hale and Thomas Bopp discovered Comet Hale–Bopp separately on July 23, 1995, before it became visible to the naked eye. It is difficult to predict the maximum brightness of new comets with any degree of certainty, but Hale–Bopp exceeded most predictions when it passed perihelion on April 1, 1997, reaching about magnitude −1.8. It was visible to the naked eye for a record 18 months, due to its massive nucleus size. This is twice as long as the Great Comet of 1811, the previous record holder. Accordingly, Hale–Bopp was dubbed the great comet of 1997.', 0)
INSERT [dbo].[Comets] ([CometID], [CometName], [EarthMOID], [Dimensions], [Meandiameter], [Mass], [Aphelion], [Perihelion], [DiscoveredBy], [DiscoveredDate], [EmployeeID], [Description], [Status]) VALUES (4, N'Comet McNaught', NULL, NULL, NULL, NULL, N'	~67,000 AU (inbound) and ~4,100 AU (outbound)', N'0.1707 AU (25,540,000 km)', NULL, N'7 August 2006', 5, N'Comet McNaught, also known as the Great Comet of 2007 and given the designation C/2006 P1, is a non-periodic comet discovered on 7 August 2006 by British-Australian astronomer Robert H. McNaught using the Uppsala Southern Schmidt Telescope.It was the brightest comet in over 40 years, and was easily visible to the naked eye for observers in the Southern Hemisphere in January and February 2007.

With an estimated peak magnitude of −5.5, the comet was the second-brightest since 1935.Around perihelion on 12 January, it was visible worldwide in broad daylight. Its tail measured an estimated 35 degrees in length at its peak.The brightness of C/2006 P1 near perihelion was enhanced by forward scattering.', 1)
INSERT [dbo].[Comets] ([CometID], [CometName], [EarthMOID], [Dimensions], [Meandiameter], [Mass], [Aphelion], [Perihelion], [DiscoveredBy], [DiscoveredDate], [EmployeeID], [Description], [Status]) VALUES (5, N'Comet Kohoutek', NULL, NULL, N'4.2 km (2.6 mi)', NULL, N'98000 AU (inbound)
3700 AU (outbound', N'0.1424249 AU', N'	Luboš Kohoutek', N'	18 March 1973', 5, N'Comet Kohoutek (formally designated C/1973 E1 and formerly as 1973 XII and 1973f)[c] is a comet that passed close to the Sun towards the end of 1973. Early predictions of the comet''s peak brightness suggested that it had the potential to become one of the brightest comets of the 20th century, capturing the attention of the wider public and the press and earning the comet the moniker of "Comet of the Century". Although Kohoutek became rather bright, the comet was ultimately far dimmer than the optimistic projections: its apparent magnitude peaked at only –3 (as opposed to predictions of roughly magnitude –10) and it was visible for only a short period, quickly dimming below naked-eye visibility by the end of January 1974.[d]

The comet was discovered by and named after Luboš Kohoutek at the Hamburg Observatory on 18 March 1973; Kohoutek had been searching for Biela''s Comet and had fortuitously discovered his eponymous comet while reviewing photographic plates for a different object. The comet was discovered farther away from the Sun than any previous comet. Conventional practices for predicting comet brightness led to generous projections of Comet Kohoutek''s luminosity towards the end of 1973 and the beginning of 1974, leading to great anticipation within both scientific circles and the general public. Comet Kohoutek reached perihelion on 28 December 1973. Though the comet was then at its brightest, it could only be observed by scientific instrumentation and astronauts on Skylab. For most ground observers, Kohoutek only reached as bright as magnitude 0 when it emerged from the Sun''s glare in January 1974. It quickly faded beyond naked-eye visibility later that month and was last observed in November 1974. Due to its underwhelming brightness after intense publicity, Kohoutek became synonymous with spectacular disappointment.

Because of its early detection and unique characteristics, numerous scientific assets were dedicated to observing Kohoutek during its 1973–74 traversal of the inner Solar System, making Kohoutek the most well-studied comet at the time; the resulting findings significantly advanced the understanding of comets. The identification of larger and more complex molecules emanating from Kohoutek alongside related but simpler chemical species confirmed the hypothesis that comets were composed of larger molecules that dissociated into simpler products. The significant presence of gasses and plasma expelled from Kohoutek supported the longstanding "dirty snowball" hypothesis concerning the composition of comet nuclei. The detection of water,[e] methyl cyanide, hydrogen cyanide, and silicon in Kohoutek were the first time such chemical species were observed in any comet. Its underwhelming display challenged longstanding assumptions regarding the light curve of similar comets entering the inner Solar System.

Kohoutek''s highly eccentric orbit preceding its 1973 perihelion suggests that it may have been formed early in the formation of the Solar System or it may have originated from a different planetary system. Its orbital period may have been initially in the order of several million years, or its 1973 apparition may have been its first trek into the inner Solar System. Its nucleus has an estimated average radius of 2.1 km (1.3 mi).', 1)
SET IDENTITY_INSERT [dbo].[Comets] OFF
GO
SET IDENTITY_INSERT [dbo].[Constellations] ON 

INSERT [dbo].[Constellations] ([ConstellationID], [ConstellationName], [Abbreviation], [Genitive], [Symbolism], [Declination], [Area], [MainStar], [Meteor], [Description], [EmployeeID], [Status]) VALUES (1, N'Andromeda', N'	And', N'	Andromedae', N'	Andromeda,the Chained Woman', N'	53.1870041°–21.6766376°', N'	722sq. deg. ', N'	16', N'	Andromedids (Bielids)', N'In Greek mythology, Andromeda (/ænˈdrɒmɪdə/; Ancient Greek: Ἀνδρομέδα, romanized: Androméda or Ἀνδρομέδη, Andromédē) is the daughter of the king of Aethiopia, Cepheus, and his wife, Cassiopeia. When Cassiopeia boasts that she is more beautiful than the Nereids, Poseidon sends the sea monster Cetus to ravage the coast of Aethiopia as divine punishment. Andromeda is chained to a rock as a sacrifice to sate the monster, but is saved from death by Perseus, who marries her and takes her to Greece to reign as his queen.[1][2]  As a subject, Andromeda has been popular in art since classical times; rescued by a Greek hero, Andromeda''s narration is considered the forerunner to the "princess and dragon" motif. From the Renaissance, interest revived in the original story, typically as derived from Ovid''s Metamorphoses (4.663ff). The story has appeared many times in such diverse media as plays, poetry, novels, operas, classical and popular music, film, and paintings. The Andromeda constellation is named after her.  The Andromeda tradition, from classical times onwards, has incorporated elements of other stories, including Saint George and the Dragon, introducing a horse for the hero, and the tale of Pegasus, Bellerophon''s winged horse. Ludovico Ariosto''s epic poem Orlando Furioso, which tells a similar story, has introduced further confusion. The tradition has been criticized for depicting the princess of Aethiopia as white; few artists have chosen to portray her as dark-skinned, despite Ovid''s account of her. Others have noted that Perseus''s liberation of Andromeda was a popular choice of subject among male artists, reinforcing a narrative of male superiority with its powerful male hero and its submissive female in bondage.', 2, 1)
INSERT [dbo].[Constellations] ([ConstellationID], [ConstellationName], [Abbreviation], [Genitive], [Symbolism], [Declination], [Area], [MainStar], [Meteor], [Description], [EmployeeID], [Status]) VALUES (2, N'Aquarius', N'	Aqr', N'Aquarii', N'the Water-Bearer', N'	03.3256676°–−24.9040413°', N'	980 sq. deg. ', N'	10, 22', N'March Aquariids, Eta Aquariids, Delta Aquariids,  Iota Aquariids', N'Aquarius is an equatorial constellation of the zodiac, between Capricornus and Pisces. Its name is Latin for "water-carrier" or "cup-carrier", and its old astronomical symbol is Aquarius symbol (fixed width).svg (♒︎), a representation of water. Aquarius is one of the oldest of the recognized constellations along the zodiac (the Sun''s apparent path).[2] It was one of the 48 constellations listed by the 2nd century astronomer Ptolemy, and it remains one of the 88 modern constellations. It is found in a region often called the Sea due to its profusion of constellations with watery associations such as Cetus the whale, Pisces the fish, and Eridanus the river.[3]

At apparent magnitude 2.9, Beta Aquarii is the brightest star in the constellation.', 4, 1)
INSERT [dbo].[Constellations] ([ConstellationID], [ConstellationName], [Abbreviation], [Genitive], [Symbolism], [Declination], [Area], [MainStar], [Meteor], [Description], [EmployeeID], [Status]) VALUES (3, N'Cancer', N'Cnc', N'Cancri', N'	the Crab', N'	33.1415138°–6.4700689', N'506 sq. deg.', N'	5', N'	Delta Cancrids', N'Cancer is one of the twelve constellations of the zodiac and is located in the Northern celestial hemisphere. Its old astronomical symbol is Cancer symbol (fixed width).svg (♋︎). Its name is Latin for crab and it is commonly represented as one. Cancer is a medium-size constellation with an area of 506 square degrees and its stars are rather faint, its brightest star Beta Cancri having an apparent magnitude of 3.5. It contains two stars with known planets, including 55 Cancri, which has five: one super-earth and four gas giants, one of which is in the habitable zone and as such has expected temperatures similar to Earth. At the (angular) heart of this sector of our celestial sphere is Praesepe (Messier 44), one of the closest open clusters to Earth and a popular target for amateur astronomers.', 5, 1)
INSERT [dbo].[Constellations] ([ConstellationID], [ConstellationName], [Abbreviation], [Genitive], [Symbolism], [Declination], [Area], [MainStar], [Meteor], [Description], [EmployeeID], [Status]) VALUES (4, N'Pisces', N'	Psc', N'	Piscium', N'	the Fishes', N'	+15°', N'	889 sq. deg. ', N'18', N'	Piscids', N'Pisces is a constellation of the zodiac. Its vast bulk – and main asterism viewed in most European cultures per Greco-Roman antiquity as a distant pair of fishes connected by one cord each that join at an apex – are in the Northern celestial hemisphere. Its old astronomical symbol is Pisces symbol (fixed width).svg (♓︎). Its name is Latin for "fishes". It is between Aquarius, of similar size, to the southwest and Aries, which is smaller, to the east. The ecliptic and the celestial equator intersect within this constellation and in Virgo. This means the sun passes directly overhead of the equator, on average, at approximately this point in the sky, at the March equinox.', 2, 0)
INSERT [dbo].[Constellations] ([ConstellationID], [ConstellationName], [Abbreviation], [Genitive], [Symbolism], [Declination], [Area], [MainStar], [Meteor], [Description], [EmployeeID], [Status]) VALUES (5, N'Centaurus', N'Cen', N'Centauri', N'	the Centaur', N'	−29.9948788°–−64.6957885°', N'1060 sq. deg.', N'11', N'	Alpha Centaurids, Omicron Centaurids, Theta Centaurids', N'Centaurus /sɛnˈtɔːrəs, -ˈtɑːr-/ is a bright constellation in the southern sky. One of the largest constellations, Centaurus was included among the 48 constellations listed by the 2nd-century astronomer Ptolemy, and it remains one of the 88 modern constellations. In Greek mythology, Centaurus represents a centaur; a creature that is half human, half horse (another constellation named after a centaur is one from the zodiac: Sagittarius). Notable stars include Alpha Centauri, the nearest star system to the Solar System, its neighbour in the sky Beta Centauri, and V766 Centauri, one of the largest stars yet discovered. The constellation also contains Omega Centauri, the brightest globular cluster as visible from Earth and the largest identified in the Milky Way, possibly a remnant of a dwarf galaxy.', 5, 1)
SET IDENTITY_INSERT [dbo].[Constellations] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Address]) VALUES (1, N'Manh', N'NH', N'manh.nh.1918@aptechlearning.edu.vn', N'0961886180          ', N'Yen Bai, VietNam')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Address]) VALUES (2, N'Duc', N'LT', N'duc.lt.521@aptech.learning.edu.vn', N'0967171560          ', N'QuangNinh, VietNam')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Address]) VALUES (3, N'Chien', N'NT', N'chien.nt.1916@aptechlearning.edu.vn', N'393879232           ', N'HaiDuong, VietNam')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Address]) VALUES (4, N'Tung', N'NH', N'tung.nh.839@aptechlearning.edu.vn', N'0961886180          ', N'Hanoi, VietNam')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Address]) VALUES (5, N'Anh', N'TQ', N'anh.tq.1903@aptechlearning.edu.vn', N'0943075209          ', N'Hanoi, VietNam')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbackToComet] ON 

INSERT [dbo].[FeedbackToComet] ([ID], [Name], [Email], [Description], [Date], [bit], [CometID]) VALUES (1, N'Astronomer', N'ayemr19071@gmail.com', N'arrrrrrrrrrrrrrrr', CAST(N'2023-03-07T03:28:24.000' AS DateTime), NULL, NULL)
INSERT [dbo].[FeedbackToComet] ([ID], [Name], [Email], [Description], [Date], [bit], [CometID]) VALUES (2, N'Astronomer', N'vinfioiast@gmail.com', N'arrrrrrrrrrrrrrrr', CAST(N'2023-03-07T03:30:52.000' AS DateTime), NULL, NULL)
INSERT [dbo].[FeedbackToComet] ([ID], [Name], [Email], [Description], [Date], [bit], [CometID]) VALUES (3, N'Astronomer', N'ayemr19071@gmail.com', N'arrrrrrrrrrrrrrrr444', CAST(N'2023-03-07T03:32:13.000' AS DateTime), NULL, 1)
INSERT [dbo].[FeedbackToComet] ([ID], [Name], [Email], [Description], [Date], [bit], [CometID]) VALUES (4, N'heee', N'vinfioiast@gmail.com', N'Perjecttt', CAST(N'2023-03-07T03:34:21.000' AS DateTime), NULL, 1)
INSERT [dbo].[FeedbackToComet] ([ID], [Name], [Email], [Description], [Date], [bit], [CometID]) VALUES (5, N'yoooo', N'vinfast@gmail.com', N'arrrrrrrrrrrrrrrr', CAST(N'2023-03-07T05:44:46.000' AS DateTime), NULL, 3)
INSERT [dbo].[FeedbackToComet] ([ID], [Name], [Email], [Description], [Date], [bit], [CometID]) VALUES (6, N'Astronomer', N'ayemr19071@gmail.com', N'perject', CAST(N'2023-03-10T01:10:51.000' AS DateTime), NULL, 5)
INSERT [dbo].[FeedbackToComet] ([ID], [Name], [Email], [Description], [Date], [bit], [CometID]) VALUES (7, N'Astronomer', N'vinfioiast@gmail.com', N'okk', CAST(N'2023-03-10T01:44:50.000' AS DateTime), NULL, 4)
SET IDENTITY_INSERT [dbo].[FeedbackToComet] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbacktoConstellations] ON 

INSERT [dbo].[FeedbacktoConstellations] ([ID], [Name], [Email], [Description], [Date], [ConstellationID], [Status]) VALUES (1, N'Astronomer', N'jkhfd@gmail.com', N'regtre', CAST(N'2023-03-08T00:50:36.000' AS DateTime), 1, NULL)
INSERT [dbo].[FeedbacktoConstellations] ([ID], [Name], [Email], [Description], [Date], [ConstellationID], [Status]) VALUES (2, N'Astronomer', N'ayemr19071@gmail.com', N'Hello guys', CAST(N'2023-03-10T01:16:23.000' AS DateTime), 5, NULL)
INSERT [dbo].[FeedbacktoConstellations] ([ID], [Name], [Email], [Description], [Date], [ConstellationID], [Status]) VALUES (3, N'Astronomer', N'vinfioiast@gmail.com', N'okkk', CAST(N'2023-03-10T01:45:10.000' AS DateTime), 3, 1)
SET IDENTITY_INSERT [dbo].[FeedbacktoConstellations] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbackToNews] ON 

INSERT [dbo].[FeedbackToNews] ([ID], [Name], [Email], [Description], [Date], [Status], [NewsID]) VALUES (1, N'Astronomer', N'xiaomi@gmail.com', N'rtretjlnre', CAST(N'2023-03-07T05:37:43.000' AS DateTime), NULL, 1)
INSERT [dbo].[FeedbackToNews] ([ID], [Name], [Email], [Description], [Date], [Status], [NewsID]) VALUES (3, N'Astronomer', N'ayemr19071@gmail.com', N'Hi guys', CAST(N'2023-03-10T01:38:52.000' AS DateTime), NULL, 3)
SET IDENTITY_INSERT [dbo].[FeedbackToNews] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbacktoObservatory] ON 

INSERT [dbo].[FeedbacktoObservatory] ([ID], [Name], [Email], [Description], [ObservatoryID], [Date], [Status]) VALUES (1, N'yoooo', N'xiaomi@gmail.com', N'regtre', 1, CAST(N'2023-03-08T00:12:48.000' AS DateTime), NULL)
INSERT [dbo].[FeedbacktoObservatory] ([ID], [Name], [Email], [Description], [ObservatoryID], [Date], [Status]) VALUES (2, N'Astronomer', N'ayemr19071@gmail.com', N'hello guys', 5, CAST(N'2023-03-10T01:12:06.000' AS DateTime), NULL)
INSERT [dbo].[FeedbacktoObservatory] ([ID], [Name], [Email], [Description], [ObservatoryID], [Date], [Status]) VALUES (3, N'Astronomer', N'jkhfd@gmail.com', N'okk', 4, CAST(N'2023-03-10T01:43:54.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[FeedbacktoObservatory] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbackToPhenomena] ON 

INSERT [dbo].[FeedbackToPhenomena] ([ID], [Name], [Email], [Description], [Date], [Status], [PhenomenaID]) VALUES (1, N'heee', N'jkhfd@gmail.com', N'Perjecttt', CAST(N'2023-03-08T01:53:22.000' AS DateTime), NULL, 3)
INSERT [dbo].[FeedbackToPhenomena] ([ID], [Name], [Email], [Description], [Date], [Status], [PhenomenaID]) VALUES (2, N'Astronomer', N'ayemr19071@gmail.com', N'Hi Guys', CAST(N'2023-03-10T01:21:42.000' AS DateTime), NULL, 6)
INSERT [dbo].[FeedbackToPhenomena] ([ID], [Name], [Email], [Description], [Date], [Status], [PhenomenaID]) VALUES (3, N'Astronomer', N'oppo@ve.ui', N'ok', CAST(N'2023-03-10T01:40:57.000' AS DateTime), 1, 5)
SET IDENTITY_INSERT [dbo].[FeedbackToPhenomena] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbacktoPlanets] ON 

INSERT [dbo].[FeedbacktoPlanets] ([ID], [Name], [Email], [Description], [Date], [PlanetID], [Status]) VALUES (5, N'yoooo', N'vinfas@gmail.com', N'hiiiiiii', CAST(N'2023-03-07T02:29:00.830' AS DateTime), 1, 1)
INSERT [dbo].[FeedbacktoPlanets] ([ID], [Name], [Email], [Description], [Date], [PlanetID], [Status]) VALUES (7, N'Astronomer', N'vinfast@gmail.com', N'wwowwwww', CAST(N'2023-03-07T02:54:00.000' AS DateTime), 4, 1)
INSERT [dbo].[FeedbacktoPlanets] ([ID], [Name], [Email], [Description], [Date], [PlanetID], [Status]) VALUES (12, N'Astronomer', N'jkhfd@gmail.com', N'Perject, i like it', CAST(N'2023-03-09T03:53:17.000' AS DateTime), 1, 0)
INSERT [dbo].[FeedbacktoPlanets] ([ID], [Name], [Email], [Description], [Date], [PlanetID], [Status]) VALUES (13, N'Astronomer', N'Duc.lt.521@aptechlearning.edu.vn', N'Xuất sắc, tuyệt vời, 10đ, quá là ghê luôn', CAST(N'2023-03-10T00:54:26.000' AS DateTime), 5, 0)
INSERT [dbo].[FeedbacktoPlanets] ([ID], [Name], [Email], [Description], [Date], [PlanetID], [Status]) VALUES (14, N'Astronomer', N'ayemr19071@gmail.com', N'ok', CAST(N'2023-03-10T01:44:25.000' AS DateTime), 4, 1)
SET IDENTITY_INSERT [dbo].[FeedbacktoPlanets] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageOfComet] ON 

INSERT [dbo].[ImageOfComet] ([ImageID], [CometID], [Image], [Description]) VALUES (2, 1, N'~/Image/Halley2318412513.jpg', NULL)
INSERT [dbo].[ImageOfComet] ([ImageID], [CometID], [Image], [Description]) VALUES (3, 2, N'~/Image/Hyakutake2320066192.jpg', NULL)
INSERT [dbo].[ImageOfComet] ([ImageID], [CometID], [Image], [Description]) VALUES (4, 3, N'~/Image/Halebopp2321226373.png', NULL)
INSERT [dbo].[ImageOfComet] ([ImageID], [CometID], [Image], [Description]) VALUES (5, 4, N'~/Image/McNaught2322002057.jpg', NULL)
INSERT [dbo].[ImageOfComet] ([ImageID], [CometID], [Image], [Description]) VALUES (6, 5, N'~/Image/Comet_Kohoutek_(S74-17688)2323547194.jpg', NULL)
SET IDENTITY_INSERT [dbo].[ImageOfComet] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageOfConstellation] ON 

INSERT [dbo].[ImageOfConstellation] ([ImageID], [ConstellationID], [Image], [Description]) VALUES (1, 1, N'~/Image/Andromeda2327193922.jpg', N'Andromeda')
INSERT [dbo].[ImageOfConstellation] ([ImageID], [ConstellationID], [Image], [Description]) VALUES (3, 3, N'~/Image/Cancer2331279800.png', N'Cancer Constellations')
INSERT [dbo].[ImageOfConstellation] ([ImageID], [ConstellationID], [Image], [Description]) VALUES (4, 4, N'~/Image/Pices2332284441.jpg', N'pisces Constellations')
INSERT [dbo].[ImageOfConstellation] ([ImageID], [ConstellationID], [Image], [Description]) VALUES (6, 5, N'~/Image/centaurusconstellation-597687b6af5d3a00116f02f12340434603.jpg', N'Centaurus Constellations')
INSERT [dbo].[ImageOfConstellation] ([ImageID], [ConstellationID], [Image], [Description]) VALUES (7, 2, N'~/Image/Aquarius (1)2341359601.jpg', N'Aquarius Constellation')
SET IDENTITY_INSERT [dbo].[ImageOfConstellation] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageOfNews] ON 

INSERT [dbo].[ImageOfNews] ([ImageID], [NewsID], [Description], [Image]) VALUES (1, 1, NULL, N'~/Image/UFO-flying-saucer-spec-efx-S-Shostak-1142px2325408827.jpg')
INSERT [dbo].[ImageOfNews] ([ImageID], [NewsID], [Description], [Image]) VALUES (2, 2, NULL, N'~/Image/exoplanet-star2326367027.jpg')
INSERT [dbo].[ImageOfNews] ([ImageID], [NewsID], [Description], [Image]) VALUES (3, 3, NULL, N'~/Image/DART Impact-Bruno-Payet-9-2022_02327135018.png')
INSERT [dbo].[ImageOfNews] ([ImageID], [NewsID], [Description], [Image]) VALUES (4, 5, N'habitable planet toi700', N'~/Image/habitableplanettoi7002319156862.jpg')
INSERT [dbo].[ImageOfNews] ([ImageID], [NewsID], [Description], [Image]) VALUES (5, 6, N'Search for alien file', N'~/Image/Searchforalienlife2326131101.jpg')
INSERT [dbo].[ImageOfNews] ([ImageID], [NewsID], [Description], [Image]) VALUES (6, 7, N'Plant life in space', N'~/Image/Plantlifeinspace2330529435.jpg')
SET IDENTITY_INSERT [dbo].[ImageOfNews] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageOfObservatory] ON 

INSERT [dbo].[ImageOfObservatory] ([ImageID], [ObservatoryID], [Image], [Description]) VALUES (1, 1, N'~/Image/University_of_Tokyo_Atacama_Observatory2343419139.jpg', N'University of Tokyo Atacama Observatory')
INSERT [dbo].[ImageOfObservatory] ([ImageID], [ObservatoryID], [Image], [Description]) VALUES (2, 2, N'~/Image/Chacaltaya_Astrophysical_Observatory2345133779.jpg', N'Chacaltaya Astrophysical Observatory')
INSERT [dbo].[ImageOfObservatory] ([ImageID], [ObservatoryID], [Image], [Description]) VALUES (3, 3, N'~/Image/Receiver_Lab_Telescope2346444783.jpg', N'Receiver Lab Telescope')
INSERT [dbo].[ImageOfObservatory] ([ImageID], [ObservatoryID], [Image], [Description]) VALUES (4, 4, N'~/Image/pic-du-midi-ete-12347502061.jpg', N'Pic du Midi Observatory')
INSERT [dbo].[ImageOfObservatory] ([ImageID], [ObservatoryID], [Image], [Description]) VALUES (5, 5, N'~/Image/1l-image-Extremely-Large-Telescope2348423804.jpg', N'Cerro Armazones Observatory')
SET IDENTITY_INSERT [dbo].[ImageOfObservatory] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageOfPhenomena] ON 

INSERT [dbo].[ImageOfPhenomena] ([ImageID], [PhenomenaID], [Image], [Description]) VALUES (1, 3, N'~/Image/solar-eclipse12327593248.jpg', N'Solar Ecipse')
INSERT [dbo].[ImageOfPhenomena] ([ImageID], [PhenomenaID], [Image], [Description]) VALUES (2, 4, N'~/Image/astronomy-3101270_12802329389822.jpg', N'Big Bang')
INSERT [dbo].[ImageOfPhenomena] ([ImageID], [PhenomenaID], [Image], [Description]) VALUES (3, 5, N'~/Image/c0295733-800px-wm2331539416.jpg', N'History of the Earth')
INSERT [dbo].[ImageOfPhenomena] ([ImageID], [PhenomenaID], [Image], [Description]) VALUES (4, 6, N'~/Image/Lunar_Esclipse2334162073.jpg', N'Lunar eclipse')
SET IDENTITY_INSERT [dbo].[ImageOfPhenomena] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageOfPlanet] ON 

INSERT [dbo].[ImageOfPlanet] ([ImageID], [PlanetID], [Image], [Description]) VALUES (2, 1, N'~/Image/tráiiii2346020330.jpg', N'Earth')
INSERT [dbo].[ImageOfPlanet] ([ImageID], [PlanetID], [Image], [Description]) VALUES (3, 2, N'~/Image/Mars2339237939.jpg', N'Mars')
INSERT [dbo].[ImageOfPlanet] ([ImageID], [PlanetID], [Image], [Description]) VALUES (4, 3, N'~/Image/saturnn2344199065.jpg', N'Saturn')
INSERT [dbo].[ImageOfPlanet] ([ImageID], [PlanetID], [Image], [Description]) VALUES (5, 4, N'~/Image/Uranus2347181977.jpg', N'Uranus')
INSERT [dbo].[ImageOfPlanet] ([ImageID], [PlanetID], [Image], [Description]) VALUES (6, 5, N'~/Image/Jupiter2352154291.jpg', N'Jupiter')
SET IDENTITY_INSERT [dbo].[ImageOfPlanet] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [Title], [Description], [EmployeeID], [Status], [PostDate]) VALUES (1, N'America''s UFO enthusiasts have questions about the Chinese spy balloon', N'In the past two weeks, the U.S. military has opened fire on multiple flying objects that have crossed into North America. The most recent intruder was taken out over Lake Huron on Super Bowl Sunday.

The government says at least one of the four objects was sent to spy on the U.S. by China. (China officially disagrees, calling the first object a wayward weather balloon.) The most recent administration spin is that the three most recently shot down UAPs (unidentified anomalous phenomena) could be benign.

But as with so many UAP sightings, and especially given the government’s aggressive response, speculation about alien activity ran rampant anyway. Are fighter pilots blasting extraterrestrial craft out of the sky?

Ever since the 1940s, aliens have been the go-to explanation when it comes to understanding mysterious objects in our atmosphere. It’s a disputable hypothesis, but one that enjoys widespread popularity. Half of the respondents in a 2021 Pew Research survey endorsed the idea that UFOs reported by the military are actually craft sent here from light-years away.

However, it needs to be said, again, that blaming the aliens doesn’t pass the smell test in this case.

Whatever China was doing with its giant balloon, the object’s highly limited maneuverability, a common shortcoming of inflatables, hardly sounds like what extraterrestrials would send our way. After all, if they can bridge the tens of trillions of miles between their planet and ours, they would surely deploy sophisticated steering technology once their probe reached our planet. We don’t send rovers to Mars that just roll around with the wind. Aliens would want to direct their hardware to the most promising vantage sites.

It also seems unlikely that an interstellar probe would be a balloon at all. Inflatable craft are slow, easily seen, and — as evidenced last week — vulnerable to weapons like Sidewinder missiles. (Although apparently one of the missiles did miss its target, requiring a $400,000 do-over.) They also require an atmosphere in which to float, and that limits their presence to only a few dozen miles above sea level, at best. Wouldn’t it make more sense for the aliens to put their hardware in a high Earth orbit — in other words, to opt for satellite reconnaissance? After all, that’s what we often do. Defense experts have already noted that, whatever their origin, the balloons are a puzzling technological choice given the superior capabilities of orbiting satellites.

It’s also instructive to consider the idea of reconnaissance from the aliens’ point of view. Sure, they might find it attractive to launch probes that would take up residence near to Earth, and then transmit imagery and other information back to their home world. But even if the extraterrestrials have rockets with speeds a hundred times greater than the best humans can currently build, those craft would still require nearly a thousand years to get here. That implies very patient aliens, or some new physics.

Nonetheless, you can bank on the fact that some members of the UFO community will demand proof positive that these objects are not further evidence that Earth is being visited. Unfortunately that line of thinking is not based on reason. Rather, it’s an “argument from ignorance.” Since we don’t know what all of these objects are, it’s fair to say that they’re probes from other parts of the galaxy. Let your fantasy be your guide.

It’s not quite true to say that “there’s nothing to see here.” There is something to see, but it’s of interest to defense types, not conspiracy theorists. The real explanation for why these objects have excited the UFO buffs is that they superficially resemble, well, UFOs. They’re something new in the sky, clearly artificial, of uncertain provenance, and visible (in at least one case) to the naked eye.

Eventually the contents and construction of all of these floating intruders will hopefully be revealed. Government officials do not seem very concerned. “I don’t think the American people need to worry about aliens with respect to these craft, period,” noted White House National Security spokesman John Kirby.

There also seems to be little doubt that — now that we’re on alert and our radar systems have been adjusted to higher sensitivity — more will be found. That may sound like good news for UFO fans. But it may also signal the beginning of the end for many theories. The more we know, the less oxygen there will be for speculators.

When asked where these balloons come from, I’d suggest that Shenzhen is a better bet than Sagittarius.', 3, 1, CAST(N'2023-03-07T03:49:12.963' AS DateTime))
INSERT [dbo].[News] ([NewsID], [Title], [Description], [EmployeeID], [Status], [PostDate]) VALUES (2, N'You Can Observe a One-hit Wonder Exoplanet this February', N'In January 2022, NASA’s planet-hunting TESS (Transiting Exoplanet Survey Satellite) spacecraft found a new exoplanet orbiting a distant star. With further observations, SETI Institute scientists Dr. Paul Dalba and Daniel Peluso have determined that the exoplanet, called TIC 139270665.01, is a giant planet with about half the mass of Jupiter. More excitingly, they have discovered that it’s not alone — another object lurks in its solar system.


TIC 139270665.01 has been observed to transit, or pass in front of its star, only one time by TESS. However, Dalba and Peluso have gathered additional radial velocity data of the host star, which shows how the star wobbles as it interacts with the other objects in its orbit. This data unveiled that TIC 139270665.01 has a “super Jupiter” sibling, with a mass five times that of our solar system’s largest planet.

Before astronomers can tackle the super Jupiter, they need more information about the planet revealed by TESS. Since TESS observed only a single transit, the planet’s orbital period, or how long it takes to orbit its star, is not well defined. To better understand TIC 139270665.01’s orbit and confirm it as a planet, astronomers need to see it transit again so that it is no longer a TESS “one-hit wonder.”', 4, 1, CAST(N'2023-03-07T03:50:17.670' AS DateTime))
INSERT [dbo].[News] ([NewsID], [Title], [Description], [EmployeeID], [Status], [PostDate]) VALUES (3, N'Unistellar Citizen Science Network and SETI Institute Contribute to Planetary Defense', N'March 1, 2023, Mountain View, CA – Citizen scientists worldwide made decisive contributions to defend our planet by recording accurate and meaningful observations supporting the NASA DART (Double Asteroid Redirection Test) mission. The team, including eight SETI Institute astronomers and led by SETI Institute postdoctoral fellow Ariel Graykowski published their results in Nature on March 1.

NASA’s first test mission for planetary defense, DART, which seeks to test and validate a method to protect Earth in case of an asteroid strike, reached Dimorphos, a moon of the near-Earth asteroid Didymos on September 26, 2022. Unistellar citizen scientists were mobilized by SETI Institute researchers to observe the impact live, which was only visible from parts of Africa. Several observers in Kenya and Réunion Island successfully recorded the event with their smart telescope, witnessing the first successful deflection of an astronomical object using human technology.', 5, 1, CAST(N'2023-03-07T03:51:49.047' AS DateTime))
INSERT [dbo].[News] ([NewsID], [Title], [Description], [EmployeeID], [Status], [PostDate]) VALUES (5, N'Two potentially habitable planets found orbiting distant star', N'NASA recently announced the discovery of a new, Earth-sized planet in the habitable zone of a nearby star called TOI-700. We are two of the astronomers who led the discovery of this planet, called TOI-700 e. TOI-700 e is just over 100 light-years from Earth — too far away for humans to visit — but we do know that it is similar in size to Earth, likely rocky in composition and could potentially support life.  You’ve probably heard about some of the many other exoplanet discoveries in recent years. In fact, TOI-700 e is one of two potentially habitable planets just in the TOI-700 star system.  Habitable planets are those that are just the right distance from their star to have a surface temperature that could sustain liquid water. While it is always exciting to find a new, potentially habitable planet far from Earth, the focus of exoplanet research is shifting away from simply discovering more planets. Instead, researchers are focusing their efforts on finding and studying systems most likely to answer key questions about how planets form, how they evolve, and whether life might exist in the universe. TOI-700 e stands out from many of these other planet discoveries because it is well suited for future studies that could help answer big question about the conditions for life outside the solar system.TOI-700 first made headlines when our team announced the discovery of three small planets orbiting the star in early 2020. Using a combination of observations from NASA’s Transiting Exoplanet Surveying Satellite mission and the Spitzer Space Telescope we discovered these planets by measuring small dips in the amount of light coming from TOI-700. These dips in light are caused by planets passing in front of the small, cool, red dwarf star at the center of the system.  By taking precise measurements of the changes in light, we were able to determine that at least three small planets are in the TOI-700 system, with hints of a possible fourth. We could also determine that the third planet from the star, TOI-700 d, orbits within its star’s habitable zone, where the temperature of the planet’s surface could allow for liquid water.  The Transiting Exoplanet Surveying Satellite observed TOI-700 for another year, from July 2020 through May 2021, and using these observations our team found the fourth planet, TOI-700 e. TOI-700 e is 95 percent the size of Earth and, much to our surprise, orbits on the inner edge of the star’s habitable zone, between planets c and d. Our discovery of this planet makes TOI-700 one of only a few known systems with two Earth-sized planets orbiting in the habitable zone of their star. The fact that it is relatively close to Earth also makes it one of the most accessible systems in terms of future characterization.', 1, 1, CAST(N'2023-03-10T02:17:10.000' AS DateTime))
INSERT [dbo].[News] ([NewsID], [Title], [Description], [EmployeeID], [Status], [PostDate]) VALUES (6, N'Here''s how astronomers are looking for life beyond Earth', N'We have long been fascinated with the idea of alien life. The earliest written record presenting the idea of “aliens” is seen in the satiric work of Assyrian writer Lucian of Samosata dated to A.D. 200.  In one novel, Lucian writes of a journey to the Moon and the bizarre life he imagines living there — everything from three-headed vultures to fleas the size of elephants.  Now, 2,000 years later, we still write stories of epic adventures beyond Earth to meet otherworldly beings (Hitchhiker’s Guide, anyone?). Stories like these entertain and inspire, and we are forever trying to find out if science fiction will become science fact.When looking for life beyond Earth, we are faced with two possibilities. We might find basic microbial life hiding somewhere in our solar system; or we will identify signals from intelligent life somewhere far away.  Unlike in Star Wars, we’re not talking far, far away in another galaxy, but rather around other nearby stars. It is this second possibility which really excites me, and should excite you too. A detection of intelligent life would fundamentally change how we see ourselves in the universe.  In the last 80 years, programs dedicated to the search for extraterrestrial intelligence (SETI) have worked tirelessly searching for cosmic “hellos” in the form of radio signals.  The reason we think any intelligent life would communicate via radio waves is due to the waves’ ability to travel vast distances through space, rarely interacting with the dust and gas in between stars. If anything out there is trying to communicate, it’s a pretty fair bet they would do it through radio waves.', 1, 1, CAST(N'2023-03-10T02:21:20.000' AS DateTime))
INSERT [dbo].[News] ([NewsID], [Title], [Description], [EmployeeID], [Status], [PostDate]) VALUES (7, N'A new place to look for alien life: The photosynthetic habitable zone', N'Exoplanet hunting is evolving from a science searching for exotic new worlds into one that is attempting to better understand these planets and to characterize them. Astrobiologists are especially interested in worlds that might support life.  One important characteristic is the existence of liquid water, which is essential for life on Earth. So astrobiologists have focused on finding other Earths in the region around stars where liquid water might exist, the so-called habitable zone. And they have found dozens of candidates, with many more set to emerge as observatories become more powerful.  However, astronomers cannot study all these planets in detail because observing time is a precious and limited resource. This raises the question of how to identify the most promising exoplanets for further study.So most of these planets around red dwarfs can be discarded as candidates for further study, at least by this criterion. In particular, it excludes the four planets in the habitable zone around a nearby star called Trappist 1. These are among the closest that exist to Earth and so had garnered much attention. But this is likely to fade given they are also tidally locked.', 2, 1, CAST(N'2023-03-10T02:27:12.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Observatories] ON 

INSERT [dbo].[Observatories] ([ObservatoryID], [ObservatoryName], [Elevation], [ObservatorySite], [Location], [coordinates], [Established], [TypeOfObservatory], [MajorInstruments], [Description], [Status], [EmployeeID]) VALUES (1, N'University of Tokyo Atacama Observatory', N'5,640 m (18,500 ft)', N'Cerro Chajnantor', N'Atacama Desert, Chile', N'22°59′12″S 67°44′32″W', 2009, N'Optical, infrared', NULL, N'The University of Tokyo Atacama Observatory (TAO) is an astronomical observatory located on the summit of Cerro Chajnantor, at an altitude of 5,640 m (18,500 ft) within a lava dome in the Atacama Desert of northern Chile.[1] The site is located less than 5 km (3.1 mi) north-northeast of the Llano de Chajnantor Observatory, where the Atacama Large Millimeter Array (ALMA) is located, but is over 580 m (1,900 ft) higher in elevation. It is also 28 m (92 ft) higher than the Fred Young Submillimeter Telescope proposed for the same peak.

The eventual goal of the project is to construct the TAO telescope (or TAO 6.5m telescope), a 6.5 m (260 in) optical-infrared telescope at the site.[2] A first step towards that goal has been the construction and installation of a 1.0 m (39 in) pilot telescope, called miniTAO, completed in 2009. With miniTAO''s first light achieved in March 2009 in the visible region, and in June 2009 for the infrared region, the observatory has become the highest permanent astronomical observatory in the world. The high altitude of the observatory is essential for its mission, for it is an infrared light observatory, and infrared light is absorbed by the water vapor in the atmosphere making it imperative that an infrared observatory be located in high altitude where the atmosphere is sparse. In 2023, TAO was noted as one of only a few major telescopes in the world with light pollution below acceptable levels of interference.', 1, 4)
INSERT [dbo].[Observatories] ([ObservatoryID], [ObservatoryName], [Elevation], [ObservatorySite], [Location], [coordinates], [Established], [TypeOfObservatory], [MajorInstruments], [Description], [Status], [EmployeeID]) VALUES (2, N'Chacaltaya Astrophysical Observatory', N'5,230 m (17,160 ft)', N'Chacaltaya', N'Andes, Bolivia', N'16°21′12″S 68°07′53″W', 1946, N'Cosmic ray, gamma ray', NULL, N'Chacaltaya (Mollo language for "bridge of winds" or "winds meeting point"[citation needed], Aymara for "cold road"[1][dubious – discuss]) is a mountain in the Cordillera Real, one of the mountain ranges of the Cordillera Oriental, itself a range of the Bolivian Andes. Its elevation is 5,421 meters (17,785 ft). Chacaltaya''s glacier — which was as old as 18,000 years — had an area of 0.22 km2 (0.085 sq mi) in 1940, which had been reduced to 0.01 km2 (0.0039 sq mi) in 2007 and was completely gone by 2009.[2][3][4] Half of the meltdown, as measured by volume, took place before 1980.[5] The final meltdown after 1980, due to missing precipitation and the warm phase of El Niño, resulted in the glacier''s disappearance in 2009.[6] The glacier was located about 30 kilometers (19 mi) from La Paz, near Huayna Potosí mountain.', 1, 5)
INSERT [dbo].[Observatories] ([ObservatoryID], [ObservatoryName], [Elevation], [ObservatorySite], [Location], [coordinates], [Established], [TypeOfObservatory], [MajorInstruments], [Description], [Status], [EmployeeID]) VALUES (3, N'Receiver Lab Telescope', N'5,525 m (18,127 ft)', N'Cerro Sairecabur', N'Atacama Desert, Chile', N'22°43′0″S 67°53′30″W', 2002, N'Submillimeter, 1–2 THz', NULL, N'A telescope is a device used to observe distant objects by their emission, absorption, or reflection of electromagnetic radiation.[1] Originally meaning only an optical instrument using lenses, curved mirrors, or a combination of both to observe distant objects, the word telescope now refers to a wide range of instruments capable of detecting different regions of the electromagnetic spectrum, and in some cases other types of detectors.

The first known practical telescopes were refracting telescopes with glass lenses and were invented in the Netherlands at the beginning of the 17th century. They were used for both terrestrial applications and astronomy.

The reflecting telescope, which uses mirrors to collect and focus light, was invented within a few decades of the first refracting telescope.

In the 20th century, many new types of telescopes were invented, including radio telescopes in the 1930s and infrared telescopes in the 1960s.', 1, 5)
INSERT [dbo].[Observatories] ([ObservatoryID], [ObservatoryName], [Elevation], [ObservatorySite], [Location], [coordinates], [Established], [TypeOfObservatory], [MajorInstruments], [Description], [Status], [EmployeeID]) VALUES (4, N'Pic du Midi Observatory', N'2,877 m (9,439 ft)', N'Pic du Midi de Bigorre', N'Pyrenees, France', N'42°56′11″N 00°08′34″E', 1878, N'Optical, solar', N'Bernard Lyot Telescope', N'The Pic du Midi Observatory (French: Observatoire du Pic du Midi) is an astronomical observatory located at 2877 meters on top of the Pic du Midi de Bigorre in the French Pyrenees. It is part of the Observatoire Midi-Pyrénées (OMP) which has additional research stations in the southwestern French towns of Tarbes, Lannemezan, and Auch, as well as many partnerships in South America, Africa, and Asia, due to the guardianship it receives from the French Research Institute for Development (IRD).[2][3][4]

Construction of the observatory began in 1878 under the auspices of the Société Ramond, but by 1882 the society decided that the spiralling costs were beyond its relatively modest means, and yielded the observatory to the French state, which took it into its possession by a law of 7 August 1882. The 8 metre dome was completed in 1908, under the ambitious direction of Benjamin Baillaud. It housed a powerful mechanical equatorial reflector which was used in 1909 to formally discredit the Martian canal theory.[3]: 46  In 1946 Mr. Gentilli funded a dome and a 0.60-meter telescope, and in 1958, a spectrograph was installed.[3][5]

A 1.06-meter (42-inch) telescope was installed in 1963, funded by NASA and was used to take detailed photographs of the surface of the Moon in preparation for the Apollo missions. In 1965 the astronomers Pierre and Janine Connes were able to formulate a detailed analysis of the composition of the atmospheres on Mars and Venus, based on the infrared spectra gathered from these planets. The results showed atmospheres in chemical equilibrium. This served as a basis for James Lovelock, a scientist working for the Jet Propulsion Laboratory in California, to predict that those planets had no life - a fact that would be proven and scientifically accepted years after.[6]

A 2-meter telescope, known as the Bernard Lyot Telescope was placed at the observatory in 1980 on top of a 28-meter column built off to the side to avoid wind turbulence affecting the seeing of the other telescopes. It is the largest telescope in France. The observatory also has a coronagraph, which is used to study the solar corona. A 0.60-meter telescope (the Gentilly''s T60 telescope) is also located at the top of Pic du Midi. Since 1982 this T60 is dedicated to amateur astronomy and managed by a group of amateurs, called association T60', 1, 5)
INSERT [dbo].[Observatories] ([ObservatoryID], [ObservatoryName], [Elevation], [ObservatorySite], [Location], [coordinates], [Established], [TypeOfObservatory], [MajorInstruments], [Description], [Status], [EmployeeID]) VALUES (5, N'Cerro Armazones Observatory', N'2,817 m (9,242 ft)', N'Cerro Armazones', N'Atacama Desert, Chile', N'24°35′54″S 70°12′04″W', 1995, N'Optical telescope', N'Hexapod-Telescope', N'Cerro Armazones Observatory (Spanish: Observatorio Cerro Armazones, OCA; German: Observatorium Cerro Armazones, OCA) was an astronomical observatory owned and operated jointly by the Ruhr University Bochum (RUB) and the Catholic University of the North (UCN). It was established in 1995 on the slopes of Cerro Armazones, a mountain in the Antofagasta Region of Chile.[1] The observatory is located in the Atacama Desert about 110 kilometres (68 mi) south of the city of Antofagasta. Unlike many other observatories, OCA is not located at the highest point of its host mountain. Instead, it was in a saddle approximately 340 metres (1,120 ft) below the summit and 1 kilometre (0.62 mi) to the southwest. This location has been given up due to the vicinity of the ELT construction site in January 2014. The Telescopes of the Bochum university, installed after 2006, are no longer operational. They are located 500 metres (1,600 ft) further to the west and 100 metres (330 ft) higher than the original OCA observatory, on a subsidiary peak of Cerro Armazones, Cerro Murphy. The coordinates here are those of this summit now.

On 26 April 2010, the European Southern Observatory Council selected Cerro Armazones as the site for the planned European Extremely Large Telescope.[2] The telescope will be located at the summit of the mountain at an altitude of 3,060 metres (10,040 ft). Currently the mountain top is flattened for this purpose and a new access road has been built.', 1, 4)
SET IDENTITY_INSERT [dbo].[Observatories] OFF
GO
SET IDENTITY_INSERT [dbo].[Phenomenas] ON 

INSERT [dbo].[Phenomenas] ([PhenomenaID], [PhenomenaName], [Title], [status], [Description], [PostDate], [EmployeeID]) VALUES (3, N'Solar eclipse', N'A solar eclipse occurs when the Moon passes between Earth and the Sun, thereby obscuring the view of the Sun from a small part of the Earth, totally or partially. ', 1, N'A solar eclipse occurs when the Moon passes between Earth and the Sun, thereby obscuring the view of the Sun from a small part of the Earth, totally or partially. Such an alignment occurs approximately every six months, during the eclipse season in its new moon phase, when the Moon''s orbital plane is closest to the plane of the Earth''s orbit.[1] In a total eclipse, the disk of the Sun is fully obscured by the Moon. In partial and annular eclipses, only part of the Sun is obscured. Unlike a lunar eclipse, which may be viewed from anywhere on the night side of Earth, a solar eclipse can only be viewed from a relatively small area of the world. As such, although total solar eclipses occur somewhere on Earth every 18 months on average, they recur at any given place only once every 360 to 410 years.

If the Moon were in a perfectly circular orbit and in the same orbital plane as Earth, there would be total solar eclipses once a month, at every new moon. Instead, because the Moon''s orbit is tilted at about 5 degrees to Earth''s orbit, its shadow usually misses Earth. Solar (and lunar) eclipses therefore happen only during eclipse seasons, resulting in at least two, and up to five, solar eclipses each year, no more than two of which can be total.[2][3] Total eclipses are more rare because they require a more precise alignment between the centers of the Sun and Moon, and because the Moon''s apparent size in the sky is sometimes too small to fully cover the Sun.

An eclipse is a natural phenomenon. In some ancient and modern cultures, solar eclipses were attributed to supernatural causes or regarded as bad omens. Astronomers'' predictions of eclipses began in China as early as the 4th century BC; eclipses hundreds of years into the future may now be predicted with high accuracy.

Looking directly at the Sun can lead to permanent eye damage, so special eye protection or indirect viewing techniques are used when viewing a solar eclipse. Only the total phase of a total solar eclipse is safe to view without protection. Enthusiasts known as eclipse chasers or umbraphiles travel to remote locations to see solar eclipses.[4][5]

The symbol for an occultation, and especially a solar eclipse, is Occultation symbol.svg (U+1F775 🝵).', CAST(N'2023-03-08T01:16:09.430' AS DateTime), 4)
INSERT [dbo].[Phenomenas] ([PhenomenaID], [PhenomenaName], [Title], [status], [Description], [PostDate], [EmployeeID]) VALUES (4, N'Big Bang', N'The Big Bang event is a physical theory that describes how the universe expanded from an initial state of high density and temperature', 1, N'The Big Bang event is a physical theory that describes how the universe expanded from an initial state of high density and temperature.[1] Various cosmological models of the Big Bang explain the evolution of the observable universe from the earliest known periods through its subsequent large-scale form.[2][3][4] These models offer a comprehensive explanation for a broad range of observed phenomena, including the abundance of light elements, the cosmic microwave background (CMB) radiation, and large-scale structure. The overall uniformity of the Universe, known as the flatness problem, is explained through cosmic inflation: a sudden and very rapid expansion of space during the earliest moments. However, physics currently lacks a widely accepted theory of quantum gravity that can successfully model the earliest conditions of the Big Bang.

Crucially, these models are compatible with the Hubble–Lemaître law—the observation that the farther away a galaxy is, the faster it is moving away from Earth. Extrapolating this cosmic expansion backwards in time using the known laws of physics, the models describe an increasingly concentrated cosmos preceded by a singularity in which space and time lose meaning (typically named "the Big Bang singularity").[5] In 1964 the CMB was discovered, which convinced many cosmologists that the competing steady-state model of cosmic evolution was falsified,[6] since the Big Bang models predict a uniform background radiation caused by high temperatures and densities in the distant past. A wide range of empirical evidence strongly favors the Big Bang event, which is now essentially universally accepted.[7] Detailed measurements of the expansion rate of the universe place the Big Bang singularity at an estimated 13.787±0.020 billion years ago, which is considered the age of the universe.[8]

There remain aspects of the observed universe that are not yet adequately explained by the Big Bang models. After its initial expansion, the universe cooled sufficiently to allow the formation of subatomic particles, and later atoms. The unequal abundances of matter and antimatter that allowed this to occur is an unexplained effect known as baryon asymmetry. These primordial elements—mostly hydrogen, with some helium and lithium—later coalesced through gravity, forming early stars and galaxies. Astronomers observe the gravitational effects of an unknown dark matter surrounding galaxies. Most of the gravitational potential in the universe seems to be in this form, and the Big Bang models and various observations indicate that this excess gravitational potential is not created by baryonic matter, such as normal atoms. Measurements of the redshifts of supernovae indicate that the expansion of the universe is accelerating, an observation attributed to an unexplained phenomenon known as dark energy.', CAST(N'2023-03-08T01:21:00.197' AS DateTime), 4)
INSERT [dbo].[Phenomenas] ([PhenomenaID], [PhenomenaName], [Title], [status], [Description], [PostDate], [EmployeeID]) VALUES (5, N'History of Earth', N'The history of Earth concerns the development of planet Earth from its formation to the present day.', 1, N'The history of Earth concerns the development of planet Earth from its formation to the present day.[1][2] Nearly all branches of natural science have contributed to understanding of the main events of Earth''s past, characterized by constant geological change and biological evolution.

The geological time scale (GTS), as defined by international convention,[3] depicts the large spans of time from the beginning of the Earth to the present, and its divisions chronicle some definitive events of Earth history. (In the graphic, Ma means "million years ago".) Earth formed around 4.54 billion years ago, approximately one-third the age of the universe, by accretion from the solar nebula.[4][5][6] Volcanic outgassing probably created the primordial atmosphere and then the ocean, but the early atmosphere contained almost no oxygen. Much of the Earth was molten because of frequent collisions with other bodies which led to extreme volcanism. While the Earth was in its earliest stage (Early Earth), a giant impact collision with a planet-sized body named Theia is thought to have formed the Moon. Over time, the Earth cooled, causing the formation of a solid crust, and allowing liquid water on the surface.

The Hadean eon represents the time before a reliable (fossil) record of life; it began with the formation of the planet and ended 4.0 billion years ago. The following Archean and Proterozoic eons produced the beginnings of life on Earth and its earliest evolution. The succeeding eon is the Phanerozoic, divided into three eras: the Palaeozoic, an era of arthropods, fishes, and the first life on land; the Mesozoic, which spanned the rise, reign, and climactic extinction of the non-avian dinosaurs; and the Cenozoic, which saw the rise of mammals. Recognizable humans emerged at most 2 million years ago, a vanishingly small period on the geological scale.

The earliest undisputed evidence of life on Earth dates at least from 3.5 billion years ago,[7][8][9] during the Eoarchean Era, after a geological crust started to solidify following the earlier molten Hadean Eon. There are microbial mat fossils such as stromatolites found in 3.48 billion-year-old sandstone discovered in Western Australia.[10][11][12] Other early physical evidence of a biogenic substance is graphite in 3.7 billion-year-old metasedimentary rocks discovered in southwestern Greenland[13] as well as "remains of biotic life" found in 4.1 billion-year-old rocks in Western Australia.[14][15] According to one of the researchers, "If life arose relatively quickly on Earth … then it could be common in the universe."[14]

Photosynthetic organisms appeared between 3.2 and 2.4 billion years ago and began enriching the atmosphere with oxygen. Life remained mostly small and microscopic until about 580 million years ago, when complex multicellular life arose, developed over time, and culminated in the Cambrian Explosion about 538.8 million years ago. This sudden diversification of life forms produced most of the major phyla known today, and divided the Proterozoic Eon from the Cambrian Period of the Paleozoic Era. It is estimated that 99 percent of all species that ever lived on Earth, over five billion,[16] have gone extinct.[17][18] Estimates on the number of Earth''s current species range from 10 million to 14 million,[19] of which about 1.2 million are documented, but over 86 percent have not been described.[20] However, it was recently claimed that 1 trillion species currently live on Earth, with only one-thousandth of one percent described.[21]

The Earth''s crust has constantly changed since its formation, as has life since its first appearance. Species continue to evolve, taking on new forms, splitting into daughter species, or going extinct in the face of ever-changing physical environments. The process of plate tectonics continues to shape the Earth''s continents and oceans and the life they harbor.', CAST(N'2023-03-08T01:22:50.410' AS DateTime), 5)
INSERT [dbo].[Phenomenas] ([PhenomenaID], [PhenomenaName], [Title], [status], [Description], [PostDate], [EmployeeID]) VALUES (6, N'Lunar eclipse', N'A lunar eclipse is an astronomical event that occurs when the Moon moves into the Earth''s shadow, causing the moon to be darkened.', 1, N'A lunar eclipse is an astronomical event that occurs when the Moon moves into the Earth''s shadow, causing the moon to be darkened.[1] Such alignment occurs during an eclipse season, approximately every six months, during the full moon phase, when the Moon''s orbital plane is closest to the plane of the Earth''s orbit.

This can occur only when the Sun, Earth, and Moon are exactly or very closely aligned (in syzygy) with Earth between the other two, which can happen only on the night of a full moon when the Moon is near either lunar node. The type and length of a lunar eclipse depend on the Moon''s proximity to the lunar node.[citation needed]

When the moon is totally eclipsed by the Earth, it takes on a reddish color that is caused by the planet when it completely blocks direct sunlight from reaching the Moon surface, as only the light reflected from the lunar surface has been refracted by Earth''s atmosphere. This light appears reddish due to the Rayleigh scattering of blue light, the same reason sunrise and sunsets are more orange than during the day.

Unlike a solar eclipse, which can only be viewed from a relatively small area of the world, a lunar eclipse may be viewed from anywhere on the night side of Earth. A total lunar eclipse can last up to nearly 2 hours, while a total solar eclipse lasts only up to a few minutes at any given place, because the Moon''s shadow is smaller. Also unlike solar eclipses, lunar eclipses are safe to view without any eye protection or special precautions.

The symbol for a lunar eclipse (or indeed any body in the shadow of another) is Lunar eclipse symbol.svg (U+1F776 🝶).', CAST(N'2023-03-08T01:24:08.223' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Phenomenas] OFF
GO
SET IDENTITY_INSERT [dbo].[Planets] ON 

INSERT [dbo].[Planets] ([PlanetID], [PlanetName], [RecordedBy], [FirstRecord], [SurfaceTemperature], [OrbitPeriod], [OrbitDistance], [Rings], [NotableMoons], [KnownMoons], [EquatorialCircumference], [PolarDiameter], [EquatorialDiameter], [Mass], [atmosphere], [Description], [Status], [EmployeeID]) VALUES (1, N'Earth', NULL, NULL, N'-88 to 58° C', N'365.26 Earth days', N'149,598,262 km (1 AU)', N'No', N'The Moon', N'1', N'40,030 km', N'12,714 km', N'12,756 km', N'5,972,190,000,000,000 billion kg', N'78.08% nitrogen (N2; dry air),20.95% oxygen (O2),~ 1% water vapor (climate variable),0.9340% argon,0.0413% carbon dioxide[26],0.00182% neon,0.00052% helium,0.00019% methane,0.00011% krypton,0.00006% hydrogen.', N'Earth is the third planet from the Sun and the only place known in the universe where life has originated and found habitability. While large volumes of water can be found throughout the Solar System, only Earth sustains liquid surface water, extending over 70.8% of the Earth with its ocean, making Earth an ocean world. At Earth''s polar regions currently large ice sheets cover the ocean and land, dwarfing all remaining surface water such as lakes and rivers, as well as all groundwater. Land, consisting of continents and islands, extends over 29.2% of the Earth and is widely covered by vegetation. Below Earth''s surface material lies Earth''s crust consisting of several slowly moving tectonic plates, which interact to produce mountain ranges, volcanoes, and earthquakes. Earth''s liquid outer core generates the magnetic field that shapes the magnetosphere of Earth, deflecting destructive solar winds.The atmosphere of Earth consists mostly of nitrogen and oxygen. Greenhouse gases in the atmosphere like carbon dioxide (CO2) trap a part of the energy from the Sun close to the surface. Water vapor is widely present in the atmosphere and forms clouds that cover most of the planet. More solar energy is received by tropical regions than polar regions and is redistributed by atmospheric and ocean circulation. A region''s climate is governed not only by latitude but also by elevation and proximity to moderating oceans. In most areas, severe weather, such as tropical cyclones, thunderstorms, and heat waves, occurs and greatly impacts life.Earth is an ellipsoid with a circumference of about 40,000 km. It is the densest planet in the Solar System. Of the four rocky planets, it is the largest and most massive. Earth is about eight light-minutes away from the Sun and orbits it, taking a year (about 365.25 days) to complete one revolution. The Earth rotates around its own axis in slightly less than a day (in about 23 hours and 56 minutes). The Earth''s axis of rotation is tilted with respect to the perpendicular to its orbital plane around the Sun, producing seasons. Earth is orbited by one permanent natural satellite, the Moon, which orbits Earth at 384,400 km (1.28 light seconds) and is roughly a quarter as wide as Earth. Through tidal locking, the Moon always faces the Earth with the same side, which causes tides, stabilizes Earth''s axis, and gradually slows its rotation.Earth, like most other bodies in the Solar System, formed 4.5 billion years ago from gas in the early Solar System. During the first billion years of Earth''s history, the ocean formed and then life developed within it. Life spread globally and began to affect Earth''s atmosphere and surface, leading to the Great Oxidation Event two billion years ago. Humans emerged 300,000 years ago, and have reached a population of 8 billion today. Humans depend on Earth''s biosphere and natural resources for their survival, but have increasingly impacted the planet''s environment. Humanity''s current impact on Earth''s climate and biosphere is unsustainable, threatening the livelihood of humans and many other life, causing widespread extinctions.', 1, 4)
INSERT [dbo].[Planets] ([PlanetID], [PlanetName], [RecordedBy], [FirstRecord], [SurfaceTemperature], [OrbitPeriod], [OrbitDistance], [Rings], [NotableMoons], [KnownMoons], [EquatorialCircumference], [PolarDiameter], [EquatorialDiameter], [Mass], [atmosphere], [Description], [Status], [EmployeeID]) VALUES (2, N'Mars', N'Egyptian astronomers', N'2nd Millenium BC', N'-87 to -5 °C', N'686.98 Earth days (1.88 Earth years)', N'227,943,824 km (1.38 AU)', N'No', N'Phobos & Deimos', N'2', N'21,297 km', N'6,755 km', N'6,805 km', N'641,693,000,000,000 billion kg (0.107 x Earth)', N'95.97% carbon dioxide,
1.93% argon,
1.89% nitrogen,
0.146% oxygen,
0.0557% carbon monoxide,
0.0210% water vapor.', N'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, larger only than Mercury. In the English language, Mars is named for the Roman god of war. Mars is a terrestrial planet with a thin atmosphere and has a crust primarily composed of elements similar to Earth''s crust, as well as a core made of iron and nickel. Mars has surface features such as impact craters, valleys, dunes, and polar ice caps. Mars has two small, irregularly shaped moons, Phobos and Deimos.

Some of the most notable surface features on Mars include Olympus Mons, the largest volcano and highest-known mountain in the Solar System, and Valles Marineris, one of the largest canyons in the Solar System. The Borealis basin in the Northern Hemisphere covers approximately 40% of the planet and may be a large impact feature.[21] Days and seasons on Mars are comparable to those of Earth, as the planets have a similar rotation period and tilt of the rotational axis relative to the ecliptic plane. Liquid water on the surface of Mars cannot exist due to low atmospheric pressure, which is less than 1% of the atmospheric pressure on Earth.[22][23] Both of Mars''s polar ice caps appear to be made largely of water.[24][25] In the distant past, Mars was likely wetter, and thus possibly more suited for life. It is not known whether life has ever existed on Mars.

Mars has been explored by several uncrewed spacecraft, beginning with Mariner 4 in 1965. NASA''s Viking 1 lander transmitted the first images from the Martian surface in 1976. Two countries have successfully deployed rovers on Mars, the United States first doing so with Sojourner in 1997 and China with Zhurong in 2021.[26] There are also planned future missions to Mars, such as a NASA-ESA Mars Sample Return set to happen in 2026, and the Rosalind Franklin rover mission, which was intended to launch in 2018 but was delayed to 2024 at the earliest, with a more likely launch date at 2028.

Mars can be viewed from Earth with the naked eye, as can its reddish coloring. This appearance, due to the iron oxide prevalent on its surface, has led to Mars often being called the Red Planet.[27][28] It is among the brightest objects in Earth''s sky, with an apparent magnitude that reaches −2.94, comparable to that of Jupiter and surpassed only by Venus, the Moon and the Sun.[16] Mars has been observed since ancient times. Over the millennia has been featured in culture and the arts in ways that have reflected humanity''s growing knowledge of it.', 1, 5)
INSERT [dbo].[Planets] ([PlanetID], [PlanetName], [RecordedBy], [FirstRecord], [SurfaceTemperature], [OrbitPeriod], [OrbitDistance], [Rings], [NotableMoons], [KnownMoons], [EquatorialCircumference], [PolarDiameter], [EquatorialDiameter], [Mass], [atmosphere], [Description], [Status], [EmployeeID]) VALUES (3, N'Saturn', N'Assyrians', N'8th Century BC', N'-139 °C', N'10,755.70 Earth days (29.45 Earth years)', N'1,426,666,422 km (9.58 AU)', N'30+ (7 Groups)', N'Titan, Rhea & Enceladus', N'62', N'365,882 km', N'108,728 km', N'120,536 km', N'568,319,000,000,000,000 billion kg (95.16 x Earth)', N'96.3%±2.4% hydrogen,
3.25%±2.4% helium,
0.45%±0.2% methane,
0.0125%±0.0075% ammonia,
0.0110%±0.0058% hydrogen deuteride,
0.0007%±0.00015% ethane,
Icy volatiles: ammoniawater iceammonium hydrosulfide.', N'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine and a half times that of Earth.[23][24] It has only one-eighth the average density of Earth, but is over 95 times more massive.[25][26][27]

Saturn''s interior is most likely composed of a rocky core, surrounded by a deep layer of metallic hydrogen, an intermediate layer of liquid hydrogen and liquid helium, and finally, a gaseous outer layer. Saturn has a pale yellow hue due to ammonia crystals in its upper atmosphere. An electrical current within the metallic hydrogen layer is thought to give rise to Saturn''s planetary magnetic field, which is weaker than Earth''s, but which has a magnetic moment 580 times that of Earth due to Saturn''s larger size. Saturn''s magnetic field strength is around one-twentieth of Jupiter''s.[28] The outer atmosphere is generally bland and lacking in contrast, although long-lived features can appear. Wind speeds on Saturn can reach 1,800 kilometres per hour (1,100 miles per hour), higher than on Jupiter but not as high as on Neptune.[29]

The planet''s most notable feature is its prominent ring system, which is composed mainly of ice particles, with a smaller amount of rocky debris and dust. At least 83 moons[30] are known to orbit Saturn, of which 53 are officially named; this does not include the hundreds of moonlets in its rings. Titan, Saturn''s largest moon and the second largest in the Solar System, is larger (while less massive) than the planet Mercury and is the only moon in the Solar System to have a substantial atmosphere.', 1, 5)
INSERT [dbo].[Planets] ([PlanetID], [PlanetName], [RecordedBy], [FirstRecord], [SurfaceTemperature], [OrbitPeriod], [OrbitDistance], [Rings], [NotableMoons], [KnownMoons], [EquatorialCircumference], [PolarDiameter], [EquatorialDiameter], [Mass], [atmosphere], [Description], [Status], [EmployeeID]) VALUES (4, N'Uranus', N'William Herschel
', N'March 13th 1781
', N'-197 °C
', N'30,687.15 Earth days (84.02 Earth years)
', N'2,870,658,186 km (19.22 AU)
', N'13
', N'Oberon, Titania, Miranda, Ariel & Umbriel
', N'27
', N'159,354 km
', N'49,946 km
', N'51,118 km
', N'86,810,300,000,000,000 billion kg (14.536 x Earth)
', N'Below 1.3 bar (130 kPa):
83 ± 3% hydrogen,
15 ± 3% helium,
2.3% methane,
0.009% (0.007–0.015%) hydrogen deuteride,
hydrogen sulfide (trace amount),
Icy volatiles: ammoniawater iceammonium hydrosulfidemethane hydrate.', N'Uranus is the seventh planet from the Sun. It is named after Greek sky deity Uranus (Caelus), who in Greek mythology is the father of Cronus (Saturn), a grandfather of Zeus (Jupiter) and great-grandfather of Ares (Mars). Uranus has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. The planet is similar in composition to Neptune, and both have bulk chemical compositions which differ from those of the other two giant planets, Jupiter and Saturn (the gas giants). For this reason, scientists often distinguish Uranus and Neptune as "ice giants".

As with gas giants, ice giants lack a well-defined solid surface. Uranus''s atmosphere is similar to Jupiter''s and Saturn''s in its primary composition of hydrogen and helium, but it contains more "ices" such as water, ammonia, and methane, along with traces of other hydrocarbons.[17] It has the coldest planetary atmosphere in the Solar System, with a minimum temperature of 49 kelvins (−224 °C; −371 °F). It has a complex, layered cloud structure; water is thought to make up the lowest clouds and methane the uppermost layer.[17] The planet''s interior is mainly composed of ices and rock.[16]

Like the other giant planets, Uranus has a ring system, a magnetosphere, and numerous moons. The Uranian system has a unique configuration because its axis of rotation is tilted sideways, nearly into the plane of its solar orbit. Therefore, its north and south poles lie where most other planets have their equators.[21] In 1986, images from Voyager 2 showed Uranus as an almost featureless planet in visible light, without the cloud bands or storms associated with the other giant planets.[21] No other spacecraft has yet visited the planet.[22] Observations from Earth have shown seasonal change and increased weather activity as Uranus approached its equinox in 2007. Wind speeds can reach 250 metres per second (900 km/h; 560 mph).', 1, 4)
INSERT [dbo].[Planets] ([PlanetID], [PlanetName], [RecordedBy], [FirstRecord], [SurfaceTemperature], [OrbitPeriod], [OrbitDistance], [Rings], [NotableMoons], [KnownMoons], [EquatorialCircumference], [PolarDiameter], [EquatorialDiameter], [Mass], [atmosphere], [Description], [Status], [EmployeeID]) VALUES (5, N'Jupiter', N'Babylonian astronomers
', N'7th or 8th Century BC
', N'-108°C
', N'4,332.82 Earth days (11.86 Earth years)
', N'778,340,821', N'	4', N'Io, Europa, Ganymede, & Callisto', N'67', N'439,264 km
', N'133,709 km
', N'142,984 km
', N'1,898,130,000,000,000,000 billion kg (317.83 x Earth)
', N'89%±2.0% hydrogen,
10%±2.0% helium,
0.3%±0.1% methane,
0.026%±0.004% ammonia,
0.0028%±0.001% hydrogen deuteride,
0.0006%±0.0002% ethane,
0.0004%±0.0004% water.
', N'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun. Jupiter is the third brightest natural object in the Earth''s night sky after the Moon and Venus, and it has been observed since prehistoric times. It was named after Jupiter, the chief deity of ancient Roman religion.

Jupiter is primarily composed of hydrogen, followed by helium, which constitutes a quarter of its mass and a tenth of its volume. The ongoing contraction of Jupiter''s interior generates more heat than the planet receives from the Sun. Because of its rapid rotation rate of 1 rotation per 10 hours, the planet''s shape is an oblate spheroid: it has a slight but noticeable bulge around the equator. The outer atmosphere is divided into a series of latitudinal bands, with turbulence and storms along their interacting boundaries. A prominent result of this is the Great Red Spot, a giant storm which has been observed since at least 1831.

Jupiter is surrounded by a faint planetary ring system and has a powerful magnetosphere. The planet''s magnetic tail is nearly 800 million kilometres (5.3 astronomical units; 500 million miles) long. Jupiter has 95 known moons and probably many more, including the four large moons discovered by Galileo Galilei in 1610: Io, Europa, Ganymede, and Callisto. Ganymede, the largest of the four, is larger than the planet Mercury. Callisto is the second largest; Io and Europa are approximately the size of Earth''s moon.

Pioneer 10 was the first spacecraft to visit Jupiter, making its closest approach to the planet in December 1973. Jupiter has since been explored by multiple robotic spacecraft, beginning with the Pioneer and Voyager flyby missions from 1973 to 1979. The Galileo orbiter arrived in orbit around Jupiter in 1995. In 2007, New Horizons visited Jupiter for a gravity assist to increase its speed and bend its trajectory on the way to Pluto. The latest probe to visit Jupiter, Juno, entered its orbit in July 2016. Future targets for exploration in the Jupiter system include its moon Europa, which probably has an ice-covered liquid ocean which scientists think could sustain life.

Name and symbol
In both the ancient Greek and Roman civilizations, Jupiter was named after the chief god of the divine pantheon: Zeus to the Greeks and Jupiter to the Romans. The International Astronomical Union formally adopted the name Jupiter for the planet in 1976, and has since named its newly discovered satellites for the god''s lovers, favourites, and descendants.[16] The planetary symbol for Jupiter, ♃, descends from a Greek zeta with a horizontal stroke, ⟨Ƶ⟩, as an abbreviation for Zeus.[17][18]

In Germanic mythology, Jupiter is equated to Thor, the namesake of Thursday.[19] It has been theorized that this replaced the Latin name for the day, Dies Iovi (''Day of Jupiter'').[20] The Latin name Iovis is associated with the etymology of Zeus (''sky father''). The English equivalent, Jove, is only known to have come into use as a poetic name for the planet around the 14th century.[21]

The original Greek deity Zeus supplies the root zeno-, which is used to form some Jupiter-related words, such as zenographic.[c] Jovian is the adjectival form of Jupiter. The older adjectival form jovial, employed by astrologers in the Middle Ages, has come to mean ''happy'' or ''merry'', moods ascribed to Jupiter''s influence in astrology.', 1, 5)
SET IDENTITY_INSERT [dbo].[Planets] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Writer', N'Writer can create,delete your articles')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Moderator', N'Moderator can Publish,Update and Delete articles')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'Admin', N'admin has full rights in the system, including account management')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [RoleID], [Password], [Username], [EmployeeID]) VALUES (1, 3, N'12345', N'manhtretrau', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [Password], [Username], [EmployeeID]) VALUES (2, 2, N'12345', N'diaz', 2)
INSERT [dbo].[Users] ([UserID], [RoleID], [Password], [Username], [EmployeeID]) VALUES (3, 2, N'12345', N'chientretrau', 3)
INSERT [dbo].[Users] ([UserID], [RoleID], [Password], [Username], [EmployeeID]) VALUES (4, 1, N'12345', N'tungtretrau', 4)
INSERT [dbo].[Users] ([UserID], [RoleID], [Password], [Username], [EmployeeID]) VALUES (5, 1, N'12345', N'qatretrau', 5)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[FeedbackToComet] ADD  CONSTRAINT [DF_FeedbackToComet_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[FeedbacktoConstellations] ADD  CONSTRAINT [DF_FeedbacktoConstellations_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[FeedbackToNews] ADD  CONSTRAINT [DF_FeedbackToNews_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[FeedbacktoObservatory] ADD  CONSTRAINT [DF_FeedbacktoObservatory_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[FeedbackToPhenomena] ADD  CONSTRAINT [DF_FeedbackToPhenomena_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[FeedbacktoPlanets] ADD  CONSTRAINT [DF_Feedback_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_PostDate]  DEFAULT (getdate()) FOR [PostDate]
GO
ALTER TABLE [dbo].[Phenomenas] ADD  CONSTRAINT [DF_Phenomenas_PostDate]  DEFAULT (getdate()) FOR [PostDate]
GO
ALTER TABLE [dbo].[Comets]  WITH CHECK ADD  CONSTRAINT [FK_Comets_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Comets] CHECK CONSTRAINT [FK_Comets_Employee]
GO
ALTER TABLE [dbo].[Constellations]  WITH CHECK ADD  CONSTRAINT [FK_Constellations_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Constellations] CHECK CONSTRAINT [FK_Constellations_Employee]
GO
ALTER TABLE [dbo].[FeedbackToComet]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackToComet_Comets] FOREIGN KEY([CometID])
REFERENCES [dbo].[Comets] ([CometID])
GO
ALTER TABLE [dbo].[FeedbackToComet] CHECK CONSTRAINT [FK_FeedbackToComet_Comets]
GO
ALTER TABLE [dbo].[FeedbacktoConstellations]  WITH CHECK ADD  CONSTRAINT [FK_FeedbacktoConstellations_Constellations] FOREIGN KEY([ConstellationID])
REFERENCES [dbo].[Constellations] ([ConstellationID])
GO
ALTER TABLE [dbo].[FeedbacktoConstellations] CHECK CONSTRAINT [FK_FeedbacktoConstellations_Constellations]
GO
ALTER TABLE [dbo].[FeedbackToNews]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackToNews_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[FeedbackToNews] CHECK CONSTRAINT [FK_FeedbackToNews_News]
GO
ALTER TABLE [dbo].[FeedbacktoObservatory]  WITH CHECK ADD  CONSTRAINT [FK_FeedbacktoObservatory_Observatories] FOREIGN KEY([ObservatoryID])
REFERENCES [dbo].[Observatories] ([ObservatoryID])
GO
ALTER TABLE [dbo].[FeedbacktoObservatory] CHECK CONSTRAINT [FK_FeedbacktoObservatory_Observatories]
GO
ALTER TABLE [dbo].[FeedbackToPhenomena]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackToPhenomena_Phenomenas] FOREIGN KEY([PhenomenaID])
REFERENCES [dbo].[Phenomenas] ([PhenomenaID])
GO
ALTER TABLE [dbo].[FeedbackToPhenomena] CHECK CONSTRAINT [FK_FeedbackToPhenomena_Phenomenas]
GO
ALTER TABLE [dbo].[FeedbacktoPlanets]  WITH CHECK ADD  CONSTRAINT [FK_FeedbacktoPlanets_Planets] FOREIGN KEY([PlanetID])
REFERENCES [dbo].[Planets] ([PlanetID])
GO
ALTER TABLE [dbo].[FeedbacktoPlanets] CHECK CONSTRAINT [FK_FeedbacktoPlanets_Planets]
GO
ALTER TABLE [dbo].[ImageOfComet]  WITH CHECK ADD  CONSTRAINT [FK_ImageOfComet_Comets] FOREIGN KEY([CometID])
REFERENCES [dbo].[Comets] ([CometID])
GO
ALTER TABLE [dbo].[ImageOfComet] CHECK CONSTRAINT [FK_ImageOfComet_Comets]
GO
ALTER TABLE [dbo].[ImageOfConstellation]  WITH CHECK ADD  CONSTRAINT [FK_ImageOfConstellation_Constellations] FOREIGN KEY([ConstellationID])
REFERENCES [dbo].[Constellations] ([ConstellationID])
GO
ALTER TABLE [dbo].[ImageOfConstellation] CHECK CONSTRAINT [FK_ImageOfConstellation_Constellations]
GO
ALTER TABLE [dbo].[ImageOfNews]  WITH CHECK ADD  CONSTRAINT [FK_ImageOfNews_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[ImageOfNews] CHECK CONSTRAINT [FK_ImageOfNews_News]
GO
ALTER TABLE [dbo].[ImageOfObservatory]  WITH CHECK ADD  CONSTRAINT [FK_ImageOfObservatory_Observatories] FOREIGN KEY([ObservatoryID])
REFERENCES [dbo].[Observatories] ([ObservatoryID])
GO
ALTER TABLE [dbo].[ImageOfObservatory] CHECK CONSTRAINT [FK_ImageOfObservatory_Observatories]
GO
ALTER TABLE [dbo].[ImageOfPhenomena]  WITH CHECK ADD  CONSTRAINT [FK_ImageOfPhenomena_Phenomenas] FOREIGN KEY([PhenomenaID])
REFERENCES [dbo].[Phenomenas] ([PhenomenaID])
GO
ALTER TABLE [dbo].[ImageOfPhenomena] CHECK CONSTRAINT [FK_ImageOfPhenomena_Phenomenas]
GO
ALTER TABLE [dbo].[ImageOfPlanet]  WITH CHECK ADD  CONSTRAINT [FK_ImageOfPlanet_Planets] FOREIGN KEY([PlanetID])
REFERENCES [dbo].[Planets] ([PlanetID])
GO
ALTER TABLE [dbo].[ImageOfPlanet] CHECK CONSTRAINT [FK_ImageOfPlanet_Planets]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Employee]
GO
ALTER TABLE [dbo].[Observatories]  WITH CHECK ADD  CONSTRAINT [FK_Observatories_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Observatories] CHECK CONSTRAINT [FK_Observatories_Employee]
GO
ALTER TABLE [dbo].[Phenomenas]  WITH CHECK ADD  CONSTRAINT [FK_Phenomenas_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Phenomenas] CHECK CONSTRAINT [FK_Phenomenas_Employee]
GO
ALTER TABLE [dbo].[Planets]  WITH CHECK ADD  CONSTRAINT [FK_Planets_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Planets] CHECK CONSTRAINT [FK_Planets_Employee]
GO
ALTER TABLE [dbo].[Planets]  WITH CHECK ADD  CONSTRAINT [FK_Planets_Employee1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Planets] CHECK CONSTRAINT [FK_Planets_Employee1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employee]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'getdate()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FeedbackToPhenomena', @level2type=N'COLUMN',@level2name=N'Date'
GO
USE [master]
GO
ALTER DATABASE [Astronomy] SET  READ_WRITE 
GO
