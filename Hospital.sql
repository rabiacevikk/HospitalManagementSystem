USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 27.02.2021 14:33:53 ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital', N'ON'
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[AddPatient]    Script Date: 27.02.2021 14:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddPatient](
	[Name] [varchar](150) NOT NULL,
	[Full_Address] [varchar](300) NOT NULL,
	[Contact] [bigint] NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Blood_Group] [varchar](20) NOT NULL,
	[Major_Disease] [varchar](400) NOT NULL,
	[pid] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientMore]    Script Date: 27.02.2021 14:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientMore](
	[pid] [bigint] NOT NULL,
	[Symptoms] [varchar](150) NOT NULL,
	[Diagnosis] [varchar](100) NOT NULL,
	[Medicines] [varchar](150) NOT NULL,
	[Ward] [varchar](15) NOT NULL,
	[Ward_Type] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[AddPatient] ([Name], [Full_Address], [Contact], [Age], [Gender], [Blood_Group], [Major_Disease], [pid]) VALUES (N'Rabia Çevik', N'Istanbul/Turkey', 905317260234, 20, N'Female', N'B+', N'Yes', 7)
INSERT [dbo].[AddPatient] ([Name], [Full_Address], [Contact], [Age], [Gender], [Blood_Group], [Major_Disease], [pid]) VALUES (N'Meryem Çevik', N'Istanbul/Turkey', 905346578908, 15, N'Female', N'B-', N'Yes', 2)
INSERT [dbo].[AddPatient] ([Name], [Full_Address], [Contact], [Age], [Gender], [Blood_Group], [Major_Disease], [pid]) VALUES (N'Sezen Kahraman', N'Ankara/Turkey', 905433789090, 23, N'Female', N'A+', N'Yes', 6)
INSERT [dbo].[AddPatient] ([Name], [Full_Address], [Contact], [Age], [Gender], [Blood_Group], [Major_Disease], [pid]) VALUES (N'Ahmet Kurt', N'Eskişehir/Turkey', 905312345436, 21, N'Male', N'0-', N'No', 4)
INSERT [dbo].[AddPatient] ([Name], [Full_Address], [Contact], [Age], [Gender], [Blood_Group], [Major_Disease], [pid]) VALUES (N'Celal Can', N'Basakehir/İstanbul', 905312343232, 23, N'Male', N'B-', N'No', 5)
GO
INSERT [dbo].[PatientMore] ([pid], [Symptoms], [Diagnosis], [Medicines], [Ward], [Ward_Type]) VALUES (7, N'fever', N'normal bp 120/80', N'decold total', N'No', N'None')
INSERT [dbo].[PatientMore] ([pid], [Symptoms], [Diagnosis], [Medicines], [Ward], [Ward_Type]) VALUES (2, N'fever ', N'grip', N'parol', N'No', N'None')
INSERT [dbo].[PatientMore] ([pid], [Symptoms], [Diagnosis], [Medicines], [Ward], [Ward_Type]) VALUES (6, N'vomitting', N'stomachache', N'Majezik', N'No', N'None')
INSERT [dbo].[PatientMore] ([pid], [Symptoms], [Diagnosis], [Medicines], [Ward], [Ward_Type]) VALUES (4, N'vertigo', N'blood pressure', N'Ramipril', N'Yes', N'Non-Ac')
INSERT [dbo].[PatientMore] ([pid], [Symptoms], [Diagnosis], [Medicines], [Ward], [Ward_Type]) VALUES (5, N'numbness of the hand', N'Corona', N'Favicovir', N'No', N'None')
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
