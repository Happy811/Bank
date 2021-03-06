USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 7/09/2020 12:50:16 pm ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY FULL 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bank', N'ON'
GO
ALTER DATABASE [Bank] SET QUERY_STORE = OFF
GO
USE [Bank]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/09/2020 12:50:16 pm ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 7/09/2020 12:50:16 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [nvarchar](max) NULL,
	[Balance] [float] NOT NULL,
	[AccountTypeId] [int] NOT NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 7/09/2020 12:50:16 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[AccountTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeAccount] [nvarchar](max) NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[AccountTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankLocation]    Script Date: 7/09/2020 12:50:16 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankLocation](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_BankLocation] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillingAccount]    Script Date: 7/09/2020 12:50:16 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingAccount](
	[BillingId] [int] IDENTITY(1,1) NOT NULL,
	[BillAmount] [float] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[BillDate] [datetime2](7) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_BillingAccount] PRIMARY KEY CLUSTERED 
(
	[BillingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/09/2020 12:50:16 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Contact] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200903060753_initial', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [AccountTypeId], [CustomerId]) VALUES (1, N'01-45673785-00', 10000, 1, NULL)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [AccountTypeId], [CustomerId]) VALUES (2, N'01-12345678-00', 20000, 2, NULL)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [AccountTypeId], [CustomerId]) VALUES (3, N'01-45678903-00', 30000, 3, NULL)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [AccountTypeId], [CustomerId]) VALUES (4, N'01-5362674872-00', 50000, 4, NULL)
INSERT [dbo].[Account] ([AccountId], [AccountNumber], [Balance], [AccountTypeId], [CustomerId]) VALUES (5, N'01-34567889-00', 100000, 5, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([AccountTypeId], [TypeAccount]) VALUES (1, N'Saving Account')
INSERT [dbo].[AccountType] ([AccountTypeId], [TypeAccount]) VALUES (2, N'Deposite A/c')
INSERT [dbo].[AccountType] ([AccountTypeId], [TypeAccount]) VALUES (3, N'Fixed Deposite a/c')
INSERT [dbo].[AccountType] ([AccountTypeId], [TypeAccount]) VALUES (4, N'Current a/c')
INSERT [dbo].[AccountType] ([AccountTypeId], [TypeAccount]) VALUES (5, N'Saving Account')
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[BankLocation] ON 

INSERT [dbo].[BankLocation] ([BranchId], [Address]) VALUES (1, N'Hamilton, NZ')
INSERT [dbo].[BankLocation] ([BranchId], [Address]) VALUES (2, N'Tauranga, NZ')
INSERT [dbo].[BankLocation] ([BranchId], [Address]) VALUES (3, N'Auckland, NZ')
INSERT [dbo].[BankLocation] ([BranchId], [Address]) VALUES (4, N'Wellington, NZ')
INSERT [dbo].[BankLocation] ([BranchId], [Address]) VALUES (5, N'Christchurch, NZ')
SET IDENTITY_INSERT [dbo].[BankLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[BillingAccount] ON 

INSERT [dbo].[BillingAccount] ([BillingId], [BillAmount], [Comment], [BillDate], [CustomerId], [AccountId]) VALUES (1, 5000, N'Financial Support', CAST(N'2020-09-03T12:32:00.0000000' AS DateTime2), 2, 1)
INSERT [dbo].[BillingAccount] ([BillingId], [BillAmount], [Comment], [BillDate], [CustomerId], [AccountId]) VALUES (2, 2000, N'Financial Support', CAST(N'2020-09-01T12:38:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[BillingAccount] ([BillingId], [BillAmount], [Comment], [BillDate], [CustomerId], [AccountId]) VALUES (3, 1000, N'Financial Support', CAST(N'2020-09-02T12:42:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[BillingAccount] ([BillingId], [BillAmount], [Comment], [BillDate], [CustomerId], [AccountId]) VALUES (4, 7000, N'Financial Support', CAST(N'2020-08-31T12:44:00.0000000' AS DateTime2), 4, 4)
INSERT [dbo].[BillingAccount] ([BillingId], [BillAmount], [Comment], [BillDate], [CustomerId], [AccountId]) VALUES (5, 10000, N'Financial Support', CAST(N'2020-09-04T12:46:00.0000000' AS DateTime2), 5, 5)
SET IDENTITY_INSERT [dbo].[BillingAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Name], [Contact]) VALUES (2, N'Harpreet Kaur', N'0223999747')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Contact]) VALUES (3, N'Navpreet Kaur', N'02264763876')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Contact]) VALUES (4, N'Sumanpreet kaur', N'1243456678')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Contact]) VALUES (5, N'Navdeep Singh', N'1234556276')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Contact]) VALUES (6, N'Arshdeep', N'4567865767')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
/****** Object:  Index [IX_Account_AccountTypeId]    Script Date: 7/09/2020 12:50:16 pm ******/
CREATE NONCLUSTERED INDEX [IX_Account_AccountTypeId] ON [dbo].[Account]
(
	[AccountTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Account_CustomerId]    Script Date: 7/09/2020 12:50:16 pm ******/
CREATE NONCLUSTERED INDEX [IX_Account_CustomerId] ON [dbo].[Account]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillingAccount_AccountId]    Script Date: 7/09/2020 12:50:16 pm ******/
CREATE NONCLUSTERED INDEX [IX_BillingAccount_AccountId] ON [dbo].[BillingAccount]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillingAccount_CustomerId]    Script Date: 7/09/2020 12:50:16 pm ******/
CREATE NONCLUSTERED INDEX [IX_BillingAccount_CustomerId] ON [dbo].[BillingAccount]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType_AccountTypeId] FOREIGN KEY([AccountTypeId])
REFERENCES [dbo].[AccountType] ([AccountTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountType_AccountTypeId]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer_CustomerId]
GO
ALTER TABLE [dbo].[BillingAccount]  WITH CHECK ADD  CONSTRAINT [FK_BillingAccount_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillingAccount] CHECK CONSTRAINT [FK_BillingAccount_Account_AccountId]
GO
ALTER TABLE [dbo].[BillingAccount]  WITH CHECK ADD  CONSTRAINT [FK_BillingAccount_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillingAccount] CHECK CONSTRAINT [FK_BillingAccount_Customer_CustomerId]
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
