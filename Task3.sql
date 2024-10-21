USE [master]
GO
/****** Object:  Database [task3]    Script Date: 21/10/2024 3:28:25 PM ******/
CREATE DATABASE [task3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'task3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\task3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'task3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\task3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [task3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [task3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [task3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [task3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [task3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [task3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [task3] SET ARITHABORT OFF 
GO
ALTER DATABASE [task3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [task3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [task3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [task3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [task3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [task3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [task3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [task3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [task3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [task3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [task3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [task3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [task3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [task3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [task3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [task3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [task3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [task3] SET RECOVERY FULL 
GO
ALTER DATABASE [task3] SET  MULTI_USER 
GO
ALTER DATABASE [task3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [task3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [task3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [task3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [task3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [task3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'task3', N'ON'
GO
ALTER DATABASE [task3] SET QUERY_STORE = ON
GO
ALTER DATABASE [task3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [task3]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 21/10/2024 3:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NULL,
	[ReceiverID] [int] NULL,
	[MessageText] [text] NULL,
	[SentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 21/10/2024 3:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ServiceID] [int] NULL,
	[PaymentAmount] [decimal](10, 2) NULL,
	[PaymentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 21/10/2024 3:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](100) NULL,
	[ServiceDescription] [text] NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21/10/2024 3:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Password] [varchar](50) NULL,
	[ProfilePicture] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserServices]    Script Date: 21/10/2024 3:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserServices](
	[UserServiceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ServiceID] [int] NULL,
	[PurchaseDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([SenderID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserServices]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[UserServices]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [task3] SET  READ_WRITE 
GO
