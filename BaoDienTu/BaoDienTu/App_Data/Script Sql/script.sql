USE [BaoDienTu]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  Table [dbo].[Article]    Script Date: 10/17/2019 2:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[IDArticle] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[IDChannel] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Content] [nvarchar](1000) NULL,
	[Author] [varchar](20) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[IDArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Channel]    Script Date: 10/17/2019 2:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channel](
	[IDChannel] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[Count] [int] NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[IDChannel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  StoredProcedure [dbo].[SP_Account_Login]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Article_Insert]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Article_ListAll]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Article_Update]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Channel_Delete]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Channel_Find_By_ID]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Channel_Insert]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Channel_ListAll]    Script Date: 10/17/2019 2:40:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Channel_Update]    Script Date: 10/17/2019 2:40:10 PM ******/
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
