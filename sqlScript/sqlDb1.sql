USE [master]
GO
/****** Object:  Database [ProjectPRN]    Script Date: 7/17/2022 8:41:36 PM ******/
CREATE DATABASE [ProjectPRN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectPRN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUNGLE\MSSQL\DATA\ProjectPRN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectPRN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUNGLE\MSSQL\DATA\ProjectPRN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectPRN] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectPRN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectPRN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRN] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectPRN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectPRN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRN] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectPRN] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectPRN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectPRN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectPRN', N'ON'
GO
ALTER DATABASE [ProjectPRN] SET QUERY_STORE = OFF
GO
USE [ProjectPRN]
GO
/****** Object:  User [hunglm21]    Script Date: 7/17/2022 8:41:36 PM ******/
CREATE USER [hunglm21] FOR LOGIN [hunglm21] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[PostalCode] [float] NULL,
	[PhoneNumber] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupAccount]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupAccount](
	[gid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
 CONSTRAINT [PK_GroupAccount] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupFeature]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFeature](
	[gid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_GroupFeature] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [nvarchar](255) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SalePrice] [float] NULL,
	[Quantity] [int] NULL,
	[Discount] [float] NULL,
	[Profit] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [nvarchar](255) NOT NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[ShipMode] [nvarchar](255) NULL,
	[CustomerID] [int] NULL,
	[OrderNote] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[UnitPrice] [int] NULL,
	[SubCategoryID] [int] NULL,
	[img] [nvarchar](255) NULL,
 CONSTRAINT [PK__Product__3214EC273F53592E] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRegion]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRegion](
	[pid] [int] NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_ProductRegion] PRIMARY KEY CLUSTERED 
(
	[pid] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 7/17/2022 8:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](255) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'admin1', N'789')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'user1', N'123')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'user2', N'456')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (1, N'Imported Meat')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (2, N'Seafood')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (3, N'Convenient Set Box')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (4, N'Drinks')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (5, N'Specialized Kitchenware')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (6, N'Sauces and Condiments')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [CustomerName], [Address], [Country], [City], [State], [PostalCode], [PhoneNumber]) VALUES (1, N'Le Van A', N'Hai Ba Trung Ha Noi', N'VietNam', N'Ha Noi', NULL, NULL, N'0923456789')
INSERT [dbo].[Customer] ([ID], [CustomerName], [Address], [Country], [City], [State], [PostalCode], [PhoneNumber]) VALUES (2, N'Nguyen Van B', N'So nha 20, Thu duc', N'VietNam', N'Ho Chi Minh', NULL, NULL, N'0981231234')
INSERT [dbo].[Customer] ([ID], [CustomerName], [Address], [Country], [City], [State], [PostalCode], [PhoneNumber]) VALUES (3, N'le Van B', N'Hai Ba Trieu', NULL, N'Ha Noi', NULL, NULL, N'0912345678')
INSERT [dbo].[Customer] ([ID], [CustomerName], [Address], [Country], [City], [State], [PostalCode], [PhoneNumber]) VALUES (18, N'Le Van V', N'ha noi', NULL, N'ha noi', NULL, NULL, N'0123456789')
INSERT [dbo].[Customer] ([ID], [CustomerName], [Address], [Country], [City], [State], [PostalCode], [PhoneNumber]) VALUES (25, N'a', N'ha noi', NULL, N'ha noi', NULL, NULL, N'0123456789')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Feature] ([fid], [url]) VALUES (1, N'/delete')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (2, N'/insert')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (3, N'/update')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (4, N'/viewcart')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (5, N'/admin')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (6, N'/order')
GO
INSERT [dbo].[Group] ([gid], [gname]) VALUES (1, N'admin')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (2, N'normal')
GO
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (1, N'admin1')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (2, N'admin1')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (2, N'user1')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (2, N'user2')
GO
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 1)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 2)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 3)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 5)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 4)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [SalePrice], [Quantity], [Discount], [Profit]) VALUES (N'1', 1, NULL, 2, NULL, NULL)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [SalePrice], [Quantity], [Discount], [Profit]) VALUES (N'1', 2, NULL, 3, NULL, NULL)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [SalePrice], [Quantity], [Discount], [Profit]) VALUES (N'2', 1, NULL, 3, NULL, NULL)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [SalePrice], [Quantity], [Discount], [Profit]) VALUES (N'3', 3, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [OrderDate], [ShipDate], [ShipMode], [CustomerID], [OrderNote]) VALUES (N'1', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [ShipDate], [ShipMode], [CustomerID], [OrderNote]) VALUES (N'2', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Orders] ([ID], [OrderDate], [ShipDate], [ShipMode], [CustomerID], [OrderNote]) VALUES (N'3', NULL, NULL, NULL, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (1, N'Thịt Bò Ba Chỉ Cao Cấp', 279000, 1, N'https://gofood.vn/upload/r/san-pham/bo-u-kho/striploin-butter/than-ngoai-u-bo-6.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (2, N'Thit Bap Hoa Bo My(loai cao cap)', 385000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/bap-bo-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (3, N'Thit Gau Bo My', 399000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/gau-bo-4.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (4, N'Thit loi nac vai My(Loai cao cap)', 425000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/loi-vai-4.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (5, N'Thit de suon bo My(Loai cao cap)', 1450000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/de-suon-black-angus-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (6, N'Suon non bo My rut suong', 1450000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/suon-non-rut-xuong-choice-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (7, N'Than lung Bo My', 1450000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/than-lung-prime-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (8, N'Thit Nac Vai Bo My(loai cao cap)', 359000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/nac-vai-bo-my-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (9, N'Thit nac vai bo My loai thuong hang', 495000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/nac-vai-bo-my-prime-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (10, N'Suon non bo My rut xuong', 1750000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/suon-non-rut-xuong-prime-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (11, N'Thit Than noi bo My(loai cao cap)', 1425000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/than-noi-3.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (12, N'Thit T Bone bo My(loai cao cap)', 825000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/t-bone-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (13, N'Thit than noi bo Kobe Nhat Ban', 14950000, 3, N'https://gofood.vn/upload/r/san-pham/thit-bo-nhat-ban/than-noi-kobe/than-noi-kobe-4.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (14, N'Thit than lung bo Kobo Nhat Ban', 13449000, 3, N'https://gofood.vn/upload/r/san-pham/thit-bo-nhat-ban/than-lung-kobe/than-lung-kobe-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (15, N'Thit than ngoai bo Kobe Nhat Ban A5', 13680000, 3, N'https://gofood.vn/upload/r/san-pham/thit-bo-nhat-ban/than-ngoai-kobe/than-ngoai-kobe-6.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (16, N'Thit suon rut xuong Kobe Nhat Ban', 6799000, 3, N'https://gofood.vn/upload/r/san-pham/thit-bo-nhat-ban/suon-rut-xuong-kobe/suon-rut-xuong-kobe-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (17, N'Thit than noi bo Waguy Nhat Ban', 8950000, 3, N'https://gofood.vn/upload/r/san-pham/thit-bo-nhat-ban/than-noi-wagyu/than-noi-wagyu-7.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (19, N'Thit than ngoai bo Wagyu Nhat Ban A5', 6850000, 3, N'https://gofood.vn/upload/r/san-pham/thit-bo-nhat-ban/than-ngoai-wagyu/than-ngoai-wagyu-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (20, N'Thit rut xuong Wagyu Nhat Ban', 4599000, 3, N'https://gofood.vn/upload/r/san-pham/thit-bo-nhat-ban/suon-rut-xuong-wagyu/suon-rut-xuong-wagyu-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (21, N'Ca Saba Fillet - pack 4 mieng fillet', 154000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/saba-fillet-4-mieng-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (22, N'Ca Saba nuong sot Teriyaki', 59000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/saba-teriyaki-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (23, N'Tom the boc non Gofood', 229500, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/tom-non-gofood-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (24, N'Tom the tuoi Nobashi', 229000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/tom-nobashi-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (25, N'Ca Saba nuong muoi', 49000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/saba-nuong-muoi-1_1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (26, N'Ca Saba Fillet - pack 2 mieng fillet', 94000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/saba-fillet-2-mieng-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (27, N'Muc la tuoi Con Dao 1 kg', 565000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/muc-la-tuoi/muc-la-1kg-4.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (28, N'Muc la tuoi Con Dao 500 gram', 295000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/muc-la-tuoi/muc-la-500g-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (29, N'Muc ong mot nang Con Dao loai A 1 kg', 645000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/muc-ong-1-nang/muc-ong-1-nang-1kg-4.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (30, N'Muc ong mot nang Con Dao loai A 500 gram', 335000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/muc-ong-1-nang/muc-ong-1-nang-500g-4.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (31, N'Muc la mot nang Con Dao loai A 1 kg', 645000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/muc-la-1-nang/muc-la-1-nang-1kg-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (32, N'Bach tuoc baby - Ocean Gems Baby Octopus', 299000, 10, N'https://gofood.vn/upload/r/san-pham/hai-san-viet-nam/bach-tuoc-baby-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (33, N'Ca hoi Na Uy Fillet tuoi- Fresh Salmon Fillet', 725000, 6, N'https://gofood.vn/upload/r/san-pham/Ca-hoi-Nauy/fillet/ca-hoi-nauy-fillet-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (34, N'Ca hoi tuoi Na Uy nguyen con- Salmon Fresh', 495000, 6, N'https://gofood.vn/upload/r/san-pham/Ca-hoi-Nauy/nguyen-con/ca-hoi-global-gap-nguyen-con-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (35, N'Ruoc ca hoi Nauy 70g GOFOOD', 95000, 6, N'https://gofood.vn/upload/r/san-pham/Ca-hoi-Nauy/ruoc-ca-hoi/ruoc-ca-hoi-70g-4.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (36, N'Ca hoi xong khoi Leroy Fossen Nauy 200 gram - Smoked Salmon', 325000, 6, N'https://gofood.vn/upload/r/san-pham/Ca-hoi-Nauy/ca-hoi-xong-khoi/ca-hoi-xong-khoi-fossen-200gr-4.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (37, N'Ca hoi xong khoi Leroy Fossen Nauy 1 kg - Smoked Salmon', 1450000, 6, N'https://gofood.vn/upload/r/san-pham/Ca-hoi-Nauy/ca-hoi-xong-khoi/ca-hoi-xong-khoi-fossen-1kg-6.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (38, N'Ca hoi Na Uy xong khoi Amigo goi 100 gram - Smoked Salmon', 109000, 6, N'https://gofood.vn/upload/r/san-pham/Ca-hoi-Nauy/ca-hoi-xong-khoi/ca-hoi-xong-khoi-amigo-3_1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (39, N'Xuong ca hoi tuoi Na Uy- Fresh Salmon''s Bones', 34000, 6, N'https://gofood.vn/upload/r/san-pham/Ca-hoi-Nauy/xuong-ca-hoi/xuong-ca-hoi-nauy-gofood-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (40, N'Dau ca hoi tuoi Na Uy- Fresh Salmon''s Head', 54000, 6, N'https://gofood.vn/upload/r/san-pham/Ca-hoi-Nauy/dau-ca-hoi/dau-ca-hoi-nauy-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (41, N'Thit ba roi heo Iberico Legado Belly', 325000, 5, N'https://gofood.vn/upload/r/san-pham/thit-heo-iberico/ba-roi-heo-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (42, N'Thit ba roi heo Iberico Legado Belly', 325000, 1, N'https://gofood.vn/upload/r/san-pham/thit-heo-iberico/ba-roi-heo-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (44, N'Thit ba chi bo My loai cao cap Short Plate Beef Choice USDA', 279000, 1, N'https://gofood.vn/upload/r/ba-chi-2.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (45, N'Suon non bo My rut xuong loai thuong hang Short Rib Boneless USDA Prime', 1750000, 1, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/suon-non-rut-xuong-prime-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (46, N'Suon non bo My rut xuong loai thuong hang Short Rib Boneless USDA Prime', 1750000, 2, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/suon-non-rut-xuong-prime-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (47, N'Suon non bo My rut xuong loai thuong hang Short Rib Boneless USDA Prime', 1750000, 2, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/suon-non-rut-xuong-prime-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (50, N'Suon non bo My rut xuong loai thuong hang Short Rib Boneless USDA Prime', 325000, 2, N'https://gofood.vn/upload/r/san-pham/Thit-bo-My/thit-bo-my-moi/suon-non-rut-xuong-prime-1.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (53, N'Suon non bo My rut xuong loai thuong hang Short Rib Boneless USDA Prime', 325000, 2, N'https://gofood.vn/upload/r/san-pham/thit-heo-iberico/ba-roi-heo-5.jpg')
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [SubCategoryID], [img]) VALUES (54, N'Thit ba roi heo Iberico Legado Belly X', 100, 1, N'https://gofood.vn/upload/r/san-pham/thit-heo-iberico/ba-roi-heo-5.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (1, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (1, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (2, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (3, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (4, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (5, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (5, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (6, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (6, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (7, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (7, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (8, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (8, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (9, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (9, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (10, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (10, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (11, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (11, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (12, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (12, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (13, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (13, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (14, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (14, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (15, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (15, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (16, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (16, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (17, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (17, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (19, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (19, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (20, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (20, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (21, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (21, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (22, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (22, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (23, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (23, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (24, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (24, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (25, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (25, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (26, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (26, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (27, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (27, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (28, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (28, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (29, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (29, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (30, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (30, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (31, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (31, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (32, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (32, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (33, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (33, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (34, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (34, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (35, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (35, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (36, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (36, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (37, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (37, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (38, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (38, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (39, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (39, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (40, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (40, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (42, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (44, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (45, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (46, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (46, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (50, 2)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (53, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (54, 1)
INSERT [dbo].[ProductRegion] ([pid], [rid]) VALUES (54, 2)
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([rid], [name]) VALUES (1, N'Ha Noi')
INSERT [dbo].[Region] ([rid], [name]) VALUES (2, N'Ho Chi Minh')
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (1, N'Thit Bo My', 1)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (2, N'Thit Bo Uc', 1)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (3, N'Thit Bo Nhat Ban', 1)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (4, N'Thit Cuu Uc', 1)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (5, N'Thit Heo Iberico', 1)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (6, N'Ca Hoi Na Uy', 2)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (7, N'Ca Hoi Huy Co Na Uy', 2)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (8, N'Hai san Nhat Ban', 2)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (9, N'Hai san Chay Au', 2)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (10, N'Hai San Viet Nam', 2)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (11, N'Sashimi Box', 3)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (12, N'SetBox Lau', 3)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (13, N'SetBox Nuong', 3)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (14, N'Set Steak', 3)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (15, N'Ruou Vang', 4)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (16, N'Ruou Sake', 4)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (17, N'Ruou Soji', 4)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (18, N'Chao Gang Lodge', 5)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (19, N'Noi Gang Lodge', 5)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (20, N'Khay Nuong Lodge', 5)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (21, N'Thot Go Teak', 5)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (22, N'Thot tre khang khuan', 5)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (23, N'Chao Thep Carbon', 5)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (24, N'Gia Vi Han Quoc', 6)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (25, N'Gia Vi Nhat Ban', 6)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (26, N'Gia Vi Thai', 6)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (27, N'Gia Vi My', 6)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (28, N'Gia Vi Chau Au', 6)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (29, N'Gia Vi Viet', 6)
INSERT [dbo].[SubCategory] ([ID], [SubCategoryName], [CategoryID]) VALUES (30, N'Gia Vi Phap', 6)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
ALTER TABLE [dbo].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Account]
GO
ALTER TABLE [dbo].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Group]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Feature]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Group1] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Group1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__2F10007B] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Produ__2F10007B]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__SubCate__30F848ED] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__SubCate__30F848ED]
GO
ALTER TABLE [dbo].[ProductRegion]  WITH CHECK ADD  CONSTRAINT [FK_ProductRegion_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductRegion] CHECK CONSTRAINT [FK_ProductRegion_Product]
GO
ALTER TABLE [dbo].[ProductRegion]  WITH CHECK ADD  CONSTRAINT [FK_ProductRegion_Region] FOREIGN KEY([rid])
REFERENCES [dbo].[Region] ([rid])
GO
ALTER TABLE [dbo].[ProductRegion] CHECK CONSTRAINT [FK_ProductRegion_Region]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
USE [master]
GO
ALTER DATABASE [ProjectPRN] SET  READ_WRITE 
GO
