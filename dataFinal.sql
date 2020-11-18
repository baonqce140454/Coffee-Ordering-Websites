USE [SHOPINGCART]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/17/2020 10:02:12 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifileDate] [datetime] NULL,
	[Image] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Abouts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[ActionId] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Actions] PRIMARY KEY CLUSTERED 
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[ModifileDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Banners] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Baogias]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baogias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Baogias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[ParentID] [int] NULL,
	[Status] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifileDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Contacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Createad] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.FeedBacks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footers]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Footers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[DisplayOrder] [int] NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Images] [nvarchar](max) NOT NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_dbo.News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Oder_ID] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Created] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Images] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Sale_Price] [float] NULL,
	[Category_ID] [int] NOT NULL,
	[MoreImages] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[ModifileDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projecteds]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projecteds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[Images] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[MoreImages] [nvarchar](max) NULL,
	[Customer] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[finish] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_dbo.Projecteds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleActions]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleActions](
	[RoleActionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.RoleActions] PRIMARY KEY CLUSTERED 
(
	[RoleActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[ModifileDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Sliders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/17/2020 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[EditedDate] [datetime] NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[RessetPasswordCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202010290824221_InitialCreate', N'DAL.DBEntityContext', 0x1F8B0800000000000400ED1DDB6EDCBAF1BD40FF61B14F6D91E3B59397D6B0CF816327ADD124DE669383BE05F28ADEA8472B6D256D8E8DA25FD6877E527FA194484ABC5F24EAB2CE2240E0E56548712EE40C6738FFFBCF7F2F7E7ADCC6B36F20CBA334B99C9F9D9CCE672059A761946C2EE7FBE2E1873FCE7FFAF1B7BFB978136E1F673F9376AFCA76B067925FCEBF16C5EE7CB1C8D75FC136C84FB6D13A4BF3F4A13859A7DB4510A68B97A7A77F5A9C9D2D00043187B066B38B8FFBA488B6A0FA017F5EA7C91AEC8A7D10BF4F4310E7B81CD6AC2AA8B30FC116E4BB600D2EE73757EFE6B3AB380AE0D02B103FCC674192A44550C0899D7FCEC1AAC8D264B3DAC18220FEF4B403B0DD4310E7004FF8BC696E3BF7D397E5DC174D47026ABDCF8B74EB08F0EC155E8C05DFBDD592CEEBC582CBF5062E6BF1547E75B56497F3ABFB745FCC67FC48E7D77156B6BA9C570B7E52357B31AB7EBCA8D10CA9A1FCF76276BD8F8B7D062E13B02FB200B658EEEFE368FD57F0F429FD052497C93E8EE979C099C03AA600162DB37407B2E2E92378C0B3BBBD99CF166CBF05DFB1EE46F54153BF4D8A572FE7B30F70F0E03E06359AA9CF5C156906FE0C1290050508974151800C62E93604D54209A3736395FF93D1205D419E98CFDE078FEF40B229BEC2B50B1EE7B3B7D1230849099EC1E724822C043B15D91E4866A81F7515EF37C38F7A038A208A871FF73A03256E6EE07F64F0F2EF4FD1D6D815926BF410C5A04DDFDB6DB0F1815B032A211DEE7332CCEB348D41901896E862D170B19EB7D748681899BB6A373C77A3716F43771E6F7A0EC5E968444FFC6E62B47C9D453B843BDF637D08BE459B6A45B8513F42D2431F09C9F12388AB36F9D7688776D193A6FE0BA1ABB759BA2D8BE9CEB8F2CBA720DB00B8B17C4A552D56E93E5BB725ED069C99BC9BB6C3937833761B32677B0F45EAE5A8E6F16CD8C5198A923A09AEBB1326213B356112D275E11CD3CC501BE9BCCA3F75B3AAEA65737262163B36198741DAB2C6D04C31CE696FF2DB8189B6355B0143FBAD68FB354431C8CCD48DDA1D3518E931371F9EAADF45C92F933C5D2B1590FE940F07624F37516043EC65BB23B1F7A4AEEB0779B3F5A326EB47597E4D13D0ED8C769D26055CB7DEA7DA927F58E6B5F9446B3EBA8653D8A4D993999348CB232F7DCFA6AF6590C145115677C0CDA777EB97F2204838407E0C24B55FA866CD4950AC15141D491357FD0BFE0CF7EB423E415C299F9F50299C55C5169D4EAB189C59EEE08623889D16BAD8907AD8F72476FC6DD08E038FA5142CB368DD88AA1452740B540550A59402322C361144E64DD4247633E06D0147D64CFADAD53EA5BBBFA4853394969B94E31EC06F51EA5DC2767A77590832747F269F21D5E04BBD47347394540B3B95AC4DA7BD8A0268DEAFA8C6C7A3B228D6103ABA1AD5EFE01A77164F8C685C41B9D442C6FE6D1FE00F7713D57A065173C697F2CB73428B1C5FD09572AE605AC878C2E274E98B6D79E1A263EDF66C6BC9B04756E5C7FA9C7B60B171CEA8BEEC4EAEF28436440D37EC551866201FE18C3A98354B2B2F6979D85D6A4A859254AEDA4EB0E423CD51E70BAEE72755152BA683EA3AC9C61284593496AD86978CE5A86D946FD2EF90BC03CA398F232497419EFF9A66E16872A38DCEF5268C5AF67C0BE738D2428FB32D8CB4098EB61BF951C73FC2B98382F0C6359CCEC09E06D29DA23A8BF1CE0575A1B04B34359DF688D2E816D8986871C3E3197AAC7BC55E7D67DF0210BE0ED6BF98E980B43CDAEA7BDC7D8E57EE2D0CC381444B19607FB1E7B1342D6C0EE4A8DD51D04EE67EA857AA780F92BD9926CA56478A10EE55C063FFC2E526CA7771F0840D8D5DC4E1649D00AD89F503F83537136BD9EA48ACD3B8541FEB6E7BB5DF6E83EC6904C3C358BB043A8478BC646EEB72F30FB0AE2CB6164E37A8E9915747F19CF5241006E2FF699CF487F436A9D8A7D9F37B1BC89F354D3FCE439444F9D73185D32A8EAC6E6B51BBA3589ACA667E6047E05E43C8FA747B1E3EE6E62ACFD375541127659F66E34BD929BC49C29931D814AD391B3807171FB26DB4838C0A277239FF83F0753AD0B5A74B035A0EF66CCEF3F95D720362508019EA50BACFE5EB20145717AE51C89640D1004A5FF82888E10E9743611325852847A2641DED82D83479AEA35404A9A2A7CBE9D503F1353760079252869830D37506F540DCC299D6E96241119A35FD5597211624C2DE8F78A43D369E93053C69BAA3276E83737958725B9AA3F1D16DF401E84D12D2A1A20C5D7C47431C4DB4953DCD69C2422C209F9E9C9C09C05B91907A1E3678148F4F4E14A45E5E9BC19BA0A551C84874BA56E15AE381DDA0BA76AFB4A7214D748F9984C6975ECAE90F40794A94D88CCD44528C427BA2FB9B8A4634BE700D8DE0637E8F04A29B90846819D77C1343B4223EE5BA0C407CCA25B019BBF6911F85F01A9715157E25FE2B0D5E917FA2BD84135D5E267F2613A63CD0694C58F7C99FC3684759BDB4E0BC660D824B4750324F5B037D8E4F529249DB2057EE70DB425231CB6F3BF2C89B2317B4A2A50755044BCBFD480F5D42758AA3DF44084F3E7FAB6DD203F1C97163A51E50416903D021B2B6553E9351023262987CDD9457AE0B82211CF20AB685E7D8FEC85353D97F050A62AC291FAACDE7B3C6BA478C63E8A15B8118B9EEE4C92BB13FB69B180030EF66094068038C052015086367F4DA95AC3B792FCB08A07C41480E00BD41640080958048FA0D8DD26580B2AC9F761060D452C100828DBD15C030A2CB06941288B13B8E79117AA35DD5B49EC8DB58BA9AC463D9008238AACA6034EEAE2620952F9E1404F6E63300281DB764DD91DB97A13372B711FAA262332DA1DB7D0535112F01031874152783412EF338009440948989FAD14AAA9DF2654B5E4EDBDC3DD41FC0092741E8DBDC3650C01480981D0036745B0C24DDB44B21AA575666F06ECBC028591C281F4B207B47475C059369D6D6384B7D002DA7354BA1B1C75A016BB124A20151B222062BA3A59D91FA8466C7D1AC86DAB2D8D76248023AC5C53098BD2C0D5FD427900D4FB3146A7B150FA7DE833B2F061518242E82C2046330C25093C5DBB4E69B45B34B0F1281899355E15A621D30DA07DAE097B5089816ABEDD7F22F2928BE5AA7BB5A6BAF96D469ADAF5A8810CDB2106F845A3FAAEB2E1628C3092EB8582852A15CBC0F76BB28D950A95170C96C85F2A25CFFB072CF1FB24530166B86CA786DAE1EA948B36003B8DAF2F01A82B7519617374111DC07A5FBC775B8159AF1DAA0E220464663143E116BE474469A977F63ADF3EA1D5607454519B77E0BBF635BEADA9583127DEA91F79B9599688238C824CE50D769BCDF266AD3B8BA37F2BAA4FBA3127B08C8A59286804AEC2190ED868621D797745098E8671A1453610F8F75F4A101B235F61071BE0F0659A8C861B5B1EF13B3DEB84C8472B1E0884DB0C208442C98B15896B063187CF275E618A90A62C3328A8EAA556CFC6DE875547BE19820895C4497BB7002E545C7B2035531193CD35A8E2BAE293B953BBE759D556BDBF4E1F1CED6D8638BDCDDF0B0DA50900B2D8E88ED76786E896137DC76C744D943E4E4A6F4D9F231B1E5BAE2165B7ADDB1ABEAD8CF1987B8700B1BAF74CF5441416ED4340C54D2D7DE6D38E748CF38C39C6F46A3527461E04EA5D575421B2A95779CEA491CBF514083C045F630F00B04340C5CE440A1243089A15052383CA51FC49999B2E5B912787DD7E54EE2EAAE5325F2EEEA66E3B5CA50B9D2975533179F027D028AEB48A45F5BB35C095F619FB3A07B654F25D97362C8ED643905B2F72595FD9CA6F01BC10C07A2228735A1DE616756862A77581FDAA79859239DB3B11A1E1D36CB3261537E48A7BE7E852079AE9D8642CA2623A81833BEABB0A2DD40DC0596B6773F7B35EDBEC5F2A9DAAD4B0DADF69AA641295DA975B3EA2E389AC7C569304DE9B408AE25A9B525B2A1C8AB7651A54128FD56D5709E8FDE543F4AC0180249E1516F92B288EA7E5ACF2195439C3B83C8BBE9289C179E2A977035143FB6CDE63D647E36AEDCD2BC6FCCAA4FA4743CC5877EC4986166AADC1E5AF3B4240DAB291D5636F89051BEE48B9F139FEC456086C625F593913AB5AFACB3AD067BD2B630D5A87AF6B33DFB52170F621369FC965DF1597B35BB2354DDB51F23843F81369503935F4373203D3105CFEFC8441CEC9D691DB9DFB7A07445C7A3E4EA8C4B14EBE08AC92A12C21D8FF26EFD6011BD33CB9883AA12874B78E6052DE6169EA999EE15F0483455C5BAB89294AC930549C9BBF54352DD6DE87E6CDFF53BADCC5448E158DB9F4A0DEBD71E3CDE951389D46A71E984E3B85A5D3BA9FAF643F2DD8D6353611A5FC4EEF95AA67EB09499565D3ABC724E5E1CA5C190B267C6C4244ED295837114A53BFBAA3AF6C3BB7EF8668AA7A0B6EE91FD1AA4C6BF62ED958F840020BE493D3A2EA97FD7014038F886890AAA56A18CF1A9BE3EC781407C340E6A329FC1A5FA56F210C4CF535E80ED49D9E064F5CFF83A8E2A414E1ABC0F92E801E4057A5C78FEF2F4ECE57C761547418EE2B4709CD139FF9A8355E0D1D9AB32F00884DB05DFDD3D7CA98492E721732B2BBEC22C89E919E279E4A85C52E303C81D72CF26DF826CFD35C87EB70D1E7FEF9EB0807A8DBD1B24122EE40396248D6208FF2EB8E446764FA78B8F05B7858543850C5FE8FE7EF27D54F84A55227DBCD88ACC55E10E66626F7AF648F274348F0704481ECB7680678D0E55948C1D4A74513166B4B0BD7B440D9B2CB61A4278E1E73609C1E3E5FC5F5597F3D9EDDFBFA05E2F66D5E1E77C763AFB774B9A701F9AF47318DC09E36D71DD16CB03E0D7DF8E3310E7C9E25B0E76BF673320745B7F3A17C1A07B98729B1F6F8B77A026310EE560A9C9DB26CA64E4EC0489C9BA597D74B7FC579D26E3892C59FE307F947DF26269C4C8F326C78195992614C5ED6441FAA94E1683CAD571D52797DC6D92E74907C88DFCDD50B3AD701CFC2C82DDC611A887380DDC699D8E3451C0B192F97484891BCF535D3B69336292B729EC623EED27DD251B8947F16E375106771CECB6BAA462441C37B1BA67277AAE234BDC46C7DD3A0DCDC803C807B133842612C55E38B911DB3321B33A5CC40DCBB85B272CFBDB6AED14193BD2A335996EA0B80C995E4CEA93556AC4B80E3B9690477398D982F47B8E76D126A6C48F2E44E24A2676B54307957483D478604F4C0478144C5EA549F7939C2CB6A43F6BB03472E360F75C9FC6AEDE6E22E5B11507ABD75B8B88EFDE701A680F19BD88177BA29484413C7B3130EE928B110B07BBE028FCC187F78124B3781BE61DED2ECF1AFB6270C1C162DF9F3DD6A709B50E5A989CA1988E5DE8D16ED8EDE641160B70B014EAED7C6245EAD61E739EECD91E0F2ABE4DED75B0810760B67A9A0D2C1275304DF693F9F21F2CEFF994E9933B1E74F3D9EAC37C30FAED968ACAC5549C86045F54EA1192240CCD83494838485A6A3A71213507BAB8973CD4CA47E845CE573FCAEE905453FBF0BDDB9803A472D56645E3B0376C6EE8F12947F1B4BDAD7B6D9F54336A5A69530E3949D23706714D218BB6D39393330173222C141E6401CF1319689E5FB6393C389101F38D36E3A99F351E841496FAE4796D29A12741429CC1E8292CE5A9A10F9076A4AE6E8AA1B46FDE0E989B5E996990CF9926260B1F886698ECBEFC1C6C1396B7CF0D3E04E1E85FAE158753BEEA3A08E128B2334EE4AC8232315363A382833F9F281ED49CD8C94499D2D215437D0A13B328F3441FD638533D5AEA2A43AC071B79DBD1A5FF6C775C78769B8FCB61C207E9386C3F4BCDFBE43DD010F7AA426D30E6F391F238C40F351035BF7A2040CCF88ECBD1FB0997F3F03E85884666219C9654548838C858051641E30A296C45E6751E38AD630B03D095B2413449D2A503298650033783C5819A22605221034DD2A5998157717B32E0A8420E1C65B932016F5423017C53251B4093349C1FA31666C210758D6C84A52A3B310F9F1153C2184CAD6C1C6DCE6FE958AA5134F0CD90D1F940008C8A6570E519AD050463AF31097E498D14BDE4656213FCDA454A1CA0A9928DD03C966B1C0239BC4806C01552F0F8755213F0CAB543048D8A6580D1539926B095CF80081615CBC0A21A3327E1CB5E292F913A053791A7EA4CA3E03B2D71085221834F5ED1E2814B93A88BD7099214EA863B07E604C36E1E74325F71EF965B7CA99E74317F8A72CE17CF5BBEF51F2AD3B50495939BEAE89F2831D44ABED264CE5598F1A84937859A0F66CDB716BD5B7CB0688E947CAFC166E9E973B9BD95C94AD6FD4345EB99E4430D263699664A4D56F16E9C4A3BE17BCA13BCB7F8D4C6DE23F9448531A8236FD23B7E9317C417D6F0F140852F55C213A7C9B5C16DDB0FE2B469D587E994EEB69CD323390ACFE9D575170BB4CDE202F85378360FAA9BFBA4BCE647BF6E401E6D1A1017106602D68CA259B7B94D1E52A2F37233224D783703F86921D442AFB2227A80474358BD06791E259BF9ECE720DE83D225FC1E84B7C9DDBED8ED0BF8C9607B1F33E2ABD49B75E35F2C84395FDC552E1BB98F4F80D38C4ACF88BBE4F53E8AC37ADE6F25CEA10A10A5428E3D6E4A5C16A5E7CDE6A986F441483DA0028497AFB6237C02DB5D0C81E577C92AF806DACC0D72E83BB009D64F4BFCFAA11A881911ECB25FDC44C1260BB63986D1F4873F210D87DBC71FFF0FAB18172584EB0000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[Actions] ON 

INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (1, N'Get All Categories', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (2, N'Get All Categories', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (3, N'Insert Category', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (4, N'Update Category', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (5, N'Delete Categories', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (6, N'Get All Footer', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (7, N'Insert Footer', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (8, N'Update Footer', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (9, N'Delete Categories', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (10, N'Search Product', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (11, N'Creat Product', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (12, N'Edit Product', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (13, N'Delete Product', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (14, N'Get All Role', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (15, N'Creat Role', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (16, N'Edit Role', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (17, N'Delete Role', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (18, N'Detail Role', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (19, N'Add New Role', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (20, N'Search Slider', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (21, N'Creat Slider', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (22, N'Edit Slider', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (23, N'Delete Slider', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (24, N'Search User', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (25, N'Creat User', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (26, N'Edit User', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (27, N'Delete User', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (28, N'Get All Abouts', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (29, N'Creat Abouts', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (30, N'Edit Abouts', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (31, N'Delete Abouts', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (32, N'Get All News', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (33, N'Create News', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (34, N'Edit News', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (35, N'Delete News', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (36, N'Get All Order', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (37, N'Details Order', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (38, N'Get All Banner', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (39, N'Create Banner', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (40, N'Edit Banner', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (41, N'Delete Banner', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (42, N'Details Banner', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (43, N'Get All Projected', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (44, N'Creat Projected', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (45, N'Edit Projected', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (46, N'Delete Projected', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (47, N'Get All Baogia', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (48, N'Edit Baogia', N'')
INSERT [dbo].[Actions] ([ActionId], [ActionName], [Description]) VALUES (49, N'Delete Baogia', N'')
SET IDENTITY_INSERT [dbo].[Actions] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name], [Slug], [ParentID], [Status], [CreatedDate], [ModifileDate]) VALUES (1, N'Giá từ 300,000 - 400,000', N'gia-tu-300000-400000', NULL, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-11-09T16:41:26.640' AS DateTime))
INSERT [dbo].[Categories] ([ID], [Name], [Slug], [ParentID], [Status], [CreatedDate], [ModifileDate]) VALUES (2, N'Giá từ 400,000 - 450,000', N'gia-tu-400000-450000', NULL, 1, CAST(N'2020-09-09T00:00:00.000' AS DateTime), CAST(N'2020-11-09T16:41:53.960' AS DateTime))
INSERT [dbo].[Categories] ([ID], [Name], [Slug], [ParentID], [Status], [CreatedDate], [ModifileDate]) VALUES (3, N'Giá từ 450,000 - 550,000', N'gia-tu-450000-550000', NULL, 1, CAST(N'2020-11-01T14:52:00.150' AS DateTime), CAST(N'2020-11-09T16:42:18.520' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBacks] ON 

INSERT [dbo].[FeedBacks] ([Id], [FullName], [Email], [Phone], [Content], [Createad], [Status]) VALUES (1, N'Pham Quoc Nghi', N'nghipqce140569', 325456582, N'Coffee Arabica very good', CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Email], [Phone], [Content], [Createad], [Status]) VALUES (2, N'thaidui', N'chauhuudang1702@gmail.com', 312349845, N'thai ngu vl', CAST(N'2020-11-09T18:37:53.183' AS DateTime), 0)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Email], [Phone], [Content], [Createad], [Status]) VALUES (3, N'dang', N'chauhuudang1702@gmail.com', 25663, N'demo', CAST(N'2020-11-10T15:10:20.767' AS DateTime), 1)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Email], [Phone], [Content], [Createad], [Status]) VALUES (4, N'demo', N'demo@gmail.com', 12345874, N'demo', CAST(N'2020-11-14T15:52:16.750' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[FeedBacks] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Slug], [Images], [Summary], [Content], [CreateDate], [Status]) VALUES (3, N'coffee-arabica-viet-nam', N'/Contents/Uploads/files/Arabica-Coffee-630.jpg', N'Vì sao cà phê Arabica lại nổi tiếng thế giới', N'<h2>&nbsp;</h2>

<p>Nguồn gốc v&agrave; đặc điểm</p>

<p>C&agrave; ph&ecirc; Arabica c&oacute; nguồn gốc ở cao nguy&ecirc;n Jimma ở t&acirc;y nam Etiopia v&agrave; cao nguy&ecirc;n Boma ở đ&ocirc;ng nam Sudan. Tuy nhi&ecirc;n, n&oacute; được trồng trọt đầu ti&ecirc;n bởi người Ả rập ở thế kỉ 14 v&agrave; được giới thiệu rộng r&atilde;i tr&ecirc;n thế giới ở thế kỉ 17. C&agrave; ph&ecirc; Arabica được m&ocirc; tả đầu ti&ecirc;n bởi nh&agrave; sinh vật học Linnaeus (Thụy Điển) v&agrave;o năm 1753.&nbsp;</p>

<p>&nbsp;</p>

<p>C&acirc;y c&agrave; ph&ecirc; Arabica trưởng th&agrave;nh c&oacute; dạng bụi c&acirc;y lớn, thẳng đứng, cao khoảng 6m, thực tế chỉ cao khoảng 2-3m, giống của VN nếu để mọc hoang d&atilde; c&oacute; thể cao đến 15 m. Tr&aacute;i c&agrave; ph&ecirc; thuộc loại quả thịt, h&igrave;nh oval. Tr&aacute;i xanh khi ch&iacute;n c&oacute; m&agrave;u đỏ tươi (chủng Caturra amarello c&oacute; quả m&agrave;u v&agrave;ng), sau chuyển th&agrave;nh m&agrave;u xanh đen.</p>

<p>&nbsp;</p>

<p>Arabica c&oacute; vị chua thanh xen lẫn với vị đắng nhẹ, m&agrave;u nước n&acirc;u nhạt, trong trẻo của hổ ph&aacute;ch. M&ugrave;i hương của Arabica rất thanh tao, qu&yacute; ph&aacute;i, Arabica c&oacute; m&ugrave;i của siro, m&ugrave;i của hoa tr&aacute;i , ho&agrave; quyện với m&ugrave;i mật ong v&agrave; cả m&ugrave;i b&aacute;nh m&igrave; nướng, m&ugrave;i c&aacute;nh đồng rơm buổi trưa h&egrave;&hellip;.</p>

<h2><br />
&nbsp;</h2>

<p>Đ&agrave; Lạt &ldquo;thi&ecirc;n đường&rdquo; của c&agrave; ph&ecirc; Arabica:</p>

<p>Khi nhắc đến những v&ugrave;ng đất trồng c&agrave; ph&ecirc; ở nước ta, người ta thường nghĩ ngay đến T&acirc;y Nguy&ecirc;n, hay c&ograve;n gọi l&agrave; Cao nguy&ecirc;n trung phần, nơi may mắn được tạo h&oacute;a ban cho diện t&iacute;ch đất đỏ bazan tr&ugrave; ph&uacute;.</p>

<p>&nbsp;</p>

<p>C&agrave; ph&ecirc; Arabica được trồng ở c&aacute;c huyện như: Đơn Dương, L&acirc;m H&agrave;, Di Linh, Đức Trọng v&agrave; một số v&ugrave;ng ngoại th&agrave;nh của th&agrave;nh phố Đ&agrave; Lạt được đ&aacute;nh gi&aacute; l&agrave; c&oacute; gi&aacute; trị cao nhất Việt Nam. Thậm ch&iacute;, hương vị s&aacute;nh ngang với c&agrave; ph&ecirc; ngon nhất thế giới l&agrave; Arabica Bourbon (Moka).</p>

<p>&nbsp;</p>

<p>V&ugrave;ng đất n&agrave;y được coi l&agrave; &ldquo;thi&ecirc;n đường&rdquo; c&agrave; ph&ecirc; Arabica nhờ những &ldquo;chỉ số v&agrave;ng&rdquo; như : độ cao 1.500 m so với mặt nước biển, kh&iacute; hậu &ocirc;n đới m&aacute;t quanh năm, nhiệt độ cực đại trong năm kh&ocirc;ng vượt qu&aacute; 33 độ, nhiệt độ cực tiểu 5 độ.</p>

<p>Điện Bi&ecirc;n, Sơn La c&oacute; lịch sử trồng c&agrave; ph&ecirc; Arabica cả trăm năm.</p>

<p>&nbsp;</p>

<p>Ở ph&iacute;a Bắc, kh&iacute; hậu lạnh do chịu ảnh hưởng của gi&oacute; m&ugrave;a đ&ocirc;ng bắc, c&ugrave;ng lượng mưa lớn, m&ugrave;a kh&ocirc; kh&ocirc;ng r&otilde; rệt, cũng l&agrave; những lợi thế gi&uacute;p cho c&agrave; ph&ecirc; Arabica sinh trưởng v&agrave; ph&aacute;t triển. Nơi đ&acirc;y cũng đ&atilde; h&igrave;nh th&agrave;nh n&ecirc;n những v&ugrave;ng c&agrave; ph&ecirc; c&oacute; hương vị rất tuyệt như ở huyện Y&ecirc;n B&igrave;nh, thuộc tỉnh Y&ecirc;n B&aacute;i.</p>

<p>&nbsp;</p>

<p>V&ugrave;ng T&acirc;y Bắc, c&agrave; ph&ecirc; được trồng ở c&aacute;c tỉnh như Sơn La, Điện Bi&ecirc;n cũng được kh&aacute;ch h&agrave;ng quốc tế đ&aacute;nh gi&aacute; rất cao nhờ c&oacute; thổ nhưỡng tương tự như v&ugrave;ng Sao Paulo của Brasil, c&oacute; kh&aacute;c chăng chỉ l&agrave; 2 v&ugrave;ng c&agrave; ph&ecirc; nằm n&agrave;y ở ph&iacute;a Bắc v&agrave; ph&iacute;a Nam b&aacute;n cầu.</p>

<p>&nbsp;</p>

<p>Đặc biệt c&agrave; ph&ecirc; Chiềng Ban, Sinh Ban( Sơn La), tuy kh&ocirc;ng được trồng ở v&ugrave;ng đất đỏ bazan v&agrave; kh&ocirc;ng nằm ở độ cao l&yacute; tưởng như c&aacute;c tỉnh T&acirc;y Nguy&ecirc;n, song Sơn La c&oacute; những loại đất trong nh&oacute;m đất đỏ v&agrave;ng th&iacute;ch hợp với c&acirc;y c&agrave; ph&ecirc; như Fk, Fv, Fs&hellip; Lại nằm ở vĩ độ kh&aacute; cao về ph&iacute;a Bắc (20039&rsquo; &ndash; 22002&rsquo; vĩ độ Bắc) n&ecirc;n kh&ocirc;ng phải tưới nước, nhưng c&acirc;y c&agrave; ph&ecirc; Arabica vẫn c&oacute; sức sống rất m&atilde;nh liệt. Nhiều c&acirc;y v&agrave;i chục năm tuổi, th&acirc;n to, t&aacute;n rộng m&agrave; hạt c&agrave; ph&ecirc; c&oacute; hương vị kh&ocirc;ng hề thua k&eacute;m so với giống c&acirc;y m&agrave; người Ph&aacute;p đ&atilde; trồng ở L&acirc;m Đồng từ những năm 30 của thế kỷ trước.</p>

<p>&nbsp;</p>

<h2>&nbsp;</h2>

<p>Quảng Trị, Nghệ An c&agrave; ph&ecirc; Arabica với hương thơm s&acirc;u lắng</p>

<p>Khu &nbsp;vực &nbsp;Trung &nbsp;bộ &nbsp;nước ta cũng c&oacute; những v&ugrave;ng đất như: Khe Sanh (Quảng Trị), Phủ Quỳ (Nghệ An) rất th&iacute;ch hợp với loại c&agrave; ph&ecirc; Arabica, đặc biệt l&agrave; giống Catimor (loại được lai giữa chủng Caturra với Hybrid de Timor). C&ugrave;ng thuộc họ Arabica, tuy kh&ocirc;ng c&oacute; vị ngọt đậm như Bourbon nhưng Catimor lại c&oacute; hương thơm s&acirc;u lắng v&agrave; vị ch&aacute;t, mặn.</p>

<p>&nbsp;</p>

<p>Ng&agrave;y nay, ngo&agrave;i những giống Arabica truyền thống, được trồng từ trước, mới đ&acirc;y, Viện Khoa học Kinh tế N&ocirc;ng L&acirc;m Nghiệp T&acirc;y Nguy&ecirc;n đ&atilde; lai tạo ra nhiều giống c&agrave; ph&ecirc; Arabica c&oacute; năng suất v&agrave; chất lượng cao.&nbsp;</p>

<p>&nbsp;</p>

<p>Trong đ&oacute;, hai giống lai TN1, TN2 c&oacute; năng suất cao v&agrave; chất lượng tốt đ&atilde; được Bộ N&ocirc;ng &nbsp;nghiệp v&agrave; Ph&aacute;t triển N&ocirc;ng th&ocirc;n cho ph&eacute;p khu vực ho&aacute; canh t&aacute;c. C&aacute;c giống c&agrave; ph&ecirc; Arabica lai mới n&agrave;y c&oacute; đặc t&iacute;nh c&acirc;y sinh trưởng khỏe, ph&acirc;n c&agrave;nh nhiều. Năng suất đạt từ 4 - 5 tấn c&agrave; ph&ecirc; nh&acirc;n/ha, k&iacute;ch cỡ hạt lớn, trọng lượng 100 nh&acirc;n tr&ecirc;n 15 - 17gram, kh&aacute;ng cao đối với bệnh gỉ sắt...</p>

<p>&nbsp;</p>

<h2>&nbsp;</h2>

<p>Gi&aacute; trị kinh tế Arabica:</p>

<p>Việt Nam hiện nay l&agrave; một nước c&oacute; sản lượng c&agrave; ph&ecirc; xuất khẩu lớn nhất thế giới với hơn 500.000 ha v&agrave; sản lượng h&agrave;ng năm từ 900.000&ndash;1.200.000 tấn. Nhưng cho tới nay cả nước chỉ c&oacute; khoảng 35.000 ha c&agrave; ph&ecirc; Arabica, tập trung chủ yếu ở L&acirc;m Đồng, Thừa Thi&ecirc;n Huế, Quảng Trị, Nghệ An, H&ograve;a B&igrave;nh, Sơn La, Điện&hellip;. . C&agrave; ph&ecirc; Arabica vốn l&agrave; loại c&oacute; gi&aacute; trị kinh tế nhất trong c&aacute;c lo&agrave;i c&agrave; ph&ecirc;. Tr&ecirc;n thị trường c&agrave; ph&ecirc; Arabica lu&ocirc;n được đ&aacute;nh gi&aacute; cao nhờ c&oacute; hương vị thơm ngon. Gi&aacute; c&agrave; ph&ecirc; Arabica cũng thường cao gấp đ&ocirc;i so với gi&aacute; c&agrave; ph&ecirc; Robusta. C&agrave; ph&ecirc; Aarabica đại diện cho khoảng gần 70% c&aacute;c sản phẩm c&agrave; ph&ecirc; cao cấp tr&ecirc;n thế giới. &nbsp;</p>

<p>&nbsp;</p>

<h2>&nbsp;</h2>

<p>C&agrave; ph&ecirc; One More &ndash; Thương hiệu chất lượng Việt Nam</p>

<p>Ch&iacute;nh v&igrave; l&yacute; do n&agrave;y, c&agrave; ph&ecirc; Arabica của Việt Nam ng&agrave;y c&agrave;ng được c&aacute;c thương hiệu c&agrave; ph&ecirc; nổi tiếng nhất tr&ecirc;n thế giới lựa chọn, trong đ&oacute; c&oacute; thương hiệu C&agrave; ph&ecirc; One More. Với ti&ecirc;u ch&iacute; &ldquo;Chất lượng l&agrave; h&agrave;ng đầu&rdquo; &ldquo;c&agrave; ph&ecirc; sạch 100%&rdquo;, One More khắt khe chọn lọc kỹ c&agrave;ng những hạt c&agrave; ph&ecirc; Arabica, Culi, Robusta&hellip;được trồng ở độ cao hơn 1000m (so với mực nước biển) từ những v&ugrave;ng đất nổi tiếng ở Đ&agrave; Lạt, Bu&ocirc;n Ma Thuột tr&ecirc;n l&atilde;nh thổ Việt Nam để cho ra sản phẩm c&agrave; ph&ecirc; ngon nhất, mang đậm hương vị Việt.</p>
', CAST(N'2020-11-03T14:57:03.090' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Slug], [Images], [Summary], [Content], [CreateDate], [Status]) VALUES (4, N'coffee-arabica-va- coffee-robusta', N'/Contents/Uploads/files/51FTrWBzKhL__SX466_.jpg', N'Giá cafe Arabica và Robusta khác nhau thế nào', N'<p>L&agrave; 2 d&ograve;ng c&agrave; ph&ecirc; ch&iacute;nh tr&ecirc;n thế giới, Arabica v&agrave; Robusta c&oacute; nhiều điểm kh&aacute;c nhau về đặc điểm c&acirc;y, m&ugrave;i vị&hellip; dẫn tới gi&aacute; th&agrave;nh cũng kh&aacute;c nhau.</p>

<p><br />
Từ đặc điểm về sinh trưởng, chăm s&oacute;c, c&aacute;ch chế biến v&agrave; hương vị m&agrave; mức gi&aacute; của 2 loại c&agrave; ph&ecirc; Arabica v&agrave; Robusta cũng kh&aacute; kh&aacute;c nhau.</p>

<p>Với những người m&ecirc; c&agrave; ph&ecirc; thực thụ, họ đ&aacute;nh gi&aacute; cao hơn d&ograve;ng c&agrave; ph&ecirc; Arabica v&agrave; coi đ&oacute; l&agrave; cao cấp hơn. Tuy nhi&ecirc;n, mỗi người c&oacute; một sở th&iacute;ch ri&ecirc;ng ph&ugrave; hợp với từng loại c&agrave; ph&ecirc; n&ecirc;n việc đ&aacute;nh gi&aacute; cũng kh&ocirc;ng ho&agrave;n to&agrave;n ch&iacute;nh x&aacute;c.</p>

<p>Gi&aacute; cả c&aacute;c loại c&agrave; ph&ecirc; chủ yếu phụ thuộc v&agrave;o lượng cung &ndash; cầu, do đ&oacute;, tại mỗi thời điểm m&agrave; gi&aacute; của 2 loại c&agrave; ph&ecirc; n&agrave;y cũng c&oacute; nhiều biến đổi.</p>

<p>Dưới đ&acirc;y l&agrave; bảng gi&aacute; c&aacute;c loại c&agrave; ph&ecirc; Robusta v&agrave; Arabica hiện đang được kinh doanh tại NGUYEN CHAT COFFEE m&agrave; bạn đọc c&oacute; thể tham khảo.</p>

<p>&nbsp;</p>
', CAST(N'2020-11-03T15:01:42.813' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (29, 23, 29, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (30, 23, 30, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (31, 23, 31, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (32, 23, 32, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (33, 23, 33, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (34, 23, 34, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (35, 23, 35, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (36, 23, 36, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (37, 23, 37, 495000, 2)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (38, 24, 37, 410000, 2)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (39, 25, 37, 410000, 2)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (40, 24, 38, 410000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (41, 23, 38, 495000, 2)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (42, 25, 38, 410000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (43, 23, 39, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (44, 24, 39, 410000, 2)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (45, 25, 39, 410000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (46, 23, 40, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (47, 23, 41, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (48, 23, 42, 495000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (49, 24, 43, 410000, 1)
INSERT [dbo].[OrderDetails] ([ID], [Product_Id], [Oder_ID], [Price], [Quantity]) VALUES (50, 23, 44, 495000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (17, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-01T16:51:57.797' AS DateTime), 2)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (18, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-01T16:58:48.170' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (19, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-02T17:49:18.493' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (20, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-02T17:52:39.733' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (21, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-02T17:58:47.457' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (22, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-02T18:04:02.757' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (23, 4, N'nhuthao', N'dangchce140529@fpt.edu.vn', N'0954862112', N'dong thap', CAST(N'2020-11-02T18:05:42.020' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (24, 4, N'nhuthao', N'dangchce140529@fpt.edu.vn', N'0954862112', N'dong thap', CAST(N'2020-11-02T18:05:56.900' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (25, 4, N'nhuthao', N'dangchce140529@fpt.edu.vn', N'0954862112', N'dong thap', CAST(N'2020-11-02T18:07:05.930' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (26, 12, N'chauhuudang', N'dangchce140529@fpt.edu.vn', N'0123456788', N'Ca Mau', CAST(N'2020-11-02T18:16:02.820' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (27, 12, N'chauhuudang', N'dangchce140529@fpt.edu.vn', N'0123456788', N'Ca Mau', CAST(N'2020-11-02T18:16:46.043' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (28, 12, N'chauhuudang', N'dangchce140529@fpt.edu.vn', N'0123456788', N'Ca Mau', CAST(N'2020-11-02T18:17:36.263' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (29, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-08T09:53:58.747' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (30, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-08T09:54:52.503' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (31, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-08T10:00:46.203' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (32, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-08T10:02:55.647' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (33, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-08T10:03:57.300' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (34, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-08T10:05:15.940' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (35, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-08T10:11:43.547' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (36, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-08T10:31:30.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (37, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-10T22:57:19.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (38, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-10T23:02:37.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (39, 4, N'nhuthao', N'nhuthao@gmail.com', N'0954862112', N'dong thap', CAST(N'2020-11-14T13:34:56.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (40, 14, N'dang', N'chauhuudang1702@gmial.com', N'0969348502', N'Cà Mau', CAST(N'2020-11-15T12:51:01.553' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (41, 14, N'dang', N'chauhuudang1702@gmial.com', N'0969348502', N'Cà Mau', CAST(N'2020-11-15T13:13:07.530' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (42, 14, N'dang', N'chauhuudang1702@gmail.com', N'0969348502', N'Cà Mau', CAST(N'2020-11-15T13:18:07.297' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (43, 14, N'dang', N'chauhuudang1702@gmail.com', N'0969348502', N'Cà Mau', CAST(N'2020-11-15T15:49:12.777' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [User_ID], [Name], [Email], [Phone], [Address], [Created], [Status]) VALUES (44, 14, N'dang', N'chauhuudang1702@gmail.com', N'0969348502', N'Cà Mau', CAST(N'2020-11-15T15:49:57.283' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Slug], [Content], [Images], [Price], [Sale_Price], [Category_ID], [MoreImages], [Created], [ModifileDate], [Status], [TopHot]) VALUES (23, N'Kopi Luwak', N'kopi-luwak', N'Cà phê chồn là một loại cà phê đặc biệt, một thứ đồ uống được xếp vào loại hiếm nhất trên thế giới. Từ Kopi Luwak được dùng để chỉ một loại hạt mà cầy vòi đốm ăn quả cà phê rồi thải ra. Và ta lấy loại hạt này đem phơi khô và chế biến. Chất lượng hạt cà phê sau khi qua dạ dày loài cầy vòi hương vẫn giữ được hương vị cà phê nguyên chất, nếu chịu khó cảm nhận bạn có thể nếm được vị bùi bùi, dìu dịu vừa ngai ngái, phảng phất mùi của khói và hương vị sô cô la. Kopi Luwak của Indonesia rất thơm ngon nên giá cả cũng đạt mức rất cao. Một kg Kopi Luwak có giá thành khoảng 20 triệu VND (1300 USD) và mỗi năm cũng chỉ có khoảng 200 kg được bán trên thị trường thế giới. Trên thế giới chỉ một số nước sản xuất được loại cà phê này như Indonesia, Philippines, Ethiopia, Việt Nam... với số lượng rất hạn chế.', N'/Contents/Uploads/files/Coffee-Package-Mockup-PSD-aa.jpg', 500000, 495000, 3, N'/Contents/Uploads/files/Coffee-Package-PSD.jpg', CAST(N'2020-11-06T17:37:59.753' AS DateTime), CAST(N'2020-11-16T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Content], [Images], [Price], [Sale_Price], [Category_ID], [MoreImages], [Created], [ModifileDate], [Status], [TopHot]) VALUES (24, N'Coffee Arabica', N'coffee-arabica', N'Bạn rất yêu hương vị cafe và chọn cà phê là loại nước uống này hằng ngày nhưng liệu loại nước uống này nó có hại cho sức khỏe của bạn. Vì khi chúng ta mua bột thành phẩm hay pha chế sẵn thì độ nguyên chất của cà phê có còn không, mặt khác những phẩm màu hóa chất sẽ gây độc hại cho bạn. Vì vậy hôm nay tôi sẽ giới thiệu đôi nét về xuất xứ, trồng trọt loại cà phê này đến khi thành quả ra hạt đem đi tiêu thụ và hứa sẽ đưa bạn đến một địa chỉ mua hạt nguyên chất để bạn có thể mua về chế biến dùng cho an tâm.', N'/Contents/Uploads/files/Coffee-Package-Mockup-PSD-aa.jpg', 410000, NULL, 2, N'/Contents/Uploads/files/Coffee-Package-PSD.jpg', CAST(N'2020-11-06T17:39:32.220' AS DateTime), CAST(N'2020-11-16T18:05:46.833' AS DateTime), 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Content], [Images], [Price], [Sale_Price], [Category_ID], [MoreImages], [Created], [ModifileDate], [Status], [TopHot]) VALUES (25, N'Coffee Capuchino', N'coffee-capuchino', N'Cà phê cappuccino là một thức uống dựa trên cà phê được làm chủ yếu từ espresso và sữa. Nó bao gồm một phần ba espresso, một phần ba sữa nóng và một phần ba bọt sữa và thường được phục vụ trong một tách nhỏ bằng sứ. Cappuccino được coi là một trong những đại diện đồ uống espresso nguyên bản của ẩm thực espresso Ý và cuối cùng là ẩm thực espresso Ý – Mỹ . Cappuccino bắt đầu trong các quán cà phê Ý và di chuyển vào thực đơn của người Mỹ gốc Ý.', N'/Contents/Uploads/files/Coffee-Package-Mockup-PSD-aa.jpg', 410000, NULL, 2, N'/Contents/Uploads/files/Coffee-Package-PSD.jpg', CAST(N'2020-11-07T12:39:20.403' AS DateTime), CAST(N'2020-11-09T16:43:49.163' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Content], [Images], [Price], [Sale_Price], [Category_ID], [MoreImages], [Created], [ModifileDate], [Status], [TopHot]) VALUES (29, N'Coffee Robusta', N'coffee-robusta', N'Khác với cà phê chế biến ướt là loại bỏ hết lớp chất nhầy trên bề mặt hạt cà phê thóc, phương pháp cà phê honey mật ong thường để lại một phần hoặc toàn bộ lớp chất nhầy trên bề mặt hạt trong quá trình làm khô. Vì vậy màu sắc của lớp vỏ thóc sau khi khô có màu gần với màu của cà phê chế biến ướt hoặc màu nâu đậm. Các màu của cà phê này chính là nguồn gốc của tên gọi sản phẩm “cà phê mật ong”, nghĩa là có màu sắc tương tự màu của mật ong. Tên của sản phẩm còn được thay đổi theo mức độ màu sắc của lớp vỏ thóc từ mật ong trắng “white honey” đến mật ong nâu đậm “black honey” với tỷ lệ lớp chất nhầy còn lại trên vỏ thóc ít hay nhiều. Mục đích của quá trình chế biến tạo ra sản phẩm này chính là tận dụng lớp cơm nhầy có khá nhiều đường (8-12%) trong đó để tạo màu cho lớp vỏ cà phê thóc thành màu tương tự mật ong và hy vọng rằng lớp đường này sẽ có đủ thời gian để ngấm vào nhân cà phê trong quá trình chế biến và làm cho nhân cà phê sau khi rang có hương và vị tốt hơn (Hương và vị của cà phê thường được tạo ra từ phản ứng maillar, phản ứng caramen hóa có sự tham gia của đường', N'/Contents/Uploads/files/Coffee-Package-Mockup-PSD-aa.jpg', 395000, 380000, 1, N'/Contents/Uploads/files/Coffee-Package-PSD.jpg', CAST(N'2020-11-07T12:50:55.457' AS DateTime), CAST(N'2020-11-17T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Content], [Images], [Price], [Sale_Price], [Category_ID], [MoreImages], [Created], [ModifileDate], [Status], [TopHot]) VALUES (31, N'Coffee Moka', N'coffee-moka', N'Coffee Moka là một chủng loại thuộc giống Arabica. Moka cùng họ với những loại cà phê nổi tiếng như: Typica, Bourbon, Icatu hay Mundo Novo. Moka được tìm thấy lần đầu tiên tại một thành phố cảng có tên Mocha thuộc Yemen, Vì vậy, giống cafe này còn có tên gọi Mocha Coffee.  Loại cà phê này lần đầu được đưa ra ngoài lãnh thổ Yemen là vào những năm cuối của thế kỷ 13, khi nhà truyền giáo Marco Polo đến đây và mang hạt Moka đi bán ở châu Âu.', N'/Contents/Uploads/files/Coffee-Package-Mockup-PSD-aa.jpg', 435000, 400000, 2, N'/Contents/Uploads/files/Coffee-Package-PSD.jpg', CAST(N'2020-11-07T13:22:23.597' AS DateTime), CAST(N'2020-11-17T00:00:00.000' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Projecteds] ON 

INSERT [dbo].[Projecteds] ([ID], [Name], [Slug], [Images], [Content], [MoreImages], [Customer], [Address], [finish], [Status]) VALUES (2, N'anh Do Mixi', N'anh-do-mixi', N'/Contents/Uploads/files/anhDo.jpg', N'<p>Được anh Độ ủng hộ</p>
', N'/Contents/Uploads/files/anhDo.jpg', N'Phùng Thanh Độ', N'Cao Bằng', CAST(N'2020-03-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Projecteds] ([ID], [Name], [Slug], [Images], [Content], [MoreImages], [Customer], [Address], [finish], [Status]) VALUES (3, N'Thầy Đa', N'thay-da', N'/Contents/Uploads/files/ThayDa.jpg', NULL, N'/Contents/Uploads/files/ThayDa.jpg', N'Quách Luyl Đa', N'Cà Mau', CAST(N'2020-10-15T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Projecteds] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleActions] ON 

INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (1, 2, 1)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (2, 2, 1)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (3, 2, 2)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (4, 2, 3)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (5, 2, 4)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (6, 2, 5)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (7, 2, 6)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (8, 2, 7)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (9, 2, 8)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (10, 2, 9)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (11, 2, 10)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (12, 2, 11)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (13, 2, 12)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (14, 2, 13)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (15, 2, 14)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (16, 2, 15)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (17, 2, 16)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (18, 2, 17)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (19, 2, 18)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (20, 2, 19)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (21, 2, 20)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (22, 2, 21)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (23, 2, 22)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (24, 2, 23)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (25, 2, 24)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (26, 2, 25)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (27, 2, 26)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (28, 2, 27)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (29, 2, 28)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (30, 2, 29)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (31, 2, 30)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (32, 2, 31)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (33, 2, 32)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (34, 2, 33)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (35, 2, 34)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (36, 2, 35)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (37, 2, 36)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (38, 2, 37)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (39, 2, 38)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (40, 2, 39)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (41, 2, 40)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (42, 2, 41)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (43, 2, 42)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (44, 2, 43)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (45, 2, 44)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (46, 2, 45)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (47, 2, 46)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (48, 2, 47)
INSERT [dbo].[RoleActions] ([RoleActionId], [RoleId], [ActionId]) VALUES (49, 2, 48)
SET IDENTITY_INSERT [dbo].[RoleActions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description]) VALUES (1, N'member', N'User')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description]) VALUES (2, N'HomeAdmin', N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([ID], [Images], [DisplayOrder], [Link], [Description], [Status], [Created], [ModifileDate]) VALUES (1, N'/Contents/Uploads/files/886887.jpg', 1, NULL, N'<p>coffee banner1</p>
', 1, CAST(N'2020-11-04T16:06:23.993' AS DateTime), CAST(N'2020-11-06T16:34:42.130' AS DateTime))
INSERT [dbo].[Sliders] ([ID], [Images], [DisplayOrder], [Link], [Description], [Status], [Created], [ModifileDate]) VALUES (2, N'/Contents/Uploads/files/965302.jpg', 2, NULL, N'<p>coffee2</p>
', 0, CAST(N'2020-11-04T16:46:07.793' AS DateTime), CAST(N'2020-11-06T16:34:31.137' AS DateTime))
INSERT [dbo].[Sliders] ([ID], [Images], [DisplayOrder], [Link], [Description], [Status], [Created], [ModifileDate]) VALUES (3, N'/Contents/Uploads/files/coffee-wallpaper-hd-1024x768-33844.jpg', 3, NULL, N'<p>coffee 3</p>
', 0, CAST(N'2020-11-04T16:53:10.527' AS DateTime), CAST(N'2020-11-04T17:34:44.463' AS DateTime))
INSERT [dbo].[Sliders] ([ID], [Images], [DisplayOrder], [Link], [Description], [Status], [Created], [ModifileDate]) VALUES (4, N'/Contents/Uploads/files/coffee-wallpaper-hd-1920x1080-33789.jpg', 4, NULL, N'<p>coffee 4</p>
', 0, CAST(N'2020-11-04T16:53:51.560' AS DateTime), CAST(N'2020-11-04T17:34:40.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [CreatedDate], [EditedDate], [FullName], [Phone], [Email], [Address], [Status], [RessetPasswordCode]) VALUES (1, 2, N'Admin', N'123', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-11-02T10:10:53.687' AS DateTime), N'Le Minh Tri', N'0947458799', N'leminhtri@gmail.com', N'can tho', 1, N'456')
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [CreatedDate], [EditedDate], [FullName], [Phone], [Email], [Address], [Status], [RessetPasswordCode]) VALUES (3, 1, N'MinhTri', N'12345', CAST(N'2020-09-04T00:00:00.000' AS DateTime), CAST(N'2020-11-02T10:08:57.113' AS DateTime), N'Nguyen Minh Tri', N'0123456789', N'nguyen@gmail.com', N'can tho', 0, N'12345')
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [CreatedDate], [EditedDate], [FullName], [Phone], [Email], [Address], [Status], [RessetPasswordCode]) VALUES (4, 1, N'nhuthao', N'fea41ab667f250434bc1a31b77184d8f', CAST(N'2020-11-01T15:58:11.733' AS DateTime), CAST(N'2020-11-17T00:00:00.000' AS DateTime), N'nhuthao', N'0954862112', N'haovnce140475@fpt.edu.vn', N'dong thap', 1, N'c9fb77bd4677b3daf2464ac84a72b185')
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [CreatedDate], [EditedDate], [FullName], [Phone], [Email], [Address], [Status], [RessetPasswordCode]) VALUES (7, 2, N'demo', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2020-11-02T10:20:27.547' AS DateTime), NULL, N'demo', N'0947235456', N'chaudang1702@gmail.com', N'Ca Mau', 1, NULL)
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [CreatedDate], [EditedDate], [FullName], [Phone], [Email], [Address], [Status], [RessetPasswordCode]) VALUES (12, 1, N'chaudang12', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2020-11-02T18:15:33.767' AS DateTime), NULL, N'chauhuudang', N'0123456788', N'dangchce140529@fpt.edu.vn', N'Ca Mau', 1, NULL)
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [CreatedDate], [EditedDate], [FullName], [Phone], [Email], [Address], [Status], [RessetPasswordCode]) VALUES (13, 1, N'demo1', N'202cb962ac59075b964b07152d234b70', CAST(N'2020-11-15T11:18:36.597' AS DateTime), NULL, N'nguyen demo', N'0125478951', N'demo1@gmail.com', N'dong thap', 1, NULL)
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [CreatedDate], [EditedDate], [FullName], [Phone], [Email], [Address], [Status], [RessetPasswordCode]) VALUES (14, 1, N'dang', N'5371b1ed1d6e6640aa8d34954e2056f3', CAST(N'2020-11-15T12:44:56.623' AS DateTime), NULL, N'dang', N'0969348502', N'chauhuudang1702@gmail.com', N'Cà Mau', 1, N'039c12d6-728c-42da-9a82-ec8a9d46f272')
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [CreatedDate], [EditedDate], [FullName], [Phone], [Email], [Address], [Status], [RessetPasswordCode]) VALUES (15, 1, N'bao', N'fe01ce2a7fbac8fafaed7c982a04e229', CAST(N'2020-11-15T15:25:38.667' AS DateTime), NULL, N'bao', N'0125489123', N'baonq3108@gmai.com', N'can tho', 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Categories_dbo.Categories_ParentID] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_dbo.Categories_dbo.Categories_ParentID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_Oder_ID] FOREIGN KEY([Oder_ID])
REFERENCES [dbo].[Orders] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_Oder_ID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_Product_Id] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_Product_Id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Users_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Users_User_ID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_Category_ID] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_Category_ID]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleActions_dbo.Actions_ActionId] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([ActionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_dbo.RoleActions_dbo.Actions_ActionId]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleActions_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_dbo.RoleActions_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId]
GO
