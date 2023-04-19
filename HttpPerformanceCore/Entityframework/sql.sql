﻿USE [master]
GO
/****** Object:  Database [HttpPerformance]    Script Date: 2023. 04. 19. 14:52:25 ******/
CREATE DATABASE [HttpPerformance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HttpPerformance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HttpPerformance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HttpPerformance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HttpPerformance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HttpPerformance] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HttpPerformance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HttpPerformance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HttpPerformance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HttpPerformance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HttpPerformance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HttpPerformance] SET ARITHABORT OFF 
GO
ALTER DATABASE [HttpPerformance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HttpPerformance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HttpPerformance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HttpPerformance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HttpPerformance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HttpPerformance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HttpPerformance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HttpPerformance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HttpPerformance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HttpPerformance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HttpPerformance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HttpPerformance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HttpPerformance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HttpPerformance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HttpPerformance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HttpPerformance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HttpPerformance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HttpPerformance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HttpPerformance] SET  MULTI_USER 
GO
ALTER DATABASE [HttpPerformance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HttpPerformance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HttpPerformance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HttpPerformance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HttpPerformance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HttpPerformance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HttpPerformance] SET QUERY_STORE = OFF
GO
USE [HttpPerformance]
GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 2023. 04. 19. 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Key] [nchar](30) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Configurations] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responses]    Script Date: 2023. 04. 19. 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responses](
	[ID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ResponseTime] [int] NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Responses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [HttpPerformance] SET  READ_WRITE 
GO