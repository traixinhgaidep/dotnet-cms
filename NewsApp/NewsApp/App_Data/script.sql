USE [master]
GO
/****** Object:  Database [NewsDB]    Script Date: 11/5/2019 3:57:33 PM ******/
CREATE DATABASE [NewsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NewsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NewsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NewsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NewsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NewsDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NewsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NewsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NewsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NewsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NewsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NewsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NewsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NewsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NewsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NewsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NewsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NewsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NewsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NewsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NewsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NewsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NewsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NewsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NewsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NewsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NewsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NewsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NewsDB] SET  MULTI_USER 
GO
ALTER DATABASE [NewsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NewsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NewsDB] SET QUERY_STORE = OFF
GO
USE [NewsDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/5/2019 3:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 11/5/2019 3:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[IDArticle] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[IDChannel] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Summary] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[Author] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[IDArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/5/2019 3:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/5/2019 3:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/5/2019 3:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/5/2019 3:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/5/2019 3:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[Image] [varchar](50) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[UserRole] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Channels]    Script Date: 11/5/2019 3:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channels](
	[IDChannel] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[Image] [varchar](50) NULL,
	[Summary] [nvarchar](500) NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[IDChannel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201910231010260_InitialCreate', N'NewsApp.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3F40FF83A0A7D383D4CAA5BBD813D85BA44E724ED0CD05EBECE2BC2D68897684952855A2B2098AFEB23EF427F52F9CA144C9E24D175BB19DA240118BC36F86C32167381CEE5F7FFC39FEE9290CAC479CA47E4426F6D1E8D0B6307123CF27CB899DD1C50FEFEC9FDE7FF78FF185173E599F4BBA1346073D493AB11F288D4F1D27751F7088D251E8BB4994460B3A72A3D0415EE41C1F1EFEDB393A723040D8806559E38F19A17E88F31FF0731A1117C73443C175E4E120E5DFA16596A35A3728C4698C5C3CB16FF0B7F42C8E4705A56D9D053E0229663858D8162224A288828CA79F523CA3494496B3183EA0E0FE39C640B740418AB9ECA72BF2AEC3383C66C370561D4B28374B6914F6043C3AE17A71E4EE6B69D7AEF4069ABB000DD36736EA5C7B13FBCAC3F9A78F51000A90199E4E8384114FECEB8AC5591ADF603A2A3B8E0AC8CB04E0BE45C9D7511DF1C0EADCEFA0B2A3E3D121FBEFC09A6601CD123C2138A3090A0EACBB6C1EF8EE2FF8F93EFA8AC9E4E468BE3879F7E62DF24EDEFE884FDED4470A63053AE1037CBA4BA21827201B5E54E3B72D47ECE7C81DAB6EB53E8556C0966049D8D6357AFA80C9923EC062397E675B97FE13F6CA2FDCB83E111F561074A249063F6FB22040F30057ED4E234FF6FF06AEC76FDE0EC2F5063DFACB7CEA25FEB0701258571F7190B7A60F7E5C2C2F61BEBF70B2CB240AD96FD1BE8AD62FB3284B5C3698C848728F9225A6A274636765BC9D4C9A410D6FD625EAFE9B369354356F2D291BD03A2BA164B1EDD550CAFBB27C3B5B1C781E98BCDCB498469A0C4E745423A9E781C5DB572673D4D564080CE5EFBC035E84C80F06D8023B7081C863E12721AE46F973040687486F99EF509AC20EE0FD17A50F0DA2C39F03883EC36E968061CE280AE317E776F710117C93857366EFDBE335D8D4DC7F8B2E914BA3E482B05E1BE37D88DCAF51462F88778E28FE44DD1290FDBCF7C3EE00838873E6BA384D2FC198B1378D20B02E01AF083D39EE0DC736A75D8720D300F9A13E0691B6D12F25E92A0ED15328B188814C178F3489FA215AFAA49BA825A959D482A255544ED6575406D64D524E691634276895B3A01A2CC2CB6768F8102F87DDFF186F33E76DDA0B6A6A9CC10E89FF83094E601BF3EE10A53821AB19E8B26FEC2258C8A78F317D71DF9473FA8C826C68566BAD867C13187E35E4B0FBBF1A7231E1F3A3EFB1A8A4C3C1A72406F84EF4FA3355FB9A9324DBF6721086B96DE6DBD9034CCBE52C4D23D7CF578126E5C51316A2FC10C359EDD98B6234720604060686EE3397075F606CB66C54B7E41C079862EBCC2D52825394BAC853D50803F27A08567A548D60AB4C8828DCBF149E60E938619D103B04A5B0527D42D565E113D78F51D0AA25A9674717C6C65EF1905BCE718C0963D8AA892ECCF5890F2640C5479A94360D8D9D9AC5351BA2216A35CD795B08BB9A77251FB1159B6C899D0D76C9E3B71731CC668D6DC1389B55D2450063126F1706CACF2A5D0D403EB8EC9B814A27268381F2906A2B062A6A6C07062AAAE4D519687144ED3AFFD27975DFCC533C286FDFAD37AA6B07B629E863CF4CB3883DA10F851E3851CDF37CCE1AF113D51CCE404E7E3E4B79A82B9B08039F612AA66C56F1AE360E759A4164236A025C195A0B28BFFE53809405D543B83297D7281D8F227AC09679B74658BEF74BB0351B50B1EBD7A03542F365A96C9C9D4E1FD5C82A6B508CBCD361A186A3310879F31207DE4129A6BCACAA982EB1709F68B836303E190D0A6A895C0D4A2A0733B8964AD36CD7922E20EB13926DA425297C3268A91CCCE05AE236DAAE244D50D0232CD84845A20B1F68B195998ECADB546D63A7A88CE21FC68EA1846A7C8DE2D827CB5A4915FF62CD8A7AAAE90FB3FEC5466181E1B8A9A6E6A892B6E244A3042DB1D40AAC41D24B3F49E939A2688E589E67EA850A99D6B71AB6FF9265DD7DAA9358FA81929AFDCD8B6FC44B7BC1CFAA8108EF7F09A30B593493A7D03573AFEF6EB1F23614A04493B59F46411612737065EE5DDCDDD5FB175F5484B123C9AF044F8AA6941057547BA7495117C4001354C52DEB4F9219C2A4EA32EAAC2BDB14899A51CAC4541DC594ACDAD9A4990298CE1325C785FDE7A915E165D6132F46A903F04F3D316AF50C0A58ADAD3BAA587252C7145BBA234A75257548A9A98794F5EA1141C87AC35A78068DEA29BA7350EB45EAE86A6B77644DE5481D5AD3BC06B64666B9AD3BAAA6B8A40EAC69EE8EBDAA349137D03DF658C6D3CA5A2EAB38CC6EE6B30C182FB31B0EE3F26A77F675A0DAE79E58FC565E01E3DFF7D2928C27BAB52CA9C85F6C6649060CF38E23DC748B1B4EE3F5BC1953B8BE1636F5A6EB7B335E3F7B7D51AB500E733249C5BD3AD44987B7313F48B53F92514E5605896D956A0487FE9C521C8E18C168F66B300D7CCCB6EF92E01A117F81535A946CD8C78747C7D25B9BFD79F7E2A4A917680EA2A6C72FE29C6DA1FA8A3CA2C47D40895A0BB1C1DB9015A89266BE221E7E9AD8BFE5BD4EF38C05FB2BFF7C605DA59F88FF6B060DF74986ADDFD5DACE616AE53BBCCEA804FDFD553C7BE8AEF2ABFF7D29BA1E58B7092CA753EB5052F43AD32F3E86E8254DD1750369D67E22F17A579BF00E418B2AAD96F59F1DCC7D3AC8938352CA7F86E8E9FBBEA2699F156C84A8793A3014DE202A343D0D5807CBF82CC0839F347F16D06FB0FA6702EB88667C22E093FE60F20381EEDB50D973877E487358DAC69694EBB9B5C07AA36ACB5DFB26A50E7BA385AED65AF7801BB49E7AB310E595D5290FE63A3565C88361EFD2EE5FBCF6785FCA8D5741FB6EAB8CB75958DC7089F4B7AA27DE830A384D45CFEEAB86B76D6BA6ECEF9E975EF6AB0DDE3363E36E7EF715C0DB3636538278CF8DAD579DEF9ED9DAAEFCE78E2DADB30BDD79D5AE5A8064B8C5D16591DBAA728B943B1CFFE71118411151168F29F565604D25AC2D0C572466A6E6FA3399B1B27014BE0A4533DB7E63E50EBF71B09CA699ADA16AB38937DFFF1B79739A66DE865AC85DD4136BAB117535DE2DFB5853C9D46BAA1F1646D252AEDE16B3365EC9BFA672E1419422AC1EC3EDF2EBA90E1E4425432E9D1ED5C0EA4531F8CEDABFB908FE3BF5972B08F62F3012EC0A5EB3A2B9228BA874DE9244258994A1B9C61479E052CF12EA2F904BA19925A0F3D7E079528F5D83CCB177456E331A6714868CC3792024BC5810D0C43F2F7916651EDFC6EC573AC410404C9F25EE6FC9CF991F7895DC979A9C90018245173CDDCBE692B2B4EFF2B942BA89484720AEBE2A28BAC7611C00587A4B66E811AF231B98DF07BC44EEF32A036802699F0851EDE3731F2D1314A61C63D51F7E820D7BE1D3FBFF03D766AB817A540000, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201910240130013_fiert', N'NewsApp.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F20FF20E869B3705ABE6406B3467702A76DEF1A195F30ED09F66DC096D86D61244A91288F8D45BE6C1FF693F617B62851375E74E956B7DA4180C04D164F158B5564B1549CFFFDE7BFD39F5F7CCF78C651EC0664669E4C8E4D03133B705CB29E99095DFDF0C1FCF9A7EFFE32BD72FC17E3B79CEE8CD1C14812CFCC274AC373CB8AED27ECA378E2BB7614C4C18A4EECC0B7901358A7C7C77FB74E4E2C0C10266019C6F45342A8EBE3F407FC9C07C4C6214D90771B38D88B793BF42C5254E30EF9380E918D67E61DFE165F84E124A3348D0BCF4520C5027B2BD3408404145190F1FC738C17340AC87A114203F21E5F430C742BE4C598CB7E5E92779DC6F1299B86550ECCA1EC24A681DF13F0E48CEBC512876FA45DB3D01B68EE0A344C5FD9AC53EDCDCC1B07A74D9F020F1420323C9F7B11239E99B7058B8B38BCC374920F9C6490D711C07D0BA2AF932AE291D179DC516147A79363F6DF91314F3C9A447846704223E41D190FC9D273ED5FF1EB63F01593D9D9C97275F6E1DD7BE49CBDFF119FBDABCE14E60A74B506687A88821047201B5E15F3370DAB3ECE120716C32A6332AD802D814B98C62D7AF988C99A3E81B39C7E308D6BF7053B790B37AECFC4050F8241344AE0E75DE27968E9E1A2DF6AE4C9FEDFC0F5F4DDFB41B8DEA167779D2EBDC01F1C2702BFFA84BDB4377E72C3CCBD6AEBFD85935D4781CF7ED7ED2BEBFDB20892C8669309B4248F285A635A976E6A95C6DBC9A419D4F0669DA31EBE69334965F35692B2096DE209398B7D7B432EEF6EF976B638387960F152D3621A6932B8FA413511461E19BCBF349993AE2643602A7FE61DB074672D67F8B313E76646573E72BD01F6DA0E5C20C459B9918F0B75FE12C00C11E9AD9C0714C7B0D538FF44F1D3CE15B4C0761281072C28F2C39D737B780A08BE4BFC2573ACFDF11A6C691EBF05D7C8A6417445D8A8ADF13E06F6D720A157C4B944147FA6760EC87E3EBA7E778041C4B9B06D1CC7D760CCD8990710C1E78037849E9D6EE4E563C73A730FB9BE3AD811F6EB2F396919F0A829A4A04743A60A7C9A44FD18AC5DD24DD49C542F6A46D12A2A27EB2B2A03EB2629A7D40B9A12B4CA99510D164AA62B347C2C99C21E7E30B95D94A0DB0B2A6A5CC00E89FF81098E601B731E10A53822E50A74D937C6884AD2E5634C777E36A59C7E435E3234AB8DBC21DD0486F78614F6F0BD2115139A9F5D8745251D6E583931C077A2575FDEDA7D4E906CDFEE509BE6183784F16E8517711CD86EEA058ADC1ACF8CD4E58718CE684F9364B311532D30313074971D79D002733345A3BA2797D8C3141B1776967B9CA3D8468EAC469890D343B0FC44550856DED1EAC2FD4DE209968E233608B14B500C9EEA122ABB854B6C37445EAB9684911D8F3036F78287D87389434C18C3564D7461AECEB030010A3EC2A2B469686A552CAED9103551AB6ECDDB42D872DDA5C4C75E6CB22576D6D8258FDF766298CD1ADB837136ABA48B00DA6CE11806CAEF2A5D0D40BCB81C9A810A37268D81F2906A2F065AD7D808065A57C99B33D0EC8ADA75FD85FBEAA19967FDA2BCFF63BD515D23D8664D1F07669A59EC0963288CC0916C9E974BD6895FA8E2720672F2FB59CC435DD14418F802D37ACAA68C779571A8D50C221A51136069682DA0FC3BA3042439540FE1F25C5EA3743C8AE8019BE7DD1A61F9DE2FC0566C40C6AE7E6FAD10EABFCA8AC6D9E9F651CCACB006C9C83B5D162A380A831037AFFAC43B284597979515D32516EE130D5726C617A341412D91AB4649F96406D7526E9AED5A5205647D42B2ADB424844F1A2DE593195C4BDC46DB95A4080A7A84055BA9A87E840FE46C79A6A3386D8ABEA9959560F186A9A5A9D59ADEA23074C9BA52BBC55B8C4556B835FF61D1BFAAC9CF302C3B56143715D2169C6810A135167A8135487AED4631BD44142D11CBF3CC1D5F22539EAD9AED3F67593D3EE545CCCF819C9AFDCDAB7CEAD501B573560E44F8F86B989DCFA2993485AE587BF57083D5D1210F458AACFD3CF0129FE8832BFDE8ECDB5D757CD622234C2D417E297892342585B875B5775A14D9210658A0226ED97C91F4103A55E7516755D9BA48548F9227A6AA28BA64D5688BA60B603A2F941817F65FA75684DDF85319118BCBAC8A939B9078594B158637F5C4A85446486095BEEEA8F5E2952A66BDA73BA250A1528514BA7A4859AD43A90959EDD8084FA3513545770E72E549155DEEED8EACA841A9422BBA37C056C82CF675475594A9548115DDFD7C543EF7CAD683D94615978A810EBFEC5ABCDDE9A7C1D8DDBEBAFDE159F9FA5F05AA34F7C4E2DFF72530DE7E9096A4BD1B6E64495926643B4BD260E8779CDA37F3FA86D3F8A15F8F59FB105EDBD49B0A01F478FDEC75A756215D0B4592827B713D14AE81537E256B7FD723DDD13212D3C8D50807FA6B4CB13F610493C5EFDEDC7331DBBE73825B44DC158E6956FC619E1E9F9C0ACF830EE7A98E15C78EA7B8D2EADEEBD4D76C0F755CE41945F6138AE4AA8A2D9EB394A052C2FA8638F86566FE3B1D759EE63ED85F69F39171137F26EEEF09743C460936FE90AB448729EFEFF0A0A410F48F37F152A3BBCA6FFEF5251B7A64DC47E04EE7C6B1A0E84D96BFFE7EA39734D9D02DA4D9F855C7DBF536F1E9440EFC571FBD7C5F45EBFD3C4229A2E07A9BBF8658BA749097105BCD57F9DA612B44C58B86A1F00651A1EEC5C22658DAD70A0EFCA4E96B857E9355BF5ED84434EDCB0597F40713DF2D74DFD3F291231E6A8A9BD73EF6B754CFAD75DF5B15818E7DD049E5E15B39BA5C02DE036ED032EFEDE29D37563E3DD839ACA88E1EF48C1FCBEE775E127D2855D0D21BD4918A9FF759EFDCF06DEB4F55E67C0085798A42A3F18B99F76D6BBA54F2815784F62B593E3063E3C7FCF885C9FB36365DB6F9C08DAD57F9F181D9DA58E7E7C896D6F9081DBD9858AE8BD27C1252A5A4DB8A85B3FC3D5CFF970118411651666F3CD5D5694D95B52D0C4B123D537D599CC858721C89AF44D1CCB6DF5CF981DF38594ED3CC56534CDAC49BEFFF8DBC394D336F4D89E61865CECA224975494DE33ED654C9F596CA9A6B3369A9A26F8B591BBFEFBFA52AE6419452F31ECDA7EAB753B43C884A86749D1E45CAF25767383B2BFFE6249CDFB1BB2E21D8BF4049B05D3B350B9A1BB20AF2C35B902827113234B79822078ED48B88BA2B6453E86609E8F4917A9AD4639F4196D8B921F7090D130A53C6FED2AB25BC5810D0C43FADC4AECB3CBD0FD9AF78882980982E4BDCDF935F12D7730AB9AF1539210D048B2E78BA97AD256569DFF56B817417908E405C7D4550F488FDD003B0F89E2CD033DE443630BF8F788DECD73203A803695F88BADAA7972E5A47C88F3946391E7E820D3BFECB4FFF07FA705C1F7A550000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (1, N'Viet Nam gianh chien thang 3-1 truoc Indonesia', 2, N'/Data/files/ChannelImage/img10.jpg', N'VN chien thang', N'VN chien thang', N'TM', CAST(N'2019-10-25T14:43:57.223' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (2, N'Thu tuong yeu cau dieu tra nguyen nhan o nhiem song Da', 1, N'/Data/files/ChannelImage/img8.jpg', N'Nguyen nhan o nhiem song Da', N'Nguyen nhan o nhiem song Da', N'NA', CAST(N'2019-10-25T14:51:25.790' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (3, N'8 mon an Viet duoc gioi thieu tai Phap', 7, N'/Data/files/ChannelImage/img9.jpg', N'Các món ăn Việt xuất hiện trong lễ hội ẩm thực nước Pháp', N'Các món ăn Việt xuất hiện trong lễ hội ẩm thực nước Pháp', N'TM', CAST(N'2019-10-25T15:02:09.157' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (4, N'Học sinh THCS chế tạo hệ thống quản lý rác thông minh', 4, N'/Data/files/ChannelImage/img6.jpg', N'Nhóm học sinh trường Phổ thông song ngữ Liên cấp Wellspring (Hà Nội) chế tạo hệ thống quản lý rác thông minh với robot thu gom, máy phân loại rác.', N'Nhóm học sinh trường Phổ thông song ngữ Liên cấp Wellspring (Hà Nội) chế tạo hệ thống quản lý rác thông minh với robot thu gom, máy phân loại rác.', N'Thanh Hang', CAST(N'2019-10-25T15:02:29.367' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (5, N'Tin mới 1', 5, N'/Data/files/ChannelImage/img5.jpg', N'Tóm tắt tin mới', N'Nội dung tin mới', N'NA', CAST(N'2019-10-25T15:03:04.693' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (6, N'Tin mới 2', 6, N'/Data/files/ChannelImage/img4.jpg', N'Tóm tắt tin mới 2', N'Nội dung tin mới 2', N'TM', CAST(N'2019-10-25T15:03:21.053' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (8, N'Tin mới 7', 1, N'/Data/files/ChannelImage/img10.jpg', N'Tóm tắt tin mới 7', N'Nội dung tin mới 7', N'NA', CAST(N'2019-10-30T10:38:46.543' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (9, N'Tin mới 8', 1, N'/Data/files/ChannelImage/img7.jpg', N'Tóm tắt tin mới 8', N'Nội dung tin mới 8', N'Thanh Hằng', CAST(N'2019-10-30T10:41:51.393' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (10, N'Tin mới 9', 2, N'/Data/files/ChannelImage/bong%20da.jpg', N'Tóm tắt tin mới 9', N'Nội dung tin mới 9', N'MA', CAST(N'2019-10-30T11:03:06.377' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (11, N'Tin mới 10', 2, N'/Data/files/ChannelImage/bong%20da%202.jpg', N'Tóm tắt tin bóng đá', N'Nội dung tin', N'MC', CAST(N'2019-10-30T11:02:55.233' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (12, N'RIKKEISOFT THAM DỰ SỰ KIỆN CÔNG NGHỆ THÔNG TIN LỚN TẠI HỒ CHÍ MINH', 4, N'/Data/files/ChannelImage/khoa%20hoc%203.jpg', N'Hòa chung không khí đón nhận giải thưởng Top 50+10 doanh nghiệp Công nghệ thông tin hàng đầu Việt Nam trong lĩnh vực phần mềm, giải pháp và dịch vụ CNTT của VINASA, Rikkeisoft lại tiếp tục tham gia Hội nghị Phát triển dịch vụ CTT Việt Nam 2019 ( VNITO 2019 ) với chủ đề “ Việt Nam – Điểm đến cho đổi mới sáng tạo “ được tổ chức vào ngày 24/10 vừa qua.', N'<p style="text-align:center"><img alt="" src="/Data/images/khoa%20hoc%203.jpg" style="height:351px; margin-left:auto; margin-right:auto; width:624px" /></p>

<p>&nbsp;</p>

<p><strong>VNITO 2019</strong> l&agrave; sự kiện được tổ chức bởi Ủy ban nh&acirc;n d&acirc;n th&agrave;nh phố Hồ ch&iacute; Minh, Trung t&acirc;m X&uacute;c tiến Thương mại v&agrave; Đầu tư Th&agrave;nh phố Hồ Ch&iacute; Minh c&ugrave;ng C&ocirc;ng vi&ecirc;n phần mềm Quang Trung v&agrave; li&ecirc;n minh VNITO. Sự kiện n&agrave;y nhằm ph&aacute;t huy tiềm năng v&agrave; thế mạnh của ng&agrave;nh CNTT Việt Nam, cung cấp th&ocirc;ng tin, dữ liệu v&agrave; đ&aacute;nh gi&aacute; về thị trường Việt Nam từ c&aacute;c tổ chức nghi&ecirc;n cứu uy t&iacute;n tr&ecirc;n thế giới, đồng thời tổ chức c&aacute;c hoạt động x&uacute;c tiến thương mại ngay tại diễn đ&agrave;n hội nghị.</p>

<p>Với c&aacute;c hoạt động đa dạng như hội thảo chuy&ecirc;n đề, hoạt động kết nối giữa c&aacute;c doanh nghiệp, triển l&atilde;m c&ocirc;ng nghệ, thăm quan c&aacute;c khu c&ocirc;ng nghệ, khu phần mềm, c&aacute;c doanh nghiệp CNTT Việt Nam ti&ecirc;u biểu,...VNITO 2019 gi&uacute;p c&aacute;c doanh nghiệp Việt Nam tiếp cận c&ocirc;ng nghệ mới, quảng b&aacute; dịch vụ v&agrave; sản phẩm. Những vấn đề &ldquo;hot&rdquo; như giải ph&aacute;p về tr&iacute; tuệ nh&acirc;n tạo ( AI/ML ), chuỗi khối ( Blockchain ), dữ liệu lớn ( Big Data ), IoT, chuyển đổi số ( Digital Transformation ) v&agrave; nh&acirc;n lực CNTT,...cũng được đưa ra để thảo luận với những chuy&ecirc;n gia c&oacute; tiếng tr&ecirc;n thế giới.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="" src="/Data/images/khoa%20hoc%2031.jpg" style="height:488px; margin-left:auto; margin-right:auto; width:650px" /></p>

<p>&nbsp;</p>

<p>Sự kiện n&agrave;y c&ograve;n l&agrave; cơ hội rất lớn cho c&aacute;c doanh nghiệp Việt Nam t&igrave;m kiếm cơ hội kinh doanh quốc tế khi quy tụ 500 kh&aacute;ch mời đến từ Hoa Kỳ, Đức, Nhật Bản, H&agrave;n Quốc, Singapore. Việt Nam c&oacute; khoảng 300 doanh nghiệp đăng k&yacute; tham dự với 100 gian h&agrave;ng. Ngo&agrave;i ra, c&oacute; hơn 30 gian h&agrave;ng của c&aacute;c doanh nghiệp đến từ H&agrave;n, Nhật&hellip;</p>

<p>Rikkeisoft cũng l&agrave; một gương mặt ti&ecirc;u biểu trong số 300 doanh nghiệp Việt Nam tham gia sự kiện VNITO 2019. Tạm g&aacute;c những bận rộn ở c&ocirc;ng ty, anh Phan Thế Dũng - CEO Rikkeisoft, anh Nguyễn Viết L&acirc;m - Gi&aacute;m đốc Nh&acirc;n sự, c&ugrave;ng anh Trần Văn Luật v&agrave; anh Nguyễn Tiến Mạnh đ&atilde; tham gia sự kiện lần n&agrave;y. Với c&aacute;c hoạt động giao lưu kết nối, tham quan triển l&atilde;m gian h&agrave;ng, đ&acirc;y sẽ l&agrave; cơ hội rất lớn để Rikkeisoft ghi điểm trước những kh&aacute;ch h&agrave;ng tiềm năng v&agrave; c&aacute;c &ldquo;anh lớn&rdquo; của l&agrave;ng c&ocirc;ng nghệ thế giới.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="" src="/Data/images/khoa%20hoc%2032.jpeg" style="height:488px; margin-left:auto; margin-right:auto; width:650px" /></p>

<p>&nbsp;</p>

<p>Hội nghị Ph&aacute;t triển Dịch vụ CNTT Việt Nam 2019 ghi dấu ấn với l&ecirc;̃ k&yacute; k&ecirc;́t thoả thuận hợp t&aacute;c giữa Li&ecirc;n minh VNITO v&agrave; s&aacute;u tổ chức quốc tế, trong đ&oacute; ba tổ chức đến từ Nhật Bản gồm: Trung t&acirc;m Chiến lược v&agrave; Đổi mới CNTT Okinawa (ISCO Okinawa), Tổ chức Heart Industry Holdings - Ủy ban trao đổi Sinh vi&ecirc;n Quốc tế Nhật Bản, Hiệp hội c&aacute;c doanh nghiệp phần mềm th&agrave;nh phố Fukuoka (FISA), v&agrave; 3 tổ chức đến từ H&agrave;n Quốc: Trung t&acirc;m Hợp t&aacute;c CNTT H&agrave;n Quốc tại TP.HCM (KICC HCM), Hiệp hội Phần mềm Thương mại H&agrave;n Quốc (KOSW), Tổ chức Kết nối Thương mại H&agrave;n Quốc (Korean Trade Network).</p>

<p>Tham gia VNITO 2019 với vị thế l&agrave; Top 50+10 doanh nghiệp C&ocirc;ng nghệ th&ocirc;ng tin h&agrave;ng đầu Việt Nam, Rikkeisoft r&otilde; r&agrave;ng c&oacute; nhiều lợi thế để khẳng định m&igrave;nh giữa thị trường ng&agrave;y c&agrave;ng đ&ocirc;ng đảo. Hy vọng rằng, th&ocirc;ng qua sự kiện n&agrave;y, Rikkeisoft sẽ ng&agrave;y c&agrave;ng khẳng định chỗ đứng của m&igrave;nh, đưa tiếng tăm vươn ra tầm thế giới.</p>

<p>&nbsp;</p>
', N'Phan Thị Linh', CAST(N'2019-11-04T08:30:35.077' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (13, N'Tin khoa học 2', 4, N'/Data/files/ChannelImage/khoa%20hoc%202.jpg', N'Tóm tắt tin khoa học 2', N'Nội dung tin', N'MA', CAST(N'2019-10-30T11:08:35.620' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (14, N'Tin thời trang 1', 5, N'/Data/files/ChannelImage/thoi%20trang.jpg', N'Tóm tắt nội dung tin ', N'Nội dung', N'TM', CAST(N'2019-10-30T11:09:30.427' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (15, N'Tin thời trang 2', 5, N'/Data/files/ChannelImage/thoi%20trang%202.jpg', N'Tóm tắt nội dung', N'Nội dung', N'NA', CAST(N'2019-10-30T11:10:02.310' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (16, N'Tin cuộc sống 1', 6, N'/Data/files/ChannelImage/cuoc%20song.jpg', N'Tóm tắt nội dung', N'Nội dung', N'MC', CAST(N'2019-10-30T11:10:47.227' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (17, N'Tin cuộc sống 2', 6, N'/Data/files/ChannelImage/cuoc%20song%202.jpg', N'Tóm tắt nội dung', N'Nội dung tin', N'KH', CAST(N'2019-10-30T11:11:22.003' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (18, N'BẢO MẬT THÔNG TIN - CÂU CHUYỆN VẪN LUÔN NÓNG BỎNG', 7, N'/Data/images/bao-mat.jpg', N'Trong doanh nghiệp, một trong những vấn đề luôn được chú trọng chính là BẢO MẬT NHỮNG THÔNG TIN MANG GIÁ TRỊ của công ty. Đặc biệt, vấn đề bảo mật thông tin của doanh nghiệp và khách hàng cũng là vấn đề sống còn và cấp thiết của mọi tổ chức. Ngày 01/06/2019, Tổng Giám đốc Rikkeisoft - anh Phan Thế Dũng đã ký quyết định ban hành QUY CHẾ BẢO MẬT THÔNG TIN mới áp dụng đối với toàn thể người lao động, cán bộ nhân viên làm việc tại Công ty. ', N'<p style="text-align:center"><img alt="" src="/Data/images/bao-mat.jpg" style="height:960px; width:679px" /></p>

<p>&nbsp;</p>

<p>Ngay sau đ&oacute;, đồng loạt c&aacute;c c&ocirc;ng ty con, chi nh&aacute;nh của Rikkeisoft tr&ecirc;n to&agrave;n quốc đ&atilde; tiến h&agrave;nh triển khai k&yacute; cam kết bảo mật th&ocirc;ng tin, &aacute;p dụng c&aacute;c biện ph&aacute;p bảo mật triệt để trong từng dự &aacute;n.</p>

<p>Sau hơn một th&aacute;ng triển khai k&yacute; kết, điều thay đổi r&otilde; rệt trong nội bộ c&aacute;c đội dự &aacute;n ch&iacute;nh l&agrave; &yacute; thức của từng th&agrave;nh vi&ecirc;n trong việc bảo mật th&ocirc;ng tin trong c&aacute;c hệ cơ sở dữ liệu: ngăn chặn c&aacute;c truy cập kh&ocirc;ng được ph&eacute;p, chặn USB, ổ cứng di động kết nối PC&hellip; Từ những thay đổi đầu ti&ecirc;n n&agrave;y, dần dần tạo cho anh em trong dự &aacute;n những th&oacute;i quen tốt nhằm duy tr&igrave; v&agrave; n&acirc;ng cao hiệu quả quy tr&igrave;nh bảo mật th&ocirc;ng tin.</p>

<p>L&agrave; đơn vị ti&ecirc;n phong trong việc k&yacute; cam kết bảo mật th&ocirc;ng tin, Systena Lab H&agrave; Nội lu&ocirc;n dứt kho&aacute;t v&agrave; quyết liệt, &quot;giữ vững th&ocirc;ng tin&quot;, đảm bảo an to&agrave;n cho dự &aacute;n. Minh chứng v&agrave; tiếp nối những h&agrave;nh động tr&ecirc;n, Systena Lab H&agrave; Nội triển khai k&yacute; cam kết BMTT từ c&aacute;c y&ecirc;u cầu của đổi t&aacute;c, đưa ph&ograve;ng Lab th&agrave;nh một trong những đơn vị vững mạnh về an ninh th&ocirc;ng tin.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="" src="/Data/images/bao-mat-1.jpg" style="height:564px; width:648px" /></p>

<p>&nbsp;</p>

<p>Việc k&yacute; kết th&ecirc;m một cam kết mới n&agrave;y, kh&ocirc;ng chỉ thể hiện thiện ch&iacute; của Rikkeisoft trong việc hợp t&aacute;c l&acirc;u d&agrave;i bền vững với kh&aacute;ch h&agrave;ng m&agrave; c&ograve;n lan tỏa tinh thần l&agrave;m việc nghi&ecirc;m t&uacute;c, chất lượng v&agrave; th&aacute;i độ sẵn s&agrave;ng trước mọi y&ecirc;u cầu về bảo mật.</p>

<p>Trong tuần n&agrave;y, hoạt động k&yacute; kết sẽ được triển khai tại Systena Lab từ l&uacute;c <strong>14h ng&agrave;y 16/07/2019</strong> với sự phụ tr&aacute;ch của gi&aacute;m đốc Trung t&acirc;m ph&aacute;t triển phần mềm 6 - anh Ho&agrave;ng Minh B&aacute;u v&agrave; ban Kiểm so&aacute;t - chị Phan Thị V&acirc;n Anh.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="" src="/Data/images/bao-mat-2.jpg" style="height:433px; width:648px" /></p>

<p>&nbsp;</p>

<p>Rất mong anh chị em Rikkeisoft tiếp tục n&acirc;ng cao &yacute; thức v&agrave; giữ vững tinh thần &ldquo;<strong>AN TO&Agrave;N L&Agrave; BẠN</strong>&rdquo; nh&eacute;!</p>
', NULL, CAST(N'2019-11-04T17:31:00.437' AS DateTime))
INSERT [dbo].[Articles] ([IDArticle], [Title], [IDChannel], [Image], [Summary], [Content], [Author], [Date]) VALUES (19, N'CHOREI - NÉT VĂN HÓA KHÔNG THỂ TRỘN LẪN TẠI RIKKEISOFT', 7, N'/Data/images/chorei.png', N'Nếu một sáng nào đó, bạn vô tình đi lạc vào khu vực làm việc của Division 5, chắc chắn bạn sẽ tận mắt nhìn thấy một “thói quen” vừa khác lạ, vừa quen thuộc và lại vô cùng hào hứng vui vẻ của cư dân D5. Đó chính là hoạt động Chorei buổi sáng. ', N'<p>Đều đặn v&agrave;o tất cả c&aacute;c buổi s&aacute;ng trong tuần, mọi người sẽ c&ugrave;ng tập hợp v&agrave; c&ugrave;ng h&ocirc; những khẩu hiệu đầy &yacute; nghĩa, c&ugrave;ng nhau đọc những quy tắc l&agrave;m việc trong văn ph&ograve;ng, c&ugrave;ng chia sẻ những c&acirc;u chuyện, b&agrave;i học học hay. Tất cả &acirc;m thanh của từng người khi h&ograve;a l&agrave;m một sẽ tạo ra luồng sinh kh&iacute; mới để từng c&aacute; nh&acirc;n c&oacute; thể t&igrave;m được một nguồn năng lượng dồi d&agrave;o, một tinh thần hưng phấn cho c&ocirc;ng việc, đồng thời truyền cảm hứng cho c&aacute;c đồng nghiệp. Khi c&ugrave;ng nhau đọc đồng thanh những nội quy hay quy tắc l&agrave;m việc của c&ocirc;ng ty v&agrave;o mỗi s&aacute;ng, mọi th&agrave;nh vi&ecirc;n sẽ lu&ocirc;n ghi nhớ rằng chỉ c&oacute; l&agrave;m việc bằng cả tấm l&ograve;ng của m&igrave;nh th&igrave; c&ocirc;ng việc đ&oacute; mới thật sự c&oacute; &yacute; nghĩa v&agrave; đạt kết quả tốt.</p>

<p>C&oacute; những điều rất đơn giản nhưng nếu to&agrave;n thể anh chị em c&ugrave;ng quyết t&acirc;m thực hiện nghi&ecirc;m chỉnh th&igrave; lợi &iacute;ch của n&oacute; mang lại cho C&ocirc;ng ty lại v&ocirc; c&ugrave;ng to lớn. Ch&iacute;nh v&igrave; vậy, hoạt động Chorei sẽ được ch&iacute;nh thức &aacute;p dụng bắt buộc cho to&agrave;n bộ C&ocirc;ng ty Rikkeisoft bắt đầu từ ng&agrave;y <strong style="color:#ff0000">21/10/2019</strong>.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="" src="/Data/images/chorei2.jpg" style="height:480px; width:640px" /></p>

<p>&nbsp;</p>

<p><strong>CHOREI V&Agrave;O L&Uacute;C N&Agrave;O?</strong></p>

<p>L&agrave; hoạt động &ldquo;ch&agrave;o buổi s&aacute;ng&rdquo; v&igrave; vậy Chorei sẽ bắt đầu v&agrave;o đầu mỗi giờ s&aacute;ng, l&uacute;c 8h00 h&agrave;ng ng&agrave;y. V&igrave; vậy, mọi người h&atilde;y ch&uacute; &yacute; đi l&agrave;m thật đ&uacute;ng giờ để kh&ocirc;ng bỏ lỡ bất cứ khoảnh khắc n&agrave;o nh&eacute;.</p>

<p>Chorei diễn ra trong khoảng 5~7 ph&uacute;t th&ocirc;i nhưng tinh thần t&iacute;ch cực chắc chắn sẽ lan tỏa cả ng&agrave;y! H&atilde;y sẵn s&agrave;ng để lan tỏa tinh thần đ&oacute; nh&eacute;!</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="" src="/Data/images/chorei.png" style="height:479px; width:850px" /></p>

<p>&nbsp;</p>

<p><strong>CHOREI CHUẨN RIKKEISOFT</strong><br />
L&agrave;m thế n&agrave;o để c&oacute; được một hoạt động Chorei thật hay, &yacute; nghĩa v&agrave; chất lượng, h&atilde;y lưu &yacute;, Chorei &ldquo;chuẩn Rikkei&rdquo; cần c&oacute; 3 phần ch&iacute;nh:</p>

<p>-<strong> </strong><strong>Warm-up</strong>: Tập hợp mọi người v&agrave; h&atilde;y giới thiệu v&agrave;i điều về bản th&acirc;n</p>

<p>- <strong>Chia sẻ</strong>: Người thực hiện chorei chia sẻ về bất cứ điều g&igrave; trong c&ocirc;ng việc hoặc cuộc sống v&agrave; đọc một quy tắc bất kỳ trong <a href="https://docs.google.com/document/d/1PradDVBYUsZBgcBO6X8oGANji3yaEMyE3aJBNTBA_a8/edit" target="_blank"><strong>Sổ tay Chorei </strong></a></p>

<p>- <strong>H&ocirc; khẩu hiệu</strong>: Người thực hiện chorei sẽ c&oacute; một khẩu lệnh bất kỳ v&agrave; to&agrave;n bộ người tham gia h&atilde;y c&ugrave;ng đồng thanh h&ocirc; thật to.</p>

<p>Điều quan trọng nhất quyết định sự th&agrave;nh c&ocirc;ng của một buổi Chorei đ&oacute; ch&iacute;nh l&agrave; tinh thần h&agrave;o hứng của tất cả mọi người tham gia. V&igrave; thế, h&atilde;y lu&ocirc;n lu&ocirc;n tr&agrave;n đầy hứng khởi v&agrave; thật nhiều năng lượng để bắt đầu một ng&agrave;y l&agrave;m việc mới thật vui vẻ nh&eacute;!</p>

<p>H&atilde;y c&ugrave;ng chờ đ&oacute;n những c&acirc;u chuyện được sẻ chia, những b&agrave;i học hay, kinh nghiệm qu&yacute; b&aacute;u v&agrave; những c&acirc;u khẩu hiệu được h&ocirc; vang mạnh mẽ, tạo cảm hứng cho ng&agrave;y mới bắt đầu!</p>
', NULL, CAST(N'2019-11-04T17:23:57.207' AS DateTime))
SET IDENTITY_INSERT [dbo].[Articles] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'26b16508-ffe4-46fc-bddb-b219445bd265', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'6f0c9774-5fb5-49c4-bef1-528e452cd0a3', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'405b50b3-7545-4252-9e06-02c3a0e3ca3e', N'26b16508-ffe4-46fc-bddb-b219445bd265')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'57eb8650-2580-4a88-b058-77c25b147d46', N'26b16508-ffe4-46fc-bddb-b219445bd265')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'57eb8650-2580-4a88-b058-77c25b147d46', N'6f0c9774-5fb5-49c4-bef1-528e452cd0a3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f07e934d-53ec-4b0a-a132-4c1d92a4e45b', N'6f0c9774-5fb5-49c4-bef1-528e452cd0a3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [Image], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserRole]) VALUES (N'405b50b3-7545-4252-9e06-02c3a0e3ca3e', N'admin@gmail.com', 0, N'AInh3XapcGbf43QbpTaK9AV5dmkm00h2vtneWl1E9rQf/6dkmI/mIDjw46+vS234cw==', N'/Data/files/ChannelImage/img5.jpg', N'e3a05ae4-656d-4125-aa4d-cff7339ee5b0', NULL, 0, 0, NULL, 1, 0, N'admin@gmail.com', N'Admin,')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [Image], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserRole]) VALUES (N'57eb8650-2580-4a88-b058-77c25b147d46', N'midtt@rikkeisoft.com', 0, N'AMPN+mUn3lyhFp4CDDX8JsrNYgbWiU8mknEidncLDaJtXuU0mTMR2rMjCxcYwfnPFQ==', N'/Data/files/ChannelImage/img10.jpg', N'a346012f-0f52-44e6-af00-ade8a5414c5c', N'0976183664', 0, 0, NULL, 1, 0, N'midtt@rikkeisoft.com', N'Admin,User,')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [Image], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserRole]) VALUES (N'f07e934d-53ec-4b0a-a132-4c1d92a4e45b', N'dotrami78@gmail.com', 0, N'AP0TUyywbCCGjDUV+GgJvs1dsH69I7v7EtAiEHuTmJ2dbS821C6Ns43ebPPDN2lCXA==', N'/Data/files/ChannelImage/cuoc%20song.jpg', N'7d3e6117-e875-4ad6-a877-1e9dd7f503a9', N'0976183664', 0, 0, NULL, 1, 0, N'dotrami78@gmail.com', N'User,')
SET IDENTITY_INSERT [dbo].[Channels] ON 

INSERT [dbo].[Channels] ([IDChannel], [Name], [Image], [Summary]) VALUES (1, N'Người Rikkei', N'/Data/images/nguoirikkei.jpg', N'Câu chuyện của những con người Rikkei')
INSERT [dbo].[Channels] ([IDChannel], [Name], [Image], [Summary]) VALUES (2, N'Tủ sách Rikkei', N'/Data/images/tu-sach.jpg', N'Giới thiệu những cuốn sách hay')
INSERT [dbo].[Channels] ([IDChannel], [Name], [Image], [Summary]) VALUES (4, N'Sự kiện', N'/Data/images/su-kien.jpg', N'Các sự kiện quan trọng của Rikkei')
INSERT [dbo].[Channels] ([IDChannel], [Name], [Image], [Summary]) VALUES (5, N'Đào tạo', N'/Data/images/dao-tao.jpg', N'Thông tin về chương trình đào tạo của Rikkei')
INSERT [dbo].[Channels] ([IDChannel], [Name], [Image], [Summary]) VALUES (6, N'Đời sống', N'/Data/images/cuoc-song.jpg', N'Đời sống hàng ngày của Rikkei')
INSERT [dbo].[Channels] ([IDChannel], [Name], [Image], [Summary]) VALUES (7, N'Tin điều hành', N'/Data/images/dieu-hanh.jpg', N'Tin nội bộ , điều hành công ty Rikkei')
SET IDENTITY_INSERT [dbo].[Channels] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/5/2019 3:57:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/5/2019 3:57:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/5/2019 3:57:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/5/2019 3:57:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/5/2019 3:57:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/5/2019 3:57:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Article_Date_1]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [NewsDB] SET  READ_WRITE 
GO
