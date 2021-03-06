USE [master]
GO
/****** Object:  Database [Buying Guide]    Script Date: 31.12.2016 8:41:13 ******/
CREATE DATABASE [Buying Guide]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Buying Guide', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Buying Guide.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Buying Guide_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Buying Guide_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Buying Guide] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Buying Guide].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Buying Guide] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Buying Guide] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Buying Guide] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Buying Guide] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Buying Guide] SET ARITHABORT OFF 
GO
ALTER DATABASE [Buying Guide] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Buying Guide] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Buying Guide] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Buying Guide] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Buying Guide] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Buying Guide] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Buying Guide] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Buying Guide] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Buying Guide] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Buying Guide] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Buying Guide] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Buying Guide] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Buying Guide] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Buying Guide] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Buying Guide] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Buying Guide] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Buying Guide] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Buying Guide] SET RECOVERY FULL 
GO
ALTER DATABASE [Buying Guide] SET  MULTI_USER 
GO
ALTER DATABASE [Buying Guide] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Buying Guide] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Buying Guide] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Buying Guide] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Buying Guide] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Buying Guide', N'ON'
GO
ALTER DATABASE [Buying Guide] SET QUERY_STORE = OFF
GO
USE [Buying Guide]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Buying Guide]
GO
/****** Object:  Table [dbo].[WORKING_HOURS]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKING_HOURS](
	[SHOP_ID] [int] NOT NULL,
	[DAY_OF_WEEK_ID] [int] NOT NULL,
	[OPEN_TIME] [nvarchar](5) NOT NULL,
	[CLOSE_TIME] [nvarchar](5) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_WH_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[HOURS]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HOURS]
   AS SELECT * FROM WORKING_HOURS
GO
/****** Object:  Table [dbo].[SHOP_SPECIALIZATION]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOP_SPECIALIZATION](
	[SHOP_ID] [int] NOT NULL,
	[SPECIALIZATION_ID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [SHOP_SPECIALIZATION_ID_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[SPECIALIZATION_VIEW]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SPECIALIZATION_VIEW]
   AS SELECT s.SHOP_ID, s.SPECIALIZATION_ID FROM SHOP_SPECIALIZATION s
GO
/****** Object:  Table [dbo].[OWN_FORMS]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWN_FORMS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OWN_FORMS] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_OF_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PRODUCT] [nvarchar](50) NOT NULL,
	[DESCRIPTION] [nvarchar](400) NOT NULL,
	[SHOP_ID] [int] NOT NULL,
	[PRICE] [money] NOT NULL,
	[IMAGE] [nvarchar](300) NOT NULL,
	[COUNT] [int] NOT NULL,
 CONSTRAINT [PK_P_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SHOP]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SHOP] [nvarchar](25) NOT NULL,
	[PHONE] [nvarchar](30) NOT NULL,
	[ADDRESS] [nvarchar](50) NOT NULL,
	[OWN_FORM_ID] [int] NOT NULL,
	[IMAGE] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_SHOP_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SPECIALIZATION]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPECIALIZATION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SPECIALIZATION] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_SPECIALIZATION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WEEK_DAYS]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEEK_DAYS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DAY_OF_WEEK] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_WD_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[OWN_FORMS] ON 

INSERT [dbo].[OWN_FORMS] ([ID], [OWN_FORMS]) VALUES (1, N'Коллективная')
INSERT [dbo].[OWN_FORMS] ([ID], [OWN_FORMS]) VALUES (2, N'Государственная')
INSERT [dbo].[OWN_FORMS] ([ID], [OWN_FORMS]) VALUES (3, N'Индивидуальная')
INSERT [dbo].[OWN_FORMS] ([ID], [OWN_FORMS]) VALUES (4, N'Кооперативная')
SET IDENTITY_INSERT [dbo].[OWN_FORMS] OFF
SET IDENTITY_INSERT [dbo].[PRODUCTS] ON 

INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (10, N'Ноутбук ASUS X556UA', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 33760.0000, N'..\..\Images\not found.jpg', 12)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (11, N'Ноутбук PACKARD BELL ENTG81BA', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 17999.0000, N'..\..\Images\not found.jpg', 7)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (12, N'Весы SCARLETT SC-2216', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 1599.0000, N'..\..\Images\not found.jpg', 10)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (13, N'Чайник BRAUN MQUICK 5 WK500', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 3199.0000, N'..\..\Images\not found.jpg', 12)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (14, N'Кофеварка гейзерная DELONGHI EMK 6', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 8999.0000, N'..\..\Images\not found.jpg', 10)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (15, N'Соковыжималка MOULINEX JU585', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 8999.0000, N'..\..\Images\not found.jpg', 4)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (16, N'Вафельница SMILE WM 3601', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 1699.0000, N'..\..\Images\not found.jpg', 12)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (17, N'Сэндвич-тостер SCARLETT SL-TM11501', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 3499.0000, N'..\..\Images\not found.jpg', 6)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (18, N'Porche 718 Cayman', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 3620000.0000, N'..\..\Images\not found.jpg', 12)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (20, N'Porsche 911 Carrera 4', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 2, 6617000.0000, N'..\..\Images\not found.jpg', 5)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (27, N'Весы SCARLETT SC-2216', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 1599.0000, N'..\..\Images\not found.jpg', 23)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (28, N'Тостер DELONGHI CTOV 2103 Green', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 3999.0000, N'..\..\Images\not found.jpg', 12)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (29, N'Цитруспресс BRAUN CJ3000', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 2799.0000, N'..\..\Images\not found.jpg', 8)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (30, N'Водоочистительный кувшин АКВАФОР Агат', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 549.0000, N'..\..\Images\not found.jpg', 13)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (31, N'Швейная машина ZIMBER ZM10917', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 999.0000, N'..\..\Images\not found.jpg', 4)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (32, N'Мороженица KENWOOD IM280', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 3999.0000, N'..\..\Images\not found.jpg', 5)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (33, N'Хлебопечь REDMOND RBM-1908', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 5299.0000, N'..\..\Images\not found.jpg', 13)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (34, N'COCA-COLA', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 59.0000, N'..\..\Images\not found.jpg', 50)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (35, N'ИНДИЛАЙТ', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 249.0000, N'..\..\Images\not found.jpg', 19)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (36, N'M&Ms', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 4, 59.0000, N'..\..\Images\not found.jpg', 23)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (37, N'ПРОСТОКВАШИНО', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 54.0000, N'..\..\Images\not found.jpg', 15)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (38, N'МИРАТОРГ', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 65.0000, N'..\..\Images\not found.jpg', 9)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (39, N'СТАРОДВОРСКИЕ', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 80.0000, N'..\..\Images\not found.jpg', 27)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (40, N'ПОМИДОРКА', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 79.0000, N'..\..\Images\not found.jpg', 6)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (41, N'Мобильный телефон ALCATEL One Touch 1035D', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 1600.0000, N'..\..\Images\not found.jpg', 9)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (42, N'Беспроводные стерео наушники HYUNDAI H-EP1201/02 B', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 1999.0000, N'..\..\Images\not found.jpg', 5)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (43, N'Наушники GAL MP-030 черно-белые', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 199.0000, N'..\..\Images\not found.jpg', 20)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (44, N'Монитор SAMSUNG S22D391Q 21.5"', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 8499.0000, N'..\..\Images\not found.jpg', 4)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (45, N'Планшет LENOVO TB2-X30F 16GB синий', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 11999.0000, N'..\..\Images\not found.jpg', 5)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (46, N'Ноутбук LENOVO B50-45 6010/2/250', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 5, 17999.0000, N'..\..\Images\not found.jpg', 10)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (49, N'Комбинированное платье с полосками', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 2999.0000, N'..\..\Images\not found.jpg', 4)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (50, N'Бархатные босоножки на платформе', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 3999.0000, N'..\..\Images\not found.jpg', 10)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (51, N'Укороченные брюки хлопок', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 1999.0000, N'..\..\Images\not found.jpg', 5)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (52, N'Пальто ручной работы', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 8999.0000, N'..\..\Images\not found.jpg', 7)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (53, N'Джемпер с воротником под горло', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 1999.0000, N'..\..\Images\not found.jpg', 6)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (54, N'Длинный бомбер с молниями', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 7999.0000, N'..\..\Images\not found.jpg', 8)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (55, N'Футболка в резинку', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 1999.0000, N'..\..\Images\not found.jpg', 9)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (56, N'Блестящий кардиган', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 899.0000, N'..\..\Images\not found.jpg', 8)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (57, N'Джемпер с пайетками', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 999.0000, N'..\..\Images\not found.jpg', 9)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (58, N'Бархатные трегинсы', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 6, 999.0000, N'..\..\Images\not found.jpg', 7)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (59, N'Ноутбук LENOVO B50-45 6010/2/250', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 13, 17999.0000, N'..\..\Images\not found.jpg', 4)
INSERT [dbo].[PRODUCTS] ([ID], [PRODUCT], [DESCRIPTION], [SHOP_ID], [PRICE], [IMAGE], [COUNT]) VALUES (60, N'Планшет LENOVO ТАВ 2 A10-70L', N'Это описание товара
В на самом деле ничего
Надо просто чтобы что-то было', 13, 17999.0000, N'..\..\Images\not found.jpg', 6)
SET IDENTITY_INSERT [dbo].[PRODUCTS] OFF
SET IDENTITY_INSERT [dbo].[SHOP] ON 

INSERT [dbo].[SHOP] ([ID], [SHOP], [PHONE], [ADDRESS], [OWN_FORM_ID], [IMAGE]) VALUES (2, N'Пятерочка', N'8 800 555 3536', N'Казань, ул. Деревня Универсиады, 7', 1, N'../Images/пятерочка.png')
INSERT [dbo].[SHOP] ([ID], [SHOP], [PHONE], [ADDRESS], [OWN_FORM_ID], [IMAGE]) VALUES (4, N'Ашан', N'8 800 555 3537', N'Казань, ул. Пушкина, 54', 2, N'../Images/ашан.png')
INSERT [dbo].[SHOP] ([ID], [SHOP], [PHONE], [ADDRESS], [OWN_FORM_ID], [IMAGE]) VALUES (5, N'Эссен', N'8 800 555 3538', N'Казань, ул. Кремлевская, 32', 4, N'../Images/эссен.png')
INSERT [dbo].[SHOP] ([ID], [SHOP], [PHONE], [ADDRESS], [OWN_FORM_ID], [IMAGE]) VALUES (6, N'Metro', N'8 800 555 3539', N'Казань, ул. Гвардейская, 2', 2, N'../Images/метро.png')
INSERT [dbo].[SHOP] ([ID], [SHOP], [PHONE], [ADDRESS], [OWN_FORM_ID], [IMAGE]) VALUES (12, N'Августина', N'8 800 555 3541', N'Казань, ул. Академика Губкина, 43', 3, N'../Images/августина.jpg')
INSERT [dbo].[SHOP] ([ID], [SHOP], [PHONE], [ADDRESS], [OWN_FORM_ID], [IMAGE]) VALUES (13, N'Карусель', N'8 800 555 3542', N'Казань, ул. Мавлютова, 45', 1, N'../Images/карусель.png')
INSERT [dbo].[SHOP] ([ID], [SHOP], [PHONE], [ADDRESS], [OWN_FORM_ID], [IMAGE]) VALUES (14, N'Эдельвейс', N'8 800 555 3543', N'Казань, ул. Островского, 76', 2, N'../Images/эдельвейс.jpg')
INSERT [dbo].[SHOP] ([ID], [SHOP], [PHONE], [ADDRESS], [OWN_FORM_ID], [IMAGE]) VALUES (15, N'Бэхэтле', N'8 800 555 3544', N'Казань, ул. Чистопольская, 21', 2, N'../Images/бэхетле.png')
SET IDENTITY_INSERT [dbo].[SHOP] OFF
SET IDENTITY_INSERT [dbo].[SHOP_SPECIALIZATION] ON 

INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (4, 3, 7)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (4, 8, 8)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (5, 1, 9)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (5, 2, 10)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (5, 8, 11)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (6, 4, 12)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (6, 5, 13)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (12, 1, 16)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (12, 3, 17)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (12, 7, 18)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (13, 2, 19)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (13, 1, 20)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (13, 6, 21)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (13, 7, 22)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (14, 1, 23)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (15, 7, 24)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (15, 8, 25)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (15, 3, 26)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (2, 2, 2048)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (2, 3, 2049)
INSERT [dbo].[SHOP_SPECIALIZATION] ([SHOP_ID], [SPECIALIZATION_ID], [ID]) VALUES (2, 7, 2050)
SET IDENTITY_INSERT [dbo].[SHOP_SPECIALIZATION] OFF
SET IDENTITY_INSERT [dbo].[SPECIALIZATION] ON 

INSERT [dbo].[SPECIALIZATION] ([ID], [SPECIALIZATION]) VALUES (1, N'Электроника')
INSERT [dbo].[SPECIALIZATION] ([ID], [SPECIALIZATION]) VALUES (2, N'Компьютеры')
INSERT [dbo].[SPECIALIZATION] ([ID], [SPECIALIZATION]) VALUES (3, N'Бытовая техника')
INSERT [dbo].[SPECIALIZATION] ([ID], [SPECIALIZATION]) VALUES (4, N'Детские товары')
INSERT [dbo].[SPECIALIZATION] ([ID], [SPECIALIZATION]) VALUES (5, N'Одежда и обувь')
INSERT [dbo].[SPECIALIZATION] ([ID], [SPECIALIZATION]) VALUES (6, N'Дом, дача, ремонт')
INSERT [dbo].[SPECIALIZATION] ([ID], [SPECIALIZATION]) VALUES (7, N'Авто')
INSERT [dbo].[SPECIALIZATION] ([ID], [SPECIALIZATION]) VALUES (8, N'Продукты')
SET IDENTITY_INSERT [dbo].[SPECIALIZATION] OFF
SET IDENTITY_INSERT [dbo].[WEEK_DAYS] ON 

INSERT [dbo].[WEEK_DAYS] ([ID], [DAY_OF_WEEK]) VALUES (1, N'Sunday')
INSERT [dbo].[WEEK_DAYS] ([ID], [DAY_OF_WEEK]) VALUES (2, N'Monday')
INSERT [dbo].[WEEK_DAYS] ([ID], [DAY_OF_WEEK]) VALUES (3, N'Tuesday')
INSERT [dbo].[WEEK_DAYS] ([ID], [DAY_OF_WEEK]) VALUES (4, N'Wednesday')
INSERT [dbo].[WEEK_DAYS] ([ID], [DAY_OF_WEEK]) VALUES (5, N'Thursday')
INSERT [dbo].[WEEK_DAYS] ([ID], [DAY_OF_WEEK]) VALUES (6, N'Friday')
INSERT [dbo].[WEEK_DAYS] ([ID], [DAY_OF_WEEK]) VALUES (7, N'Saturday')
SET IDENTITY_INSERT [dbo].[WEEK_DAYS] OFF
SET IDENTITY_INSERT [dbo].[WORKING_HOURS] ON 

INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (4, 1, N'08:00', N'22:00', 1066)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (4, 2, N'08:00', N'22:00', 1067)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (4, 3, N'08:00', N'22:00', 1068)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (4, 4, N'08:00', N'22:00', 1069)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (4, 5, N'08:00', N'22:00', 1070)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (4, 6, N'08:00', N'22:00', 1071)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (4, 7, N'08:00', N'22:00', 1072)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (5, 1, N'08:00', N'22:00', 1073)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (5, 2, N'08:00', N'22:00', 1074)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (5, 3, N'08:00', N'22:00', 1075)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (5, 4, N'08:00', N'22:00', 1076)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (5, 5, N'08:00', N'22:00', 1077)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (5, 6, N'08:00', N'22:00', 1078)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (5, 7, N'08:00', N'22:00', 1079)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (6, 1, N'08:00', N'22:00', 1080)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (6, 2, N'08:00', N'22:00', 1081)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (6, 3, N'08:00', N'22:00', 1082)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (6, 4, N'08:00', N'22:00', 1083)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (6, 5, N'08:00', N'22:00', 1084)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (6, 6, N'08:00', N'22:00', 1085)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (6, 7, N'08:00', N'22:00', 1086)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (12, 1, N'08:00', N'22:00', 1094)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (12, 2, N'08:00', N'22:00', 1095)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (12, 3, N'08:00', N'22:00', 1096)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (12, 4, N'08:00', N'22:00', 1097)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (12, 5, N'08:00', N'22:00', 1098)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (12, 6, N'08:00', N'22:00', 1099)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (12, 7, N'08:00', N'22:00', 1100)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (13, 1, N'08:00', N'22:00', 1101)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (13, 2, N'08:00', N'22:00', 1102)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (13, 3, N'08:00', N'22:00', 1103)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (13, 4, N'08:00', N'22:00', 1104)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (13, 5, N'08:00', N'22:00', 1105)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (13, 6, N'08:00', N'22:00', 1106)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (13, 7, N'08:00', N'22:00', 1107)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (14, 1, N'08:00', N'22:00', 1108)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (14, 2, N'08:00', N'22:00', 1109)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (14, 3, N'08:00', N'22:00', 1110)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (14, 4, N'08:00', N'22:00', 1111)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (14, 5, N'08:00', N'22:00', 1112)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (14, 6, N'08:00', N'22:00', 1113)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (14, 7, N'08:00', N'22:00', 1114)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (15, 1, N'08:00', N'22:00', 1115)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (15, 2, N'08:00', N'22:00', 1116)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (15, 3, N'08:00', N'22:00', 1117)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (15, 4, N'08:00', N'22:00', 1118)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (15, 5, N'08:00', N'22:00', 1119)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (15, 6, N'08:00', N'22:00', 1120)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (15, 7, N'08:00', N'22:00', 1121)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (2, 1, N'2:00', N'0:00', 1252)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (2, 2, N'2:00', N'0:00', 1253)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (2, 3, N'2:00', N'0:00', 1254)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (2, 4, N'8:00', N'0:00', 1255)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (2, 5, N'6:00', N'0:00', 1256)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (2, 6, N'6:00', N'0:00', 1257)
INSERT [dbo].[WORKING_HOURS] ([SHOP_ID], [DAY_OF_WEEK_ID], [OPEN_TIME], [CLOSE_TIME], [ID]) VALUES (2, 7, N'5:00', N'0:00', 1258)
SET IDENTITY_INSERT [dbo].[WORKING_HOURS] OFF
ALTER TABLE [dbo].[SHOP] ADD  DEFAULT ('No name') FOR [SHOP]
GO
ALTER TABLE [dbo].[SHOP] ADD  DEFAULT ('No phone') FOR [PHONE]
GO
ALTER TABLE [dbo].[SHOP] ADD  DEFAULT ('No address') FOR [ADDRESS]
GO
ALTER TABLE [dbo].[SHOP] ADD  DEFAULT ((1)) FOR [OWN_FORM_ID]
GO
ALTER TABLE [dbo].[SHOP] ADD  DEFAULT ('../../Images/not found.jpg') FOR [IMAGE]
GO
ALTER TABLE [dbo].[WORKING_HOURS] ADD  DEFAULT ('8:00') FOR [OPEN_TIME]
GO
ALTER TABLE [dbo].[WORKING_HOURS] ADD  DEFAULT ('22:00') FOR [CLOSE_TIME]
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH CHECK ADD  CONSTRAINT [FK_SH_ID] FOREIGN KEY([SHOP_ID])
REFERENCES [dbo].[SHOP] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCTS] CHECK CONSTRAINT [FK_SH_ID]
GO
ALTER TABLE [dbo].[SHOP]  WITH CHECK ADD  CONSTRAINT [FK_OF_ID] FOREIGN KEY([OWN_FORM_ID])
REFERENCES [dbo].[OWN_FORMS] ([ID])
GO
ALTER TABLE [dbo].[SHOP] CHECK CONSTRAINT [FK_OF_ID]
GO
ALTER TABLE [dbo].[SHOP_SPECIALIZATION]  WITH CHECK ADD  CONSTRAINT [FK_S] FOREIGN KEY([SPECIALIZATION_ID])
REFERENCES [dbo].[SPECIALIZATION] ([ID])
GO
ALTER TABLE [dbo].[SHOP_SPECIALIZATION] CHECK CONSTRAINT [FK_S]
GO
ALTER TABLE [dbo].[SHOP_SPECIALIZATION]  WITH CHECK ADD  CONSTRAINT [FK_SHOP] FOREIGN KEY([SHOP_ID])
REFERENCES [dbo].[SHOP] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SHOP_SPECIALIZATION] CHECK CONSTRAINT [FK_SHOP]
GO
ALTER TABLE [dbo].[WORKING_HOURS]  WITH CHECK ADD  CONSTRAINT [FK_S_ID] FOREIGN KEY([SHOP_ID])
REFERENCES [dbo].[SHOP] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WORKING_HOURS] CHECK CONSTRAINT [FK_S_ID]
GO
ALTER TABLE [dbo].[WORKING_HOURS]  WITH CHECK ADD  CONSTRAINT [FK_WD_ID] FOREIGN KEY([DAY_OF_WEEK_ID])
REFERENCES [dbo].[WEEK_DAYS] ([ID])
GO
ALTER TABLE [dbo].[WORKING_HOURS] CHECK CONSTRAINT [FK_WD_ID]
GO
ALTER TABLE [dbo].[WORKING_HOURS]  WITH CHECK ADD  CONSTRAINT [check_constraint] CHECK  ((len([OPEN_TIME])>(3) AND len([OPEN_TIME])<(6)))
GO
ALTER TABLE [dbo].[WORKING_HOURS] CHECK CONSTRAINT [check_constraint]
GO
ALTER TABLE [dbo].[WORKING_HOURS]  WITH CHECK ADD  CONSTRAINT [check_constraint1] CHECK  ((len([CLOSE_TIME])>(3) AND len([CLOSE_TIME])<(6)))
GO
ALTER TABLE [dbo].[WORKING_HOURS] CHECK CONSTRAINT [check_constraint1]
GO
/****** Object:  StoredProcedure [dbo].[insertShop]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertShop](@name NVARCHAR(50), @address NVARCHAR(50), @image NVARCHAR(300), @phone NVARCHAR(50), @ownForm INT)
   AS 
   INSERT INTO SHOP VALUES (@name, @phone, @address, @ownForm, @image)
GO
/****** Object:  StoredProcedure [dbo].[insertSpec]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertSpec] (@shopId INT, @specId INT)
   AS 
      INSERT INTO SHOP_SPECIALIZATION (SHOP_ID, SPECIALIZATION_ID) VALUES (@shopId, @specId)
GO
/****** Object:  StoredProcedure [dbo].[insertWorkHours]    Script Date: 31.12.2016 8:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertWorkHours] (@dayId INT, @shopId INT, @open NVARCHAR(50), @close NVARCHAR(50))
   AS INSERT INTO WORKING_HOURS (SHOP_ID, DAY_OF_WEEK_ID, OPEN_TIME, CLOSE_TIME) VALUES (@shopId, @dayId, @open, @close)
GO
USE [master]
GO
ALTER DATABASE [Buying Guide] SET  READ_WRITE 
GO
