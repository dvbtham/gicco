USE [master]
GO
/****** Object:  Database [GiccoDb]    Script Date: 19/10/2018 6:13:59 PM ******/
CREATE DATABASE [GiccoDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GiccoDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GiccoDb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GiccoDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GiccoDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GiccoDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GiccoDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GiccoDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GiccoDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GiccoDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GiccoDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GiccoDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [GiccoDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GiccoDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GiccoDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GiccoDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GiccoDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GiccoDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GiccoDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GiccoDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GiccoDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GiccoDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GiccoDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GiccoDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GiccoDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GiccoDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GiccoDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GiccoDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GiccoDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GiccoDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GiccoDb] SET  MULTI_USER 
GO
ALTER DATABASE [GiccoDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GiccoDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GiccoDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GiccoDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GiccoDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GiccoDb] SET QUERY_STORE = OFF
GO
USE [GiccoDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [GiccoDb]
GO
/****** Object:  User [su]    Script Date: 19/10/2018 6:13:59 PM ******/
CREATE USER [su] FOR LOGIN [su] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [su]
GO
ALTER ROLE [db_datareader] ADD MEMBER [su]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [su]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19/10/2018 6:13:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityLog_Activity]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLog_Activity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ActivityTypeId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[EntityTypeId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ActivityLog_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityLog_ActivityType]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLog_ActivityType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ActivityLog_ActivityType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_Brand]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_Brand](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsPublished] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Catalog_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_Category]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[IncludeInMenu] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ParentId] [bigint] NULL,
	[ThumbnailImageId] [bigint] NULL,
 CONSTRAINT [PK_Catalog_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_Product]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[IsPublished] [bit] NOT NULL,
	[PublishedOn] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedById] [bigint] NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedById] [bigint] NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Specification] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OldPrice] [decimal](18, 2) NULL,
	[SpecialPrice] [decimal](18, 2) NULL,
	[SpecialPriceStart] [datetimeoffset](7) NULL,
	[SpecialPriceEnd] [datetimeoffset](7) NULL,
	[HasOptions] [bit] NOT NULL,
	[IsVisibleIndividually] [bit] NOT NULL,
	[IsFeatured] [bit] NOT NULL,
	[IsCallForPricing] [bit] NOT NULL,
	[IsAllowToOrder] [bit] NOT NULL,
	[StockTrackingIsEnabled] [bit] NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[Sku] [nvarchar](450) NULL,
	[Gtin] [nvarchar](450) NULL,
	[NormalizedName] [nvarchar](450) NULL,
	[DisplayOrder] [int] NOT NULL,
	[VendorId] [bigint] NULL,
	[ThumbnailImageId] [bigint] NULL,
	[ReviewsCount] [int] NOT NULL,
	[RatingAverage] [float] NULL,
	[BrandId] [bigint] NULL,
	[TaxClassId] [bigint] NULL,
 CONSTRAINT [PK_Catalog_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductAttribute]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductAttribute](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[GroupId] [bigint] NOT NULL,
 CONSTRAINT [PK_Catalog_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductAttributeGroup]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductAttributeGroup](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Catalog_ProductAttributeGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductAttributeValue]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductAttributeValue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AttributeId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Catalog_ProductAttributeValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductCategory]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IsFeaturedProduct] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_Catalog_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductLink]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductLink](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[LinkedProductId] [bigint] NOT NULL,
	[LinkType] [int] NOT NULL,
 CONSTRAINT [PK_Catalog_ProductLink] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductMedia]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductMedia](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[MediaId] [bigint] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Catalog_ProductMedia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductOption]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductOption](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Catalog_ProductOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductOptionCombination]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductOptionCombination](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[OptionId] [bigint] NOT NULL,
	[Value] [nvarchar](max) NULL,
	[SortIndex] [int] NOT NULL,
 CONSTRAINT [PK_Catalog_ProductOptionCombination] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductOptionValue]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductOptionValue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OptionId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Value] [nvarchar](max) NULL,
	[DisplayType] [nvarchar](max) NULL,
	[SortIndex] [int] NOT NULL,
 CONSTRAINT [PK_Catalog_ProductOptionValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductPriceHistory]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductPriceHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NULL,
	[CreatedById] [bigint] NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[OldPrice] [decimal](18, 2) NULL,
	[SpecialPrice] [decimal](18, 2) NULL,
	[SpecialPriceStart] [datetimeoffset](7) NULL,
	[SpecialPriceEnd] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Catalog_ProductPriceHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductTemplate]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductTemplate](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Catalog_ProductTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog_ProductTemplateProductAttribute]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog_ProductTemplateProductAttribute](
	[ProductTemplateId] [bigint] NOT NULL,
	[ProductAttributeId] [bigint] NOT NULL,
 CONSTRAINT [PK_Catalog_ProductTemplateProductAttribute] PRIMARY KEY CLUSTERED 
(
	[ProductTemplateId] ASC,
	[ProductAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cms_Menu]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cms_Menu](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[IsSystem] [bit] NOT NULL,
 CONSTRAINT [PK_Cms_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cms_MenuItem]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cms_MenuItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentId] [bigint] NULL,
	[MenuId] [bigint] NOT NULL,
	[EntityId] [bigint] NULL,
	[CustomLink] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Cms_MenuItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cms_Page]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cms_Page](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[IsPublished] [bit] NOT NULL,
	[PublishedOn] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedById] [bigint] NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedById] [bigint] NULL,
	[Body] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cms_Page] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments_Comment]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments_Comment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[CommentText] [nvarchar](max) NULL,
	[CommenterName] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[EntityTypeId] [nvarchar](max) NULL,
	[EntityId] [bigint] NOT NULL,
	[ParentId] [bigint] NULL,
 CONSTRAINT [PK_Comments_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts_Contact]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts_Contact](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[ContactAreaId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Contacts_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts_ContactArea]    Script Date: 19/10/2018 6:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts_ContactArea](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Contacts_ContactArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_Address]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_Address](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[AddressLine1] [nvarchar](max) NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[DistrictId] [bigint] NULL,
	[StateOrProvinceId] [bigint] NOT NULL,
	[CountryId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Core_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_AppSetting]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_AppSetting](
	[Id] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Module] [nvarchar](max) NULL,
	[IsVisibleInCommonSettingPage] [bit] NOT NULL,
 CONSTRAINT [PK_Core_AppSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_Country]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_Country](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Code3] [nvarchar](max) NULL,
	[IsBillingEnabled] [bit] NOT NULL,
	[IsShippingEnabled] [bit] NOT NULL,
	[IsCityEnabled] [bit] NOT NULL,
	[IsZipCodeEnabled] [bit] NOT NULL,
	[IsDistrictEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Core_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_CustomerGroup]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_CustomerGroup](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Core_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_CustomerGroupUser]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_CustomerGroupUser](
	[UserId] [bigint] NOT NULL,
	[CustomerGroupId] [bigint] NOT NULL,
 CONSTRAINT [PK_Core_CustomerGroupUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_District]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_District](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateOrProvinceId] [bigint] NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_Entity]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_Entity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[EntityId] [bigint] NOT NULL,
	[EntityTypeId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Core_Entity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_EntityType]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_EntityType](
	[Id] [nvarchar](450) NOT NULL,
	[IsMenuable] [bit] NOT NULL,
	[AreaName] [nvarchar](450) NULL,
	[RoutingController] [nvarchar](450) NULL,
	[RoutingAction] [nvarchar](450) NULL,
 CONSTRAINT [PK_Core_EntityType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_Media]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_Media](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](max) NULL,
	[FileSize] [int] NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[MediaType] [int] NOT NULL,
 CONSTRAINT [PK_Core_Media] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_Role]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_Role](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_RoleClaim]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_RoleClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_RoleClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_StateOrProvince]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_StateOrProvince](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [nvarchar](450) NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_StateOrProvince] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_User]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserGuid] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](450) NOT NULL,
	[VendorId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
	[DefaultShippingAddressId] [bigint] NULL,
	[DefaultBillingAddressId] [bigint] NULL,
	[RefreshTokenHash] [nvarchar](max) NULL,
	[Culture] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_UserAddress]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_UserAddress](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[AddressType] [int] NOT NULL,
	[LastUsedOn] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Core_UserAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_UserClaim]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_UserClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_UserClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_UserLogin]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_UserLogin](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_Core_UserLogin] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_UserRole]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_UserRole](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
 CONSTRAINT [PK_Core_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_UserToken]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_UserToken](
	[UserId] [bigint] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_UserToken] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_Vendor]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_Vendor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Core_Vendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_Widget]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_Widget](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[ViewComponentName] [nvarchar](max) NULL,
	[CreateUrl] [nvarchar](max) NULL,
	[EditUrl] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[IsPublished] [bit] NOT NULL,
 CONSTRAINT [PK_Core_Widget] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_WidgetInstance]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_WidgetInstance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
	[PublishStart] [datetimeoffset](7) NULL,
	[PublishEnd] [datetimeoffset](7) NULL,
	[WidgetId] [nvarchar](450) NULL,
	[WidgetZoneId] [bigint] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[HtmlData] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_WidgetInstance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_WidgetZone]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_WidgetZone](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Core_WidgetZone] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory_Stock]    Script Date: 19/10/2018 6:14:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Stock](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[WarehouseId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ReservedQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Inventory_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory_StockHistory]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_StockHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[WareHouseId] [bigint] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[CreatedById] [bigint] NOT NULL,
	[AdjustedQuantity] [bigint] NOT NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Inventory_StockHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory_Warehouse]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Warehouse](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[VendorId] [bigint] NULL,
 CONSTRAINT [PK_Inventory_Warehouse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localization_Culture]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localization_Culture](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Localization_Culture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localization_Resource]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localization_Resource](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[CultureId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Localization_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News_NewsCategory]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_NewsCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_News_NewsCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News_NewsItem]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_NewsItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[IsPublished] [bit] NOT NULL,
	[PublishedOn] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedById] [bigint] NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedById] [bigint] NULL,
	[ShortContent] [nvarchar](max) NULL,
	[FullContent] [nvarchar](max) NULL,
	[ThumbnailImageId] [bigint] NULL,
 CONSTRAINT [PK_News_NewsItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News_NewsItemCategory]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_NewsItemCategory](
	[CategoryId] [bigint] NOT NULL,
	[NewsItemId] [bigint] NOT NULL,
 CONSTRAINT [PK_News_NewsItemCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[NewsItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Order]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
	[CreatedById] [bigint] NOT NULL,
	[VendorId] [bigint] NULL,
	[CouponCode] [nvarchar](max) NULL,
	[CouponRuleName] [nvarchar](max) NULL,
	[DiscountAmount] [decimal](18, 2) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[SubTotalWithDiscount] [decimal](18, 2) NOT NULL,
	[ShippingAddressId] [bigint] NOT NULL,
	[BillingAddressId] [bigint] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[ParentId] [bigint] NULL,
	[IsMasterOrder] [bit] NOT NULL,
	[ShippingMethod] [nvarchar](max) NULL,
	[ShippingFeeAmount] [decimal](18, 2) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[OrderTotal] [decimal](18, 2) NOT NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[PaymentFeeAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_OrderAddress]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_OrderAddress](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[AddressLine1] [nvarchar](max) NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[DistrictId] [bigint] NULL,
	[StateOrProvinceId] [bigint] NOT NULL,
	[CountryId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Orders_OrderAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_OrderHistory]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_OrderHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[OldStatus] [int] NULL,
	[NewStatus] [int] NOT NULL,
	[OrderSnapshot] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[CreatedById] [bigint] NOT NULL,
 CONSTRAINT [PK_Orders_OrderHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_OrderItem]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_OrderItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[ProductId] [bigint] NOT NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[DiscountAmount] [decimal](18, 2) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[TaxPercent] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments_Payment]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments_Payment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentFee] [decimal](18, 2) NOT NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[GatewayTransactionId] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[FailureMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Payments_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments_PaymentProvider]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments_PaymentProvider](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[ConfigureUrl] [nvarchar](max) NULL,
	[LandingViewComponentName] [nvarchar](max) NULL,
	[AdditionalSettings] [nvarchar](max) NULL,
 CONSTRAINT [PK_Payments_PaymentProvider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing_CartRule]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing_CartRule](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[StartOn] [datetimeoffset](7) NULL,
	[EndOn] [datetimeoffset](7) NULL,
	[IsCouponRequired] [bit] NOT NULL,
	[RuleToApply] [nvarchar](max) NULL,
	[DiscountAmount] [decimal](18, 2) NOT NULL,
	[MaxDiscountAmount] [decimal](18, 2) NULL,
	[DiscountStep] [int] NULL,
	[UsageLimitPerCoupon] [int] NULL,
	[UsageLimitPerCustomer] [int] NULL,
 CONSTRAINT [PK_Pricing_CartRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing_CartRuleCategory]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing_CartRuleCategory](
	[CategoryId] [bigint] NOT NULL,
	[CartRuleId] [bigint] NOT NULL,
 CONSTRAINT [PK_Pricing_CartRuleCategory] PRIMARY KEY CLUSTERED 
(
	[CartRuleId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing_CartRuleCustomerGroup]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing_CartRuleCustomerGroup](
	[CartRuleId] [bigint] NOT NULL,
	[CustomerGroupId] [bigint] NOT NULL,
 CONSTRAINT [PK_Pricing_CartRuleCustomerGroup] PRIMARY KEY CLUSTERED 
(
	[CartRuleId] ASC,
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing_CartRuleProduct]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing_CartRuleProduct](
	[ProductId] [bigint] NOT NULL,
	[CartRuleId] [bigint] NOT NULL,
 CONSTRAINT [PK_Pricing_CartRuleProduct] PRIMARY KEY CLUSTERED 
(
	[CartRuleId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing_CartRuleUsage]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing_CartRuleUsage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CartRuleId] [bigint] NOT NULL,
	[CouponId] [bigint] NULL,
	[UserId] [bigint] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Pricing_CartRuleUsage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing_CatalogRule]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing_CatalogRule](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[StartOn] [datetimeoffset](7) NULL,
	[EndOn] [datetimeoffset](7) NULL,
	[RuleToApply] [nvarchar](max) NULL,
	[DiscountAmount] [decimal](18, 2) NOT NULL,
	[MaxDiscountAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Pricing_CatalogRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing_CatalogRuleCustomerGroup]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing_CatalogRuleCustomerGroup](
	[CatalogRuleId] [bigint] NOT NULL,
	[CustomerGroupId] [bigint] NOT NULL,
 CONSTRAINT [PK_Pricing_CatalogRuleCustomerGroup] PRIMARY KEY CLUSTERED 
(
	[CatalogRuleId] ASC,
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing_Coupon]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing_Coupon](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CartRuleId] [bigint] NOT NULL,
	[Code] [nvarchar](450) NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Pricing_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductComparison_ComparingProduct]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComparison_ComparingProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductComparison_ComparingProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRecentlyViewed_RecentlyViewedProduct]    Script Date: 19/10/2018 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRecentlyViewed_RecentlyViewedProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[LatestViewedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ProductRecentlyViewed_RecentlyViewedProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews_Reply]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews_Reply](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReviewId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[ReplierName] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Reviews_Reply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews_Review]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews_Review](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[ReviewerName] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[EntityTypeId] [nvarchar](max) NULL,
	[EntityId] [bigint] NOT NULL,
 CONSTRAINT [PK_Reviews_Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Search_Query]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Search_Query](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QueryText] [nvarchar](500) NOT NULL,
	[ResultsCount] [int] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Search_Query] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments_Shipment]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments_Shipment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[TrackingNumber] [nvarchar](450) NULL,
	[WarehouseId] [bigint] NOT NULL,
	[VendorId] [bigint] NULL,
	[CreatedById] [bigint] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Shipments_Shipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments_ShipmentItem]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments_ShipmentItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ShipmentId] [bigint] NOT NULL,
	[OrderItemId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Shipments_ShipmentItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping_ShippingProvider]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping_ShippingProvider](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[ConfigureUrl] [nvarchar](max) NULL,
	[ToAllShippingEnabledCountries] [bit] NOT NULL,
	[OnlyCountryIdsString] [nvarchar](max) NULL,
	[ToAllShippingEnabledStatesOrProvinces] [bit] NOT NULL,
	[OnlyStateOrProvinceIdsString] [nvarchar](max) NULL,
	[AdditionalSettings] [nvarchar](max) NULL,
	[ShippingPriceServiceTypeName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Shipping_ShippingProvider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingTableRate_PriceAndDestination]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingTableRate_PriceAndDestination](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [nvarchar](450) NULL,
	[StateOrProvinceId] [bigint] NULL,
	[DistrictId] [bigint] NULL,
	[ZipCode] [nvarchar](450) NULL,
	[Note] [nvarchar](max) NULL,
	[MinOrderSubtotal] [decimal](18, 2) NOT NULL,
	[ShippingPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ShippingTableRate_PriceAndDestination] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart_Cart]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart_Cart](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NULL,
	[IsActive] [bit] NOT NULL,
	[CouponCode] [nvarchar](max) NULL,
	[CouponRuleName] [nvarchar](max) NULL,
	[ShippingMethod] [nvarchar](max) NULL,
	[IsProductPriceIncludeTax] [bit] NOT NULL,
	[ShippingAmount] [decimal](18, 2) NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[ShippingData] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShoppingCart_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart_CartItem]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart_CartItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CartId] [bigint] NOT NULL,
 CONSTRAINT [PK_ShoppingCart_CartItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tax_TaxClass]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax_TaxClass](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Tax_TaxClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tax_TaxRate]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax_TaxRate](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaxClassId] [bigint] NOT NULL,
	[CountryId] [nvarchar](450) NULL,
	[StateOrProvinceId] [bigint] NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[ZipCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tax_TaxRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList_WishList]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList_WishList](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[SharingCode] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_WishList_WishList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList_WishListItem]    Script Date: 19/10/2018 6:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList_WishListItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WishListId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NOT NULL,
	[UpdatedOn] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_WishList_WishListItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181003043253_InitDb', N'2.1.3-rtm-32065')
SET IDENTITY_INSERT [dbo].[ActivityLog_Activity] ON 

INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (1, 1, 13, CAST(N'2018-10-03T11:45:14.2525362+07:00' AS DateTimeOffset), 18, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (2, 1, 13, CAST(N'2018-10-03T11:45:14.4034984+07:00' AS DateTimeOffset), 18, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (3, 1, 13, CAST(N'2018-10-03T11:45:33.9053771+07:00' AS DateTimeOffset), 9, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (4, 1, 13, CAST(N'2018-10-03T11:45:33.9756309+07:00' AS DateTimeOffset), 9, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (5, 1, 10, CAST(N'2018-10-03T15:45:04.9266372+07:00' AS DateTimeOffset), 5, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (6, 1, 10, CAST(N'2018-10-03T15:45:05.3319831+07:00' AS DateTimeOffset), 5, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (7, 1, 10, CAST(N'2018-10-05T12:52:01.4952153+07:00' AS DateTimeOffset), 20, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (8, 1, 10, CAST(N'2018-10-05T12:52:01.7301159+07:00' AS DateTimeOffset), 20, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (9, 1, 10, CAST(N'2018-10-08T17:31:12.3024958+07:00' AS DateTimeOffset), 21, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (10, 1, 10, CAST(N'2018-10-08T17:31:12.4877112+07:00' AS DateTimeOffset), 21, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (11, 1, 10, CAST(N'2018-10-17T19:51:36.3866105+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (12, 1, 10, CAST(N'2018-10-17T19:51:36.6528987+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (13, 1, 10, CAST(N'2018-10-18T12:54:11.5750190+07:00' AS DateTimeOffset), 18, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (14, 1, 10, CAST(N'2018-10-18T12:54:11.7724774+07:00' AS DateTimeOffset), 18, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (15, 1, 10, CAST(N'2018-10-18T12:54:45.9694918+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (16, 1, 10, CAST(N'2018-10-18T12:54:46.0280374+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (17, 1, 10, CAST(N'2018-10-18T13:00:49.6893669+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (18, 1, 10, CAST(N'2018-10-18T13:00:49.7067063+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (19, 1, 10, CAST(N'2018-10-18T13:01:25.2090493+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (20, 1, 10, CAST(N'2018-10-18T13:01:25.2228125+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (21, 1, 10, CAST(N'2018-10-18T13:03:39.9835759+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (22, 1, 10, CAST(N'2018-10-18T13:03:39.9996279+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (23, 1, 10, CAST(N'2018-10-18T13:04:10.6778939+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (24, 1, 10, CAST(N'2018-10-18T13:04:10.6936031+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (25, 1, 10, CAST(N'2018-10-18T13:05:04.7602770+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (26, 1, 10, CAST(N'2018-10-18T13:05:04.7774267+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (27, 1, 10, CAST(N'2018-10-18T13:06:03.5925793+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (28, 1, 10, CAST(N'2018-10-18T13:06:03.6121575+07:00' AS DateTimeOffset), 22, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (29, 1, 10, CAST(N'2018-10-19T17:07:00.1327880+07:00' AS DateTimeOffset), 18, N'Product')
INSERT [dbo].[ActivityLog_Activity] ([Id], [ActivityTypeId], [UserId], [CreatedOn], [EntityId], [EntityTypeId]) VALUES (30, 1, 10, CAST(N'2018-10-19T17:07:00.3554348+07:00' AS DateTimeOffset), 18, N'Product')
SET IDENTITY_INSERT [dbo].[ActivityLog_Activity] OFF
SET IDENTITY_INSERT [dbo].[ActivityLog_ActivityType] ON 

INSERT [dbo].[ActivityLog_ActivityType] ([Id], [Name]) VALUES (1, N'EntityView')
SET IDENTITY_INSERT [dbo].[ActivityLog_ActivityType] OFF
SET IDENTITY_INSERT [dbo].[Catalog_Brand] ON 

INSERT [dbo].[Catalog_Brand] ([Id], [Name], [Slug], [Description], [IsPublished], [IsDeleted]) VALUES (1, N'Adidas', N'adidas', NULL, 1, 0)
INSERT [dbo].[Catalog_Brand] ([Id], [Name], [Slug], [Description], [IsPublished], [IsDeleted]) VALUES (2, N'Calvin Klein', N'calvin-klein', NULL, 1, 0)
INSERT [dbo].[Catalog_Brand] ([Id], [Name], [Slug], [Description], [IsPublished], [IsDeleted]) VALUES (3, N'Ogival', N'ogival', NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Catalog_Brand] OFF
SET IDENTITY_INSERT [dbo].[Catalog_Category] ON 

INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (1, N'Thời trang nữ', N'thoi-trang-nu', NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (2, N'Man', N'man', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 16, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (3, N'Thiết bị điện tử', N'thiet-bi-dien-tu', NULL, NULL, NULL, NULL, 2, 1, 1, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (4, N'Phụ kiện điện tử', N'phu-kien-dien-tu', NULL, NULL, NULL, NULL, 4, 1, 1, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (5, N'T-Shirt', N't-shirt', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 2, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (6, N'Suit', N'suit', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 2, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (16, N'Thời trang nam', N'thoi-trang-nam', NULL, NULL, NULL, NULL, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (17, N'Skirts', N'skirts', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 2, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (18, N'Skirts', N'woman-skirts', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (19, N'T-Shirt', N'woman-t-shirt', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (20, N'Couple', N'couple', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 16, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (21, N'T-Shirt', N't-shirt-2', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 20, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (22, N'Shoes', N'shoes-2', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 20, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (23, N'Sức Khỏe Và Làm Đẹp', N'suc-khoe-va-lam-dep', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (24, N'Siêu thị tạp hóa', N'sieu-thi-tap-hoa', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (25, N'TV & Điện Gia Dụng', N'tv-&-dien-gia-dung', NULL, NULL, NULL, NULL, 3, 1, 1, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (26, N'Phụ kiện di động', N'phu-kien-di-dong', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 4, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (27, N'Phụ kiện máy tính', N'phu-kien-may-tinh', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 4, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (28, N'SIM & Thẻ cào', N'sim-&-the-cao', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 26, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (29, N'Pin sạc dự phòng', N'pin-sac-du-phong', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 26, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (30, N'Phụ kiện Tivi', N'phu-kien-tivi', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 25, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (31, N'xvcvx', N'xvcvx', NULL, NULL, NULL, NULL, 0, 1, 0, 1, 4, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (32, N'gggg', N'gggg', NULL, NULL, NULL, NULL, 0, 1, 0, 1, 4, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (33, N'đsdfsdf', N'dsdfsdf', NULL, NULL, NULL, NULL, 0, 1, 0, 1, 4, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (34, N'Sức Khỏe Và Làm Đẹp', N'suc-khoe-va-lam-dep-2', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (35, N'Phụ kiện thời trang', N'phu-kien-thoi-trang', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (36, N'Ôtô, Xe máy & Thiết bị định vị', N'oto,-xe-may-&-thiet-bi-dinh-vi', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (37, N'Thể thao và du lịch', N'the-thao-va-du-lich', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (38, N'Hàng gia dụng và đời sống', N'hang-gia-dung-va-doi-song', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (39, N'Hàng mẹ, bé và đồ chơi', N'hang-me,-be-va-do-choi', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (40, N'Xe máy', N'xe-may', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 36, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (41, N'Ôtô', N'oto', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 36, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (42, N'Dịch vụ chăm sóc xe', N'dich-vu-cham-soc-xe', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 36, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (43, N'Phụ tùng & phụ kiện xe máy', N'phu-tung-&-phu-kien-xe-may', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 36, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (44, N'Lắp đặt lốp và mâm ôtô', N'lap-dat-lop-va-mam-oto', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 36, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (45, N'Lắp đặt phụ kiện', N'lap-dat-phu-kien', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 42, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (46, N'Dịch vụ về động cơ', N'dich-vu-ve-dong-co', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 42, NULL)
INSERT [dbo].[Catalog_Category] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [Description], [DisplayOrder], [IsPublished], [IncludeInMenu], [IsDeleted], [ParentId], [ThumbnailImageId]) VALUES (47, N'Dịch vụ về thắng', N'dich-vu-ve-thang', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 42, NULL)
SET IDENTITY_INSERT [dbo].[Catalog_Category] OFF
SET IDENTITY_INSERT [dbo].[Catalog_Product] ON 

INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (1, N'Lightweight Jacket', N'lightweight-jacket', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T15:02:17.0131910+07:00' AS DateTimeOffset), CAST(N'2018-08-11T15:02:17.0133446+07:00' AS DateTimeOffset), 10, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (2, N'Lightweight Jacket M Black', N'lightweight-jacket-m-black', NULL, NULL, NULL, 1, CAST(N'2018-08-11T15:02:17.0496868+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T15:02:17.0490714+07:00' AS DateTimeOffset), CAST(N'2018-08-11T15:02:17.0490747+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'M-Black', 0, NULL, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (3, N'Lightweight Jacket M Gray', N'lightweight-jacket-m-gray', NULL, NULL, NULL, 1, CAST(N'2018-08-11T15:02:17.0554427+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T15:02:17.0554403+07:00' AS DateTimeOffset), CAST(N'2018-08-11T15:02:17.0554418+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'M-Gray', 0, NULL, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (4, N'Lightweight Jacket L Black', N'lightweight-jacket-l-black', NULL, NULL, NULL, 1, CAST(N'2018-08-11T15:02:17.0554601+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T15:02:17.0554598+07:00' AS DateTimeOffset), CAST(N'2018-08-11T15:02:17.0554598+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'L-Black', 0, NULL, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (5, N'Lightweight Jacket L Gray', N'lightweight-jacket-l-gray', NULL, NULL, NULL, 1, CAST(N'2018-08-11T15:02:17.0554688+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T15:02:17.0554685+07:00' AS DateTimeOffset), CAST(N'2018-08-11T15:02:17.0554686+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'L-Gray', 0, NULL, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (6, N'Lightweight Jacket S Black', N'lightweight-jacket-s-black', NULL, NULL, NULL, 1, CAST(N'2018-08-11T15:02:17.0554741+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T15:02:17.0554738+07:00' AS DateTimeOffset), CAST(N'2018-08-11T15:02:17.0554739+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'S-Black', 0, NULL, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (7, N'Lightweight Jacket S Gray', N'lightweight-jacket-s-gray', NULL, NULL, NULL, 1, CAST(N'2018-08-11T15:02:17.0554798+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T15:02:17.0554795+07:00' AS DateTimeOffset), CAST(N'2018-08-11T15:02:17.0554796+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'S-Gray', 0, NULL, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (8, N'Esprit Ruffle Shirt', N'esprit-ruffle-shirt', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:14:54.9500292+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:14:54.9500303+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(16.64 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 5, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (9, N'Herschel supply', N'herschel-supply', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:16:28.3513281+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:16:28.3513289+07:00' AS DateTimeOffset), NULL, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(35.31 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 7, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (10, N'Only Check Trouser', N'only-check-trouser', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:17:33.9968471+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:17:33.9968483+07:00' AS DateTimeOffset), 10, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(25.50 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 9, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (11, N'Classic Trench Coat', N'classic-trench-coat', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:18:38.8006442+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:18:38.8006452+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(75.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 11, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (12, N'Front Pocket Jumper', N'front-pocket-jumper', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:20:26.0181214+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:20:26.0181225+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(34.75 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 13, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (13, N'Vintage Inspired Classic', N'vintage-inspired-classic', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:22:07.9910541+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:22:07.9910553+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(93.20 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 15, 0, NULL, 3, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (14, N'Shirt in Stretch Cotton', N'shirt-in-stretch-cotton', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:23:06.0599222+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:23:06.0599232+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(52.66 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 17, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (15, N'Pieces Metallic Printed', N'pieces-metallic-printed', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:24:48.0791813+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:24:48.0791822+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(18.96 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 19, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (16, N'Converse All Star Hi Plimsolls', N'converse-all-star-hi-plimsolls', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:26:22.6986514+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:26:22.6986524+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(75.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 21, 0, NULL, 1, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (17, N'Femme T-Shirt In Stripe', N'femme-t-shirt-in-stripe', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:27:33.7510433+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:27:33.7510446+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(25.85 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 23, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (18, N'Herschel supply', N'herschel-supply-2', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:28:33.4852442+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:28:33.4852456+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(63.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 25, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (19, N'Herschel supply', N'herschel-supply-2-3', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:29:44.3076497+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:29:44.3076505+07:00' AS DateTimeOffset), 10, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(63.15 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 27, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (20, N'T-Shirt with Sleeve', N't-shirt-with-sleeve', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:30:56.2639586+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:30:56.2639602+07:00' AS DateTimeOffset), 10, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(18.49 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 29, 1, 5, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (21, N'Pretty Little Thing', N'pretty-little-thing', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:32:22.4371355+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:32:22.4371365+07:00' AS DateTimeOffset), 10, N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.</span><br></p>', N'<p>Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.<br></p>', NULL, CAST(54.79 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 31, 0, NULL, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (22, N'Square Neck Back', N'square-neck-back', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T18:33:38.3028193+07:00' AS DateTimeOffset), CAST(N'2018-08-11T18:33:38.3028200+07:00' AS DateTimeOffset), 10, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 100, NULL, NULL, NULL, 0, NULL, 34, 1, 5, 2, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (23, N'Square Neck Back Silver S', N'square-neck-back-silver-s', NULL, NULL, NULL, 1, CAST(N'2018-08-11T19:24:26.1186306+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T19:24:26.1186262+07:00' AS DateTimeOffset), CAST(N'2018-08-11T19:24:26.1186289+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'Silver-S', 0, NULL, 34, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (24, N'Square Neck Back Silver M', N'square-neck-back-silver-m', NULL, NULL, NULL, 1, CAST(N'2018-08-11T19:24:26.1245088+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T19:24:26.1245061+07:00' AS DateTimeOffset), CAST(N'2018-08-11T19:24:26.1245075+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'Silver-M', 0, NULL, 34, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (25, N'Square Neck Back Gray S', N'square-neck-back-gray-s', NULL, NULL, NULL, 1, CAST(N'2018-08-11T19:24:26.1245475+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T19:24:26.1245466+07:00' AS DateTimeOffset), CAST(N'2018-08-11T19:24:26.1245470+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'Gray-S', 0, NULL, 34, 0, NULL, NULL, 1)
INSERT [dbo].[Catalog_Product] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [ShortDescription], [Description], [Specification], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd], [HasOptions], [IsVisibleIndividually], [IsFeatured], [IsCallForPricing], [IsAllowToOrder], [StockTrackingIsEnabled], [StockQuantity], [Sku], [Gtin], [NormalizedName], [DisplayOrder], [VendorId], [ThumbnailImageId], [ReviewsCount], [RatingAverage], [BrandId], [TaxClassId]) VALUES (26, N'Square Neck Back Gray M', N'square-neck-back-gray-m', NULL, NULL, NULL, 1, CAST(N'2018-08-11T19:24:26.1245624+07:00' AS DateTimeOffset), 0, NULL, CAST(N'2018-08-11T19:24:26.1245617+07:00' AS DateTimeOffset), CAST(N'2018-08-11T19:24:26.1245620+07:00' AS DateTimeOffset), NULL, N'<p>Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.<br></p>', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, sans-serif; font-size: 15px;">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</span><br></p>', NULL, CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 100, NULL, NULL, N'Gray-M', 0, NULL, 34, 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Catalog_Product] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductAttribute] ON 

INSERT [dbo].[Catalog_ProductAttribute] ([Id], [Name], [GroupId]) VALUES (19, N'ds', 5)
SET IDENTITY_INSERT [dbo].[Catalog_ProductAttribute] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductAttributeGroup] ON 

INSERT [dbo].[Catalog_ProductAttributeGroup] ([Id], [Name]) VALUES (5, N'Screen')
SET IDENTITY_INSERT [dbo].[Catalog_ProductAttributeGroup] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductCategory] ON 

INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (1, 0, 0, 5, 1)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (2, 0, 0, 2, 7)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (3, 0, 0, 5, 7)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (4, 0, 0, 2, 6)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (5, 0, 0, 5, 6)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (6, 0, 0, 2, 5)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (7, 0, 0, 5, 5)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (8, 0, 0, 2, 4)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (9, 0, 0, 5, 4)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (10, 0, 0, 5, 3)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (11, 0, 0, 2, 2)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (12, 0, 0, 5, 2)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (13, 0, 0, 2, 3)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (14, 0, 0, 2, 1)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (15, 0, 0, 1, 8)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (16, 0, 0, 1, 9)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (17, 0, 0, 2, 10)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (18, 0, 0, 1, 11)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (19, 0, 0, 1, 12)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (20, 0, 0, 4, 13)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (21, 0, 0, 2, 13)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (22, 0, 0, 1, 14)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (23, 0, 0, 1, 15)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (24, 0, 0, 3, 16)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (25, 0, 0, 1, 17)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (26, 0, 0, 2, 18)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (27, 0, 0, 5, 18)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (28, 0, 0, 2, 19)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (29, 0, 0, 1, 20)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (30, 0, 0, 1, 21)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (31, 0, 0, 1, 22)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (32, 0, 0, 1, 23)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (33, 0, 0, 1, 24)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (34, 0, 0, 1, 25)
INSERT [dbo].[Catalog_ProductCategory] ([Id], [IsFeaturedProduct], [DisplayOrder], [CategoryId], [ProductId]) VALUES (35, 0, 0, 1, 26)
SET IDENTITY_INSERT [dbo].[Catalog_ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductLink] ON 

INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (1, 1, 2, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (2, 1, 7, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (4, 1, 6, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (5, 1, 4, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (6, 1, 5, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (7, 22, 23, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (8, 22, 24, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (9, 22, 25, 1)
INSERT [dbo].[Catalog_ProductLink] ([Id], [ProductId], [LinkedProductId], [LinkType]) VALUES (10, 22, 26, 1)
SET IDENTITY_INSERT [dbo].[Catalog_ProductLink] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductMedia] ON 

INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (1, 1, 2, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (2, 1, 3, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (3, 1, 4, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (4, 8, 6, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (5, 9, 8, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (6, 10, 10, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (7, 11, 12, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (8, 12, 14, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (9, 13, 16, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (10, 14, 18, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (11, 15, 20, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (12, 16, 22, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (13, 17, 24, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (14, 18, 26, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (15, 19, 28, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (16, 20, 30, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (17, 21, 32, 0)
INSERT [dbo].[Catalog_ProductMedia] ([Id], [ProductId], [MediaId], [DisplayOrder]) VALUES (18, 22, 33, 0)
SET IDENTITY_INSERT [dbo].[Catalog_ProductMedia] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductOption] ON 

INSERT [dbo].[Catalog_ProductOption] ([Id], [Name]) VALUES (1, N'Color')
INSERT [dbo].[Catalog_ProductOption] ([Id], [Name]) VALUES (2, N'Size')
SET IDENTITY_INSERT [dbo].[Catalog_ProductOption] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductOptionCombination] ON 

INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (1, 4, 1, N'Black', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (2, 6, 1, N'Black', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (3, 6, 2, N'S', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (4, 5, 1, N'Gray', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (5, 5, 2, N'L', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (6, 7, 1, N'Gray', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (7, 4, 2, N'L', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (8, 3, 1, N'Gray', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (9, 3, 2, N'M', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (10, 7, 2, N'S', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (11, 2, 1, N'Black', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (12, 2, 2, N'M', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (13, 23, 1, N'Silver', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (14, 23, 2, N'S', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (15, 26, 1, N'Gray', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (16, 24, 1, N'Silver', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (17, 24, 2, N'M', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (18, 26, 2, N'M', 1)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (19, 25, 1, N'Gray', 0)
INSERT [dbo].[Catalog_ProductOptionCombination] ([Id], [ProductId], [OptionId], [Value], [SortIndex]) VALUES (20, 25, 2, N'S', 1)
SET IDENTITY_INSERT [dbo].[Catalog_ProductOptionCombination] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductOptionValue] ON 

INSERT [dbo].[Catalog_ProductOptionValue] ([Id], [OptionId], [ProductId], [Value], [DisplayType], [SortIndex]) VALUES (1, 1, 1, N'[{"Key":"Black","Display":"#090808"},{"Key":"Gray","Display":"#cfd6dd"}]', N'color', 1)
INSERT [dbo].[Catalog_ProductOptionValue] ([Id], [OptionId], [ProductId], [Value], [DisplayType], [SortIndex]) VALUES (2, 2, 1, N'[{"Key":"M","Display":"M"},{"Key":"L","Display":"L"},{"Key":"S","Display":"S"}]', N'text', 0)
INSERT [dbo].[Catalog_ProductOptionValue] ([Id], [OptionId], [ProductId], [Value], [DisplayType], [SortIndex]) VALUES (3, 1, 22, N'[{"Key":"Silver","Display":"#e8e6ef"},{"Key":"Gray","Display":"#8c8585"}]', N'color', 0)
INSERT [dbo].[Catalog_ProductOptionValue] ([Id], [OptionId], [ProductId], [Value], [DisplayType], [SortIndex]) VALUES (4, 2, 22, N'[{"Key":"S","Display":null},{"Key":"M","Display":null}]', N'text', 1)
SET IDENTITY_INSERT [dbo].[Catalog_ProductOptionValue] OFF
SET IDENTITY_INSERT [dbo].[Catalog_ProductPriceHistory] ON 

INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (1, 1, 10, CAST(N'2018-08-11T15:02:17.0541076+07:00' AS DateTimeOffset), CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (2, 1, 10, CAST(N'2018-08-11T15:02:17.0554587+07:00' AS DateTimeOffset), CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (3, 1, 10, CAST(N'2018-08-11T15:02:17.0554679+07:00' AS DateTimeOffset), CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (4, 1, 10, CAST(N'2018-08-11T15:02:17.0554732+07:00' AS DateTimeOffset), CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (5, 1, 10, CAST(N'2018-08-11T15:02:17.0554783+07:00' AS DateTimeOffset), CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (6, 1, 10, CAST(N'2018-08-11T15:02:17.0554862+07:00' AS DateTimeOffset), CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (7, 1, 10, CAST(N'2018-08-11T15:02:17.0560706+07:00' AS DateTimeOffset), CAST(58.79 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (8, 8, 10, CAST(N'2018-08-11T18:14:54.9581872+07:00' AS DateTimeOffset), CAST(16.64 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (9, 9, 10, CAST(N'2018-08-11T18:16:28.3595420+07:00' AS DateTimeOffset), CAST(35.31 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (10, 10, 10, CAST(N'2018-08-11T18:17:34.0032918+07:00' AS DateTimeOffset), CAST(25.50 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (11, 11, 10, CAST(N'2018-08-11T18:18:38.8056600+07:00' AS DateTimeOffset), CAST(75.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (12, 12, 10, CAST(N'2018-08-11T18:20:26.0235652+07:00' AS DateTimeOffset), CAST(34.75 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (13, 13, 10, CAST(N'2018-08-11T18:22:07.9966185+07:00' AS DateTimeOffset), CAST(93.20 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (14, 14, 10, CAST(N'2018-08-11T18:23:06.0659327+07:00' AS DateTimeOffset), CAST(52.66 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (15, 15, 10, CAST(N'2018-08-11T18:24:48.0845771+07:00' AS DateTimeOffset), CAST(18.96 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (16, 16, 10, CAST(N'2018-08-11T18:26:22.7028175+07:00' AS DateTimeOffset), CAST(75.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (17, 17, 10, CAST(N'2018-08-11T18:27:33.7559977+07:00' AS DateTimeOffset), CAST(25.85 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (18, 18, 10, CAST(N'2018-08-11T18:28:33.4902495+07:00' AS DateTimeOffset), CAST(63.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (19, 19, 10, CAST(N'2018-08-11T18:29:44.3117613+07:00' AS DateTimeOffset), CAST(63.15 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (20, 20, 10, CAST(N'2018-08-11T18:30:56.2754061+07:00' AS DateTimeOffset), CAST(18.49 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (21, 21, 10, CAST(N'2018-08-11T18:32:22.4407454+07:00' AS DateTimeOffset), CAST(54.79 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (22, 22, 10, CAST(N'2018-08-11T18:33:38.3028499+07:00' AS DateTimeOffset), CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (23, 24, 10, CAST(N'2018-08-11T19:24:26.1245415+07:00' AS DateTimeOffset), CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (24, 23, 10, CAST(N'2018-08-11T19:24:26.1242459+07:00' AS DateTimeOffset), CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (25, 25, 10, CAST(N'2018-08-11T19:24:26.1245570+07:00' AS DateTimeOffset), CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Catalog_ProductPriceHistory] ([Id], [ProductId], [CreatedById], [CreatedOn], [Price], [OldPrice], [SpecialPrice], [SpecialPriceStart], [SpecialPriceEnd]) VALUES (26, 26, 10, CAST(N'2018-08-11T19:24:26.1245732+07:00' AS DateTimeOffset), CAST(29.64 AS Decimal(18, 2)), CAST(39.64 AS Decimal(18, 2)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Catalog_ProductPriceHistory] OFF
SET IDENTITY_INSERT [dbo].[Cms_Menu] ON 

INSERT [dbo].[Cms_Menu] ([Id], [Name], [IsPublished], [IsSystem]) VALUES (1, N'Customer Services', 1, 1)
INSERT [dbo].[Cms_Menu] ([Id], [Name], [IsPublished], [IsSystem]) VALUES (2, N'Information', 1, 1)
SET IDENTITY_INSERT [dbo].[Cms_Menu] OFF
SET IDENTITY_INSERT [dbo].[Cms_MenuItem] ON 

INSERT [dbo].[Cms_MenuItem] ([Id], [ParentId], [MenuId], [EntityId], [CustomLink], [Name], [DisplayOrder]) VALUES (1, NULL, 2, 1, NULL, N'Woman', 0)
INSERT [dbo].[Cms_MenuItem] ([Id], [ParentId], [MenuId], [EntityId], [CustomLink], [Name], [DisplayOrder]) VALUES (2, NULL, 2, 2, NULL, N'Man', 1)
INSERT [dbo].[Cms_MenuItem] ([Id], [ParentId], [MenuId], [EntityId], [CustomLink], [Name], [DisplayOrder]) VALUES (3, NULL, 2, 3, NULL, N'Shoes', 2)
INSERT [dbo].[Cms_MenuItem] ([Id], [ParentId], [MenuId], [EntityId], [CustomLink], [Name], [DisplayOrder]) VALUES (4, NULL, 2, 4, NULL, N'Watches', 3)
INSERT [dbo].[Cms_MenuItem] ([Id], [ParentId], [MenuId], [EntityId], [CustomLink], [Name], [DisplayOrder]) VALUES (5, NULL, 1, 24, NULL, N'About Us', 0)
INSERT [dbo].[Cms_MenuItem] ([Id], [ParentId], [MenuId], [EntityId], [CustomLink], [Name], [DisplayOrder]) VALUES (6, NULL, 1, 23, NULL, N'Help center', 1)
INSERT [dbo].[Cms_MenuItem] ([Id], [ParentId], [MenuId], [EntityId], [CustomLink], [Name], [DisplayOrder]) VALUES (7, NULL, 1, 25, NULL, N'Terms of Use', 2)
SET IDENTITY_INSERT [dbo].[Cms_MenuItem] OFF
SET IDENTITY_INSERT [dbo].[Cms_Page] ON 

INSERT [dbo].[Cms_Page] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [Body]) VALUES (1, N'Help center', N'help-center', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T20:47:14.1027299+07:00' AS DateTimeOffset), CAST(N'2018-08-11T20:47:14.1027316+07:00' AS DateTimeOffset), NULL, N'<h1>Help center</h1><p><span style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;">Your information. Use admin site to update</span><br></p>')
INSERT [dbo].[Cms_Page] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [Body]) VALUES (2, N'About Us', N'about-us', NULL, NULL, N'', 1, NULL, 0, 10, CAST(N'2018-08-11T20:49:11.7082006+07:00' AS DateTimeOffset), CAST(N'2018-08-11T20:49:11.7082016+07:00' AS DateTimeOffset), NULL, N'<h1>About Us</h1><p>Edit your information in the admin side</p>')
INSERT [dbo].[Cms_Page] ([Id], [Name], [Slug], [MetaTitle], [MetaKeywords], [MetaDescription], [IsPublished], [PublishedOn], [IsDeleted], [CreatedById], [CreatedOn], [UpdatedOn], [UpdatedById], [Body]) VALUES (3, N'Terms of Use', N'terms-of-use', NULL, NULL, NULL, 1, NULL, 0, 10, CAST(N'2018-08-11T20:50:11.5637211+07:00' AS DateTimeOffset), CAST(N'2018-08-11T20:50:11.5637220+07:00' AS DateTimeOffset), NULL, N'<h1>Term and Conditions</h1><p>Your term and conditions. Use admin site to update.<br></p>')
SET IDENTITY_INSERT [dbo].[Cms_Page] OFF
SET IDENTITY_INSERT [dbo].[Contacts_ContactArea] ON 

INSERT [dbo].[Contacts_ContactArea] ([Id], [Name], [IsDeleted]) VALUES (1, N'demo', 1)
INSERT [dbo].[Contacts_ContactArea] ([Id], [Name], [IsDeleted]) VALUES (2, N'dsfsd', 1)
INSERT [dbo].[Contacts_ContactArea] ([Id], [Name], [IsDeleted]) VALUES (3, N'VIP', 0)
SET IDENTITY_INSERT [dbo].[Contacts_ContactArea] OFF
SET IDENTITY_INSERT [dbo].[Core_Address] ON 

INSERT [dbo].[Core_Address] ([Id], [ContactName], [Phone], [AddressLine1], [AddressLine2], [City], [ZipCode], [DistrictId], [StateOrProvinceId], [CountryId]) VALUES (1, N'Thien Nguyen', NULL, N'364 Cong Hoa', NULL, NULL, NULL, NULL, 1, N'VN')
SET IDENTITY_INSERT [dbo].[Core_Address] OFF
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'Catalog.IsCommentsRequireApproval', N'true', N'Catalog', 1)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'Catalog.IsProductPriceIncludeTax', N'true', N'Catalog', 1)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'Catalog.ProductPageSize', N'10', N'Catalog', 1)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'Global.AssetVersion', N'1.0', N'Core', 1)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'GoogleAppKey', N'', N'Contact', 0)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'News.PageSize', N'10', N'News', 1)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'SmtpPassword', N'', N'EmailSenderSmpt', 0)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'SmtpPort', N'587', N'EmailSenderSmpt', 0)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'SmtpServer', N'smtp.gmail.com', N'EmailSenderSmpt', 0)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'SmtpUsername', N'', N'EmailSenderSmpt', 0)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'Tax.DefaultTaxClassId', N'1', N'Tax', 1)
INSERT [dbo].[Core_AppSetting] ([Id], [Value], [Module], [IsVisibleInCommonSettingPage]) VALUES (N'Theme', N'GiccoStore', N'Core', 0)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AD', N'Andorra', N'AND', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AE', N'United Arab Emirates', N'ARE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AF', N'Afghanistan', N'AFG', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AG', N'Antigua &amp; Barbuda', N'ATG', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AI', N'Anguilla', N'AIA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AL', N'Albania', N'ALB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AM', N'Armenia', N'ARM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AN', N'Netherlands Antilles', N'ANT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AO', N'Angola', N'AGO', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AQ', N'Antarctica', N'ATA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AR', N'Argentina', N'ARG', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AS', N'American Samoa', N'ASM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AT', N'Austria', N'AUT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AU', N'Australia', N'AUS', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AW', N'Aruba', N'ABW', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AX', N'Åland Islands', N'ALA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'AZ', N'Azerbaijan', N'AZE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BA', N'Bosnia &amp; Herzegovina', N'BIH', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BB', N'Barbados', N'BRB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BD', N'Bangladesh', N'BGD', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BE', N'Belgium', N'BEL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BF', N'Burkina Faso', N'BFA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BG', N'Bulgaria', N'BGR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BH', N'Bahrain', N'BHR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BI', N'Burundi', N'BDI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BJ', N'Benin', N'BEN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BL', N'St. Barthélemy', N'BLM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BM', N'Bermuda', N'BMU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BN', N'Brunei', N'BRN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BO', N'Bolivia', N'BOL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BR', N'Brazil', N'BRA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BS', N'Bahamas', N'BHS', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BT', N'Bhutan', N'BTN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BV', N'Bouvet Island', N'BVT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BW', N'Botswana', N'BWA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BY', N'Belarus', N'BLR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'BZ', N'Belize', N'BLZ', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CA', N'Canada', N'CAN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CC', N'Cocos (Keeling) Islands', N'CCK', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CD', N'Congo - Kinshasa', N'COD', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CF', N'Central African Republic', N'CAF', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CG', N'Congo - Brazzaville', N'COG', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CH', N'Switzerland', N'CHE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CI', N'Côte d’Ivoire', N'CIV', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CK', N'Cook Islands', N'COK', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CL', N'Chile', N'CHL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CM', N'Cameroon', N'CMR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CN', N'China', N'CHN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CO', N'Colombia', N'COL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CR', N'Costa Rica', N'CRI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CU', N'Cuba', N'CUB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CV', N'Cape Verde', N'CPV', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CX', N'Christmas Island', N'CXR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CY', N'Cyprus', N'CYP', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'CZ', N'Czech Republic', N'CZE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'DE', N'Germany', N'DEU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'DJ', N'Djibouti', N'DJI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'DK', N'Denmark', N'DNK', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'DM', N'Dominica', N'DMA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'DO', N'Dominican Republic', N'DOM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'DZ', N'Algeria', N'DZA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'EC', N'Ecuador', N'ECU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'EE', N'Estonia', N'EST', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'EG', N'Egypt', N'EGY', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'EH', N'Western Sahara', N'ESH', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ER', N'Eritrea', N'ERI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ES', N'Spain', N'ESP', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ET', N'Ethiopia', N'ETH', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'FI', N'Finland', N'FIN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'FJ', N'Fiji', N'FJI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'FK', N'Falkland Islands', N'FLK', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'FM', N'Micronesia', N'FSM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'FO', N'Faroe Islands', N'FRO', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'FR', N'France', N'FRA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GA', N'Gabon', N'GAB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GB', N'United Kingdom', N'GBR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GD', N'Grenada', N'GRD', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GE', N'Georgia', N'GEO', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GF', N'French Guiana', N'GUF', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GG', N'Guernsey', N'GGY', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GH', N'Ghana', N'GHA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GI', N'Gibraltar', N'GIB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GL', N'Greenland', N'GRL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GM', N'Gambia', N'GMB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GN', N'Guinea', N'GIN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GP', N'Guadeloupe', N'GLP', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GQ', N'Equatorial Guinea', N'GNQ', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GR', N'Greece', N'GRC', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GS', N'South Georgia &amp; South Sandwich Islands', N'SGS', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GT', N'Guatemala', N'GTM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GU', N'Guam', N'GUM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GW', N'Guinea-Bissau', N'GNB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'GY', N'Guyana', N'GUY', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'HK', N'Hong Kong SAR China', N'HKG', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'HM', N'Heard &amp; McDonald Islands', N'HMD', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'HN', N'Honduras', N'HND', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'HR', N'Croatia', N'HRV', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'HT', N'Haiti', N'HTI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'HU', N'Hungary', N'HUN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ID', N'Indonesia', N'IDN', 0, 0, 1, 1, 1)
GO
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IE', N'Ireland', N'IRL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IL', N'Israel', N'ISR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IM', N'Isle of Man', N'IMN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IN', N'India', N'IND', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IO', N'British Indian Ocean Territory', N'IOT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IQ', N'Iraq', N'IRQ', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IR', N'Iran', N'IRN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IS', N'Iceland', N'ISL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'IT', N'Italy', N'ITA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'JE', N'Jersey', N'JEY', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'JM', N'Jamaica', N'JAM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'JO', N'Jordan', N'JOR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'JP', N'Japan', N'JPN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KE', N'Kenya', N'KEN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KG', N'Kyrgyzstan', N'KGZ', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KH', N'Cambodia', N'KHM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KI', N'Kiribati', N'KIR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KM', N'Comoros', N'COM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KN', N'St. Kitts &amp; Nevis', N'KNA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KP', N'North Korea', N'PRK', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KR', N'South Korea', N'KOR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KW', N'Kuwait', N'KWT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KY', N'Cayman Islands', N'CYM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'KZ', N'Kazakhstan', N'KAZ', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LA', N'Laos', N'LAO', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LB', N'Lebanon', N'LBN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LC', N'St. Lucia', N'LCA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LI', N'Liechtenstein', N'LIE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LK', N'Sri Lanka', N'LKA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LR', N'Liberia', N'LBR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LS', N'Lesotho', N'LSO', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LT', N'Lithuania', N'LTU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LU', N'Luxembourg', N'LUX', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LV', N'Latvia', N'LVA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'LY', N'Libya', N'LBY', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MA', N'Morocco', N'MAR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MC', N'Monaco', N'MCO', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MD', N'Moldova', N'MDA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ME', N'Montenegro', N'MNE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MF', N'St. Martin', N'MAF', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MG', N'Madagascar', N'MDG', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MH', N'Marshall Islands', N'MHL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MK', N'Macedonia', N'MKD', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ML', N'Mali', N'MLI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MM', N'Myanmar (Burma)', N'MMR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MN', N'Mongolia', N'MNG', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MO', N'Macau SAR China', N'MAC', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MP', N'Northern Mariana Islands', N'MNP', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MQ', N'Martinique', N'MTQ', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MR', N'Mauritania', N'MRT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MS', N'Montserrat', N'MSR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MT', N'Malta', N'MLT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MU', N'Mauritius', N'MUS', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MV', N'Maldives', N'MDV', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MW', N'Malawi', N'MWI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MX', N'Mexico', N'MEX', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MY', N'Malaysia', N'MYS', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'MZ', N'Mozambique', N'MOZ', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NA', N'Namibia', N'NAM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NC', N'New Caledonia', N'NCL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NE', N'Niger', N'NER', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NF', N'Norfolk Island', N'NFK', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NG', N'Nigeria', N'NGA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NI', N'Nicaragua', N'NIC', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NL', N'Netherlands', N'NLD', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NO', N'Norway', N'NOR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NP', N'Nepal', N'NPL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NR', N'Nauru', N'NRU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NU', N'Niue', N'NIU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'NZ', N'New Zealand', N'NZL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'OM', N'Oman', N'OMN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PA', N'Panama', N'PAN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PE', N'Peru', N'PER', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PF', N'French Polynesia', N'PYF', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PG', N'Papua New Guinea', N'PNG', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PH', N'Philippines', N'PHL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PK', N'Pakistan', N'PAK', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PL', N'Poland', N'POL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PM', N'St. Pierre &amp; Miquelon', N'SPM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PN', N'Pitcairn Islands', N'PCN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PS', N'Palestinian Territories', N'PSE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PT', N'Portugal', N'PRT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PW', N'Palau', N'PLW', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'PY', N'Paraguay', N'PRY', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'QA', N'Qatar', N'QAT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'RE', N'Réunion', N'REU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'RO', N'Romania', N'ROU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'RS', N'Serbia', N'SRB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'RU', N'Russia', N'RUS', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'RW', N'Rwanda', N'RWA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SA', N'Saudi Arabia', N'SAU', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SB', N'Solomon Islands', N'SLB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SC', N'Seychelles', N'SYC', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SD', N'Sudan', N'SDN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SE', N'Sweden', N'SWE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SG', N'Singapore', N'SGP', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SH', N'St. Helena', N'SHN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SI', N'Slovenia', N'SVN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SJ', N'Svalbard &amp; Jan Mayen', N'SJM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SK', N'Slovakia', N'SVK', 0, 0, 1, 1, 1)
GO
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SL', N'Sierra Leone', N'SLE', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SM', N'San Marino', N'SMR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SN', N'Senegal', N'SEN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SO', N'Somalia', N'SOM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SR', N'Suriname', N'SUR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ST', N'São Tomé &amp; Príncipe', N'STP', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SV', N'El Salvador', N'SLV', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SY', N'Syria', N'SYR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'SZ', N'Swaziland', N'SWZ', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TC', N'Turks &amp; Caicos Islands', N'TCA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TD', N'Chad', N'TCD', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TF', N'French Southern Territories', N'ATF', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TG', N'Togo', N'TGO', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TH', N'Thailand', N'THA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TJ', N'Tajikistan', N'TJK', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TK', N'Tokelau', N'TKL', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TL', N'Timor-Leste', N'TLS', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TM', N'Turkmenistan', N'TKM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TN', N'Tunisia', N'TUN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TO', N'Tonga', N'TON', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TR', N'Turkey', N'TUR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TT', N'Trinidad &amp; Tobago', N'TTO', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TV', N'Tuvalu', N'TUV', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TW', N'Taiwan', N'TWN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'TZ', N'Tanzania', N'TZA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'UA', N'Ukraine', N'UKR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'UG', N'Uganda', N'UGA', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'UM', N'U.S. Outlying Islands', N'UMI', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'US', N'United States', N'USA', 1, 1, 1, 1, 0)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'UY', N'Uruguay', N'URY', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'UZ', N'Uzbekistan', N'UZB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'VA', N'Vatican City', N'VAT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'VC', N'St. Vincent &amp; Grenadines', N'VCT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'VE', N'Venezuela', N'VEN', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'VG', N'British Virgin Islands', N'VGB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'VI', N'U.S. Virgin Islands', N'VIR', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'VN', N'Việt Nam', N'VNM', 1, 1, 0, 0, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'VU', N'Vanuatu', N'VUT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'WF', N'Wallis &amp; Futuna', N'WLF', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'WS', N'Samoa', N'WSM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'YE', N'Yemen', N'YEM', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'YT', N'Mayotte', N'MYT', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ZA', N'South Africa', N'ZAF', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ZM', N'Zambia', N'ZMB', 0, 0, 1, 1, 1)
INSERT [dbo].[Core_Country] ([Id], [Name], [Code3], [IsBillingEnabled], [IsShippingEnabled], [IsCityEnabled], [IsZipCodeEnabled], [IsDistrictEnabled]) VALUES (N'ZW', N'Zimbabwe', N'ZWE', 0, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Core_CustomerGroup] ON 

INSERT [dbo].[Core_CustomerGroup] ([Id], [Name], [Description], [IsActive], [IsDeleted], [CreatedOn], [UpdatedOn]) VALUES (1, N'Frequent Buyers', NULL, 1, 0, CAST(N'2018-10-04T16:28:13.7220812+07:00' AS DateTimeOffset), CAST(N'2018-10-05T10:31:59.2278670+07:00' AS DateTimeOffset))
INSERT [dbo].[Core_CustomerGroup] ([Id], [Name], [Description], [IsActive], [IsDeleted], [CreatedOn], [UpdatedOn]) VALUES (2, N'Employee', NULL, 1, 0, CAST(N'2018-10-04T16:29:08.6671734+07:00' AS DateTimeOffset), CAST(N'2018-10-05T10:45:02.1447898+07:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Core_CustomerGroup] OFF
INSERT [dbo].[Core_CustomerGroupUser] ([UserId], [CustomerGroupId]) VALUES (13, 1)
INSERT [dbo].[Core_CustomerGroupUser] ([UserId], [CustomerGroupId]) VALUES (12, 2)
SET IDENTITY_INSERT [dbo].[Core_District] ON 

INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (1, 79, N'Ba Đình', N'Quận', N'21 02 08N, 105 49 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (2, 79, N'Hoàn Kiếm', N'Quận', N'21 01 53N, 105 51 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (3, 79, N'Tây Hồ', N'Quận', N'21 04 10N, 105 49 07E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (4, 79, N'Long Biên', N'Quận', N'21 02 21N, 105 53 07E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (5, 79, N'Cầu Giấy', N'Quận', N'21 01 52N, 105 47 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (6, 79, N'Đống Đa', N'Quận', N'21 00 56N, 105 49 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (7, 79, N'Hai Bà Trưng', N'Quận', N'21 00 27N, 105 51 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (8, 79, N'Hoàng Mai', N'Quận', N'20 58 33N, 105 51 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (9, 79, N'Thanh Xuân', N'Quận', N'20 59 44N, 105 48 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (16, 79, N'Sóc Sơn', N'Huyện', N'21 16 55N, 105 49 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (17, 79, N'Đông Anh', N'Huyện', N'21 08 16N, 105 49 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (18, 79, N'Gia Lâm', N'Huyện', N'21 01 28N, 105 56 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (19, 79, N'Từ Liêm', N'Huyện', N'21 02 39N, 105 45 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (20, 79, N'Thanh Trì', N'Huyện', N'20 56 32N, 105 50 55E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (24, 2, N'Hà Giang', N'Thị Xã', N'22 46 23N, 105 02 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (26, 2, N'Đồng Văn', N'Huyện', N'23 14 34N, 105 15 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (27, 2, N'Mèo Vạc', N'Huyện', N'23 09 10N, 105 26 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (28, 2, N'Yên Minh', N'Huyện', N'23 04 20N, 105 10 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (29, 2, N'Quản Bạ', N'Huyện', N'23 04 03N, 104 58 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (30, 2, N'Vị Xuyên', N'Huyện', N'22 45 50N, 104 56 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (31, 2, N'Bắc Mê', N'Huyện', N'22 45 48N, 105 16 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (32, 2, N'Hoàng Su Phì', N'Huyện', N'22 41 37N, 104 40 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (33, 2, N'Xín Mần', N'Huyện', N'22 38 05N, 104 28 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (34, 2, N'Bắc Quang', N'Huyện', N'22 23 42N, 104 55 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (35, 2, N'Quang Bình', N'Huyện', N'22 23 07N, 104 37 11E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (40, 4, N'Cao Bằng', N'Thị Xã', N'22 39 20N, 106 15 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (42, 4, N'Bảo Lâm', N'Huyện', N'22 52 37N, 105 27 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (43, 4, N'Bảo Lạc', N'Huyện', N'22 52 31N, 105 42 41E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (44, 4, N'Thông Nông', N'Huyện', N'22 49 09N, 105 57 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (45, 4, N'Hà Quảng', N'Huyện', N'22 53 42N, 106 06 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (46, 4, N'Trà Lĩnh', N'Huyện', N'22 48 14N, 106 19 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (47, 4, N'Trùng Khánh', N'Huyện', N'22 49 31N, 106 33 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (48, 4, N'Hạ Lang', N'Huyện', N'22 42 37N, 106 41 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (49, 4, N'Quảng Uyên', N'Huyện', N'22 40 15N, 106 27 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (50, 4, N'Phục Hoà', N'Huyện', N'22 33 52N, 106 30 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (51, 4, N'Hoà An', N'Huyện', N'22 41 20N, 106 02 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (52, 4, N'Nguyên Bình', N'Huyện', N'22 38 52N, 105 57 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (53, 4, N'Thạch An', N'Huyện', N'22 28 51N, 106 19 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (58, 6, N'Bắc Kạn', N'Thị Xã', N'22 08 00N, 105 51 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (60, 6, N'Pác Nặm', N'Huyện', N'22 35 46N, 105 40 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (61, 6, N'Ba Bể', N'Huyện', N'22 23 54N, 105 43 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (62, 6, N'Ngân Sơn', N'Huyện', N'22 25 50N, 106 01 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (63, 6, N'Bạch Thông', N'Huyện', N'22 12 04N, 105 51 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (64, 6, N'Chợ Đồn', N'Huyện', N'22 11 18N, 105 34 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (65, 6, N'Chợ Mới', N'Huyện', N'21 57 56N, 105 51 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (66, 6, N'Na Rì', N'Huyện', N'22 09 48N, 106 05 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (70, 8, N'Tuyên Quang', N'Thị Xã', N'21 49 40N, 105 13 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (72, 8, N'Nà Hang', N'Huyện', N'22 28 34N, 105 21 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (73, 8, N'Chiêm Hóa', N'Huyện', N'22 12 49N, 105 14 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (74, 8, N'Hàm Yên', N'Huyện', N'22 05 46N, 105 00 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (75, 8, N'Yên Sơn', N'Huyện', N'21 51 53N, 105 18 14E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (76, 8, N'Sơn Dương', N'Huyện', N'21 40 22N, 105 22 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (80, 10, N'Lào Cai', N'Thành Phố', N'22 25 07N, 103 58 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (82, 10, N'Bát Xát', N'Huyện', N'22 35 50N, 103 44 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (83, 10, N'Mường Khương', N'Huyện', N'22 41 05N, 104 08 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (84, 10, N'Si Ma Cai', N'Huyện', N'22 39 46N, 104 16 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (85, 10, N'Bắc Hà', N'Huyện', N'22 30 08N, 104 18 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (86, 10, N'Bảo Thắng', N'Huyện', N'22 22 47N, 104 10 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (87, 10, N'Bảo Yên', N'Huyện', N'22 17 38N, 104 25 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (88, 10, N'Sa Pa', N'Huyện', N'22 18 54N, 103 54 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (89, 10, N'Văn Bàn', N'Huyện', N'22 03 48N, 104 10 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (94, 11, N'Điện Biên Phủ', N'Thành Phố', N'21 24 52N, 103 02 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (95, 11, N'Mường Lay', N'Thị Xã', N'22 01 47N, 103 07 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (96, 11, N'Mường Nhé', N'Huyện', N'22 06 11N, 102 30 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (97, 11, N'Mường Chà', N'Huyện', N'21 50 31N, 103 03 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (98, 11, N'Tủa Chùa', N'Huyện', N'21 58 19N, 103 23 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (99, 11, N'Tuần Giáo', N'Huyện', N'21 38 03N, 103 21 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (100, 11, N'Điện Biên', N'Huyện', N'21 15 19N, 103 03 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (101, 11, N'Điện Biên Đông', N'Huyện', N'21 14 07N, 103 15 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (102, 11, N'Mường Ảng', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (104, 12, N'Lai Châu', N'Thị Xã', N'22 23 15N, 103 24 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (106, 12, N'Tam Đường', N'Huyện', N'22 20 16N, 103 32 53E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (107, 12, N'Mường Tè', N'Huyện', N'22 24 16N, 102 43 11E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (108, 12, N'Sìn Hồ', N'Huyện', N'22 17 21N, 103 18 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (109, 12, N'Phong Thổ', N'Huyện', N'22 38 24N, 103 22 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (110, 12, N'Than Uyên', N'Huyện', N'21 59 35N, 103 45 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (111, 12, N'Tân Uyên', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (116, 14, N'Sơn La', N'Thành Phố', N'21 20 39N, 103 54 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (118, 14, N'Quỳnh Nhai', N'Huyện', N'21 46 34N, 103 39 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (119, 14, N'Thuận Châu', N'Huyện', N'21 24 54N, 103 39 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (120, 14, N'Mường La', N'Huyện', N'21 31 38N, 104 02 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (121, 14, N'Bắc Yên', N'Huyện', N'21 13 23N, 104 22 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (122, 14, N'Phù Yên', N'Huyện', N'21 13 33N, 104 41 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (123, 14, N'Mộc Châu', N'Huyện', N'20 49 21N, 104 43 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (124, 14, N'Yên Châu', N'Huyện', N'20 59 33N, 104 19 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (125, 14, N'Mai Sơn', N'Huyện', N'21 10 08N, 103 59 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (126, 14, N'Sông Mã', N'Huyện', N'21 06 04N, 103 43 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (127, 14, N'Sốp Cộp', N'Huyện', N'20 52 46N, 103 30 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (132, 15, N'Yên Bái', N'Thành Phố', N'21 44 28N, 104 53 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (133, 15, N'Nghĩa Lộ', N'Thị Xã', N'21 35 58N, 104 29 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (135, 15, N'Lục Yên', N'Huyện', N'22 06 44N, 104 43 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (136, 15, N'Văn Yên', N'Huyện', N'21 55 55N, 104 33 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (137, 15, N'Mù Cang Chải', N'Huyện', N'21 48 22N, 104 09 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (138, 15, N'Trấn Yên', N'Huyện', N'21 42 20N, 104 48 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (139, 15, N'Trạm Tấu', N'Huyện', N'21 30 40N, 104 28 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (140, 15, N'Văn Chấn', N'Huyện', N'21 34 15N, 104 35 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (141, 15, N'Yên Bình', N'Huyện', N'21 52 24N, 104 55 16E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (148, 17, N'Hòa Bình', N'Thành Phố', N'20 50 36N, 105 19 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (150, 17, N'Đà Bắc', N'Huyện', N'20 55 58N, 105 04 52E')
GO
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (151, 17, N'Kỳ Sơn', N'Huyện', N'20 54 06N, 105 23 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (152, 17, N'Lương Sơn', N'Huyện', N'20 53 16N, 105 30 55E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (153, 17, N'Kim Bôi', N'Huyện', N'20 40 34N, 105 32 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (154, 17, N'Cao Phong', N'Huyện', N'20 41 23N, 105 17 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (155, 17, N'Tân Lạc', N'Huyện', N'20 36 44N, 105 15 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (156, 17, N'Mai Châu', N'Huyện', N'20 40 56N, 104 59 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (157, 17, N'Lạc Sơn', N'Huyện', N'20 29 59N, 105 24 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (158, 17, N'Yên Thủy', N'Huyện', N'20 25 42N, 105 37 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (159, 17, N'Lạc Thủy', N'Huyện', N'20 29 12N, 105 44 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (164, 19, N'Thái Nguyên', N'Thành Phố', N'21 33 20N, 105 48 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (165, 19, N'Sông Công', N'Thị Xã', N'21 29 14N, 105 48 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (167, 19, N'Định Hóa', N'Huyện', N'21 53 50N, 105 38 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (168, 19, N'Phú Lương', N'Huyện', N'21 45 57N, 105 43 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (169, 19, N'Đồng Hỷ', N'Huyện', N'21 41 10N, 105 55 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (170, 19, N'Võ Nhai', N'Huyện', N'21 47 14N, 106 02 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (171, 19, N'Đại Từ', N'Huyện', N'21 36 17N, 105 37 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (172, 19, N'Phổ Yên', N'Huyện', N'21 27 08N, 105 45 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (173, 19, N'Phú Bình', N'Huyện', N'21 29 36N, 105 57 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (178, 20, N'Lạng Sơn', N'Thành Phố', N'21 51 19N, 106 44 50E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (180, 20, N'Tràng Định', N'Huyện', N'22 18 09N, 106 26 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (181, 20, N'Bình Gia', N'Huyện', N'22 03 56N, 106 19 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (182, 20, N'Văn Lãng', N'Huyện', N'22 01 59N, 106 34 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (183, 20, N'Cao Lộc', N'Huyện', N'21 53 05N, 106 50 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (184, 20, N'Văn Quan', N'Huyện', N'21 51 04N, 106 33 04E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (185, 20, N'Bắc Sơn', N'Huyện', N'21 48 57N, 106 15 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (186, 20, N'Hữu Lũng', N'Huyện', N'21 34 33N, 106 20 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (187, 20, N'Chi Lăng', N'Huyện', N'21 40 05N, 106 37 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (188, 20, N'Lộc Bình', N'Huyện', N'21 40 41N, 106 58 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (189, 20, N'Đình Lập', N'Huyện', N'21 32 07N, 107 07 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (193, 22, N'Hạ Long', N'Thành Phố', N'20 52 24N, 107 05 23E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (194, 22, N'Móng Cái', N'Thành Phố', N'21 26 31N, 107 55 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (195, 22, N'Cẩm Phả', N'Thị Xã', N'21 03 42N, 107 17 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (196, 22, N'Uông Bí', N'Thị Xã', N'21 04 33N, 106 45 07E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (198, 22, N'Bình Liêu', N'Huyện', N'21 33 07N, 107 26 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (199, 22, N'Tiên Yên', N'Huyện', N'21 22 24N, 107 22 50E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (200, 22, N'Đầm Hà', N'Huyện', N'21 21 23N, 107 34 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (201, 22, N'Hải Hà', N'Huyện', N'21 25 50N, 107 41 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (202, 22, N'Ba Chẽ', N'Huyện', N'21 15 40N, 107 09 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (203, 22, N'Vân Đồn', N'Huyện', N'20 56 17N, 107 28 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (204, 22, N'Hoành Bồ', N'Huyện', N'21 06 30N, 107 02 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (205, 22, N'Đông Triều', N'Huyện', N'21 07 10N, 106 34 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (206, 22, N'Yên Hưng', N'Huyện', N'20 55 40N, 106 51 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (207, 22, N'Cô Tô', N'Huyện', N'21 05 01N, 107 49 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (213, 24, N'Bắc Giang', N'Thành Phố', N'21 17 36N, 106 11 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (215, 24, N'Yên Thế', N'Huyện', N'21 31 29N, 106 09 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (216, 24, N'Tân Yên', N'Huyện', N'21 23 23N, 106 05 55E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (217, 24, N'Lạng Giang', N'Huyện', N'21 21 58N, 106 15 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (218, 24, N'Lục Nam', N'Huyện', N'21 18 16N, 106 29 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (219, 24, N'Lục Ngạn', N'Huyện', N'21 26 15N, 106 39 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (220, 24, N'Sơn Động', N'Huyện', N'21 19 42N, 106 51 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (221, 24, N'Yên Dũng', N'Huyện', N'21 12 22N, 106 14 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (222, 24, N'Việt Yên', N'Huyện', N'21 16 16N, 106 04 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (223, 24, N'Hiệp Hòa', N'Huyện', N'21 15 51N, 105 57 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (227, 25, N'Việt Trì', N'Thành Phố', N'21 19 01N, 105 23 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (228, 25, N'Phú Thọ', N'Thị Xã', N'21 24 54N, 105 13 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (230, 25, N'Đoan Hùng', N'Huyện', N'21 36 56N, 105 08 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (231, 25, N'Hạ Hoà', N'Huyện', N'21 35 13N, 105 00 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (232, 25, N'Thanh Ba', N'Huyện', N'21 27 04N, 105 09 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (233, 25, N'Phù Ninh', N'Huyện', N'21 26 59N, 105 18 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (234, 25, N'Yên Lập', N'Huyện', N'21 22 21N, 105 01 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (235, 25, N'Cẩm Khê', N'Huyện', N'21 23 04N, 105 05 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (236, 25, N'Tam Nông', N'Huyện', N'21 18 24N, 105 14 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (237, 25, N'Lâm Thao', N'Huyện', N'21 19 37N, 105 18 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (238, 25, N'Thanh Sơn', N'Huyện', N'21 08 32N, 105 04 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (239, 25, N'Thanh Thuỷ', N'Huyện', N'21 07 26N, 105 17 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (240, 25, N'Tân Sơn', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (243, 26, N'Vĩnh Yên', N'Thành Phố', N'21 18 26N, 105 35 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (244, 26, N'Phúc Yên', N'Thị Xã', N'21 18 55N, 105 43 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (246, 26, N'Lập Thạch', N'Huyện', N'21 24 45N, 105 25 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (247, 26, N'Tam Dương', N'Huyện', N'21 21 40N, 105 33 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (248, 26, N'Tam Đảo', N'Huyện', N'21 27 34N, 105 35 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (249, 26, N'Bình Xuyên', N'Huyện', N'21 19 48N, 105 39 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (250, 1, N'Mê Linh', N'Huyện', N'21 10 53N, 105 42 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (251, 26, N'Yên Lạc', N'Huyện', N'21 13 17N, 105 34 44E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (252, 26, N'Vĩnh Tường', N'Huyện', N'21 14 58N, 105 29 37E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (253, 26, N'Sông Lô', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (256, 27, N'Bắc Ninh', N'Thành Phố', N'21 10 48N, 106 03 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (258, 27, N'Yên Phong', N'Huyện', N'21 12 40N, 105 59 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (259, 27, N'Quế Võ', N'Huyện', N'21 08 44N, 106 11 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (260, 27, N'Tiên Du', N'Huyện', N'21 07 37N, 106 02 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (261, 27, N'Từ Sơn', N'Thị Xã', N'21 07 12N, 105 57 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (262, 27, N'Thuận Thành', N'Huyện', N'21 02 24N, 106 04 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (263, 27, N'Gia Bình', N'Huyện', N'21 03 55N, 106 12 53E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (264, 27, N'Lương Tài', N'Huyện', N'21 01 33N, 106 13 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (268, 1, N'Hà Đông', N'Quận', N'20 57 25N, 105 45 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (269, 1, N'Sơn Tây', N'Thị Xã', N'21 05 51N, 105 28 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (271, 1, N'Ba Vì', N'Huyện', N'21 09 40N, 105 22 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (272, 1, N'Phúc Thọ', N'Huyện', N'21 06 32N, 105 34 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (273, 1, N'Đan Phượng', N'Huyện', N'21 07 13N, 105 40 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (274, 1, N'Hoài Đức', N'Huyện', N'21 01 25N, 105 42 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (275, 1, N'Quốc Oai', N'Huyện', N'20 58 45N, 105 36 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (276, 1, N'Thạch Thất', N'Huyện', N'21 02 17N, 105 33 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (277, 1, N'Chương Mỹ', N'Huyện', N'20 52 46N, 105 39 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (278, 1, N'Thanh Oai', N'Huyện', N'20 51 44N, 105 46 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (279, 1, N'Thường Tín', N'Huyện', N'20 49 59N, 105 22 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (280, 1, N'Phú Xuyên', N'Huyện', N'20 43 37N, 105 53 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (281, 1, N'Ứng Hòa', N'Huyện', N'20 42 41N, 105 47 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (282, 1, N'Mỹ Đức', N'Huyện', N'20 41 53N, 105 43 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (288, 30, N'Hải Dương', N'Thành Phố', N'20 56 14N, 106 18 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (290, 30, N'Chí Linh', N'Huyện', N'21 07 47N, 106 23 46E')
GO
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (291, 30, N'Nam Sách', N'Huyện', N'21 00 15N, 106 20 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (292, 30, N'Kinh Môn', N'Huyện', N'21 00 04N, 106 30 23E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (293, 30, N'Kim Thành', N'Huyện', N'20 55 40N, 106 30 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (294, 30, N'Thanh Hà', N'Huyện', N'20 53 19N, 106 25 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (295, 30, N'Cẩm Giàng', N'Huyện', N'20 57 05N, 106 12 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (296, 30, N'Bình Giang', N'Huyện', N'20 52 36N, 106 11 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (297, 30, N'Gia Lộc', N'Huyện', N'20 51 01N, 106 17 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (298, 30, N'Tứ Kỳ', N'Huyện', N'20 49 05N, 106 24 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (299, 30, N'Ninh Giang', N'Huyện', N'20 45 13N, 106 20 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (300, 30, N'Thanh Miện', N'Huyện', N'20 46 02N, 106 12 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (303, 31, N'Hồng Bàng', N'Quận', N'20 52 37N, 106 38 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (304, 31, N'Ngô Quyền', N'Quận', N'20 51 13N, 106 41 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (305, 31, N'Lê Chân', N'Quận', N'20 50 12N, 106 40 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (306, 31, N'Hải An', N'Quận', N'20 49 38N, 106 45 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (307, 31, N'Kiến An', N'Quận', N'20 48 26N, 106 38 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (308, 31, N'Đồ Sơn', N'Quận', N'20 42 41N, 106 44 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (309, 31, N'Kinh Dương', N'Quận', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (311, 31, N'Thuỷ Nguyên', N'Huyện', N'20 56 36N, 106 39 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (312, 31, N'An Dương', N'Huyện', N'20 53 06N, 106 35 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (313, 31, N'An Lão', N'Huyện', N'20 47 54N, 106 33 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (314, 31, N'Kiến Thụy', N'Huyện', N'20 45 13N, 106 41 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (315, 31, N'Tiên Lãng', N'Huyện', N'20 42 23N, 106 36 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (316, 31, N'Vĩnh Bảo', N'Huyện', N'20 40 56N, 106 29 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (317, 31, N'Cát Hải', N'Huyện', N'20 47 09N, 106 58 07E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (318, 31, N'Bạch Long Vĩ', N'Huyện', N'20 08 41N, 107 42 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (323, 33, N'Hưng Yên', N'Thành Phố', N'20 39 38N, 106 03 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (325, 33, N'Văn Lâm', N'Huyện', N'20 58 31N, 106 02 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (326, 33, N'Văn Giang', N'Huyện', N'20 55 51N, 105 57 14E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (327, 33, N'Yên Mỹ', N'Huyện', N'20 53 45N, 106 01 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (328, 33, N'Mỹ Hào', N'Huyện', N'20 55 35N, 106 05 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (329, 33, N'Ân Thi', N'Huyện', N'20 48 49N, 106 05 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (330, 33, N'Khoái Châu', N'Huyện', N'20 49 53N, 105 58 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (331, 33, N'Kim Động', N'Huyện', N'20 44 47N, 106 01 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (332, 33, N'Tiên Lữ', N'Huyện', N'20 40 05N, 106 07 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (333, 33, N'Phù Cừ', N'Huyện', N'20 42 51N, 106 11 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (336, 34, N'Thái Bình', N'Thành Phố', N'20 26 45N, 106 19 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (338, 34, N'Quỳnh Phụ', N'Huyện', N'20 38 57N, 106 21 16E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (339, 34, N'Hưng Hà', N'Huyện', N'20 35 38N, 106 12 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (340, 34, N'Đông Hưng', N'Huyện', N'20 32 50N, 106 20 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (341, 34, N'Thái Thụy', N'Huyện', N'20 32 33N, 106 32 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (342, 34, N'Tiền Hải', N'Huyện', N'20 21 05N, 106 32 45E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (343, 34, N'Kiến Xương', N'Huyện', N'20 23 52N, 106 25 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (344, 34, N'Vũ Thư', N'Huyện', N'20 25 29N, 106 16 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (347, 35, N'Phủ Lý', N'Thành Phố', N'20 32 19N, 105 54 55E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (349, 35, N'Duy Tiên', N'Huyện', N'20 37 33N, 105 58 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (350, 35, N'Kim Bảng', N'Huyện', N'20 34 19N, 105 50 41E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (351, 35, N'Thanh Liêm', N'Huyện', N'20 27 31N, 105 55 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (352, 35, N'Bình Lục', N'Huyện', N'20 29 23N, 106 02 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (353, 35, N'Lý Nhân', N'Huyện', N'20 32 55N, 106 04 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (356, 36, N'Nam Định', N'Thành Phố', N'20 25 07N, 106 09 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (358, 36, N'Mỹ Lộc', N'Huyện', N'20 27 21N, 106 07 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (359, 36, N'Vụ Bản', N'Huyện', N'20 22 57N, 106 05 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (360, 36, N'Ý Yên', N'Huyện', N'20 19 48N, 106 01 55E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (361, 36, N'Nghĩa Hưng', N'Huyện', N'20 05 37N, 106 08 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (362, 36, N'Nam Trực', N'Huyện', N'20 20 08N, 106 12 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (363, 36, N'Trực Ninh', N'Huyện', N'20 14 42N, 106 12 45E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (364, 36, N'Xuân Trường', N'Huyện', N'20 17 53N, 106 21 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (365, 36, N'Giao Thủy', N'Huyện', N'20 14 45N, 106 28 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (366, 36, N'Hải Hậu', N'Huyện', N'20 06 26N, 106 16 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (369, 37, N'Ninh Bình', N'Thành Phố', N'20 14 45N, 105 58 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (370, 37, N'Tam Điệp', N'Thị Xã', N'20 09 42N, 103 52 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (372, 37, N'Nho Quan', N'Huyện', N'20 18 46N, 105 42 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (373, 37, N'Gia Viễn', N'Huyện', N'20 19 50N, 105 52 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (374, 37, N'Hoa Lư', N'Huyện', N'20 15 04N, 105 55 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (375, 37, N'Yên Khánh', N'Huyện', N'20 11 26N, 106 04 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (376, 37, N'Kim Sơn', N'Huyện', N'20 02 07N, 106 05 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (377, 37, N'Yên Mô', N'Huyện', N'20 07 45N, 105 59 45E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (380, 38, N'Thanh Hóa', N'Thành Phố', N'19 48 26N, 105 47 37E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (381, 38, N'Bỉm Sơn', N'Thị Xã', N'20 05 21N, 105 51 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (382, 38, N'Sầm Sơn', N'Thị Xã', N'19 45 11N, 105 54 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (384, 38, N'Mường Lát', N'Huyện', N'20 30 42N, 104 37 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (385, 38, N'Quan Hóa', N'Huyện', N'20 29 15N, 104 56 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (386, 38, N'Bá Thước', N'Huyện', N'20 22 48N, 105 14 50E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (387, 38, N'Quan Sơn', N'Huyện', N'20 15 17N, 104 51 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (388, 38, N'Lang Chánh', N'Huyện', N'20 08 58N, 105 07 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (389, 38, N'Ngọc Lặc', N'Huyện', N'20 04 08N, 105 22 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (390, 38, N'Cẩm Thủy', N'Huyện', N'20 12 20N, 105 27 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (391, 38, N'Thạch Thành', N'Huyện', N'21 12 41N, 105 36 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (392, 38, N'Hà Trung', N'Huyện', N'20 03 20N, 105 51 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (393, 38, N'Vĩnh Lộc', N'Huyện', N'20 02 29N, 105 39 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (394, 38, N'Yên Định', N'Huyện', N'20 00 31N, 105 37 44E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (395, 38, N'Thọ Xuân', N'Huyện', N'19 55 39N, 105 29 14E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (396, 38, N'Thường Xuân', N'Huyện', N'19 54 55N, 105 10 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (397, 38, N'Triệu Sơn', N'Huyện', N'19 48 11N, 105 34 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (398, 38, N'Thiệu Hoá', N'Huyện', N'19 53 56N, 105 40 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (399, 38, N'Hoằng Hóa', N'Huyện', N'19 51 59N, 105 51 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (400, 38, N'Hậu Lộc', N'Huyện', N'19 56 02N, 105 53 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (401, 38, N'Nga Sơn', N'Huyện', N'20 00 16N, 105 59 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (402, 38, N'Như Xuân', N'Huyện', N'19 5 55N, 105 20 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (403, 38, N'Như Thanh', N'Huyện', N'19 35 19N, 105 33 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (404, 38, N'Nông Cống', N'Huyện', N'19 36 58N, 105 40 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (405, 38, N'Đông Sơn', N'Huyện', N'19 47 44N, 105 42 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (406, 38, N'Quảng Xương', N'Huyện', N'19 40 53N, 105 48 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (407, 38, N'Tĩnh Gia', N'Huyện', N'19 27 13N, 105 43 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (412, 40, N'Vinh', N'Thành Phố', N'18 41 06N, 105 42 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (413, 40, N'Cửa Lò', N'Thị Xã', N'18 47 26N, 105 43 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (414, 40, N'Thái Hoà', N'Thị Xã', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (415, 40, N'Quế Phong', N'Huyện', N'19 42 25N, 104 54 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (416, 40, N'Quỳ Châu', N'Huyện', N'19 32 16N, 105 03 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (417, 40, N'Kỳ Sơn', N'Huyện', N'19 24 36N, 104 09 45E')
GO
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (418, 40, N'Tương Dương', N'Huyện', N'19 19 15N, 104 35 41E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (419, 40, N'Nghĩa Đàn', N'Huyện', N'19 21 19N, 105 26 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (420, 40, N'Quỳ Hợp', N'Huyện', N'19 19 24N, 105 09 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (421, 40, N'Quỳnh Lưu', N'Huyện', N'19 14 01N, 105 37 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (422, 40, N'Con Cuông', N'Huyện', N'19 03 50N, 107 47 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (423, 40, N'Tân Kỳ', N'Huyện', N'19 06 11N, 105 14 14E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (424, 40, N'Anh Sơn', N'Huyện', N'18 58 04N, 105 04 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (425, 40, N'Diễn Châu', N'Huyện', N'19 01 20N, 105 34 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (426, 40, N'Yên Thành', N'Huyện', N'19 01 25N, 105 26 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (427, 40, N'Đô Lương', N'Huyện', N'18 55 00N, 105 21 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (428, 40, N'Thanh Chương', N'Huyện', N'18 44 11N, 105 12 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (429, 40, N'Nghi Lộc', N'Huyện', N'18 47 41N, 105 31 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (430, 40, N'Nam Đàn', N'Huyện', N'18 40 28N, 105 30 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (431, 40, N'Hưng Nguyên', N'Huyện', N'18 41 13N, 105 37 41E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (436, 42, N'Hà Tĩnh', N'Thành Phố', N'18 21 20N, 105 54 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (437, 42, N'Hồng Lĩnh', N'Thị Xã', N'18 32 05N, 105 42 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (439, 42, N'Hương Sơn', N'Huyện', N'18 26 47N, 105 19 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (440, 42, N'Đức Thọ', N'Huyện', N'18 29 23N, 105 36 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (441, 42, N'Vũ Quang', N'Huyện', N'18 19 30N, 105 26 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (442, 42, N'Nghi Xuân', N'Huyện', N'18 38 46N, 105 46 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (443, 42, N'Can Lộc', N'Huyện', N'18 26 39N, 105 46 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (444, 42, N'Hương Khê', N'Huyện', N'18 11 36N, 105 41 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (445, 42, N'Thạch Hà', N'Huyện', N'18 19 29N, 105 52 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (446, 42, N'Cẩm Xuyên', N'Huyện', N'18 11 32N, 106 00 04E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (447, 42, N'Kỳ Anh', N'Huyện', N'18 05 15N, 106 15 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (448, 42, N'Lộc Hà', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (450, 44, N'Đồng Hới', N'Thành Phố', N'17 26 53N, 106 35 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (452, 44, N'Minh Hóa', N'Huyện', N'17 44 03N, 105 51 45E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (453, 44, N'Tuyên Hóa', N'Huyện', N'17 54 04N, 105 58 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (454, 44, N'Quảng Trạch', N'Huyện', N'17 50 04N, 106 22 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (455, 44, N'Bố Trạch', N'Huyện', N'17 29 13N, 106 06 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (456, 44, N'Quảng Ninh', N'Huyện', N'17 15 15N, 106 32 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (457, 44, N'Lệ Thủy', N'Huyện', N'17 07 35N, 106 41 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (461, 45, N'Đông Hà', N'Thành Phố', N'16 48 12N, 107 05 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (462, 45, N'Quảng Trị', N'Thị Xã', N'16 44 37N, 107 11 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (464, 45, N'Vĩnh Linh', N'Huyện', N'17 01 35N, 106 53 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (465, 45, N'Hướng Hóa', N'Huyện', N'16 42 19N, 106 40 14E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (466, 45, N'Gio Linh', N'Huyện', N'16 54 49N, 106 56 16E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (467, 45, N'Đa Krông', N'Huyện', N'16 33 58N, 106 55 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (468, 45, N'Cam Lộ', N'Huyện', N'16 47 09N, 106 57 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (469, 45, N'Triệu Phong', N'Huyện', N'16 46 32N, 107 09 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (470, 45, N'Hải Lăng', N'Huyện', N'16 41 07N, 107 13 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (471, 45, N'Cồn Cỏ', N'Huyện', N'19 09 39N, 107 19 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (474, 46, N'Huế', N'Thành Phố', N'16 27 16N, 107 34 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (476, 46, N'Phong Điền', N'Huyện', N'16 32 42N, 106 16 37E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (477, 46, N'Quảng Điền', N'Huyện', N'16 35 21N, 107 29 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (478, 46, N'Phú Vang', N'Huyện', N'16 27 20N, 107 42 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (479, 46, N'Hương Thủy', N'Huyện', N'16 19 27N, 107 37 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (480, 46, N'Hương Trà', N'Huyện', N'16 25 49N, 107 28 37E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (481, 46, N'A Lưới', N'Huyện', N'16 13 59N, 107 16 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (482, 46, N'Phú Lộc', N'Huyện', N'16 17 16N, 107 55 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (483, 46, N'Nam Đông', N'Huyện', N'16 07 11N, 107 41 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (490, 48, N'Liên Chiểu', N'Quận', N'16 07 26N, 108 07 04E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (491, 48, N'Thanh Khê', N'Quận', N'16 03 28N, 108 11 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (492, 48, N'Hải Châu', N'Quận', N'16 03 38N, 108 11 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (493, 48, N'Sơn Trà', N'Quận', N'16 06 13N, 108 16 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (494, 48, N'Ngũ Hành Sơn', N'Quận', N'16 00 30N, 108 15 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (495, 48, N'Cẩm Lệ', N'Quận', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (497, 48, N'Hoà Vang', N'Huyện', N'16 03 59N, 108 01 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (498, 48, N'Hoàng Sa', N'Huyện', N'16 21 36N, 111 57 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (502, 49, N'Tam Kỳ', N'Thành Phố', N'15 34 37N, 108 29 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (503, 49, N'Hội An', N'Thành Phố', N'15 53 20N, 108 20 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (504, 49, N'Tây Giang', N'Huyện', N'15 53 46N, 107 25 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (505, 49, N'Đông Giang', N'Huyện', N'15 54 44N, 107 47 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (506, 49, N'Đại Lộc', N'Huyện', N'15 50 10N, 107 58 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (507, 49, N'Điện Bàn', N'Huyện', N'15 54 15N, 108 13 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (508, 49, N'Duy Xuyên', N'Huyện', N'15 47 58N, 108 13 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (509, 49, N'Quế Sơn', N'Huyện', N'15 41 03N, 108 05 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (510, 49, N'Nam Giang', N'Huyện', N'15 36 37N, 107 33 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (511, 49, N'Phước Sơn', N'Huyện', N'15 23 17N, 107 50 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (512, 49, N'Hiệp Đức', N'Huyện', N'15 31 09N, 108 05 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (513, 49, N'Thăng Bình', N'Huyện', N'15 42 29N, 108 22 04E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (514, 49, N'Tiên Phước', N'Huyện', N'15 29 30N, 108 15 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (515, 49, N'Bắc Trà My', N'Huyện', N'15 08 00N, 108 05 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (516, 49, N'Nam Trà My', N'Huyện', N'15 16 40N, 108 12 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (517, 49, N'Núi Thành', N'Huyện', N'15 26 53N, 108 34 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (518, 49, N'Phú Ninh', N'Huyện', N'15 30 43N, 108 24 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (519, 49, N'Nông Sơn', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (522, 51, N'Quảng Ngãi', N'Thành Phố', N'15 07 17N, 108 48 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (524, 51, N'Bình Sơn', N'Huyện', N'15 18 45N, 108 45 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (525, 51, N'Trà Bồng', N'Huyện', N'15 13 30N, 108 29 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (526, 51, N'Tây Trà', N'Huyện', N'15 11 13N, 108 22 23E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (527, 51, N'Sơn Tịnh', N'Huyện', N'15 11 49N, 108 45 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (528, 51, N'Tư Nghĩa', N'Huyện', N'15 05 25N, 108 45 23E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (529, 51, N'Sơn Hà', N'Huyện', N'14 58 35N, 108 29 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (530, 51, N'Sơn Tây', N'Huyện', N'14 58 11N, 108 21 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (531, 51, N'Minh Long', N'Huyện', N'14 56 49N, 108 40 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (532, 51, N'Nghĩa Hành', N'Huyện', N'14 58 06N, 108 46 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (533, 51, N'Mộ Đức', N'Huyện', N'11 59 13N, 108 52 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (534, 51, N'Đức Phổ', N'Huyện', N'14 44 59N, 108 56 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (535, 51, N'Ba Tơ', N'Huyện', N'14 42 52N, 108 43 44E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (536, 51, N'Lý Sơn', N'Huyện', N'15 22 50N, 109 06 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (540, 52, N'Qui Nhơn', N'Thành Phố', N'13 47 15N, 109 12 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (542, 52, N'An Lão', N'Huyện', N'14 32 10N, 108 47 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (543, 52, N'Hoài Nhơn', N'Huyện', N'14 30 56N, 109 01 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (544, 52, N'Hoài Ân', N'Huyện', N'14 20 51N, 108 54 04E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (545, 52, N'Phù Mỹ', N'Huyện', N'14 14 41N, 109 05 43E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (546, 52, N'Vĩnh Thạnh', N'Huyện', N'14 14 26N, 108 44 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (547, 52, N'Tây Sơn', N'Huyện', N'13 56 47N, 108 53 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (548, 52, N'Phù Cát', N'Huyện', N'14 03 48N, 109 03 57E')
GO
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (549, 52, N'An Nhơn', N'Huyện', N'13 51 28N, 109 04 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (550, 52, N'Tuy Phước', N'Huyện', N'13 46 30N, 109 05 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (551, 52, N'Vân Canh', N'Huyện', N'13 40 35N, 108 57 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (555, 54, N'Tuy Hòa', N'Thành Phố', N'13 05 42N, 109 15 50E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (557, 54, N'Sông Cầu', N'Thị Xã', N'13 31 40N, 109 12 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (558, 54, N'Đồng Xuân', N'Huyện', N'13 24 59N, 108 56 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (559, 54, N'Tuy An', N'Huyện', N'13 15 19N, 109 12 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (560, 54, N'Sơn Hòa', N'Huyện', N'13 12 16N, 108 57 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (561, 54, N'Sông Hinh', N'Huyện', N'12 54 19N, 108 53 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (562, 54, N'Tây Hoà', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (563, 54, N'Phú Hoà', N'Huyện', N'13 04 07N, 109 11 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (564, 54, N'Đông Hoà', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (568, 56, N'Nha Trang', N'Thành Phố', N'12 15 40N, 109 10 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (569, 56, N'Cam Ranh', N'Thị Xã', N'11 59 05N, 108 08 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (570, 56, N'Cam Lâm', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (571, 56, N'Vạn Ninh', N'Huyện', N'12 43 10N, 109 11 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (572, 56, N'Ninh Hòa', N'Huyện', N'12 32 54N, 109 06 11E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (573, 56, N'Khánh Vĩnh', N'Huyện', N'12 17 50N, 108 51 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (574, 56, N'Diên Khánh', N'Huyện', N'12 13 19N, 109 02 16E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (575, 56, N'Khánh Sơn', N'Huyện', N'12 02 17N, 108 53 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (576, 56, N'Trường Sa', N'Huyện', N'9 07 27N, 114 15 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (582, 58, N'Phan Rang-Tháp Chàm', N'Thành Phố', N'11 36 11N, 108 58 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (584, 58, N'Bác Ái', N'Huyện', N'11 54 45N, 108 51 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (585, 58, N'Ninh Sơn', N'Huyện', N'11 42 36N, 108 44 55E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (586, 58, N'Ninh Hải', N'Huyện', N'11 42 46N, 109 05 41E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (587, 58, N'Ninh Phước', N'Huyện', N'11 28 56N, 108 50 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (588, 58, N'Thuận Bắc', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (589, 58, N'Thuận Nam', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (593, 60, N'Phan Thiết', N'Thành Phố', N'10 54 16N, 108 03 44E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (594, 60, N'La Gi', N'Thị Xã', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (595, 60, N'Tuy Phong', N'Huyện', N'11 20 26N, 108 41 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (596, 60, N'Bắc Bình', N'Huyện', N'11 15 52N, 108 21 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (597, 60, N'Hàm Thuận Bắc', N'Huyện', N'11 09 18N, 108 03 07E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (598, 60, N'Hàm Thuận Nam', N'Huyện', N'10 56 20N, 107 54 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (599, 60, N'Tánh Linh', N'Huyện', N'11 08 26N, 107 41 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (600, 60, N'Đức Linh', N'Huyện', N'11 11 43N, 107 31 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (601, 60, N'Hàm Tân', N'Huyện', N'10 44 41N, 107 41 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (602, 60, N'Phú Quí', N'Huyện', N'10 33 13N, 108 57 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (608, 62, N'Kon Tum', N'Thành Phố', N'14 20 32N, 107 58 04E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (610, 62, N'Đắk Glei', N'Huyện', N'15 08 13N, 107 44 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (611, 62, N'Ngọc Hồi', N'Huyện', N'14 44 23N, 107 38 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (612, 62, N'Đắk Tô', N'Huyện', N'14 46 49N, 107 55 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (613, 62, N'Kon Plông', N'Huyện', N'14 48 13N, 108 20 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (614, 62, N'Kon Rẫy', N'Huyện', N'14 32 56N, 108 13 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (615, 62, N'Đắk Hà', N'Huyện', N'14 36 50N, 107 59 55E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (616, 62, N'Sa Thầy', N'Huyện', N'14 16 02N, 107 36 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (617, 62, N'Tu Mơ Rông', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (622, 64, N'Pleiku', N'Thành Phố', N'13 57 42N, 107 58 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (623, 64, N'An Khê', N'Thị Xã', N'14 01 24N, 108 41 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (624, 64, N'Ayun Pa', N'Thị Xã', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (625, 64, N'Kbang', N'Huyện', N'14 18 08N, 108 29 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (626, 64, N'Đăk Đoa', N'Huyện', N'14 07 02N, 108 09 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (627, 64, N'Chư Păh', N'Huyện', N'14 13 30N, 107 56 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (628, 64, N'Ia Grai', N'Huyện', N'13 59 25N, 107 43 16E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (629, 64, N'Mang Yang', N'Huyện', N'13 57 26N, 108 18 37E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (630, 64, N'Kông Chro', N'Huyện', N'13 45 47N, 108 36 04E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (631, 64, N'Đức Cơ', N'Huyện', N'13 46 16N, 107 38 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (632, 64, N'Chư Prông', N'Huyện', N'13 35 39N, 107 47 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (633, 64, N'Chư Sê', N'Huyện', N'13 37 04N, 108 06 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (634, 64, N'Đăk Pơ', N'Huyện', N'13 55 47N, 108 36 16E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (635, 64, N'Ia Pa', N'Huyện', N'13 31 37N, 108 30 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (637, 64, N'Krông Pa', N'Huyện', N'13 14 13N, 108 39 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (638, 64, N'Phú Thiện', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (639, 64, N'Chư Pưh', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (643, 66, N'Buôn Ma Thuột', N'Thành Phố', N'12 39 43N, 108 10 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (644, 66, N'Buôn Hồ', N'Thị Xã', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (645, 66, N'Ea H''leo', N'Huyện', N'13 13 52N, 108 12 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (646, 66, N'Ea Súp', N'Huyện', N'13 10 59N, 107 46 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (647, 66, N'Buôn Đôn', N'Huyện', N'12 52 45N, 107 45 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (648, 66, N'Cư M''gar', N'Huyện', N'12 53 47N, 108 04 16E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (649, 66, N'Krông Búk', N'Huyện', N'12 56 27N, 108 13 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (650, 66, N'Krông Năng', N'Huyện', N'12 59 41N, 108 23 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (651, 66, N'Ea Kar', N'Huyện', N'12 48 17N, 108 32 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (652, 66, N'M''đrắk', N'Huyện', N'12 42 14N, 108 47 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (653, 66, N'Krông Bông', N'Huyện', N'12 27 08N, 108 27 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (654, 66, N'Krông Pắc', N'Huyện', N'12 41 20N, 108 18 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (655, 66, N'Krông A Na', N'Huyện', N'12 31 51N, 108 05 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (656, 66, N'Lắk', N'Huyện', N'12 19 20N, 108 12 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (657, 66, N'Cư Kuin', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (660, 67, N'Gia Nghĩa', N'Thị Xã', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (661, 67, N'Đắk Glong', N'Huyện', N'12 01 53N, 107 50 37E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (662, 67, N'Cư Jút', N'Huyện', N'12 40 56N, 107 44 44E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (663, 67, N'Đắk Mil', N'Huyện', N'12 31 08N, 107 42 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (664, 67, N'Krông Nô', N'Huyện', N'12 22 16N, 107 53 49E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (665, 67, N'Đắk Song', N'Huyện', N'12 14 04N, 107 36 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (666, 67, N'Đắk R''lấp', N'Huyện', N'12 02 30N, 107 25 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (667, 67, N'Tuy Đức', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (672, 68, N'Đà Lạt', N'Thành Phố', N'11 54 33N, 108 27 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (673, 68, N'Bảo Lộc', N'Thị Xã', N'11 32 48N, 107 47 37E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (674, 68, N'Đam Rông', N'Huyện', N'12 02 35N, 108 10 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (675, 68, N'Lạc Dương', N'Huyện', N'12 08 30N, 108 27 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (676, 68, N'Lâm Hà', N'Huyện', N'11 55 26N, 108 11 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (677, 68, N'Đơn Dương', N'Huyện', N'11 48 26N, 108 32 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (678, 68, N'Đức Trọng', N'Huyện', N'11 41 50N, 108 18 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (679, 68, N'Di Linh', N'Huyện', N'11 31 10N, 108 05 23E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (680, 68, N'Bảo Lâm', N'Huyện', N'11 38 31N, 107 43 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (681, 68, N'Đạ Huoai', N'Huyện', N'11 27 11N, 107 38 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (682, 68, N'Đạ Tẻh', N'Huyện', N'11 33 46N, 107 32 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (683, 68, N'Cát Tiên', N'Huyện', N'11 39 38N, 107 23 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (688, 70, N'Phước Long', N'Thị Xã', N'')
GO
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (689, 70, N'Đồng Xoài', N'Thị Xã', N'11 31 01N, 106 50 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (690, 70, N'Bình Long', N'Thị Xã', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (691, 70, N'Bù Gia Mập', N'Huyện', N'11 56 57N, 106 59 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (692, 70, N'Lộc Ninh', N'Huyện', N'11 49 28N, 106 35 11E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (693, 70, N'Bù Đốp', N'Huyện', N'11 59 08N, 106 49 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (694, 70, N'Hớn Quản', N'Huyện', N'11 37 37N, 106 36 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (695, 70, N'Đồng Phù', N'Huyện', N'11 28 45N, 106 57 07E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (696, 70, N'Bù Đăng', N'Huyện', N'11 46 09N, 107 14 14E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (697, 70, N'Chơn Thành', N'Huyện', N'11 28 45N, 106 39 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (703, 72, N'Tây Ninh', N'Thị Xã', N'11 21 59N, 106 07 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (705, 72, N'Tân Biên', N'Huyện', N'11 35 14N, 105 57 53E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (706, 72, N'Tân Châu', N'Huyện', N'11 34 49N, 106 17 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (707, 72, N'Dương Minh Châu', N'Huyện', N'11 22 04N, 106 16 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (708, 72, N'Châu Thành', N'Huyện', N'11 19 02N, 106 00 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (709, 72, N'Hòa Thành', N'Huyện', N'11 15 31N, 106 08 44E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (710, 72, N'Gò Dầu', N'Huyện', N'11 09 39N, 106 14 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (711, 72, N'Bến Cầu', N'Huyện', N'11 07 50N, 106 08 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (712, 72, N'Trảng Bàng', N'Huyện', N'11 06 18N, 106 23 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (718, 74, N'Thủ Dầu Một', N'Thị Xã', N'11 00 01N, 106 38 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (720, 74, N'Dầu Tiếng', N'Huyện', N'11 19 07N, 106 26 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (721, 74, N'Bến Cát', N'Huyện', N'11 12 42N, 106 36 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (722, 74, N'Phú Giáo', N'Huyện', N'11 20 21N, 106 47 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (723, 74, N'Tân Uyên', N'Huyện', N'11 06 31N, 106 49 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (724, 74, N'Dĩ An', N'Huyện', N'10 55 03N, 106 47 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (725, 74, N'Thuận An', N'Huyện', N'10 55 58N, 106 41 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (731, 75, N'Biên Hòa', N'Thành Phố', N'10 56 31N, 106 50 50E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (732, 75, N'Long Khánh', N'Thị Xã', N'10 56 24N, 107 14 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (734, 75, N'Tân Phú', N'Huyện', N'11 22 51N, 107 21 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (735, 75, N'Vĩnh Cửu', N'Huyện', N'11 14 31N, 107 00 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (736, 75, N'Định Quán', N'Huyện', N'11 12 41N, 107 17 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (737, 75, N'Trảng Bom', N'Huyện', N'10 58 39N, 107 00 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (738, 75, N'Thống Nhất', N'Huyện', N'10 58 29N, 107 09 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (739, 75, N'Cẩm Mỹ', N'Huyện', N'10 47 05N, 107 14 36E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (740, 75, N'Long Thành', N'Huyện', N'10 47 38N, 106 59 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (741, 75, N'Xuân Lộc', N'Huyện', N'10 55 39N, 107 24 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (742, 75, N'Nhơn Trạch', N'Huyện', N'10 39 18N, 106 53 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (747, 77, N'Vũng Tầu', N'Thành Phố', N'10 24 08N, 107 07 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (748, 77, N'Bà Rịa', N'Thị Xã', N'10 30 33N, 107 10 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (750, 77, N'Châu Đức', N'Huyện', N'10 39 23N, 107 15 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (751, 77, N'Xuyên Mộc', N'Huyện', N'10 37 46N, 107 29 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (752, 77, N'Long Điền', N'Huyện', N'10 26 47N, 107 12 53E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (753, 77, N'Đất Đỏ', N'Huyện', N'10 28 40N, 107 18 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (754, 77, N'Tân Thành', N'Huyện', N'10 34 50N, 107 05 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (755, 77, N'Côn Đảo', N'Huyện', N'8 42 25N, 106 36 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (760, 1, N'Quận 1', N'Quận', N'10 46 34N, 106 41 45E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (761, 1, N'Quận 12', N'Quận', N'10 51 43N, 106 39 32E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (762, 1, N'Thủ Đức', N'Quận', N'10 51 20N, 106 45 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (763, 1, N'Quận 9', N'Quận', N'10 49 49N, 106 49 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (764, 1, N'Gò Vấp', N'Quận', N'10 50 12N, 106 39 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (765, 1, N'Bình Thạnh', N'Quận', N'10 48 46N, 106 42 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (766, 1, N'Tân Bình', N'Quận', N'10 48 13N, 106 39 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (767, 1, N'Tân Phú', N'Quận', N'10 47 32N, 106 37 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (768, 1, N'Phú Nhuận', N'Quận', N'10 48 06N, 106 40 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (769, 1, N'Quận 2', N'Quận', N'10 46 51N, 106 45 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (770, 1, N'Quận 3', N'Quận', N'10 46 48N, 106 40 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (771, 1, N'Quận 10', N'Quận', N'10 46 25N, 106 40 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (772, 1, N'Quận 11', N'Quận', N'10 46 01N, 106 38 44E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (773, 1, N'Quận 4', N'Quận', N'10 45 42N, 106 42 09E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (774, 1, N'Quận 5', N'Quận', N'10 45 24N, 106 40 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (775, 1, N'Quận 6', N'Quận', N'10 44 46N, 106 38 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (776, 1, N'Quận 8', N'Quận', N'10 43 24N, 106 37 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (777, 1, N'Bình Tân', N'Quận', N'10 46 16N, 106 35 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (778, 1, N'Quận 7', N'Quận', N'10 44 19N, 106 43 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (783, 1, N'Củ Chi', N'Huyện', N'11 02 17N, 106 30 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (784, 1, N'Hóc Môn', N'Huyện', N'10 52 42N, 106 35 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (785, 1, N'Bình Chánh', N'Huyện', N'10 45 01N, 106 30 45E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (786, 1, N'Nhà Bè', N'Huyện', N'10 39 06N, 106 43 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (787, 1, N'Cần Giờ', N'Huyện', N'10 30 43N, 106 52 50E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (794, 80, N'Tân An', N'Thành Phố', N'10 31 36N, 106 24 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (796, 80, N'Tân Hưng', N'Huyện', N'10 49 05N, 105 39 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (797, 80, N'Vĩnh Hưng', N'Huyện', N'10 52 54N, 105 45 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (798, 80, N'Mộc Hóa', N'Huyện', N'10 47 09N, 105 57 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (799, 80, N'Tân Thạnh', N'Huyện', N'10 37 44N, 105 57 07E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (800, 80, N'Thạnh Hóa', N'Huyện', N'10 41 37N, 106 11 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (801, 80, N'Đức Huệ', N'Huyện', N'10 51 57N, 106 15 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (802, 80, N'Đức Hòa', N'Huyện', N'10 53 04N, 106 23 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (803, 80, N'Bến Lức', N'Huyện', N'10 41 40N, 106 26 28E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (804, 80, N'Thủ Thừa', N'Huyện', N'10 39 41N, 106 20 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (805, 80, N'Tân Trụ', N'Huyện', N'10 31 47N, 106 30 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (806, 80, N'Cần Đước', N'Huyện', N'10 32 21N, 106 36 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (807, 80, N'Cần Giuộc', N'Huyện', N'10 34 43N, 106 38 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (808, 80, N'Châu Thành', N'Huyện', N'10 27 52N, 106 30 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (815, 82, N'Mỹ Tho', N'Thành Phố', N'10 22 14N, 106 21 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (816, 82, N'Gò Công', N'Thị Xã', N'10 21 55N, 106 40 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (818, 82, N'Tân Phước', N'Huyện', N'10 30 36N, 106 13 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (819, 82, N'Cái Bè', N'Huyện', N'10 24 21N, 105 56 01E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (820, 82, N'Cai Lậy', N'Huyện', N'10 24 20N, 106 06 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (821, 82, N'Châu Thành', N'Huyện', N'20 25 21N, 106 16 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (822, 82, N'Chợ Gạo', N'Huyện', N'10 23 45N, 106 26 53E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (823, 82, N'Gò Công Tây', N'Huyện', N'10 19 55N, 106 35 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (824, 82, N'Gò Công Đông', N'Huyện', N'10 20 42N, 106 42 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (825, 82, N'Tân Phú Đông', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (829, 83, N'Bến Tre', N'Thành Phố', N'10 14 17N, 106 22 26E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (831, 83, N'Châu Thành', N'Huyện', N'10 17 24N, 106 17 45E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (832, 83, N'Chợ Lách', N'Huyện', N'10 13 26N, 106 09 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (833, 83, N'Mỏ Cày Nam', N'Huyện', N'10 06 56N, 106 19 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (834, 83, N'Giồng Trôm', N'Huyện', N'10 08 46N, 106 28 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (835, 83, N'Bình Đại', N'Huyện', N'10 09 56N, 106 37 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (836, 83, N'Ba Tri', N'Huyện', N'10 04 08N, 106 35 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (837, 83, N'Thạnh Phú', N'Huyện', N'9 55 53N, 106 32 45E')
GO
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (838, 83, N'Mỏ Cày Bắc', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (842, 84, N'Trà Vinh', N'Thị Xã', N'9 57 09N, 106 20 39E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (844, 84, N'Càng Long', N'Huyện', N'9 58 18N, 106 12 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (845, 84, N'Cầu Kè', N'Huyện', N'9 51 23N, 106 03 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (846, 84, N'Tiểu Cần', N'Huyện', N'9 48 37N, 106 12 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (847, 84, N'Châu Thành', N'Huyện', N'9 52 57N, 106 24 12E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (848, 84, N'Cầu Ngang', N'Huyện', N'9 47 14N, 106 29 19E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (849, 84, N'Trà Cú', N'Huyện', N'9 42 06N, 106 16 24E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (850, 84, N'Duyên Hải', N'Huyện', N'9 39 58N, 106 26 23E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (855, 86, N'Vĩnh Long', N'Thành Phố', N'10 15 09N, 105 56 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (857, 86, N'Long Hồ', N'Huyện', N'10 13 58N, 105 55 47E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (858, 86, N'Mang Thít', N'Huyện', N'10 10 58N, 106 05 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (859, 86, N'Vũng Liêm', N'Huyện', N'10 03 32N, 106 10 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (860, 86, N'Tam Bình', N'Huyện', N'10 03 58N, 105 58 03E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (861, 86, N'Bình Minh', N'Huyện', N'10 05 45N, 105 47 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (862, 86, N'Trà Ôn', N'Huyện', N'9 59 20N, 105 57 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (863, 86, N'Bình Tân', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (866, 87, N'Cao Lãnh', N'Thành Phố', N'10 27 38N, 105 37 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (867, 87, N'Sa Đéc', N'Thị Xã', N'10 19 22N, 105 44 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (868, 87, N'Hồng Ngự', N'Thị Xã', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (869, 87, N'Tân Hồng', N'Huyện', N'10 52 48N, 105 29 21E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (870, 87, N'Hồng Ngự', N'Huyện', N'10 48 13N, 105 19 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (871, 87, N'Tam Nông', N'Huyện', N'10 44 06N, 105 30 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (872, 87, N'Tháp Mười', N'Huyện', N'10 33 36N, 105 47 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (873, 87, N'Cao Lãnh', N'Huyện', N'10 29 03N, 105 41 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (874, 87, N'Thanh Bình', N'Huyện', N'10 36 38N, 105 28 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (875, 87, N'Lấp Vò', N'Huyện', N'10 21 27N, 105 36 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (876, 87, N'Lai Vung', N'Huyện', N'10 14 43N, 105 38 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (877, 87, N'Châu Thành', N'Huyện', N'10 13 27N, 105 48 38E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (883, 89, N'Long Xuyên', N'Thành Phố', N'10 22 22N, 105 25 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (884, 89, N'Châu Đốc', N'Thị Xã', N'10 41 20N, 105 05 15E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (886, 89, N'An Phú', N'Huyện', N'10 50 12N, 105 05 33E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (887, 89, N'Tân Châu', N'Thị Xã', N'10 49 11N, 105 11 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (888, 89, N'Phú Tân', N'Huyện', N'10 40 26N, 105 14 40E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (889, 89, N'Châu Phú', N'Huyện', N'10 34 12N, 105 12 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (890, 89, N'Tịnh Biên', N'Huyện', N'10 33 30N, 105 00 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (891, 89, N'Tri Tôn', N'Huyện', N'10 24 41N, 104 56 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (892, 89, N'Châu Thành', N'Huyện', N'10 25 39N, 105 15 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (893, 89, N'Chợ Mới', N'Huyện', N'10 27 23N, 105 26 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (894, 89, N'Thoại Sơn', N'Huyện', N'10 16 45N, 105 15 59E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (899, 91, N'Rạch Giá', N'Thành Phố', N'10 01 35N, 105 06 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (900, 91, N'Hà Tiên', N'Thị Xã', N'10 22 54N, 104 30 10E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (902, 91, N'Kiên Lương', N'Huyện', N'10 20 21N, 104 39 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (903, 91, N'Hòn Đất', N'Huyện', N'10 14 20N, 104 55 57E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (904, 91, N'Tân Hiệp', N'Huyện', N'10 05 18N, 105 14 04E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (905, 91, N'Châu Thành', N'Huyện', N'9 57 37N, 105 10 16E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (906, 91, N'Giồng Giềng', N'Huyện', N'9 56 05N, 105 22 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (907, 91, N'Gò Quao', N'Huyện', N'9 43 17N, 105 17 06E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (908, 91, N'An Biên', N'Huyện', N'9 48 37N, 105 03 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (909, 91, N'An Minh', N'Huyện', N'9 40 24N, 104 59 05E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (910, 91, N'Vĩnh Thuận', N'Huyện', N'9 33 25N, 105 11 30E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (911, 91, N'Phú Quốc', N'Huyện', N'10 13 44N, 103 57 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (912, 91, N'Kiên Hải', N'Huyện', N'9 48 31N, 104 37 48E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (913, 91, N'U Minh Thượng', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (914, 91, N'Giang Thành', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (916, 92, N'Ninh Kiều', N'Quận', N'10 01 58N, 105 45 34E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (917, 92, N'Ô Môn', N'Quận', N'10 07 28N, 105 37 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (918, 92, N'Bình Thuỷ', N'Quận', N'10 03 42N, 105 43 17E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (919, 92, N'Cái Răng', N'Quận', N'9 59 57N, 105 46 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (923, 92, N'Thốt Nốt', N'Quận', N'10 14 23N, 105 32 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (924, 92, N'Vĩnh Thạnh', N'Huyện', N'10 11 35N, 105 22 45E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (925, 92, N'Cờ Đỏ', N'Huyện', N'10 02 48N, 105 29 46E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (926, 92, N'Phong Điền', N'Huyện', N'9 59 57N, 105 39 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (927, 92, N'Thới Lai', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (930, 93, N'Vị Thanh', N'Thị Xã', N'9 45 15N, 105 24 50E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (931, 93, N'Ngã Bảy', N'Thị Xã', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (932, 93, N'Châu Thành A', N'Huyện', N'9 55 50N, 105 38 31E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (933, 93, N'Châu Thành', N'Huyện', N'9 55 22N, 105 48 37E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (934, 93, N'Phụng Hiệp', N'Huyện', N'9 47 20N, 105 43 29E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (935, 93, N'Vị Thuỷ', N'Huyện', N'9 48 05N, 105 32 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (936, 93, N'Long Mỹ', N'Huyện', N'9 40 47N, 105 30 53E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (941, 94, N'Sóc Trăng', N'Thành Phố', N'9 36 39N, 105 59 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (942, 94, N'Châu Thành', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (943, 94, N'Kế Sách', N'Huyện', N'9 49 30N, 105 57 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (944, 94, N'Mỹ Tú', N'Huyện', N'9 38 21N, 105 49 52E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (945, 94, N'Cù Lao Dung', N'Huyện', N'9 37 36N, 106 12 13E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (946, 94, N'Long Phú', N'Huyện', N'9 34 38N, 106 06 07E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (947, 94, N'Mỹ Xuyên', N'Huyện', N'9 28 16N, 105 55 51E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (948, 94, N'Ngã Năm', N'Huyện', N'9 31 38N, 105 37 22E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (949, 94, N'Thạnh Trị', N'Huyện', N'9 28 05N, 105 43 02E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (950, 94, N'Vĩnh Châu', N'Huyện', N'9 20 50N, 105 59 58E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (951, 94, N'Trần Đề', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (954, 95, N'Bạc Liêu', N'Thị Xã', N'9 16 05N, 105 45 08E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (956, 95, N'Hồng Dân', N'Huyện', N'9 30 37N, 105 24 25E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (957, 95, N'Phước Long', N'Huyện', N'9 23 13N, 105 24 41E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (958, 95, N'Vĩnh Lợi', N'Huyện', N'9 16 51N, 105 40 54E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (959, 95, N'Giá Rai', N'Huyện', N'9 15 51N, 105 23 18E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (960, 95, N'Đông Hải', N'Huyện', N'9 08 11N, 105 24 42E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (961, 95, N'Hoà Bình', N'Huyện', N'')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (964, 96, N'Cà Mau', N'Thành Phố', N'9 10 33N, 105 11 11E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (966, 96, N'U Minh', N'Huyện', N'9 22 30N, 104 57 00E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (967, 96, N'Thới Bình', N'Huyện', N'9 22 50N, 105 07 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (968, 96, N'Trần Văn Thời', N'Huyện', N'9 07 36N, 104 57 27E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (969, 96, N'Cái Nước', N'Huyện', N'9 00 31N, 105 03 23E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (970, 96, N'Đầm Dơi', N'Huyện', N'8 57 48N, 105 13 56E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (971, 96, N'Năm Căn', N'Huyện', N'8 46 59N, 104 58 20E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (972, 96, N'Phú Tân', N'Huyện', N'8 52 47N, 104 53 35E')
INSERT [dbo].[Core_District] ([Id], [StateOrProvinceId], [Name], [Type], [Location]) VALUES (973, 96, N'Ngọc Hiển', N'Huyện', N'8 40 47N, 104 57 58E')
SET IDENTITY_INSERT [dbo].[Core_District] OFF
SET IDENTITY_INSERT [dbo].[Core_Entity] ON 

INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (1, N'thoi-trang-nu', N'Thời trang nữ', 1, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (2, N'man', N'Man', 2, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (3, N'thiet-bi-dien-tu', N'Thiết bị điện tử', 3, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (4, N'phu-kien-dien-tu', N'Phụ kiện điện tử', 4, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (5, N't-shirt', N'T-Shirt', 5, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (6, N'suit', N'Suit', 6, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (7, N'lightweight-jacket', N'Lightweight Jacket', 1, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (8, N'esprit-ruffle-shirt', N'Esprit Ruffle Shirt', 8, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (9, N'herschel-supply', N'Herschel supply', 9, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (10, N'only-check-trouser', N'Only Check Trouser', 10, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (11, N'classic-trench-coat', N'Classic Trench Coat', 11, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (12, N'front-pocket-jumper', N'Front Pocket Jumper', 12, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (13, N'vintage-inspired-classic', N'Vintage Inspired Classic', 13, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (14, N'shirt-in-stretch-cotton', N'Shirt in Stretch Cotton', 14, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (15, N'pieces-metallic-printed', N'Pieces Metallic Printed', 15, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (16, N'converse-all-star-hi-plimsolls', N'Converse All Star Hi Plimsolls', 16, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (17, N'femme-t-shirt-in-stripe', N'Femme T-Shirt In Stripe', 17, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (18, N'herschel-supply-2', N'Herschel supply', 18, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (19, N'herschel-supply-2-3', N'Herschel supply', 19, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (20, N't-shirt-with-sleeve', N'T-Shirt with Sleeve', 20, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (21, N'pretty-little-thing', N'Pretty Little Thing', 21, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (22, N'square-neck-back', N'Square Neck Back', 22, N'Product')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (23, N'help-center', N'Help center', 1, N'Page')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (24, N'about-us', N'About Us', 2, N'Page')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (25, N'terms-of-use', N'Terms of Use', 3, N'Page')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (26, N'adidas', N'Adidas', 1, N'Brand')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (27, N'calvin-klein', N'Calvin Klein', 2, N'Brand')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (28, N'ogival', N'Ogival', 3, N'Brand')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (39, N'thoi-trang-nam', N'Thời trang nam', 16, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (40, N'skirts', N'Skirts', 17, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (41, N'woman-skirts', N'Skirts', 18, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (42, N'woman-t-shirt', N'T-Shirt', 19, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (43, N'couple', N'Couple', 20, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (44, N't-shirt-2', N'T-Shirt', 21, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (45, N'shoes-2', N'Shoes', 22, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (46, N'suc-khoe-va-lam-dep', N'Sức Khỏe Và Làm Đẹp', 23, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (47, N'sieu-thi-tap-hoa', N'Siêu thị tạp hóa', 24, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (48, N'tv-&-dien-gia-dung', N'TV & Điện Gia Dụng', 25, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (49, N'phu-kien-di-dong', N'Phụ kiện di động', 26, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (50, N'phu-kien-may-tinh', N'Phụ kiện máy tính', 27, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (51, N'sim-&-the-cao', N'SIM & Thẻ cào', 28, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (52, N'pin-sac-du-phong', N'Pin sạc dự phòng', 29, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (53, N'phu-kien-tivi', N'Phụ kiện Tivi', 30, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (57, N'suc-khoe-va-lam-dep-2', N'Sức Khỏe Và Làm Đẹp', 34, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (58, N'phu-kien-thoi-trang', N'Phụ kiện thời trang', 35, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (59, N'oto,-xe-may-&-thiet-bi-dinh-vi', N'Ôtô, Xe máy & Thiết bị định vị', 36, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (60, N'the-thao-va-du-lich', N'Thể thao và du lịch', 37, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (61, N'hang-gia-dung-va-doi-song', N'Hàng gia dụng và đời sống', 38, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (62, N'hang-me,-be-va-do-choi', N'Hàng mẹ, bé và đồ chơi', 39, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (63, N'xe-may', N'Xe máy', 40, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (64, N'oto', N'Ôtô', 41, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (65, N'dich-vu-cham-soc-xe', N'Dịch vụ chăm sóc xe', 42, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (66, N'phu-tung-&-phu-kien-xe-may', N'Phụ tùng & phụ kiện xe máy', 43, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (67, N'lap-dat-lop-va-mam-oto', N'Lắp đặt lốp và mâm ôtô', 44, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (68, N'lap-dat-phu-kien', N'Lắp đặt phụ kiện', 45, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (69, N'dich-vu-ve-dong-co', N'Dịch vụ về động cơ', 46, N'Category')
INSERT [dbo].[Core_Entity] ([Id], [Slug], [Name], [EntityId], [EntityTypeId]) VALUES (70, N'dich-vu-ve-thang', N'Dịch vụ về thắng', 47, N'Category')
SET IDENTITY_INSERT [dbo].[Core_Entity] OFF
INSERT [dbo].[Core_EntityType] ([Id], [IsMenuable], [AreaName], [RoutingController], [RoutingAction]) VALUES (N'Brand', 1, N'Catalog', N'Brand', N'BrandDetail')
INSERT [dbo].[Core_EntityType] ([Id], [IsMenuable], [AreaName], [RoutingController], [RoutingAction]) VALUES (N'Category', 1, N'Catalog', N'Category', N'CategoryDetail')
INSERT [dbo].[Core_EntityType] ([Id], [IsMenuable], [AreaName], [RoutingController], [RoutingAction]) VALUES (N'NewsCategory', 1, N'News', N'NewsCategory', N'NewsCategoryDetail')
INSERT [dbo].[Core_EntityType] ([Id], [IsMenuable], [AreaName], [RoutingController], [RoutingAction]) VALUES (N'NewsItem', 0, N'News', N'NewsItem', N'NewsItemDetail')
INSERT [dbo].[Core_EntityType] ([Id], [IsMenuable], [AreaName], [RoutingController], [RoutingAction]) VALUES (N'Page', 1, N'Cms', N'Page', N'PageDetail')
INSERT [dbo].[Core_EntityType] ([Id], [IsMenuable], [AreaName], [RoutingController], [RoutingAction]) VALUES (N'Product', 0, N'Catalog', N'Product', N'ProductDetail')
INSERT [dbo].[Core_EntityType] ([Id], [IsMenuable], [AreaName], [RoutingController], [RoutingAction]) VALUES (N'Vendor', 0, N'Core', N'Vendor', N'VendorDetail')
SET IDENTITY_INSERT [dbo].[Core_Media] ON 

INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (1, NULL, 0, N'b94d02b8-6d3a-4919-b144-c121387a272d.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (2, NULL, 0, N'911207ad-5b45-423f-9575-2185c85261c0.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (3, NULL, 0, N'37dc2d94-dbac-4112-afbc-2fc88ddca753.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (4, NULL, 0, N'bf16c55d-747e-4238-b444-06c3fe0463b2.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (5, NULL, 0, N'2db2ffbb-46d5-4f3c-8dc0-614e83162a1c.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (6, NULL, 0, N'daa3af7c-452c-4c0f-9c61-aeccf001e825.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (7, NULL, 0, N'c8756541-d192-48e2-b822-2bf616fb876e.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (8, NULL, 0, N'0199b7af-4d14-4858-a902-62ca8c5e9b6d.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (9, NULL, 0, N'1761ffd9-2c53-4a6b-856f-e2f4039d0247.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (10, NULL, 0, N'1b896b5e-f6bf-41ca-89ee-025c6be9e08c.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (11, NULL, 0, N'1aead9b6-73a8-45c1-a463-7655e9a9b478.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (12, NULL, 0, N'c27ee7c7-deb3-4697-a6b6-3358d72b556f.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (13, NULL, 0, N'532fc844-2c11-494e-a68b-af0be2b9a87f.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (14, NULL, 0, N'4d24a1fd-a362-47e4-9060-011d415398b9.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (15, NULL, 0, N'117ed074-628a-4db7-abbb-4a335adb3504.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (16, NULL, 0, N'78f1840e-7a50-49de-9dad-9127ec290dfd.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (17, NULL, 0, N'de4bdb93-ab9d-4515-b19b-bb55aa4703b3.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (18, NULL, 0, N'dd14f5e8-2e76-4f60-9f58-19652dcb80c5.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (19, NULL, 0, N'bf6461d5-0a9b-4a19-9516-5ca3b5b9da9e.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (20, NULL, 0, N'461a2564-b657-46bb-bcb5-f7deaeb2a0a9.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (21, NULL, 0, N'fb26a4f2-0a36-41dd-b0e8-a6c0554d31f8.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (22, NULL, 0, N'74552a46-4309-43e1-ad4e-79cd9e778722.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (23, NULL, 0, N'1a79b958-50bc-48d8-b3e5-826222949d28.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (24, NULL, 0, N'e0a99874-20a8-43b8-9199-b109bb2c3ae5.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (25, NULL, 0, N'1d9d5101-7e0b-4c29-88fe-e54891647672.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (26, NULL, 0, N'5cf020c2-72b5-407d-836a-ef1a316b741c.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (27, NULL, 0, N'df3590c2-a6a0-4813-96db-4a07e6c7f460.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (28, NULL, 0, N'bc68637c-420f-4951-9130-b9fca36484e6.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (29, NULL, 0, N'1201ba32-984a-48eb-b86a-23d4c8f76d5b.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (30, NULL, 0, N'0089c72c-2fbe-48c3-a33f-718ae1eafd8b.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (31, NULL, 0, N'2f856ed8-323e-4c26-99d1-cd4ec07f9979.jpg', 0)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (32, NULL, 0, N'fd623151-fc8a-464b-8c19-b1350d785bce.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (33, NULL, 0, N'057afd18-8973-4078-9fd2-7eb0b52d8e72.jpg', 1)
INSERT [dbo].[Core_Media] ([Id], [Caption], [FileSize], [FileName], [MediaType]) VALUES (34, NULL, 0, N'ee4b30bf-fd13-47a7-b893-0e6e6b1aed05.jpg', 0)
SET IDENTITY_INSERT [dbo].[Core_Media] OFF
SET IDENTITY_INSERT [dbo].[Core_Role] ON 

INSERT [dbo].[Core_Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'admin', N'ADMIN', N'4776a1b2-dbe4-4056-82ec-8bed211d1454')
INSERT [dbo].[Core_Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'customer', N'CUSTOMER', N'00d172be-03a0-4856-8b12-26d63fcf4374')
INSERT [dbo].[Core_Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'guest', N'GUEST', N'd4754388-8355-4018-b728-218018836817')
INSERT [dbo].[Core_Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (4, N'vendor', N'VENDOR', N'71f10604-8c4d-4a7d-ac4a-ffefb11cefeb')
SET IDENTITY_INSERT [dbo].[Core_Role] OFF
SET IDENTITY_INSERT [dbo].[Core_StateOrProvince] ON 

INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (1, N'VN', NULL, N'Hồ Chí Minh', N'Thành Phố')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (2, N'VN', NULL, N'Hà Giang', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (4, N'VN', NULL, N'Cao Bằng', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (6, N'VN', NULL, N'Bắc Kạn', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (8, N'VN', NULL, N'Tuyên Quang', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (10, N'VN', NULL, N'Lào Cai', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (11, N'VN', NULL, N'Điện Biên', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (12, N'VN', NULL, N'Lai Châu', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (14, N'VN', NULL, N'Sơn La', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (15, N'VN', NULL, N'Yên Bái', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (17, N'VN', NULL, N'Hòa Bình', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (19, N'VN', NULL, N'Thái Nguyên', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (20, N'VN', NULL, N'Lạng Sơn', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (22, N'VN', NULL, N'Quảng Ninh', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (24, N'VN', NULL, N'Bắc Giang', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (25, N'VN', NULL, N'Phú Thọ', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (26, N'VN', NULL, N'Vĩnh Phúc', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (27, N'VN', NULL, N'Bắc Ninh', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (30, N'VN', NULL, N'Hải Dương', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (31, N'VN', NULL, N'Hải Phòng', N'Thành Phố')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (33, N'VN', NULL, N'Hưng Yên', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (34, N'VN', NULL, N'Thái Bình', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (35, N'VN', NULL, N'Hà Nam', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (36, N'VN', NULL, N'Nam Định', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (37, N'VN', NULL, N'Ninh Bình', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (38, N'VN', NULL, N'Thanh Hóa', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (40, N'VN', NULL, N'Nghệ An', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (42, N'VN', NULL, N'Hà Tĩnh', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (44, N'VN', NULL, N'Quảng Bình', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (45, N'VN', NULL, N'Quảng Trị', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (46, N'VN', NULL, N'Thừa Thiên Huế', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (48, N'VN', NULL, N'Đà Nẵng', N'Thành Phố')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (49, N'VN', NULL, N'Quảng Nam', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (51, N'VN', NULL, N'Quảng Ngãi', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (52, N'VN', NULL, N'Bình Định', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (54, N'VN', NULL, N'Phú Yên', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (56, N'VN', NULL, N'Khánh Hòa', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (58, N'VN', NULL, N'Ninh Thuận', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (60, N'VN', NULL, N'Bình Thuận', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (62, N'VN', NULL, N'Kon Tum', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (64, N'VN', NULL, N'Gia Lai', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (66, N'VN', NULL, N'Đắk Lắk', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (67, N'VN', NULL, N'Đắk Nông', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (68, N'VN', NULL, N'Lâm Đồng', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (70, N'VN', NULL, N'Bình Phước', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (72, N'VN', NULL, N'Tây Ninh', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (74, N'VN', NULL, N'Bình Dương', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (75, N'VN', NULL, N'Đồng Nai', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (77, N'VN', NULL, N'Bà Rịa - Vũng Tàu', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (79, N'VN', NULL, N'Hà Nội', N'Thành Phố')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (80, N'VN', NULL, N'Long An', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (82, N'VN', NULL, N'Tiền Giang', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (83, N'VN', NULL, N'Bến Tre', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (84, N'VN', NULL, N'Trà Vinh', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (86, N'VN', NULL, N'Vĩnh Long', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (87, N'VN', NULL, N'Đồng Tháp', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (89, N'VN', NULL, N'An Giang', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (91, N'VN', NULL, N'Kiên Giang', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (92, N'VN', NULL, N'Cần Thơ', N'Thành Phố')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (93, N'VN', NULL, N'Hậu Giang', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (94, N'VN', NULL, N'Sóc Trăng', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (95, N'VN', NULL, N'Bạc Liêu', N'Tỉnh')
INSERT [dbo].[Core_StateOrProvince] ([Id], [CountryId], [Code], [Name], [Type]) VALUES (96, N'VN', NULL, N'Cà Mau', N'Tỉnh')
SET IDENTITY_INSERT [dbo].[Core_StateOrProvince] OFF
SET IDENTITY_INSERT [dbo].[Core_User] ON 

INSERT [dbo].[Core_User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserGuid], [FullName], [VendorId], [IsDeleted], [CreatedOn], [UpdatedOn], [DefaultShippingAddressId], [DefaultBillingAddressId], [RefreshTokenHash], [Culture]) VALUES (2, N'system@Gicco.com', N'SYSTEM@Gicco.COM', N'system@Gicco.com', N'SYSTEM@Gicco.COM', 0, N'AQAAAAEAACcQAAAAEAEqSCV8Bpg69irmeg8N86U503jGEAYf75fBuzvL00/mr/FGEsiUqfR0rWBbBUwqtw==', N'a9565acb-cee6-425f-9833-419a793f5fba', N'101cd6ae-a8ef-4a37-97fd-04ac2dd630e4', NULL, 0, 0, NULL, 0, 0, N'5f72f83b-7436-4221-869c-1b69b2e23aae', N'System User', NULL, 1, CAST(N'2018-05-29T04:33:39.1890000+07:00' AS DateTimeOffset), CAST(N'2018-05-29T04:33:39.1890000+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
INSERT [dbo].[Core_User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserGuid], [FullName], [VendorId], [IsDeleted], [CreatedOn], [UpdatedOn], [DefaultShippingAddressId], [DefaultBillingAddressId], [RefreshTokenHash], [Culture]) VALUES (10, N'admin@Gicco.com', N'ADMIN@Gicco.COM', N'admin@Gicco.com', N'ADMIN@Gicco.COM', 0, N'AQAAAAEAACcQAAAAEAEqSCV8Bpg69irmeg8N86U503jGEAYf75fBuzvL00/mr/FGEsiUqfR0rWBbBUwqtw==', N'd6847450-47f0-4c7a-9fed-0c66234bf61f', N'c83afcbc-312c-4589-bad7-8686bd4754c0', NULL, 0, 0, NULL, 0, 0, N'ed8210c3-24b0-4823-a744-80078cf12eb4', N'Shop Admin', NULL, 0, CAST(N'2018-05-29T04:33:39.1900000+07:00' AS DateTimeOffset), CAST(N'2018-05-29T04:33:39.1900000+07:00' AS DateTimeOffset), NULL, NULL, NULL, N'en-US')
INSERT [dbo].[Core_User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserGuid], [FullName], [VendorId], [IsDeleted], [CreatedOn], [UpdatedOn], [DefaultShippingAddressId], [DefaultBillingAddressId], [RefreshTokenHash], [Culture]) VALUES (11, N'4fbff37a-33b9-4bb6-a6dd-cf798356dd69@guest.gicco.com', N'4FBFF37A-33B9-4BB6-A6DD-CF798356DD69@GUEST.GICCO.COM', N'4fbff37a-33b9-4bb6-a6dd-cf798356dd69@guest.gicco.com', N'4FBFF37A-33B9-4BB6-A6DD-CF798356DD69@GUEST.GICCO.COM', 0, N'AQAAAAEAACcQAAAAEOeVPd9PZO7OUCdBA0HcDz8wp9v1113kCTN1Vjw+r1NNkRyZhwh4YlGr8Dta0YiIiQ==', N'3EFXC2NMZ6NEAM6LEECHQ7B4IEBSEA3Y', N'838a053e-2adf-4d34-baa5-183e00d0dc21', NULL, 0, 0, NULL, 1, 0, N'4fbff37a-33b9-4bb6-a6dd-cf798356dd69', N'Guest', NULL, 1, CAST(N'2018-10-03T11:34:32.7736183+07:00' AS DateTimeOffset), CAST(N'2018-10-03T11:34:32.7736206+07:00' AS DateTimeOffset), NULL, NULL, NULL, N'vi-VN')
INSERT [dbo].[Core_User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserGuid], [FullName], [VendorId], [IsDeleted], [CreatedOn], [UpdatedOn], [DefaultShippingAddressId], [DefaultBillingAddressId], [RefreshTokenHash], [Culture]) VALUES (12, N'b46eb0bb-a52b-4283-a3d5-5b98692915dc@guest.gicco.com', N'B46EB0BB-A52B-4283-A3D5-5B98692915DC@GUEST.GICCO.COM', N'b46eb0bb-a52b-4283-a3d5-5b98692915dc@guest.gicco.com', N'B46EB0BB-A52B-4283-A3D5-5B98692915DC@GUEST.GICCO.COM', 0, N'AQAAAAEAACcQAAAAECGKB3AMb9VzMqIXxogDPR1rPSu0Z/quHpOXcv3b+fhzWa4n4TnK5wma2YV5dPi3Bw==', N'KMGAYYHSUMWCMFTSE7PHC4WWQIM6UPVJ', N'443ee52e-f73c-44ab-ae45-37d84cfd49dd', NULL, 0, 0, NULL, 1, 0, N'b46eb0bb-a52b-4283-a3d5-5b98692915dc', N'Guest', NULL, 0, CAST(N'2018-10-03T11:38:15.9908916+07:00' AS DateTimeOffset), CAST(N'2018-10-03T11:38:15.9908930+07:00' AS DateTimeOffset), NULL, NULL, NULL, N'vi-VN')
INSERT [dbo].[Core_User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserGuid], [FullName], [VendorId], [IsDeleted], [CreatedOn], [UpdatedOn], [DefaultShippingAddressId], [DefaultBillingAddressId], [RefreshTokenHash], [Culture]) VALUES (13, N'8935c4e3-9612-4ebc-b0c7-539d2ce0d94c@guest.gicco.com', N'8935C4E3-9612-4EBC-B0C7-539D2CE0D94C@GUEST.GICCO.COM', N'8935c4e3-9612-4ebc-b0c7-539d2ce0d94c@guest.gicco.com', N'8935C4E3-9612-4EBC-B0C7-539D2CE0D94C@GUEST.GICCO.COM', 0, N'AQAAAAEAACcQAAAAEPcu2Q6r1cFwRgipRxpz10UwdzTowdQHvXiIf31qFdb/hMI3KJirZno3ze3OvfMZtA==', N'RZZ3MH3B52ZWGE3IKCJKEYYJDRVQ7GJZ', N'a1b5374a-ab99-42d1-9eb5-ce0e73e1f4fa', NULL, 0, 0, NULL, 1, 0, N'8935c4e3-9612-4ebc-b0c7-539d2ce0d94c', N'Guest', NULL, 0, CAST(N'2018-10-03T11:39:23.4526771+07:00' AS DateTimeOffset), CAST(N'2018-10-03T11:39:23.4526798+07:00' AS DateTimeOffset), NULL, NULL, NULL, N'vi-VN')
INSERT [dbo].[Core_User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserGuid], [FullName], [VendorId], [IsDeleted], [CreatedOn], [UpdatedOn], [DefaultShippingAddressId], [DefaultBillingAddressId], [RefreshTokenHash], [Culture]) VALUES (14, N'f0a3e0aa-370b-4698-90dc-7ff1564811de@guest.gicco.com', N'F0A3E0AA-370B-4698-90DC-7FF1564811DE@GUEST.GICCO.COM', N'f0a3e0aa-370b-4698-90dc-7ff1564811de@guest.gicco.com', N'F0A3E0AA-370B-4698-90DC-7FF1564811DE@GUEST.GICCO.COM', 0, N'AQAAAAEAACcQAAAAEDH7+MJZ0xNne+Bu+qpYwf6VNcTXshcE5WmUgU53HGy37Ro+F8d+sA+UrlUSfTqYkA==', N'CMAVCS3D2ITOZUP5X3GXNNWNTXKQW2JT', N'f98e4f0a-c795-4bf3-95ac-b7f04bb3c570', NULL, 0, 0, NULL, 1, 0, N'f0a3e0aa-370b-4698-90dc-7ff1564811de', N'Guest', NULL, 0, CAST(N'2018-10-08T17:19:05.3626398+07:00' AS DateTimeOffset), CAST(N'2018-10-08T17:19:05.3626421+07:00' AS DateTimeOffset), NULL, NULL, NULL, N'en-US')
INSERT [dbo].[Core_User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserGuid], [FullName], [VendorId], [IsDeleted], [CreatedOn], [UpdatedOn], [DefaultShippingAddressId], [DefaultBillingAddressId], [RefreshTokenHash], [Culture]) VALUES (15, N'71b4616f-978c-462d-915d-6179ecc0c087@guest.gicco.com', N'71B4616F-978C-462D-915D-6179ECC0C087@GUEST.GICCO.COM', N'71b4616f-978c-462d-915d-6179ecc0c087@guest.gicco.com', N'71B4616F-978C-462D-915D-6179ECC0C087@GUEST.GICCO.COM', 0, N'AQAAAAEAACcQAAAAEMy7Ru5Z6N0mHtBxgilvl8q9YJLE9ZuqpHEDBoxHF8mingnwE2nPBqmasUdatkI9pA==', N'BDVGIJ37MKH6S5DRU5ADAZNRSZ5JANXN', N'db31b73d-7058-41b1-a8b4-912af1cea01d', NULL, 0, 0, NULL, 1, 0, N'71b4616f-978c-462d-915d-6179ecc0c087', N'Guest', NULL, 0, CAST(N'2018-10-18T15:06:52.8506196+07:00' AS DateTimeOffset), CAST(N'2018-10-18T15:06:52.8506213+07:00' AS DateTimeOffset), NULL, NULL, NULL, N'en-US')
INSERT [dbo].[Core_User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserGuid], [FullName], [VendorId], [IsDeleted], [CreatedOn], [UpdatedOn], [DefaultShippingAddressId], [DefaultBillingAddressId], [RefreshTokenHash], [Culture]) VALUES (16, N'2888bfcd-67c1-4fff-9418-ee31c8f7cba0@guest.gicco.com', N'2888BFCD-67C1-4FFF-9418-EE31C8F7CBA0@GUEST.GICCO.COM', N'2888bfcd-67c1-4fff-9418-ee31c8f7cba0@guest.gicco.com', N'2888BFCD-67C1-4FFF-9418-EE31C8F7CBA0@GUEST.GICCO.COM', 0, N'AQAAAAEAACcQAAAAEPIuqJGq84939+1YWjvrSwrTpX6zWINmAhdnEt/9fmOUonGwqNcgiKGoXlX7VlesBw==', N'RCX2Y3GNNBZCZRA4UST7TVVXG3LKSGCB', N'c54d0191-72a2-40e7-825d-aeccccd28a85', NULL, 0, 0, NULL, 1, 0, N'2888bfcd-67c1-4fff-9418-ee31c8f7cba0', N'Guest', NULL, 0, CAST(N'2018-10-19T09:30:39.0693289+07:00' AS DateTimeOffset), CAST(N'2018-10-19T09:30:39.0693329+07:00' AS DateTimeOffset), NULL, NULL, NULL, N'en-US')
SET IDENTITY_INSERT [dbo].[Core_User] OFF
INSERT [dbo].[Core_UserRole] ([UserId], [RoleId]) VALUES (10, 1)
INSERT [dbo].[Core_UserRole] ([UserId], [RoleId]) VALUES (11, 3)
INSERT [dbo].[Core_UserRole] ([UserId], [RoleId]) VALUES (12, 3)
INSERT [dbo].[Core_UserRole] ([UserId], [RoleId]) VALUES (13, 3)
INSERT [dbo].[Core_UserRole] ([UserId], [RoleId]) VALUES (14, 3)
INSERT [dbo].[Core_UserRole] ([UserId], [RoleId]) VALUES (15, 3)
INSERT [dbo].[Core_UserRole] ([UserId], [RoleId]) VALUES (16, 3)
SET IDENTITY_INSERT [dbo].[Core_Vendor] ON 

INSERT [dbo].[Core_Vendor] ([Id], [Name], [Slug], [Description], [Email], [CreatedOn], [UpdatedOn], [IsActive], [IsDeleted]) VALUES (1, N'Hoàng Sơn''s Store', N'hoang-son''s-store', NULL, N'sonnh@store.com', CAST(N'2018-10-04T23:41:02.4370843+07:00' AS DateTimeOffset), CAST(N'0001-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), 1, 1)
INSERT [dbo].[Core_Vendor] ([Id], [Name], [Slug], [Description], [Email], [CreatedOn], [UpdatedOn], [IsActive], [IsDeleted]) VALUES (2, N'Hoàng Sơn''s Store', N'hoang-son''s-store-2', NULL, N'sonnh@store.com', CAST(N'2018-10-04T23:41:11.1766913+07:00' AS DateTimeOffset), CAST(N'2018-10-04T23:51:27.3130982+07:00' AS DateTimeOffset), 1, 0)
INSERT [dbo].[Core_Vendor] ([Id], [Name], [Slug], [Description], [Email], [CreatedOn], [UpdatedOn], [IsActive], [IsDeleted]) VALUES (3, N'Davies''s Store', N'davies''s-store', NULL, N'davies@store.com', CAST(N'2018-10-04T23:51:49.2864268+07:00' AS DateTimeOffset), CAST(N'0001-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), 1, 0)
INSERT [dbo].[Core_Vendor] ([Id], [Name], [Slug], [Description], [Email], [CreatedOn], [UpdatedOn], [IsActive], [IsDeleted]) VALUES (4, N'Thâm Davies', N'tham-davies', NULL, N'thamdv96@gmail.com', CAST(N'2018-10-05T10:02:56.8277658+07:00' AS DateTimeOffset), CAST(N'2018-10-05T10:11:06.6200791+07:00' AS DateTimeOffset), 1, 1)
SET IDENTITY_INSERT [dbo].[Core_Vendor] OFF
INSERT [dbo].[Core_Widget] ([Id], [Name], [ViewComponentName], [CreateUrl], [EditUrl], [CreatedOn], [IsPublished]) VALUES (N'CarouselWidget', N'Carousel Widget', N'CarouselWidget', N'app.content.widget-carousel-create', N'app.content.widget-carousel-edit', CAST(N'2018-05-29T04:33:39.1640000+07:00' AS DateTimeOffset), 0)
INSERT [dbo].[Core_Widget] ([Id], [Name], [ViewComponentName], [CreateUrl], [EditUrl], [CreatedOn], [IsPublished]) VALUES (N'CategoryWidget', N'Category Widget', N'CategoryWidget', N'widget-category-create', N'widget-category-edit', CAST(N'2018-05-29T04:33:39.1600000+07:00' AS DateTimeOffset), 0)
INSERT [dbo].[Core_Widget] ([Id], [Name], [ViewComponentName], [CreateUrl], [EditUrl], [CreatedOn], [IsPublished]) VALUES (N'HomeTabWidget', N'Home Tab Widget', N'HomeTabWidget', N'widget-home-tab-create', N'widget-home-tab-edit', CAST(N'2018-10-19T00:00:00.0000000+07:00' AS DateTimeOffset), 0)
INSERT [dbo].[Core_Widget] ([Id], [Name], [ViewComponentName], [CreateUrl], [EditUrl], [CreatedOn], [IsPublished]) VALUES (N'HtmlWidget', N'Html Widget', N'HtmlWidget', N'widget-html-create', N'widget-html-edit', CAST(N'2018-05-29T04:33:39.1640000+07:00' AS DateTimeOffset), 0)
INSERT [dbo].[Core_Widget] ([Id], [Name], [ViewComponentName], [CreateUrl], [EditUrl], [CreatedOn], [IsPublished]) VALUES (N'ProductWidget', N'Product Widget', N'ProductWidget', N'widget-product-create', N'widget-product-edit', CAST(N'2018-05-29T04:33:39.1630000+07:00' AS DateTimeOffset), 0)
INSERT [dbo].[Core_Widget] ([Id], [Name], [ViewComponentName], [CreateUrl], [EditUrl], [CreatedOn], [IsPublished]) VALUES (N'RecentlyViewedWidget', N'Recently Viewed Widget', N'RecentlyViewedWidget', N'widget-recently-viewed-create', N'widget-recently-viewed-edit', CAST(N'2018-05-29T04:33:39.1640000+07:00' AS DateTimeOffset), 0)
INSERT [dbo].[Core_Widget] ([Id], [Name], [ViewComponentName], [CreateUrl], [EditUrl], [CreatedOn], [IsPublished]) VALUES (N'SimpleProductWidget', N'Simple Product Widget', N'SimpleProductWidget', N'widget-simple-product-create', N'widget-simple-product-edit', CAST(N'2018-05-29T04:33:39.1630000+07:00' AS DateTimeOffset), 0)
INSERT [dbo].[Core_Widget] ([Id], [Name], [ViewComponentName], [CreateUrl], [EditUrl], [CreatedOn], [IsPublished]) VALUES (N'SpaceBarWidget', N'SpaceBar Widget', N'SpaceBarWidget', N'widget-spacebar-create', N'widget-spacebar-edit', CAST(N'2018-05-29T04:33:39.1640000+07:00' AS DateTimeOffset), 0)
SET IDENTITY_INSERT [dbo].[Core_WidgetInstance] ON 

INSERT [dbo].[Core_WidgetInstance] ([Id], [Name], [CreatedOn], [UpdatedOn], [PublishStart], [PublishEnd], [WidgetId], [WidgetZoneId], [DisplayOrder], [Data], [HtmlData]) VALUES (1, N'Home Carousel', CAST(N'2018-08-11T06:57:30.6053643+07:00' AS DateTimeOffset), CAST(N'2018-08-11T06:57:30.6054847+07:00' AS DateTimeOffset), CAST(N'2018-08-10T23:53:17.2780000+00:00' AS DateTimeOffset), NULL, N'CarouselWidget', 4, 0, N'[{"Image":"b599c271-d0ee-41cc-a8ad-12fc87f096a5.jpg","ImageUrl":null,"Caption":"NEW SEASON","SubCaption":"Women Collection 2018","LinkText":"Shop Now","TargetUrl":"/woman"},{"Image":"9f3e9f5e-cad2-41cc-b36e-6f6fd817d2d4.jpg","ImageUrl":null,"Caption":"Jackets & Coats","SubCaption":"Men New-Season","LinkText":"Shop Now","TargetUrl":"/man"},{"Image":"b83c1029-329b-4974-a265-5d9461d1fe34.jpg","ImageUrl":null,"Caption":"New arrivals","SubCaption":"Men Collection 2018","LinkText":"Shop Now","TargetUrl":"/man"}]', NULL)
INSERT [dbo].[Core_WidgetInstance] ([Id], [Name], [CreatedOn], [UpdatedOn], [PublishStart], [PublishEnd], [WidgetId], [WidgetZoneId], [DisplayOrder], [Data], [HtmlData]) VALUES (2, N'New products', CAST(N'2018-08-11T15:05:18.2330286+07:00' AS DateTimeOffset), CAST(N'2018-08-11T15:05:18.2331945+07:00' AS DateTimeOffset), CAST(N'2018-08-11T08:04:35.8680000+00:00' AS DateTimeOffset), NULL, N'HomeTabWidget', 1, 0, N'{"NumberOfProducts":4,"CategoryId":null,"OrderBy":"Newest","FeaturedOnly":false}', NULL)
INSERT [dbo].[Core_WidgetInstance] ([Id], [Name], [CreatedOn], [UpdatedOn], [PublishStart], [PublishEnd], [WidgetId], [WidgetZoneId], [DisplayOrder], [Data], [HtmlData]) VALUES (6, N'Man collection', CAST(N'2018-09-06T07:50:22.6521628+07:00' AS DateTimeOffset), CAST(N'2018-09-06T07:50:22.6521650+07:00' AS DateTimeOffset), CAST(N'2018-09-06T00:50:11.8940000+00:00' AS DateTimeOffset), NULL, N'ProductWidget', 5, 0, N'{"NumberOfProducts":4,"CategoryId":2,"OrderBy":"Newest","FeaturedOnly":false}', NULL)
INSERT [dbo].[Core_WidgetInstance] ([Id], [Name], [CreatedOn], [UpdatedOn], [PublishStart], [PublishEnd], [WidgetId], [WidgetZoneId], [DisplayOrder], [Data], [HtmlData]) VALUES (7, N'Woman collection', CAST(N'2018-09-06T07:50:37.6019466+07:00' AS DateTimeOffset), CAST(N'2018-09-06T07:50:37.6019479+07:00' AS DateTimeOffset), CAST(N'2018-09-06T00:50:26.2900000+00:00' AS DateTimeOffset), NULL, N'ProductWidget', 5, 0, N'{"NumberOfProducts":4,"CategoryId":1,"OrderBy":"Newest","FeaturedOnly":false}', NULL)
INSERT [dbo].[Core_WidgetInstance] ([Id], [Name], [CreatedOn], [UpdatedOn], [PublishStart], [PublishEnd], [WidgetId], [WidgetZoneId], [DisplayOrder], [Data], [HtmlData]) VALUES (8, N'Best Sellers', CAST(N'2018-10-19T14:41:15.3255961+07:00' AS DateTimeOffset), CAST(N'2018-10-19T14:41:15.3255983+07:00' AS DateTimeOffset), CAST(N'2018-10-19T07:40:19.5490000+00:00' AS DateTimeOffset), NULL, N'HomeTabWidget', 1, 0, N'{"NumberOfProducts":4,"CategoryId":null,"OrderBy":"BestSelling","FeaturedOnly":false}', NULL)
INSERT [dbo].[Core_WidgetInstance] ([Id], [Name], [CreatedOn], [UpdatedOn], [PublishStart], [PublishEnd], [WidgetId], [WidgetZoneId], [DisplayOrder], [Data], [HtmlData]) VALUES (9, N'On Sales', CAST(N'2018-10-19T14:41:58.6863953+07:00' AS DateTimeOffset), CAST(N'2018-10-19T14:41:58.6863975+07:00' AS DateTimeOffset), CAST(N'2018-10-19T07:41:41.9180000+00:00' AS DateTimeOffset), NULL, N'HomeTabWidget', 1, 0, N'{"NumberOfProducts":4,"CategoryId":null,"OrderBy":"Discount","FeaturedOnly":false}', NULL)
SET IDENTITY_INSERT [dbo].[Core_WidgetInstance] OFF
SET IDENTITY_INSERT [dbo].[Core_WidgetZone] ON 

INSERT [dbo].[Core_WidgetZone] ([Id], [Name], [Description]) VALUES (1, N'Home Featured', NULL)
INSERT [dbo].[Core_WidgetZone] ([Id], [Name], [Description]) VALUES (2, N'Home Main Content', NULL)
INSERT [dbo].[Core_WidgetZone] ([Id], [Name], [Description]) VALUES (3, N'Home After Main Content', NULL)
INSERT [dbo].[Core_WidgetZone] ([Id], [Name], [Description]) VALUES (4, N'Home Slider', NULL)
INSERT [dbo].[Core_WidgetZone] ([Id], [Name], [Description]) VALUES (5, N'Home Featured Category', NULL)
SET IDENTITY_INSERT [dbo].[Core_WidgetZone] OFF
SET IDENTITY_INSERT [dbo].[Inventory_Stock] ON 

INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (1, 2, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (2, 3, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (3, 4, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (4, 5, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (5, 6, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (6, 7, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (7, 8, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (8, 24, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (9, 23, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (10, 22, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (11, 21, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (12, 20, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (13, 19, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (14, 18, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (15, 25, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (16, 17, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (17, 15, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (18, 14, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (19, 13, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (20, 12, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (21, 11, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (22, 10, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (23, 9, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (24, 16, 1, 100, 0)
INSERT [dbo].[Inventory_Stock] ([Id], [ProductId], [WarehouseId], [Quantity], [ReservedQuantity]) VALUES (25, 26, 1, 100, 0)
SET IDENTITY_INSERT [dbo].[Inventory_Stock] OFF
SET IDENTITY_INSERT [dbo].[Inventory_StockHistory] ON 

INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (1, 7, 1, CAST(N'2018-08-11T15:03:25.9597942+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (2, 6, 1, CAST(N'2018-08-11T15:03:25.9866400+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (3, 5, 1, CAST(N'2018-08-11T15:03:25.9920796+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (4, 4, 1, CAST(N'2018-08-11T15:03:25.9973684+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (5, 3, 1, CAST(N'2018-08-11T15:03:26.0034946+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (6, 2, 1, CAST(N'2018-08-11T15:03:26.0091053+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (7, 26, 1, CAST(N'2018-08-11T21:20:52.1609725+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (8, 16, 1, CAST(N'2018-08-11T21:20:52.1902238+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (9, 9, 1, CAST(N'2018-08-11T21:20:52.1954335+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (10, 10, 1, CAST(N'2018-08-11T21:20:52.2005929+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (11, 11, 1, CAST(N'2018-08-11T21:20:52.2059812+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (12, 12, 1, CAST(N'2018-08-11T21:20:52.2111554+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (13, 13, 1, CAST(N'2018-08-11T21:20:52.2164212+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (14, 14, 1, CAST(N'2018-08-11T21:20:52.2219702+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (15, 15, 1, CAST(N'2018-08-11T21:20:52.2276720+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (16, 17, 1, CAST(N'2018-08-11T21:20:52.2340966+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (17, 25, 1, CAST(N'2018-08-11T21:20:52.2416871+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (18, 18, 1, CAST(N'2018-08-11T21:20:52.2503225+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (19, 19, 1, CAST(N'2018-08-11T21:20:52.2567163+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (20, 20, 1, CAST(N'2018-08-11T21:20:52.2655516+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (21, 21, 1, CAST(N'2018-08-11T21:20:52.2718544+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (22, 22, 1, CAST(N'2018-08-11T21:20:52.2782942+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (23, 23, 1, CAST(N'2018-08-11T21:20:52.2871106+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (24, 24, 1, CAST(N'2018-08-11T21:20:52.2956470+07:00' AS DateTimeOffset), 10, 100, NULL)
INSERT [dbo].[Inventory_StockHistory] ([Id], [ProductId], [WareHouseId], [CreatedOn], [CreatedById], [AdjustedQuantity], [Note]) VALUES (25, 8, 1, CAST(N'2018-08-11T21:20:52.3045421+07:00' AS DateTimeOffset), 10, 100, NULL)
SET IDENTITY_INSERT [dbo].[Inventory_StockHistory] OFF
SET IDENTITY_INSERT [dbo].[Inventory_Warehouse] ON 

INSERT [dbo].[Inventory_Warehouse] ([Id], [Name], [AddressId], [VendorId]) VALUES (1, N'Default warehouse', 1, NULL)
SET IDENTITY_INSERT [dbo].[Inventory_Warehouse] OFF
INSERT [dbo].[Localization_Culture] ([Id], [Name]) VALUES (N'en-US', N'English (US)')
INSERT [dbo].[Localization_Culture] ([Id], [Name]) VALUES (N'vi-VN', N'Tiếng Việt')
INSERT [dbo].[Payments_PaymentProvider] ([Id], [Name], [IsEnabled], [ConfigureUrl], [LandingViewComponentName], [AdditionalSettings]) VALUES (N'CoD', N'Cash On Delivery', 1, N'payments-cod-config', N'CoDLanding', NULL)
INSERT [dbo].[Payments_PaymentProvider] ([Id], [Name], [IsEnabled], [ConfigureUrl], [LandingViewComponentName], [AdditionalSettings]) VALUES (N'PaypalExpress', N'Paypal Express', 1, N'payments-paypalExpress-config', N'PaypalExpressLanding', N'{ "IsSandbox":true, "ClientId":"", "ClientSecret":"" }')
INSERT [dbo].[Payments_PaymentProvider] ([Id], [Name], [IsEnabled], [ConfigureUrl], [LandingViewComponentName], [AdditionalSettings]) VALUES (N'Stripe', N'Stripe', 1, N'payments-stripe-config', N'StripeLanding', N'{"PublicKey": "pk_test_6pRNASCoBOKtIshFeQd4XMUh", "PrivateKey" : "sk_test_BQokikJOvBiI2HlWgH4olfQ2"}')
SET IDENTITY_INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] ON 

INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] ([Id], [UserId], [ProductId], [LatestViewedOn]) VALUES (1, 13, 18, CAST(N'2018-10-03T11:45:14.4054302+07:00' AS DateTimeOffset))
INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] ([Id], [UserId], [ProductId], [LatestViewedOn]) VALUES (2, 13, 9, CAST(N'2018-10-03T11:45:33.9769821+07:00' AS DateTimeOffset))
INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] ([Id], [UserId], [ProductId], [LatestViewedOn]) VALUES (3, 10, 5, CAST(N'2018-10-03T15:45:05.3336615+07:00' AS DateTimeOffset))
INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] ([Id], [UserId], [ProductId], [LatestViewedOn]) VALUES (4, 10, 20, CAST(N'2018-10-05T12:52:01.7317656+07:00' AS DateTimeOffset))
INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] ([Id], [UserId], [ProductId], [LatestViewedOn]) VALUES (5, 10, 21, CAST(N'2018-10-08T17:31:12.4895578+07:00' AS DateTimeOffset))
INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] ([Id], [UserId], [ProductId], [LatestViewedOn]) VALUES (6, 10, 22, CAST(N'2018-10-18T13:06:03.6133601+07:00' AS DateTimeOffset))
INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] ([Id], [UserId], [ProductId], [LatestViewedOn]) VALUES (7, 10, 18, CAST(N'2018-10-19T17:07:00.3593096+07:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[ProductRecentlyViewed_RecentlyViewedProduct] OFF
SET IDENTITY_INSERT [dbo].[Reviews_Review] ON 

INSERT [dbo].[Reviews_Review] ([Id], [UserId], [Title], [Comment], [Rating], [ReviewerName], [Status], [CreatedOn], [EntityTypeId], [EntityId]) VALUES (1, 10, N'Good', N'very good', 5, N'very good', 5, CAST(N'2018-08-11T19:20:55.4863839+07:00' AS DateTimeOffset), N'Product', 20)
INSERT [dbo].[Reviews_Review] ([Id], [UserId], [Title], [Comment], [Rating], [ReviewerName], [Status], [CreatedOn], [EntityTypeId], [EntityId]) VALUES (2, 10, N'excellent', N'very good', 5, N'Thien', 5, CAST(N'2018-08-11T20:43:11.1216762+07:00' AS DateTimeOffset), N'Product', 22)
SET IDENTITY_INSERT [dbo].[Reviews_Review] OFF
SET IDENTITY_INSERT [dbo].[Search_Query] ON 

INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (1, N'Herschel', 0, CAST(N'2018-10-15T18:37:05.7921618+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (2, N'Herschel', 0, CAST(N'2018-10-15T18:37:37.2281647+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (3, N'Herschel', 0, CAST(N'2018-10-15T18:37:50.4545009+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (4, N'Square ', 0, CAST(N'2018-10-15T18:38:06.2236352+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (5, N'Square', 0, CAST(N'2018-10-15T18:38:17.8603571+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (6, N'Square', 0, CAST(N'2018-10-15T18:38:23.2287680+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (7, N'Square', 1, CAST(N'2018-10-15T18:38:29.8621572+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (8, N'Square', 0, CAST(N'2018-10-15T18:38:52.5542342+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (9, N'Square', 0, CAST(N'2018-10-15T18:40:37.7355239+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (10, N'Square ', 0, CAST(N'2018-10-15T18:41:41.5575959+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (11, N'Square', 0, CAST(N'2018-10-15T18:41:49.3399075+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (12, N'Square', 0, CAST(N'2018-10-15T18:42:33.8558861+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (13, N'Square', 0, CAST(N'2018-10-15T18:42:39.7306157+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (14, N'Square', 1, CAST(N'2018-10-15T18:42:48.0854960+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (15, N'Square', 1, CAST(N'2018-10-15T18:43:02.8944924+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (16, N'Square', 1, CAST(N'2018-10-15T18:43:10.7068678+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (17, N'Square', 1, CAST(N'2018-10-15T18:44:55.8896559+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (18, N'Square', 1, CAST(N'2018-10-15T18:45:23.4738538+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (19, N'Square', 1, CAST(N'2018-10-15T18:45:39.3727313+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (20, N'Square', 1, CAST(N'2018-10-15T18:48:54.3279252+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (21, N'Square', 0, CAST(N'2018-10-15T18:49:15.0805314+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (22, N'Square', 1, CAST(N'2018-10-15T18:49:24.3761384+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (23, N'Square', 1, CAST(N'2018-10-15T18:49:30.8058166+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (24, N'Square', 1, CAST(N'2018-10-15T18:49:37.5538153+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (25, N'Square', 1, CAST(N'2018-10-15T18:49:45.8159598+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (26, N'Square', 0, CAST(N'2018-10-15T18:49:49.8143167+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (27, N'Square', 0, CAST(N'2018-10-15T18:49:58.9249501+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (28, N'Square', 0, CAST(N'2018-10-15T18:50:13.0780553+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (29, N'Square', 0, CAST(N'2018-10-15T18:50:16.1776516+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (30, N'Square', 0, CAST(N'2018-10-15T18:50:21.1835667+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (31, N'Square', 1, CAST(N'2018-10-15T18:50:26.3072903+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (32, N'Square', 1, CAST(N'2018-10-15T18:50:33.8615967+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (33, N'Square', 1, CAST(N'2018-10-15T18:51:08.6135322+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (34, N'Square', 0, CAST(N'2018-10-15T18:51:13.6696979+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (35, N'Square', 0, CAST(N'2018-10-15T18:52:49.2224513+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (36, N'Square', 1, CAST(N'2018-10-15T18:52:55.1481908+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (37, N'Square', 0, CAST(N'2018-10-15T18:53:01.0116932+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (38, N'Square', 0, CAST(N'2018-10-15T18:54:09.2600357+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (39, N'Square', 0, CAST(N'2018-10-15T18:54:13.2569629+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (40, N'Pieces ', 0, CAST(N'2018-10-15T18:54:38.7078552+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (41, N'Pieces', 0, CAST(N'2018-10-15T18:54:42.5647769+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (42, N'Pieces', 0, CAST(N'2018-10-15T18:54:49.1725443+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (43, N'Pieces', 0, CAST(N'2018-10-15T18:55:00.3857849+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (44, N'Square', 0, CAST(N'2018-10-15T18:57:01.6682294+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (45, N'Square', 0, CAST(N'2018-10-15T18:57:33.3825233+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (46, N'Square', 0, CAST(N'2018-10-15T18:59:21.7133883+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (47, N'Square', 0, CAST(N'2018-10-15T18:59:32.4988678+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (48, N'Square', 0, CAST(N'2018-10-15T19:11:08.6999643+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (49, N'Square', 0, CAST(N'2018-10-15T19:34:29.8437901+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (50, N'Square', 0, CAST(N'2018-10-15T19:41:03.1642579+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (51, N'Square', 0, CAST(N'2018-10-15T19:41:31.8866053+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (52, N'Square', 1, CAST(N'2018-10-15T19:41:41.0843076+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (53, N'Square', 1, CAST(N'2018-10-15T19:57:57.0609662+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (54, N'Square', 1, CAST(N'2018-10-15T20:01:51.2696448+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (55, N'Square', 0, CAST(N'2018-10-15T20:02:20.9119210+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (56, N'Square', 0, CAST(N'2018-10-15T20:06:48.6509497+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (57, N'Square', 0, CAST(N'2018-10-15T20:09:00.6873997+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (58, N'Square', 0, CAST(N'2018-10-15T20:09:05.4599019+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (59, N'Square', 0, CAST(N'2018-10-15T20:09:38.1589217+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (60, N'Square', 0, CAST(N'2018-10-15T20:10:09.7856510+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (61, N'Square', 0, CAST(N'2018-10-15T20:10:14.7834457+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (62, N'Square', 0, CAST(N'2018-10-15T20:10:19.8406195+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (63, N'Square', 0, CAST(N'2018-10-15T20:10:43.0802985+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (64, N'Square', 0, CAST(N'2018-10-15T20:14:22.6016709+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (65, N'Square', 0, CAST(N'2018-10-15T20:14:31.2784288+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (66, N'Square', 0, CAST(N'2018-10-15T20:14:37.8771819+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (67, N'Square', 0, CAST(N'2018-10-15T20:15:06.7808151+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (68, N'Square', 0, CAST(N'2018-10-15T20:16:18.7156597+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (69, N'Square', 0, CAST(N'2018-10-15T20:17:39.3628852+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (70, N'Square', 0, CAST(N'2018-10-15T20:17:47.0415240+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (71, N'Square', 0, CAST(N'2018-10-15T20:19:08.6905975+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (72, N'Square', 0, CAST(N'2018-10-15T20:25:43.8310755+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (73, N'Square', 0, CAST(N'2018-10-15T20:26:00.5511516+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (74, N'Square', 0, CAST(N'2018-10-15T20:26:06.6270527+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (75, N'Square', 0, CAST(N'2018-10-15T20:26:10.3198076+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (76, N'Square', 1, CAST(N'2018-10-15T20:26:28.7386000+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (77, N'Square', 1, CAST(N'2018-10-16T18:20:52.3452780+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (78, N'Square', 1, CAST(N'2018-10-16T18:21:11.0778577+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (79, N'Square', 1, CAST(N'2018-10-16T18:21:23.3585548+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (80, N'Square', 1, CAST(N'2018-10-16T18:32:53.7533679+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (81, N'Square', 1, CAST(N'2018-10-16T19:05:18.7786883+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (82, N'Square', 1, CAST(N'2018-10-16T19:15:15.8496626+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (83, N'Square', 1, CAST(N'2018-10-16T19:19:39.2857987+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (84, N'Square', 1, CAST(N'2018-10-16T19:25:08.9232117+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (85, N'Square', 1, CAST(N'2018-10-16T19:26:04.4946150+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (86, N'Square', 1, CAST(N'2018-10-16T19:31:46.4541489+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (87, N'Lightweight', 1, CAST(N'2018-10-16T19:47:08.4875813+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (88, N'Lightweight', 1, CAST(N'2018-10-16T19:52:58.9182633+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (89, N'Lightweight', 1, CAST(N'2018-10-16T20:07:01.0290125+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (90, N'Square', 1, CAST(N'2018-10-17T09:09:20.5225278+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (91, N'Square', 1, CAST(N'2018-10-17T09:09:37.8066619+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (92, N'Square', 1, CAST(N'2018-10-17T09:09:48.8668179+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (93, N'Square', 1, CAST(N'2018-10-17T09:56:07.5680639+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (94, N'Square', 1, CAST(N'2018-10-17T16:34:11.6772920+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (95, N'Square', 0, CAST(N'2018-10-17T16:34:20.0828309+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (96, N'Square', 0, CAST(N'2018-10-17T16:34:25.9499530+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (97, N'Square', 1, CAST(N'2018-10-17T16:34:41.0469231+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (98, N'Square', 1, CAST(N'2018-10-18T13:06:21.2918359+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (99, N'Square', 1, CAST(N'2018-10-18T13:06:32.2151054+07:00' AS DateTimeOffset))
GO
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (100, N'Square', 1, CAST(N'2018-10-18T13:06:47.3661509+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (101, N'Square', 1, CAST(N'2018-10-18T13:11:19.9642944+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (102, N'Square', 1, CAST(N'2018-10-18T13:11:52.8574756+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (103, N'Square', 1, CAST(N'2018-10-18T13:12:31.1045979+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (104, N'Square', 1, CAST(N'2018-10-18T13:13:40.1422973+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (105, N'Square', 1, CAST(N'2018-10-18T13:13:45.7413205+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (106, N'Square', 1, CAST(N'2018-10-18T13:13:48.5569901+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (107, N'Square', 1, CAST(N'2018-10-18T16:34:42.1235145+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (108, N'Square', 1, CAST(N'2018-10-18T17:37:11.2482810+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (109, N'Square', 1, CAST(N'2018-10-18T17:47:55.6800073+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (110, N'Square', 1, CAST(N'2018-10-18T17:48:30.2941842+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (111, N'Square', 1, CAST(N'2018-10-18T17:50:45.6648487+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (112, N'Square', 1, CAST(N'2018-10-18T17:52:14.9811669+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (113, N'Square', 1, CAST(N'2018-10-18T17:53:15.2590150+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (114, N'Square', 1, CAST(N'2018-10-19T08:59:18.0563926+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (115, N'Square', 1, CAST(N'2018-10-19T08:59:58.8204718+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (116, N'sq', 1, CAST(N'2018-10-19T15:29:00.7102817+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (117, N'sq', 1, CAST(N'2018-10-19T15:29:05.7157140+07:00' AS DateTimeOffset))
INSERT [dbo].[Search_Query] ([Id], [QueryText], [ResultsCount], [CreatedOn]) VALUES (118, N'sq', 1, CAST(N'2018-10-19T15:29:08.2366533+07:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Search_Query] OFF
INSERT [dbo].[Shipping_ShippingProvider] ([Id], [Name], [IsEnabled], [ConfigureUrl], [ToAllShippingEnabledCountries], [OnlyCountryIdsString], [ToAllShippingEnabledStatesOrProvinces], [OnlyStateOrProvinceIdsString], [AdditionalSettings], [ShippingPriceServiceTypeName]) VALUES (N'FreeShip', N'Free Ship', 1, N'', 1, NULL, 1, NULL, N'{MinimumOrderAmount : 1}', N'Gicco.Module.ShippingFree.Services.FreeShippingServiceProvider,Gicco.Module.ShippingFree')
INSERT [dbo].[Shipping_ShippingProvider] ([Id], [Name], [IsEnabled], [ConfigureUrl], [ToAllShippingEnabledCountries], [OnlyCountryIdsString], [ToAllShippingEnabledStatesOrProvinces], [OnlyStateOrProvinceIdsString], [AdditionalSettings], [ShippingPriceServiceTypeName]) VALUES (N'TableRate', N'Table Rate', 1, N'shipping-table-rate-config', 1, NULL, 1, NULL, NULL, N'Gicco.Module.ShippingTableRate.Services.TableRateShippingServiceProvider,Gicco.Module.ShippingTableRate')
SET IDENTITY_INSERT [dbo].[ShippingTableRate_PriceAndDestination] ON 

INSERT [dbo].[ShippingTableRate_PriceAndDestination] ([Id], [CountryId], [StateOrProvinceId], [DistrictId], [ZipCode], [Note], [MinOrderSubtotal], [ShippingPrice]) VALUES (1, N'VN', 92, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[ShippingTableRate_PriceAndDestination] ([Id], [CountryId], [StateOrProvinceId], [DistrictId], [ZipCode], [Note], [MinOrderSubtotal], [ShippingPrice]) VALUES (2, N'VN', 92, NULL, NULL, NULL, CAST(100.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ShippingTableRate_PriceAndDestination] OFF
SET IDENTITY_INSERT [dbo].[ShoppingCart_Cart] ON 

INSERT [dbo].[ShoppingCart_Cart] ([Id], [UserId], [CreatedOn], [UpdatedOn], [IsActive], [CouponCode], [CouponRuleName], [ShippingMethod], [IsProductPriceIncludeTax], [ShippingAmount], [TaxAmount], [ShippingData]) VALUES (1, 10, CAST(N'2018-10-18T13:06:11.3355998+07:00' AS DateTimeOffset), NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShoppingCart_Cart] OFF
SET IDENTITY_INSERT [dbo].[ShoppingCart_CartItem] ON 

INSERT [dbo].[ShoppingCart_CartItem] ([Id], [CreatedOn], [ProductId], [Quantity], [CartId]) VALUES (1, CAST(N'2018-10-18T13:06:11.3676614+07:00' AS DateTimeOffset), 23, 1, 1)
SET IDENTITY_INSERT [dbo].[ShoppingCart_CartItem] OFF
SET IDENTITY_INSERT [dbo].[Tax_TaxClass] ON 

INSERT [dbo].[Tax_TaxClass] ([Id], [Name]) VALUES (1, N'Standard VAT')
SET IDENTITY_INSERT [dbo].[Tax_TaxClass] OFF
/****** Object:  Index [IX_ActivityLog_Activity_ActivityTypeId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityLog_Activity_ActivityTypeId] ON [dbo].[ActivityLog_Activity]
(
	[ActivityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_Category_ParentId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_Category_ParentId] ON [dbo].[Catalog_Category]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_Category_ThumbnailImageId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_Category_ThumbnailImageId] ON [dbo].[Catalog_Category]
(
	[ThumbnailImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_Product_BrandId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_Product_BrandId] ON [dbo].[Catalog_Product]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_Product_CreatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_Product_CreatedById] ON [dbo].[Catalog_Product]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_Product_TaxClassId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_Product_TaxClassId] ON [dbo].[Catalog_Product]
(
	[TaxClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_Product_ThumbnailImageId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_Product_ThumbnailImageId] ON [dbo].[Catalog_Product]
(
	[ThumbnailImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_Product_UpdatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_Product_UpdatedById] ON [dbo].[Catalog_Product]
(
	[UpdatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductAttribute_GroupId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductAttribute_GroupId] ON [dbo].[Catalog_ProductAttribute]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductAttributeValue_AttributeId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductAttributeValue_AttributeId] ON [dbo].[Catalog_ProductAttributeValue]
(
	[AttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductAttributeValue_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductAttributeValue_ProductId] ON [dbo].[Catalog_ProductAttributeValue]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductCategory_CategoryId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductCategory_CategoryId] ON [dbo].[Catalog_ProductCategory]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductCategory_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductCategory_ProductId] ON [dbo].[Catalog_ProductCategory]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductLink_LinkedProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductLink_LinkedProductId] ON [dbo].[Catalog_ProductLink]
(
	[LinkedProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductLink_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductLink_ProductId] ON [dbo].[Catalog_ProductLink]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductMedia_MediaId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductMedia_MediaId] ON [dbo].[Catalog_ProductMedia]
(
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductMedia_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductMedia_ProductId] ON [dbo].[Catalog_ProductMedia]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductOptionCombination_OptionId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductOptionCombination_OptionId] ON [dbo].[Catalog_ProductOptionCombination]
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductOptionCombination_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductOptionCombination_ProductId] ON [dbo].[Catalog_ProductOptionCombination]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductOptionValue_OptionId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductOptionValue_OptionId] ON [dbo].[Catalog_ProductOptionValue]
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductOptionValue_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductOptionValue_ProductId] ON [dbo].[Catalog_ProductOptionValue]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductPriceHistory_CreatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductPriceHistory_CreatedById] ON [dbo].[Catalog_ProductPriceHistory]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductPriceHistory_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductPriceHistory_ProductId] ON [dbo].[Catalog_ProductPriceHistory]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_ProductTemplateProductAttribute_ProductAttributeId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_ProductTemplateProductAttribute_ProductAttributeId] ON [dbo].[Catalog_ProductTemplateProductAttribute]
(
	[ProductAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cms_MenuItem_EntityId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cms_MenuItem_EntityId] ON [dbo].[Cms_MenuItem]
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cms_MenuItem_MenuId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cms_MenuItem_MenuId] ON [dbo].[Cms_MenuItem]
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cms_MenuItem_ParentId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cms_MenuItem_ParentId] ON [dbo].[Cms_MenuItem]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cms_Page_CreatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cms_Page_CreatedById] ON [dbo].[Cms_Page]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cms_Page_UpdatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cms_Page_UpdatedById] ON [dbo].[Cms_Page]
(
	[UpdatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_Comment_ParentId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_Comment_ParentId] ON [dbo].[Comments_Comment]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_Comment_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_Comment_UserId] ON [dbo].[Comments_Comment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contacts_Contact_ContactAreaId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contacts_Contact_ContactAreaId] ON [dbo].[Contacts_Contact]
(
	[ContactAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Core_Address_CountryId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_Address_CountryId] ON [dbo].[Core_Address]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_Address_DistrictId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_Address_DistrictId] ON [dbo].[Core_Address]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_Address_StateOrProvinceId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_Address_StateOrProvinceId] ON [dbo].[Core_Address]
(
	[StateOrProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Core_CustomerGroup_Name]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Core_CustomerGroup_Name] ON [dbo].[Core_CustomerGroup]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_CustomerGroupUser_CustomerGroupId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_CustomerGroupUser_CustomerGroupId] ON [dbo].[Core_CustomerGroupUser]
(
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_District_StateOrProvinceId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_District_StateOrProvinceId] ON [dbo].[Core_District]
(
	[StateOrProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Core_Entity_EntityTypeId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_Entity_EntityTypeId] ON [dbo].[Core_Entity]
(
	[EntityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Core_Role]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_RoleClaim_RoleId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_RoleClaim_RoleId] ON [dbo].[Core_RoleClaim]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Core_StateOrProvince_CountryId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_StateOrProvince_CountryId] ON [dbo].[Core_StateOrProvince]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[Core_User]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_User_DefaultBillingAddressId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_User_DefaultBillingAddressId] ON [dbo].[Core_User]
(
	[DefaultBillingAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_User_DefaultShippingAddressId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_User_DefaultShippingAddressId] ON [dbo].[Core_User]
(
	[DefaultShippingAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_User_VendorId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_User_VendorId] ON [dbo].[Core_User]
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Core_User]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_UserAddress_AddressId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_UserAddress_AddressId] ON [dbo].[Core_UserAddress]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_UserAddress_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_UserAddress_UserId] ON [dbo].[Core_UserAddress]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_UserClaim_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_UserClaim_UserId] ON [dbo].[Core_UserClaim]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_UserLogin_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_UserLogin_UserId] ON [dbo].[Core_UserLogin]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_UserRole_RoleId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_UserRole_RoleId] ON [dbo].[Core_UserRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Core_WidgetInstance_WidgetId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_WidgetInstance_WidgetId] ON [dbo].[Core_WidgetInstance]
(
	[WidgetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Core_WidgetInstance_WidgetZoneId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Core_WidgetInstance_WidgetZoneId] ON [dbo].[Core_WidgetInstance]
(
	[WidgetZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inventory_Stock_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Inventory_Stock_ProductId] ON [dbo].[Inventory_Stock]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inventory_Stock_WarehouseId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Inventory_Stock_WarehouseId] ON [dbo].[Inventory_Stock]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inventory_StockHistory_CreatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Inventory_StockHistory_CreatedById] ON [dbo].[Inventory_StockHistory]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inventory_Warehouse_AddressId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Inventory_Warehouse_AddressId] ON [dbo].[Inventory_Warehouse]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inventory_Warehouse_VendorId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Inventory_Warehouse_VendorId] ON [dbo].[Inventory_Warehouse]
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Localization_Resource_CultureId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Localization_Resource_CultureId] ON [dbo].[Localization_Resource]
(
	[CultureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_News_NewsItem_CreatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_News_NewsItem_CreatedById] ON [dbo].[News_NewsItem]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_News_NewsItem_ThumbnailImageId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_News_NewsItem_ThumbnailImageId] ON [dbo].[News_NewsItem]
(
	[ThumbnailImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_News_NewsItem_UpdatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_News_NewsItem_UpdatedById] ON [dbo].[News_NewsItem]
(
	[UpdatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_News_NewsItemCategory_NewsItemId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_News_NewsItemCategory_NewsItemId] ON [dbo].[News_NewsItemCategory]
(
	[NewsItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_Order_BillingAddressId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_Order_BillingAddressId] ON [dbo].[Orders_Order]
(
	[BillingAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_Order_CreatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_Order_CreatedById] ON [dbo].[Orders_Order]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_Order_ParentId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_Order_ParentId] ON [dbo].[Orders_Order]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_Order_ShippingAddressId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_Order_ShippingAddressId] ON [dbo].[Orders_Order]
(
	[ShippingAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_OrderAddress_CountryId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OrderAddress_CountryId] ON [dbo].[Orders_OrderAddress]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_OrderAddress_DistrictId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OrderAddress_DistrictId] ON [dbo].[Orders_OrderAddress]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_OrderAddress_StateOrProvinceId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OrderAddress_StateOrProvinceId] ON [dbo].[Orders_OrderAddress]
(
	[StateOrProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_OrderHistory_CreatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OrderHistory_CreatedById] ON [dbo].[Orders_OrderHistory]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_OrderHistory_OrderId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OrderHistory_OrderId] ON [dbo].[Orders_OrderHistory]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_OrderItem_OrderId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OrderItem_OrderId] ON [dbo].[Orders_OrderItem]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_OrderItem_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OrderItem_ProductId] ON [dbo].[Orders_OrderItem]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Payments_Payment_OrderId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Payments_Payment_OrderId] ON [dbo].[Payments_Payment]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pricing_CartRuleCategory_CategoryId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pricing_CartRuleCategory_CategoryId] ON [dbo].[Pricing_CartRuleCategory]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pricing_CartRuleCustomerGroup_CustomerGroupId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pricing_CartRuleCustomerGroup_CustomerGroupId] ON [dbo].[Pricing_CartRuleCustomerGroup]
(
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pricing_CartRuleProduct_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pricing_CartRuleProduct_ProductId] ON [dbo].[Pricing_CartRuleProduct]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pricing_CartRuleUsage_CartRuleId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pricing_CartRuleUsage_CartRuleId] ON [dbo].[Pricing_CartRuleUsage]
(
	[CartRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pricing_CartRuleUsage_CouponId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pricing_CartRuleUsage_CouponId] ON [dbo].[Pricing_CartRuleUsage]
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pricing_CartRuleUsage_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pricing_CartRuleUsage_UserId] ON [dbo].[Pricing_CartRuleUsage]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pricing_CatalogRuleCustomerGroup_CustomerGroupId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pricing_CatalogRuleCustomerGroup_CustomerGroupId] ON [dbo].[Pricing_CatalogRuleCustomerGroup]
(
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pricing_Coupon_CartRuleId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pricing_Coupon_CartRuleId] ON [dbo].[Pricing_Coupon]
(
	[CartRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductComparison_ComparingProduct_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductComparison_ComparingProduct_ProductId] ON [dbo].[ProductComparison_ComparingProduct]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductComparison_ComparingProduct_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductComparison_ComparingProduct_UserId] ON [dbo].[ProductComparison_ComparingProduct]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_Reply_ReviewId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_Reply_ReviewId] ON [dbo].[Reviews_Reply]
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_Reply_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_Reply_UserId] ON [dbo].[Reviews_Reply]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_Review_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_Review_UserId] ON [dbo].[Reviews_Review]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipments_Shipment_CreatedById]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Shipments_Shipment_CreatedById] ON [dbo].[Shipments_Shipment]
(
	[CreatedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipments_Shipment_OrderId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Shipments_Shipment_OrderId] ON [dbo].[Shipments_Shipment]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipments_Shipment_WarehouseId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Shipments_Shipment_WarehouseId] ON [dbo].[Shipments_Shipment]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipments_ShipmentItem_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Shipments_ShipmentItem_ProductId] ON [dbo].[Shipments_ShipmentItem]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipments_ShipmentItem_ShipmentId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Shipments_ShipmentItem_ShipmentId] ON [dbo].[Shipments_ShipmentItem]
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ShippingTableRate_PriceAndDestination_CountryId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShippingTableRate_PriceAndDestination_CountryId] ON [dbo].[ShippingTableRate_PriceAndDestination]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShippingTableRate_PriceAndDestination_DistrictId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShippingTableRate_PriceAndDestination_DistrictId] ON [dbo].[ShippingTableRate_PriceAndDestination]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShippingTableRate_PriceAndDestination_StateOrProvinceId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShippingTableRate_PriceAndDestination_StateOrProvinceId] ON [dbo].[ShippingTableRate_PriceAndDestination]
(
	[StateOrProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShoppingCart_Cart_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCart_Cart_UserId] ON [dbo].[ShoppingCart_Cart]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShoppingCart_CartItem_CartId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCart_CartItem_CartId] ON [dbo].[ShoppingCart_CartItem]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShoppingCart_CartItem_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCart_CartItem_ProductId] ON [dbo].[ShoppingCart_CartItem]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tax_TaxRate_CountryId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tax_TaxRate_CountryId] ON [dbo].[Tax_TaxRate]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax_TaxRate_StateOrProvinceId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tax_TaxRate_StateOrProvinceId] ON [dbo].[Tax_TaxRate]
(
	[StateOrProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax_TaxRate_TaxClassId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tax_TaxRate_TaxClassId] ON [dbo].[Tax_TaxRate]
(
	[TaxClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WishList_WishList_UserId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_WishList_WishList_UserId] ON [dbo].[WishList_WishList]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WishList_WishListItem_ProductId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_WishList_WishListItem_ProductId] ON [dbo].[WishList_WishListItem]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WishList_WishListItem_WishListId]    Script Date: 19/10/2018 6:14:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_WishList_WishListItem_WishListId] ON [dbo].[WishList_WishListItem]
(
	[WishListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityLog_Activity]  WITH CHECK ADD  CONSTRAINT [FK_ActivityLog_Activity_ActivityLog_ActivityType_ActivityTypeId] FOREIGN KEY([ActivityTypeId])
REFERENCES [dbo].[ActivityLog_ActivityType] ([Id])
GO
ALTER TABLE [dbo].[ActivityLog_Activity] CHECK CONSTRAINT [FK_ActivityLog_Activity_ActivityLog_ActivityType_ActivityTypeId]
GO
ALTER TABLE [dbo].[Catalog_Category]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_Category_Catalog_Category_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Catalog_Category] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Category] CHECK CONSTRAINT [FK_Catalog_Category_Catalog_Category_ParentId]
GO
ALTER TABLE [dbo].[Catalog_Category]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_Category_Core_Media_ThumbnailImageId] FOREIGN KEY([ThumbnailImageId])
REFERENCES [dbo].[Core_Media] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Category] CHECK CONSTRAINT [FK_Catalog_Category_Core_Media_ThumbnailImageId]
GO
ALTER TABLE [dbo].[Catalog_Product]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_Product_Catalog_Brand_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Catalog_Brand] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Product] CHECK CONSTRAINT [FK_Catalog_Product_Catalog_Brand_BrandId]
GO
ALTER TABLE [dbo].[Catalog_Product]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_Product_Core_Media_ThumbnailImageId] FOREIGN KEY([ThumbnailImageId])
REFERENCES [dbo].[Core_Media] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Product] CHECK CONSTRAINT [FK_Catalog_Product_Core_Media_ThumbnailImageId]
GO
ALTER TABLE [dbo].[Catalog_Product]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_Product_Core_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Product] CHECK CONSTRAINT [FK_Catalog_Product_Core_User_CreatedById]
GO
ALTER TABLE [dbo].[Catalog_Product]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_Product_Core_User_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Product] CHECK CONSTRAINT [FK_Catalog_Product_Core_User_UpdatedById]
GO
ALTER TABLE [dbo].[Catalog_Product]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_Product_Tax_TaxClass_TaxClassId] FOREIGN KEY([TaxClassId])
REFERENCES [dbo].[Tax_TaxClass] ([Id])
GO
ALTER TABLE [dbo].[Catalog_Product] CHECK CONSTRAINT [FK_Catalog_Product_Tax_TaxClass_TaxClassId]
GO
ALTER TABLE [dbo].[Catalog_ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductAttribute_Catalog_ProductAttributeGroup_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Catalog_ProductAttributeGroup] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductAttribute] CHECK CONSTRAINT [FK_Catalog_ProductAttribute_Catalog_ProductAttributeGroup_GroupId]
GO
ALTER TABLE [dbo].[Catalog_ProductAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductAttributeValue_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductAttributeValue] CHECK CONSTRAINT [FK_Catalog_ProductAttributeValue_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Catalog_ProductAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductAttributeValue_Catalog_ProductAttribute_AttributeId] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Catalog_ProductAttribute] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductAttributeValue] CHECK CONSTRAINT [FK_Catalog_ProductAttributeValue_Catalog_ProductAttribute_AttributeId]
GO
ALTER TABLE [dbo].[Catalog_ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductCategory_Catalog_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Catalog_Category] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductCategory] CHECK CONSTRAINT [FK_Catalog_ProductCategory_Catalog_Category_CategoryId]
GO
ALTER TABLE [dbo].[Catalog_ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductCategory_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductCategory] CHECK CONSTRAINT [FK_Catalog_ProductCategory_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Catalog_ProductLink]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductLink_Catalog_Product_LinkedProductId] FOREIGN KEY([LinkedProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductLink] CHECK CONSTRAINT [FK_Catalog_ProductLink_Catalog_Product_LinkedProductId]
GO
ALTER TABLE [dbo].[Catalog_ProductLink]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductLink_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductLink] CHECK CONSTRAINT [FK_Catalog_ProductLink_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Catalog_ProductMedia]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductMedia_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductMedia] CHECK CONSTRAINT [FK_Catalog_ProductMedia_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Catalog_ProductMedia]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductMedia_Core_Media_MediaId] FOREIGN KEY([MediaId])
REFERENCES [dbo].[Core_Media] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductMedia] CHECK CONSTRAINT [FK_Catalog_ProductMedia_Core_Media_MediaId]
GO
ALTER TABLE [dbo].[Catalog_ProductOptionCombination]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductOptionCombination_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductOptionCombination] CHECK CONSTRAINT [FK_Catalog_ProductOptionCombination_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Catalog_ProductOptionCombination]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductOptionCombination_Catalog_ProductOption_OptionId] FOREIGN KEY([OptionId])
REFERENCES [dbo].[Catalog_ProductOption] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductOptionCombination] CHECK CONSTRAINT [FK_Catalog_ProductOptionCombination_Catalog_ProductOption_OptionId]
GO
ALTER TABLE [dbo].[Catalog_ProductOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductOptionValue_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductOptionValue] CHECK CONSTRAINT [FK_Catalog_ProductOptionValue_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Catalog_ProductOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductOptionValue_Catalog_ProductOption_OptionId] FOREIGN KEY([OptionId])
REFERENCES [dbo].[Catalog_ProductOption] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductOptionValue] CHECK CONSTRAINT [FK_Catalog_ProductOptionValue_Catalog_ProductOption_OptionId]
GO
ALTER TABLE [dbo].[Catalog_ProductPriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductPriceHistory_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductPriceHistory] CHECK CONSTRAINT [FK_Catalog_ProductPriceHistory_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Catalog_ProductPriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductPriceHistory_Core_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Catalog_ProductPriceHistory] CHECK CONSTRAINT [FK_Catalog_ProductPriceHistory_Core_User_CreatedById]
GO
ALTER TABLE [dbo].[Catalog_ProductTemplateProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductTemplateProductAttribute_Catalog_ProductAttribute_ProductAttributeId] FOREIGN KEY([ProductAttributeId])
REFERENCES [dbo].[Catalog_ProductAttribute] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalog_ProductTemplateProductAttribute] CHECK CONSTRAINT [FK_Catalog_ProductTemplateProductAttribute_Catalog_ProductAttribute_ProductAttributeId]
GO
ALTER TABLE [dbo].[Catalog_ProductTemplateProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_ProductTemplateProductAttribute_Catalog_ProductTemplate_ProductTemplateId] FOREIGN KEY([ProductTemplateId])
REFERENCES [dbo].[Catalog_ProductTemplate] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalog_ProductTemplateProductAttribute] CHECK CONSTRAINT [FK_Catalog_ProductTemplateProductAttribute_Catalog_ProductTemplate_ProductTemplateId]
GO
ALTER TABLE [dbo].[Cms_MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_Cms_MenuItem_Cms_Menu_MenuId] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Cms_Menu] ([Id])
GO
ALTER TABLE [dbo].[Cms_MenuItem] CHECK CONSTRAINT [FK_Cms_MenuItem_Cms_Menu_MenuId]
GO
ALTER TABLE [dbo].[Cms_MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_Cms_MenuItem_Cms_MenuItem_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Cms_MenuItem] ([Id])
GO
ALTER TABLE [dbo].[Cms_MenuItem] CHECK CONSTRAINT [FK_Cms_MenuItem_Cms_MenuItem_ParentId]
GO
ALTER TABLE [dbo].[Cms_MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_Cms_MenuItem_Core_Entity_EntityId] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Core_Entity] ([Id])
GO
ALTER TABLE [dbo].[Cms_MenuItem] CHECK CONSTRAINT [FK_Cms_MenuItem_Core_Entity_EntityId]
GO
ALTER TABLE [dbo].[Cms_Page]  WITH CHECK ADD  CONSTRAINT [FK_Cms_Page_Core_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Cms_Page] CHECK CONSTRAINT [FK_Cms_Page_Core_User_CreatedById]
GO
ALTER TABLE [dbo].[Cms_Page]  WITH CHECK ADD  CONSTRAINT [FK_Cms_Page_Core_User_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Cms_Page] CHECK CONSTRAINT [FK_Cms_Page_Core_User_UpdatedById]
GO
ALTER TABLE [dbo].[Comments_Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comment_Comments_Comment_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Comments_Comment] ([Id])
GO
ALTER TABLE [dbo].[Comments_Comment] CHECK CONSTRAINT [FK_Comments_Comment_Comments_Comment_ParentId]
GO
ALTER TABLE [dbo].[Comments_Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comment_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Comments_Comment] CHECK CONSTRAINT [FK_Comments_Comment_Core_User_UserId]
GO
ALTER TABLE [dbo].[Contacts_Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Contact_Contacts_ContactArea_ContactAreaId] FOREIGN KEY([ContactAreaId])
REFERENCES [dbo].[Contacts_ContactArea] ([Id])
GO
ALTER TABLE [dbo].[Contacts_Contact] CHECK CONSTRAINT [FK_Contacts_Contact_Contacts_ContactArea_ContactAreaId]
GO
ALTER TABLE [dbo].[Core_Address]  WITH CHECK ADD  CONSTRAINT [FK_Core_Address_Core_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Core_Country] ([Id])
GO
ALTER TABLE [dbo].[Core_Address] CHECK CONSTRAINT [FK_Core_Address_Core_Country_CountryId]
GO
ALTER TABLE [dbo].[Core_Address]  WITH CHECK ADD  CONSTRAINT [FK_Core_Address_Core_District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Core_District] ([Id])
GO
ALTER TABLE [dbo].[Core_Address] CHECK CONSTRAINT [FK_Core_Address_Core_District_DistrictId]
GO
ALTER TABLE [dbo].[Core_Address]  WITH CHECK ADD  CONSTRAINT [FK_Core_Address_Core_StateOrProvince_StateOrProvinceId] FOREIGN KEY([StateOrProvinceId])
REFERENCES [dbo].[Core_StateOrProvince] ([Id])
GO
ALTER TABLE [dbo].[Core_Address] CHECK CONSTRAINT [FK_Core_Address_Core_StateOrProvince_StateOrProvinceId]
GO
ALTER TABLE [dbo].[Core_CustomerGroupUser]  WITH CHECK ADD  CONSTRAINT [FK_Core_CustomerGroupUser_Core_CustomerGroup_CustomerGroupId] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[Core_CustomerGroup] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_CustomerGroupUser] CHECK CONSTRAINT [FK_Core_CustomerGroupUser_Core_CustomerGroup_CustomerGroupId]
GO
ALTER TABLE [dbo].[Core_CustomerGroupUser]  WITH CHECK ADD  CONSTRAINT [FK_Core_CustomerGroupUser_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_CustomerGroupUser] CHECK CONSTRAINT [FK_Core_CustomerGroupUser_Core_User_UserId]
GO
ALTER TABLE [dbo].[Core_District]  WITH CHECK ADD  CONSTRAINT [FK_Core_District_Core_StateOrProvince_StateOrProvinceId] FOREIGN KEY([StateOrProvinceId])
REFERENCES [dbo].[Core_StateOrProvince] ([Id])
GO
ALTER TABLE [dbo].[Core_District] CHECK CONSTRAINT [FK_Core_District_Core_StateOrProvince_StateOrProvinceId]
GO
ALTER TABLE [dbo].[Core_Entity]  WITH CHECK ADD  CONSTRAINT [FK_Core_Entity_Core_EntityType_EntityTypeId] FOREIGN KEY([EntityTypeId])
REFERENCES [dbo].[Core_EntityType] ([Id])
GO
ALTER TABLE [dbo].[Core_Entity] CHECK CONSTRAINT [FK_Core_Entity_Core_EntityType_EntityTypeId]
GO
ALTER TABLE [dbo].[Core_RoleClaim]  WITH CHECK ADD  CONSTRAINT [FK_Core_RoleClaim_Core_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Core_Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_RoleClaim] CHECK CONSTRAINT [FK_Core_RoleClaim_Core_Role_RoleId]
GO
ALTER TABLE [dbo].[Core_StateOrProvince]  WITH CHECK ADD  CONSTRAINT [FK_Core_StateOrProvince_Core_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Core_Country] ([Id])
GO
ALTER TABLE [dbo].[Core_StateOrProvince] CHECK CONSTRAINT [FK_Core_StateOrProvince_Core_Country_CountryId]
GO
ALTER TABLE [dbo].[Core_User]  WITH CHECK ADD  CONSTRAINT [FK_Core_User_Core_UserAddress_DefaultBillingAddressId] FOREIGN KEY([DefaultBillingAddressId])
REFERENCES [dbo].[Core_UserAddress] ([Id])
GO
ALTER TABLE [dbo].[Core_User] CHECK CONSTRAINT [FK_Core_User_Core_UserAddress_DefaultBillingAddressId]
GO
ALTER TABLE [dbo].[Core_User]  WITH CHECK ADD  CONSTRAINT [FK_Core_User_Core_UserAddress_DefaultShippingAddressId] FOREIGN KEY([DefaultShippingAddressId])
REFERENCES [dbo].[Core_UserAddress] ([Id])
GO
ALTER TABLE [dbo].[Core_User] CHECK CONSTRAINT [FK_Core_User_Core_UserAddress_DefaultShippingAddressId]
GO
ALTER TABLE [dbo].[Core_User]  WITH CHECK ADD  CONSTRAINT [FK_Core_User_Core_Vendor_VendorId] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Core_Vendor] ([Id])
GO
ALTER TABLE [dbo].[Core_User] CHECK CONSTRAINT [FK_Core_User_Core_Vendor_VendorId]
GO
ALTER TABLE [dbo].[Core_UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_Core_UserAddress_Core_Address_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Core_Address] ([Id])
GO
ALTER TABLE [dbo].[Core_UserAddress] CHECK CONSTRAINT [FK_Core_UserAddress_Core_Address_AddressId]
GO
ALTER TABLE [dbo].[Core_UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_Core_UserAddress_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Core_UserAddress] CHECK CONSTRAINT [FK_Core_UserAddress_Core_User_UserId]
GO
ALTER TABLE [dbo].[Core_UserClaim]  WITH CHECK ADD  CONSTRAINT [FK_Core_UserClaim_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_UserClaim] CHECK CONSTRAINT [FK_Core_UserClaim_Core_User_UserId]
GO
ALTER TABLE [dbo].[Core_UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_Core_UserLogin_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_UserLogin] CHECK CONSTRAINT [FK_Core_UserLogin_Core_User_UserId]
GO
ALTER TABLE [dbo].[Core_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_Core_UserRole_Core_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Core_Role] ([Id])
GO
ALTER TABLE [dbo].[Core_UserRole] CHECK CONSTRAINT [FK_Core_UserRole_Core_Role_RoleId]
GO
ALTER TABLE [dbo].[Core_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_Core_UserRole_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Core_UserRole] CHECK CONSTRAINT [FK_Core_UserRole_Core_User_UserId]
GO
ALTER TABLE [dbo].[Core_UserToken]  WITH CHECK ADD  CONSTRAINT [FK_Core_UserToken_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_UserToken] CHECK CONSTRAINT [FK_Core_UserToken_Core_User_UserId]
GO
ALTER TABLE [dbo].[Core_WidgetInstance]  WITH CHECK ADD  CONSTRAINT [FK_Core_WidgetInstance_Core_Widget_WidgetId] FOREIGN KEY([WidgetId])
REFERENCES [dbo].[Core_Widget] ([Id])
GO
ALTER TABLE [dbo].[Core_WidgetInstance] CHECK CONSTRAINT [FK_Core_WidgetInstance_Core_Widget_WidgetId]
GO
ALTER TABLE [dbo].[Core_WidgetInstance]  WITH CHECK ADD  CONSTRAINT [FK_Core_WidgetInstance_Core_WidgetZone_WidgetZoneId] FOREIGN KEY([WidgetZoneId])
REFERENCES [dbo].[Core_WidgetZone] ([Id])
GO
ALTER TABLE [dbo].[Core_WidgetInstance] CHECK CONSTRAINT [FK_Core_WidgetInstance_Core_WidgetZone_WidgetZoneId]
GO
ALTER TABLE [dbo].[Inventory_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Stock_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Inventory_Stock] CHECK CONSTRAINT [FK_Inventory_Stock_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Inventory_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Stock_Inventory_Warehouse_WarehouseId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Inventory_Warehouse] ([Id])
GO
ALTER TABLE [dbo].[Inventory_Stock] CHECK CONSTRAINT [FK_Inventory_Stock_Inventory_Warehouse_WarehouseId]
GO
ALTER TABLE [dbo].[Inventory_StockHistory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_StockHistory_Core_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Inventory_StockHistory] CHECK CONSTRAINT [FK_Inventory_StockHistory_Core_User_CreatedById]
GO
ALTER TABLE [dbo].[Inventory_Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Warehouse_Core_Address_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Core_Address] ([Id])
GO
ALTER TABLE [dbo].[Inventory_Warehouse] CHECK CONSTRAINT [FK_Inventory_Warehouse_Core_Address_AddressId]
GO
ALTER TABLE [dbo].[Inventory_Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Warehouse_Core_Vendor_VendorId] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Core_Vendor] ([Id])
GO
ALTER TABLE [dbo].[Inventory_Warehouse] CHECK CONSTRAINT [FK_Inventory_Warehouse_Core_Vendor_VendorId]
GO
ALTER TABLE [dbo].[Localization_Resource]  WITH CHECK ADD  CONSTRAINT [FK_Localization_Resource_Localization_Culture_CultureId] FOREIGN KEY([CultureId])
REFERENCES [dbo].[Localization_Culture] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Localization_Resource] CHECK CONSTRAINT [FK_Localization_Resource_Localization_Culture_CultureId]
GO
ALTER TABLE [dbo].[News_NewsItem]  WITH CHECK ADD  CONSTRAINT [FK_News_NewsItem_Core_Media_ThumbnailImageId] FOREIGN KEY([ThumbnailImageId])
REFERENCES [dbo].[Core_Media] ([Id])
GO
ALTER TABLE [dbo].[News_NewsItem] CHECK CONSTRAINT [FK_News_NewsItem_Core_Media_ThumbnailImageId]
GO
ALTER TABLE [dbo].[News_NewsItem]  WITH CHECK ADD  CONSTRAINT [FK_News_NewsItem_Core_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[News_NewsItem] CHECK CONSTRAINT [FK_News_NewsItem_Core_User_CreatedById]
GO
ALTER TABLE [dbo].[News_NewsItem]  WITH CHECK ADD  CONSTRAINT [FK_News_NewsItem_Core_User_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[News_NewsItem] CHECK CONSTRAINT [FK_News_NewsItem_Core_User_UpdatedById]
GO
ALTER TABLE [dbo].[News_NewsItemCategory]  WITH CHECK ADD  CONSTRAINT [FK_News_NewsItemCategory_News_NewsCategory_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[News_NewsCategory] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News_NewsItemCategory] CHECK CONSTRAINT [FK_News_NewsItemCategory_News_NewsCategory_CategoryId]
GO
ALTER TABLE [dbo].[News_NewsItemCategory]  WITH CHECK ADD  CONSTRAINT [FK_News_NewsItemCategory_News_NewsItem_NewsItemId] FOREIGN KEY([NewsItemId])
REFERENCES [dbo].[News_NewsItem] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News_NewsItemCategory] CHECK CONSTRAINT [FK_News_NewsItemCategory_News_NewsItem_NewsItemId]
GO
ALTER TABLE [dbo].[Orders_Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Order_Core_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Orders_Order] CHECK CONSTRAINT [FK_Orders_Order_Core_User_CreatedById]
GO
ALTER TABLE [dbo].[Orders_Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Order_Orders_Order_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Orders_Order] ([Id])
GO
ALTER TABLE [dbo].[Orders_Order] CHECK CONSTRAINT [FK_Orders_Order_Orders_Order_ParentId]
GO
ALTER TABLE [dbo].[Orders_Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Order_Orders_OrderAddress_BillingAddressId] FOREIGN KEY([BillingAddressId])
REFERENCES [dbo].[Orders_OrderAddress] ([Id])
GO
ALTER TABLE [dbo].[Orders_Order] CHECK CONSTRAINT [FK_Orders_Order_Orders_OrderAddress_BillingAddressId]
GO
ALTER TABLE [dbo].[Orders_Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Order_Orders_OrderAddress_ShippingAddressId] FOREIGN KEY([ShippingAddressId])
REFERENCES [dbo].[Orders_OrderAddress] ([Id])
GO
ALTER TABLE [dbo].[Orders_Order] CHECK CONSTRAINT [FK_Orders_Order_Orders_OrderAddress_ShippingAddressId]
GO
ALTER TABLE [dbo].[Orders_OrderAddress]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderAddress_Core_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Core_Country] ([Id])
GO
ALTER TABLE [dbo].[Orders_OrderAddress] CHECK CONSTRAINT [FK_Orders_OrderAddress_Core_Country_CountryId]
GO
ALTER TABLE [dbo].[Orders_OrderAddress]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderAddress_Core_District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Core_District] ([Id])
GO
ALTER TABLE [dbo].[Orders_OrderAddress] CHECK CONSTRAINT [FK_Orders_OrderAddress_Core_District_DistrictId]
GO
ALTER TABLE [dbo].[Orders_OrderAddress]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderAddress_Core_StateOrProvince_StateOrProvinceId] FOREIGN KEY([StateOrProvinceId])
REFERENCES [dbo].[Core_StateOrProvince] ([Id])
GO
ALTER TABLE [dbo].[Orders_OrderAddress] CHECK CONSTRAINT [FK_Orders_OrderAddress_Core_StateOrProvince_StateOrProvinceId]
GO
ALTER TABLE [dbo].[Orders_OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderHistory_Core_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Orders_OrderHistory] CHECK CONSTRAINT [FK_Orders_OrderHistory_Core_User_CreatedById]
GO
ALTER TABLE [dbo].[Orders_OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderHistory_Orders_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders_Order] ([Id])
GO
ALTER TABLE [dbo].[Orders_OrderHistory] CHECK CONSTRAINT [FK_Orders_OrderHistory_Orders_Order_OrderId]
GO
ALTER TABLE [dbo].[Orders_OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderItem_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Orders_OrderItem] CHECK CONSTRAINT [FK_Orders_OrderItem_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Orders_OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderItem_Orders_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders_Order] ([Id])
GO
ALTER TABLE [dbo].[Orders_OrderItem] CHECK CONSTRAINT [FK_Orders_OrderItem_Orders_Order_OrderId]
GO
ALTER TABLE [dbo].[Payments_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Payment_Orders_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders_Order] ([Id])
GO
ALTER TABLE [dbo].[Payments_Payment] CHECK CONSTRAINT [FK_Payments_Payment_Orders_Order_OrderId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleCategory]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleCategory_Catalog_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Catalog_Category] ([Id])
GO
ALTER TABLE [dbo].[Pricing_CartRuleCategory] CHECK CONSTRAINT [FK_Pricing_CartRuleCategory_Catalog_Category_CategoryId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleCategory]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleCategory_Pricing_CartRule_CartRuleId] FOREIGN KEY([CartRuleId])
REFERENCES [dbo].[Pricing_CartRule] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pricing_CartRuleCategory] CHECK CONSTRAINT [FK_Pricing_CartRuleCategory_Pricing_CartRule_CartRuleId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleCustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleCustomerGroup_Core_CustomerGroup_CustomerGroupId] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[Core_CustomerGroup] ([Id])
GO
ALTER TABLE [dbo].[Pricing_CartRuleCustomerGroup] CHECK CONSTRAINT [FK_Pricing_CartRuleCustomerGroup_Core_CustomerGroup_CustomerGroupId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleCustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleCustomerGroup_Pricing_CartRule_CartRuleId] FOREIGN KEY([CartRuleId])
REFERENCES [dbo].[Pricing_CartRule] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pricing_CartRuleCustomerGroup] CHECK CONSTRAINT [FK_Pricing_CartRuleCustomerGroup_Pricing_CartRule_CartRuleId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleProduct]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleProduct_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Pricing_CartRuleProduct] CHECK CONSTRAINT [FK_Pricing_CartRuleProduct_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleProduct]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleProduct_Pricing_CartRule_CartRuleId] FOREIGN KEY([CartRuleId])
REFERENCES [dbo].[Pricing_CartRule] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pricing_CartRuleProduct] CHECK CONSTRAINT [FK_Pricing_CartRuleProduct_Pricing_CartRule_CartRuleId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleUsage]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleUsage_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Pricing_CartRuleUsage] CHECK CONSTRAINT [FK_Pricing_CartRuleUsage_Core_User_UserId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleUsage]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleUsage_Pricing_CartRule_CartRuleId] FOREIGN KEY([CartRuleId])
REFERENCES [dbo].[Pricing_CartRule] ([Id])
GO
ALTER TABLE [dbo].[Pricing_CartRuleUsage] CHECK CONSTRAINT [FK_Pricing_CartRuleUsage_Pricing_CartRule_CartRuleId]
GO
ALTER TABLE [dbo].[Pricing_CartRuleUsage]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CartRuleUsage_Pricing_Coupon_CouponId] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Pricing_Coupon] ([Id])
GO
ALTER TABLE [dbo].[Pricing_CartRuleUsage] CHECK CONSTRAINT [FK_Pricing_CartRuleUsage_Pricing_Coupon_CouponId]
GO
ALTER TABLE [dbo].[Pricing_CatalogRuleCustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CatalogRuleCustomerGroup_Core_CustomerGroup_CustomerGroupId] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[Core_CustomerGroup] ([Id])
GO
ALTER TABLE [dbo].[Pricing_CatalogRuleCustomerGroup] CHECK CONSTRAINT [FK_Pricing_CatalogRuleCustomerGroup_Core_CustomerGroup_CustomerGroupId]
GO
ALTER TABLE [dbo].[Pricing_CatalogRuleCustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_CatalogRuleCustomerGroup_Pricing_CatalogRule_CatalogRuleId] FOREIGN KEY([CatalogRuleId])
REFERENCES [dbo].[Pricing_CatalogRule] ([Id])
GO
ALTER TABLE [dbo].[Pricing_CatalogRuleCustomerGroup] CHECK CONSTRAINT [FK_Pricing_CatalogRuleCustomerGroup_Pricing_CatalogRule_CatalogRuleId]
GO
ALTER TABLE [dbo].[Pricing_Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_Coupon_Pricing_CartRule_CartRuleId] FOREIGN KEY([CartRuleId])
REFERENCES [dbo].[Pricing_CartRule] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pricing_Coupon] CHECK CONSTRAINT [FK_Pricing_Coupon_Pricing_CartRule_CartRuleId]
GO
ALTER TABLE [dbo].[ProductComparison_ComparingProduct]  WITH CHECK ADD  CONSTRAINT [FK_ProductComparison_ComparingProduct_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[ProductComparison_ComparingProduct] CHECK CONSTRAINT [FK_ProductComparison_ComparingProduct_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[ProductComparison_ComparingProduct]  WITH CHECK ADD  CONSTRAINT [FK_ProductComparison_ComparingProduct_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[ProductComparison_ComparingProduct] CHECK CONSTRAINT [FK_ProductComparison_ComparingProduct_Core_User_UserId]
GO
ALTER TABLE [dbo].[Reviews_Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Reply_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Reviews_Reply] CHECK CONSTRAINT [FK_Reviews_Reply_Core_User_UserId]
GO
ALTER TABLE [dbo].[Reviews_Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Reply_Reviews_Review_ReviewId] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[Reviews_Review] ([Id])
GO
ALTER TABLE [dbo].[Reviews_Reply] CHECK CONSTRAINT [FK_Reviews_Reply_Reviews_Review_ReviewId]
GO
ALTER TABLE [dbo].[Reviews_Review]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Review_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Reviews_Review] CHECK CONSTRAINT [FK_Reviews_Review_Core_User_UserId]
GO
ALTER TABLE [dbo].[Shipments_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Shipment_Core_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[Shipments_Shipment] CHECK CONSTRAINT [FK_Shipments_Shipment_Core_User_CreatedById]
GO
ALTER TABLE [dbo].[Shipments_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Shipment_Inventory_Warehouse_WarehouseId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Inventory_Warehouse] ([Id])
GO
ALTER TABLE [dbo].[Shipments_Shipment] CHECK CONSTRAINT [FK_Shipments_Shipment_Inventory_Warehouse_WarehouseId]
GO
ALTER TABLE [dbo].[Shipments_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Shipment_Orders_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders_Order] ([Id])
GO
ALTER TABLE [dbo].[Shipments_Shipment] CHECK CONSTRAINT [FK_Shipments_Shipment_Orders_Order_OrderId]
GO
ALTER TABLE [dbo].[Shipments_ShipmentItem]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_ShipmentItem_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[Shipments_ShipmentItem] CHECK CONSTRAINT [FK_Shipments_ShipmentItem_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[Shipments_ShipmentItem]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_ShipmentItem_Shipments_Shipment_ShipmentId] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipments_Shipment] ([Id])
GO
ALTER TABLE [dbo].[Shipments_ShipmentItem] CHECK CONSTRAINT [FK_Shipments_ShipmentItem_Shipments_Shipment_ShipmentId]
GO
ALTER TABLE [dbo].[ShippingTableRate_PriceAndDestination]  WITH CHECK ADD  CONSTRAINT [FK_ShippingTableRate_PriceAndDestination_Core_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Core_Country] ([Id])
GO
ALTER TABLE [dbo].[ShippingTableRate_PriceAndDestination] CHECK CONSTRAINT [FK_ShippingTableRate_PriceAndDestination_Core_Country_CountryId]
GO
ALTER TABLE [dbo].[ShippingTableRate_PriceAndDestination]  WITH CHECK ADD  CONSTRAINT [FK_ShippingTableRate_PriceAndDestination_Core_District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Core_District] ([Id])
GO
ALTER TABLE [dbo].[ShippingTableRate_PriceAndDestination] CHECK CONSTRAINT [FK_ShippingTableRate_PriceAndDestination_Core_District_DistrictId]
GO
ALTER TABLE [dbo].[ShippingTableRate_PriceAndDestination]  WITH CHECK ADD  CONSTRAINT [FK_ShippingTableRate_PriceAndDestination_Core_StateOrProvince_StateOrProvinceId] FOREIGN KEY([StateOrProvinceId])
REFERENCES [dbo].[Core_StateOrProvince] ([Id])
GO
ALTER TABLE [dbo].[ShippingTableRate_PriceAndDestination] CHECK CONSTRAINT [FK_ShippingTableRate_PriceAndDestination_Core_StateOrProvince_StateOrProvinceId]
GO
ALTER TABLE [dbo].[ShoppingCart_Cart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Cart_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCart_Cart] CHECK CONSTRAINT [FK_ShoppingCart_Cart_Core_User_UserId]
GO
ALTER TABLE [dbo].[ShoppingCart_CartItem]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_CartItem_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCart_CartItem] CHECK CONSTRAINT [FK_ShoppingCart_CartItem_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[ShoppingCart_CartItem]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_CartItem_ShoppingCart_Cart_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[ShoppingCart_Cart] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCart_CartItem] CHECK CONSTRAINT [FK_ShoppingCart_CartItem_ShoppingCart_Cart_CartId]
GO
ALTER TABLE [dbo].[Tax_TaxRate]  WITH CHECK ADD  CONSTRAINT [FK_Tax_TaxRate_Core_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Core_Country] ([Id])
GO
ALTER TABLE [dbo].[Tax_TaxRate] CHECK CONSTRAINT [FK_Tax_TaxRate_Core_Country_CountryId]
GO
ALTER TABLE [dbo].[Tax_TaxRate]  WITH CHECK ADD  CONSTRAINT [FK_Tax_TaxRate_Core_StateOrProvince_StateOrProvinceId] FOREIGN KEY([StateOrProvinceId])
REFERENCES [dbo].[Core_StateOrProvince] ([Id])
GO
ALTER TABLE [dbo].[Tax_TaxRate] CHECK CONSTRAINT [FK_Tax_TaxRate_Core_StateOrProvince_StateOrProvinceId]
GO
ALTER TABLE [dbo].[Tax_TaxRate]  WITH CHECK ADD  CONSTRAINT [FK_Tax_TaxRate_Tax_TaxClass_TaxClassId] FOREIGN KEY([TaxClassId])
REFERENCES [dbo].[Tax_TaxClass] ([Id])
GO
ALTER TABLE [dbo].[Tax_TaxRate] CHECK CONSTRAINT [FK_Tax_TaxRate_Tax_TaxClass_TaxClassId]
GO
ALTER TABLE [dbo].[WishList_WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_WishList_Core_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Core_User] ([Id])
GO
ALTER TABLE [dbo].[WishList_WishList] CHECK CONSTRAINT [FK_WishList_WishList_Core_User_UserId]
GO
ALTER TABLE [dbo].[WishList_WishListItem]  WITH CHECK ADD  CONSTRAINT [FK_WishList_WishListItem_Catalog_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catalog_Product] ([Id])
GO
ALTER TABLE [dbo].[WishList_WishListItem] CHECK CONSTRAINT [FK_WishList_WishListItem_Catalog_Product_ProductId]
GO
ALTER TABLE [dbo].[WishList_WishListItem]  WITH CHECK ADD  CONSTRAINT [FK_WishList_WishListItem_WishList_WishList_WishListId] FOREIGN KEY([WishListId])
REFERENCES [dbo].[WishList_WishList] ([Id])
GO
ALTER TABLE [dbo].[WishList_WishListItem] CHECK CONSTRAINT [FK_WishList_WishListItem_WishList_WishList_WishListId]
GO
USE [master]
GO
ALTER DATABASE [GiccoDb] SET  READ_WRITE 
GO
