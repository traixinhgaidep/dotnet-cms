USE [master]
GO
/****** Object:  Database [BaoDienTu]    Script Date: 10/21/2019 5:31:26 PM ******/
CREATE DATABASE [BaoDienTu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaoDienTu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaoDienTu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaoDienTu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaoDienTu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BaoDienTu] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaoDienTu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaoDienTu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaoDienTu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaoDienTu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaoDienTu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaoDienTu] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaoDienTu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaoDienTu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaoDienTu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaoDienTu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaoDienTu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaoDienTu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaoDienTu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaoDienTu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaoDienTu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaoDienTu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BaoDienTu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaoDienTu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaoDienTu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaoDienTu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaoDienTu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaoDienTu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaoDienTu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaoDienTu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaoDienTu] SET  MULTI_USER 
GO
ALTER DATABASE [BaoDienTu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaoDienTu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaoDienTu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaoDienTu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BaoDienTu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaoDienTu] SET QUERY_STORE = OFF
GO
USE [BaoDienTu]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Email] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[IDArticle] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[IDChannel] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Summary] [nvarchar](500) NULL,
	[Content] [nvarchar](1000) NULL,
	[Author] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Link] [varchar](50) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[IDArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Channel]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channel](
	[IDChannel] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[Summary] [nvarchar](500) NULL,
	[Count] [int] NULL,
	[Link] [varchar](50) NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[IDChannel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Email], [Password]) VALUES (N'dotrami78@gmail.com', N'81dc9bdb52d04dc20036dbd8313ed055')
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date], [Link]) VALUES (1, N'Viet Nam gianh chien thang 3-1 truoc Indonesia', 2, N'Image1', N'VN chien thang', N'VN chien thang', N'TM', CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'/Article/1')
INSERT [dbo].[Article] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date], [Link]) VALUES (2, N'Thu tuong yeu cau dieu tra nguyen nhan o nhiem song Da', 1, N'Image2', N'Nguyen nhan o nhiem song Da', N'Nguyen nhan o nhiem song Da', N'NA', CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'/Article/2')
INSERT [dbo].[Article] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date], [Link]) VALUES (3, N'8 mon an Viet duoc gioi thieu tai Phap', 9, N'Image3', N'Các món ăn Việt xuất hiện trong lễ hội ẩm thực nước Pháp', N'Các món ăn Việt xuất hiện trong lễ hội ẩm thực nước Pháp', N'TM', CAST(N'2019-10-16T14:53:05.033' AS DateTime), N'/Article/3')
INSERT [dbo].[Article] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date], [Link]) VALUES (4, N'Học sinh THCS chế tạo hệ thống quản lý rác thông minh', 4, N'Image4', N'Nhóm học sinh trường Phổ thông song ngữ Liên cấp Wellspring (Hà Nội) chế tạo hệ thống quản lý rác thông minh với robot thu gom, máy phân loại rác.', N'Nhóm học sinh trường Phổ thông song ngữ Liên cấp Wellspring (Hà Nội) chế tạo hệ thống quản lý rác thông minh với robot thu gom, máy phân loại rác.', N'Thanh H?ng', CAST(N'2019-10-18T00:00:00.000' AS DateTime), N'/Article/4')
INSERT [dbo].[Article] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date], [Link]) VALUES (5, N'Tin moi 1', 1, N'Image5', N'Mo ta ngan tin moi 1', N'Tin moi 1', N'TM', CAST(N'2019-10-21T00:00:00.000' AS DateTime), N'/Article/5')
INSERT [dbo].[Article] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date], [Link]) VALUES (6, N'Tin moi 2', 8, N'Image6', N'Mo ta ngan tin moi 2', N'Tin moi 2', N'TM', CAST(N'2019-10-21T00:00:00.000' AS DateTime), N'/Article/6')
INSERT [dbo].[Article] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date], [Link]) VALUES (9, N'Tin moi 3', 8, N'Image7', N'Mo ta ngan tin moi 3', N'Tin moi 3', N'TM', CAST(N'2019-10-21T00:00:00.000' AS DateTime), N'/Article/9')
INSERT [dbo].[Article] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date], [Link]) VALUES (10, N'Tin moi 4', 3, N'Image8', N'Mo ta ngan tin moi 4', N'Tin moi 4', N'NA', CAST(N'2019-10-21T14:08:00.067' AS DateTime), N'/Article/10')
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Channel] ON 

INSERT [dbo].[Channel] ([IDChannel], [Name], [Summary], [Count], [Link]) VALUES (1, N'Thoi su', NULL, 20, NULL)
INSERT [dbo].[Channel] ([IDChannel], [Name], [Summary], [Count], [Link]) VALUES (2, N'The thao', NULL, 15, NULL)
INSERT [dbo].[Channel] ([IDChannel], [Name], [Summary], [Count], [Link]) VALUES (3, N'Giai tri', NULL, 555, NULL)
INSERT [dbo].[Channel] ([IDChannel], [Name], [Summary], [Count], [Link]) VALUES (4, N'Khoa hoc', NULL, 15, NULL)
INSERT [dbo].[Channel] ([IDChannel], [Name], [Summary], [Count], [Link]) VALUES (8, N'Thoi trang', NULL, 1, NULL)
INSERT [dbo].[Channel] ([IDChannel], [Name], [Summary], [Count], [Link]) VALUES (9, N'Giao duc', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Channel] OFF
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  StoredProcedure [dbo].[SP_Account_Login]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Account_Login] 
	@Email nvarchar(50),
	@Password varchar(50)
AS
BEGIN
	declare @count int
	declare @res bit
	select @count = count(*) from Account where Email = @Email and Password = @Password
	if @count > 0
	set @res = 1
	else
	set @res = 0
	select @res
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Article_Insert]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Article_Insert] 
@Title nvarchar(200),
@IDChannel int,
@Image nvarchar(100),
@Content nvarchar(1000),
@Author varchar(20)
AS
BEGIN
	Insert into Article (Title,IDChannel,Image,Content,Author,Date)
	values (@Title,@IDChannel,@Image,@Content,@Author,getdate())
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Article_ListAll]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Article_ListAll]

AS
BEGIN
	
	SELECT * from Article order by Date asc
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Article_Update]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Article_Update]
@IDArticle int,
@Title nvarchar(200),
@IDChannel int,
@Image nvarchar(100),
@Content nvarchar(1000),
@Author varchar(20)
AS
BEGIN
	Update Article set Title=@Title,IDChannel=@IDChannel, Image=@Image, Content=@Content,@Author=@Author
	where IDArticle = @IDArticle
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Channel_Delete]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Channel_Delete]
@IDChannel int
AS
BEGIN
	Delete from Channel where IDChannel = @IDChannel 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Channel_Find_By_ID]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Channel_Find_By_ID]
@IDChannel int
AS
BEGIN
	SELECT * From Channel where IDChannel = @IDChannel
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Channel_Insert]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Channel_Insert]
    @Name nvarchar(15),
	@Count int
AS
BEGIN
	insert into Channel (Name,Count) values (@Name,@Count)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Channel_ListAll]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Channel_ListAll]
AS
BEGIN
	SELECT * From Channel
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Channel_Update]    Script Date: 10/21/2019 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Channel_Update]
	@IDChannel int,
	@Name nvarchar(15),
	@Count int
AS
BEGIN
	Update Channel set Name=@Name,Count=@Count where IDChannel=@IDChannel
END
GO
USE [master]
GO
ALTER DATABASE [BaoDienTu] SET  READ_WRITE 
GO
