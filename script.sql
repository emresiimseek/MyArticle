USE [master]
GO
/****** Object:  Database [MyArticle]    Script Date: 4.07.2020 18:13:26 ******/
CREATE DATABASE [MyArticle]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyArticle', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyArticle.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyArticle_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyArticle_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyArticle] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyArticle].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyArticle] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyArticle] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyArticle] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyArticle] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyArticle] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyArticle] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyArticle] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyArticle] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyArticle] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyArticle] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyArticle] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyArticle] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyArticle] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyArticle] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyArticle] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyArticle] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyArticle] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyArticle] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyArticle] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyArticle] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyArticle] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MyArticle] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyArticle] SET RECOVERY FULL 
GO
ALTER DATABASE [MyArticle] SET  MULTI_USER 
GO
ALTER DATABASE [MyArticle] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyArticle] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyArticle] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyArticle] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyArticle] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyArticle', N'ON'
GO
ALTER DATABASE [MyArticle] SET QUERY_STORE = OFF
GO
USE [MyArticle]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4.07.2020 18:13:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 4.07.2020 18:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[PublishedAt] [datetime] NOT NULL,
	[Content] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 4.07.2020 18:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4.07.2020 18:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200704150848_Initial', N'3.1.5')
GO
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (1, 1, 1, N'Rerum quia nihil iste omnis laborum sint voluptas.', N'Quis sint totam est.', CAST(N'2019-10-15T00:00:00.000' AS DateTime), N'Odit sequi laboriosam qui ea et ut nemo. Ullam tenetur aut. Est accusantium dolorem vel error. Excepturi velit voluptatibus corrupti rem. Aliquam accusamus qui animi nisi dolor quasi. Dolor error vitae aut ut et voluptatibus. Asperiores sed minus. Omnis est quos accusantium et. Debitis numquam vel fugit. Qui dolore aut. Error quidem enim non expedita mollitia et. Iure doloremque qui odio quis ut nobis deleniti. Tempore sed quae est neque eum magnam. Ipsum inventore eum dolor rem accusamus nostrum ut. Quas voluptatum consectetur. Soluta earum veniam. Omnis totam est aut deserunt molestiae ipsum. Quae optio molestiae quisquam. Et ut minima facere. Amet quidem est ut vel. Dolorem recusandae laudantium. Molestiae quod molestias repudiandae est sint. Minima ex voluptatem aut est et. Consequatur delectus nisi consequatur temporibus molestias est. Blanditiis beatae id et. Sunt doloribus ex consequatur. Est aut error ipsum. Quas aut ipsa. Maiores dolores adipisci sunt asperiores. Architecto voluptate quibusdam eaque aspernatur. Est iste eligendi nihil dignissimos voluptatem sunt excepturi. Voluptatem sunt aut assumenda voluptatibus id minima. Quidem aliquid vero qui cumque aut. Dolor ea sed voluptas magni. Dolorem minima ea. Est accusamus tempore. Repudiandae doloremque ex. Nam voluptatibus alias a. Nostrum hic impedit est. Temporibus doloremque eos accusamus eum. Officiis aut laudantium est rerum quis porro beatae. Doloribus sunt expedita suscipit qui dolores. Eum ipsa ipsum voluptates. Voluptatem quia sit velit. Odit similique sunt iure laboriosam. Aspernatur iste tempore cumque excepturi. Eos ut molestias minus. Praesentium aut beatae rerum quos hic voluptatem. Dolores rerum beatae rerum non vel. Illo fugiat et qui est. Accusantium veritatis cum ipsa ex quis velit pariatur. Vitae ab quia unde.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (2, 2, 2, N'Sint fugiat eum inventore.', N'Dolor aut architecto qui neque.', CAST(N'2020-04-04T00:00:00.000' AS DateTime), N'Voluptatibus facere illo dicta illum aut. Omnis saepe ut perspiciatis perferendis voluptatem mollitia. Exercitationem in occaecati. Cupiditate natus expedita velit quaerat. Reprehenderit et quo voluptatum nam. Possimus voluptatum voluptatem tempore saepe et perferendis ut. Sit corporis repellendus dolores nam atque non nihil. Perspiciatis voluptas enim et optio aut et non. Rerum quas non. Dolores aut rerum odio libero ab dolor rerum. Exercitationem iste ad quia eius. Error animi id reiciendis. Velit reiciendis eligendi doloremque et dolorum ut. Ea dolorum magni. Vel sint et. Minus consequatur voluptates qui sint numquam. Provident consequatur ut. Dolores et quia facilis quaerat et deserunt qui. Sapiente sint dolorem qui rerum sit. Laboriosam alias eum vel minima ut. Rem voluptatem quisquam vel. Beatae atque nemo sit. Aliquid nihil sed asperiores. Sed placeat voluptas voluptatem et ut tempora. Magni officiis vel et et qui non esse. Ut odio asperiores voluptatum et. Et labore impedit provident nesciunt. Culpa voluptates unde. Et aut sed omnis et. Quia maxime eveniet natus ratione ipsam ut. Ea earum consequatur nostrum sapiente nemo. Ut commodi quam error. Non in modi architecto animi quo expedita. Magni reprehenderit voluptatibus placeat et autem quis. Quia aut voluptatem debitis maiores. Nam reprehenderit qui quia qui. Nobis et vitae. Consequatur maiores id necessitatibus dolore a eum. Aliquam nihil labore officia dolor exercitationem est voluptatem. Occaecati sint velit ratione laborum quaerat et dolores. Rerum possimus beatae nihil consequatur ut. Tempora nobis provident ea aliquid. Totam debitis facilis est. Quos temporibus est magni architecto et. Ad sed voluptatum. Vel dignissimos id. Et blanditiis iste sed placeat ut est amet. Rerum eligendi est ut nostrum. Corporis natus ut esse praesentium. Officiis fugit et eveniet cupiditate. Voluptate ullam non doloremque.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (3, 3, 3, N'Non omnis ipsum dolorem.', N'Dignissimos enim dolores qui quisquam quia cumque in neque.', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Ullam quasi perferendis qui. Quod perspiciatis consequatur laudantium reprehenderit. Excepturi nisi quasi aut. Numquam dignissimos nihil a eum. Quas modi ipsa. Atque alias odio quibusdam nihil. Itaque sit dicta autem repudiandae unde minus qui. Aliquid doloremque nihil minima neque. Sed aut aliquid et omnis. Repellendus dignissimos amet nostrum. Cupiditate sed quibusdam. Mollitia est minima voluptatem aut eum. Quibusdam ad consequuntur. Illum quasi asperiores enim praesentium ipsa. Similique deleniti eveniet vel facere velit ut. Commodi autem voluptas odio in. Et ipsam adipisci voluptatum. Est aut ipsam. A animi est fugiat vel repellendus. Sit repudiandae perferendis. Beatae possimus ea fugiat debitis hic dolor. Omnis qui est enim saepe ipsa ad est. Corrupti occaecati quisquam rerum debitis omnis delectus. Aut velit quos est quia vero a. Quo deleniti mollitia non porro esse ab nemo. Dicta tempora et non itaque quia. Iure aperiam enim. Expedita tenetur incidunt nesciunt labore recusandae. Ut beatae qui. Consequatur sint aut eum occaecati cumque. Quo et rem qui et. Molestiae rerum voluptas culpa incidunt est. Culpa rem repudiandae facere eaque odio. Voluptatibus eos nemo quas similique ut. Excepturi rem doloribus alias. Illum deserunt culpa corrupti inventore sit fugiat ipsum. Quasi animi voluptate voluptatem doloremque minima necessitatibus. Molestiae unde sapiente placeat. Rerum quae atque deleniti delectus dignissimos optio earum. Aperiam explicabo sed non et. Corporis natus quia voluptas atque ullam. Tempora et reiciendis. Repellat doloribus quae fugit quisquam ut placeat omnis. Blanditiis corporis eum maiores. Quo iure distinctio. Voluptatem aperiam culpa non facere reiciendis. Illum et et a sit non est doloribus. Quae dolorum sint non enim eaque facilis officia. Facilis asperiores at rerum et ea velit. Neque nulla corrupti deserunt molestiae sint nam voluptas.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (4, 1, 1, N'Cum autem sed consectetur.', N'Modi ipsa esse accusantium.', CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'Consequatur qui quas illo. Rerum sunt in quam. Omnis omnis tempora dolores ipsam quibusdam. Sapiente placeat illo quia inventore repudiandae. Consequatur corrupti hic officiis quas. Consectetur reiciendis dolorem repellat voluptatem sunt. Iste doloribus ut ex dolor. Sed facilis commodi dicta eum. Sed sint voluptas aperiam. Aliquam perferendis debitis ut quia iusto possimus. Iusto voluptas neque cumque asperiores molestiae rem est. Voluptas nihil aspernatur doloremque et. Autem vel sunt veniam labore ipsam quia non. Ut ducimus neque porro autem hic. Labore magnam necessitatibus aperiam incidunt. Voluptate quae illo quas vitae error ipsum. Error quia voluptas mollitia repellendus pariatur magnam. Saepe id est. Nihil impedit dolor. Corporis nam maiores exercitationem. Qui voluptatibus aliquam molestias exercitationem voluptatem. Sit quos eveniet velit qui soluta minima. Laudantium eos natus. Ullam cum ut est illo soluta. Commodi dolore autem nobis dolores dignissimos odit. Iusto omnis impedit at ab. Non laudantium fugit velit odit ab consequuntur. Ut dolore nesciunt. Laboriosam nesciunt cum sunt itaque velit accusamus hic. Consequuntur non et dolore. Sit velit qui dolor qui in eveniet. Aliquam enim maiores. Non et et quos pariatur. Ex expedita earum consectetur illo laudantium. Enim placeat magni quasi. Sint incidunt vel dignissimos molestias suscipit totam mollitia. Voluptas minus ut unde. Praesentium quae similique. Eos aspernatur et facilis quaerat necessitatibus laudantium. Sint asperiores voluptas quae ipsum. Earum esse a officia harum sit autem consequatur. Quia aspernatur consectetur provident. Dolor nihil laboriosam quia aut asperiores exercitationem doloribus. Id neque expedita. Cum tenetur iusto excepturi. Est iste harum deleniti ipsa rerum. Mollitia aut non sunt earum laudantium. Repellendus optio autem molestias. Neque repellat officia aut cum. Corporis quasi et aperiam qui et eos nulla.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (5, 2, 2, N'Quia ut sunt quas ut nulla inventore.', N'Aut nulla sequi repellendus nemo laborum repellat.', CAST(N'2019-11-25T00:00:00.000' AS DateTime), N'Neque autem expedita iste qui est. Vel minus accusamus est animi sit. Debitis quas dolorum. Molestiae mollitia quia. Maiores laborum doloremque et aperiam est voluptas vel. Repellendus asperiores quo. Quae architecto deleniti recusandae ut enim praesentium consequatur. Dolor dicta officiis quae. Natus voluptas quia explicabo consectetur. Voluptas ut qui. Eos rerum asperiores. Fuga porro quia adipisci et ducimus aut. Iste reiciendis nesciunt. Est ullam est consequatur magnam. Voluptate et deserunt illo. Sunt et optio voluptatibus architecto nam. Nesciunt voluptas et quam explicabo. Accusantium id nihil non perspiciatis asperiores. Ut autem dolores facilis. Consectetur neque ut aperiam illo dignissimos hic. Rem vel est accusantium. Repellat ipsum aliquid at. Ea eius doloribus atque molestiae quo non quam. Doloribus dolores et. Eaque fugiat rerum animi. Delectus porro sint. Non et velit sequi et nihil corrupti aut. Cum minima aut pariatur tempore. Commodi ad quo maiores pariatur qui voluptas. Nostrum ipsum recusandae qui est soluta a excepturi. Nihil id voluptate. Modi vel voluptates consectetur itaque qui praesentium fugit. Ut odit est. Qui voluptas iste odit voluptatem atque. Optio voluptate corrupti. Ullam omnis et voluptas ipsum blanditiis. Officia dolorum quia nulla est et ut. Molestias amet excepturi tempora. Ea cumque omnis eligendi. Quis itaque laborum dignissimos ipsam quia et. Enim accusantium voluptatem sit vitae nihil. Suscipit minus officiis vel cum aliquid. Voluptatem ducimus dolor beatae consequatur officia aut. Commodi ea temporibus facere voluptas quia est. Voluptatem accusantium beatae voluptas quas fuga deserunt quo. Non adipisci voluptate atque voluptas explicabo. Voluptatem magni a occaecati incidunt beatae. Tempore rem et aut. Pariatur atque culpa. Quo nesciunt nulla iusto totam voluptates nemo voluptatem. Necessitatibus consequuntur nisi tenetur voluptatem. Labore quod dolor tempora et.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (6, 3, 3, N'Temporibus cupiditate numquam sed sed.', N'Perferendis ad iste et.', CAST(N'2019-08-26T00:00:00.000' AS DateTime), N'Nam architecto sint dolor adipisci illum quia. Vero cumque aut. Commodi quia deleniti ea nihil eveniet rerum. Perspiciatis officia tenetur suscipit voluptatem et quis. Iusto molestiae aut qui. Rerum ut et suscipit quaerat. Similique ullam eum commodi debitis soluta. Ut vitae similique dignissimos iste. Sint ut non enim molestiae facilis ducimus vel. At commodi sed ut. Itaque mollitia cum provident fuga voluptas sapiente. Qui ratione sed repellat neque. Eum ex consequuntur culpa sit. Ea aliquam possimus nulla et tempora occaecati. Dolorem voluptatum dolores ab iusto aspernatur assumenda. Nisi aliquam excepturi voluptas. Maxime pariatur dolor qui et. Magni veniam reiciendis accusamus id. Sint corporis voluptas est. Nihil corporis id tempore voluptatem odio maiores. Optio quam earum nesciunt eos. Molestiae consectetur perspiciatis. Vel odit aut voluptas. Soluta provident quasi delectus quas sunt animi. Vel qui atque saepe dolores velit. Distinctio a vel deleniti voluptas est. Dicta aspernatur dolores accusantium et. Unde consectetur magnam natus maxime mollitia dolorum. Commodi laboriosam laborum et totam illo. Deserunt porro sed voluptas ab odio. Cumque perferendis et quo. Doloribus sunt repudiandae aut voluptas sapiente. Recusandae sunt ipsa. Quo aperiam expedita doloremque iure eveniet facilis. Quis in consequatur repellendus quam ut tenetur. Quia aut tenetur aut quisquam nihil dolores. Vero necessitatibus itaque officia ipsam. Explicabo id aliquid quisquam qui. Officia voluptate ipsa error aut maiores. Minima quam qui. Perspiciatis itaque sed. Quia enim laboriosam qui consequatur. Illum nisi aut animi vel pariatur eum. Molestiae voluptas laborum debitis ullam dolor. Atque error amet dolores perspiciatis sunt doloribus. Incidunt nostrum laborum. Tempora consectetur pariatur magni sit impedit dolorem rerum. Illo reiciendis enim nobis. Similique illum aut. Qui alias nam.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (7, 1, 1, N'Ipsam est dolor aliquid quos.', N'Autem porro qui ea in.', CAST(N'2019-07-26T00:00:00.000' AS DateTime), N'Ipsam quae quis rem sequi et vel. Sint est aliquam vero maxime saepe eligendi. Voluptas praesentium eum suscipit consequatur aut aliquam deleniti. Quis soluta cumque et sunt quia enim iure. Et non laboriosam. Voluptatem adipisci aut fuga dolore eos. Accusamus rerum et. Sunt nobis blanditiis minus sequi delectus rem. Totam voluptas nihil dolores ipsam error temporibus accusamus. Vel vero sit aliquam enim. Sed numquam dicta. Dolore quibusdam quia. Quia repellendus corrupti ut ut. Reprehenderit est non nobis consequatur dicta. Est voluptatem cupiditate voluptatem quasi autem sint saepe. Et hic odio. Est temporibus ullam assumenda quis ex corrupti quos. Iste ullam dolorem aut nisi magni nesciunt non. Nihil quae repellendus et quia aliquid vero iste. Molestias dolore architecto. Voluptatibus sit quas eligendi alias porro similique. Nam labore itaque. Consequatur aut aut autem. Molestiae ex nesciunt voluptatem totam sit. Et laudantium rerum. Ex earum repellat voluptas dolores qui. Tempore illum quisquam vel voluptatem ut. Minus tempore dolores. Quod voluptatem ipsam repellat alias sed deserunt. Eaque fugit ut voluptates totam. Ducimus rem quia eos alias. Veniam aspernatur labore. Architecto id illo saepe sapiente. Aliquid sunt voluptatem. Voluptates earum aut. Occaecati dolores commodi. Nihil deserunt voluptas ratione omnis exercitationem sint dolores. Iure provident animi eligendi dolor. Sit quia quo aliquid. Dignissimos provident ea culpa esse eos ut labore. Mollitia aut natus sint iure nobis rerum autem. Facilis veniam cum et. Sed dolorem necessitatibus ut libero aut. Est esse similique ipsum eos. Illo omnis eos reiciendis qui facere. Est minus voluptatem perspiciatis reprehenderit enim ipsam. Nulla quo nisi id aut sunt. Aut maxime sunt libero dolorum. Facere ut atque distinctio quibusdam. Atque quod consectetur amet explicabo aliquid soluta perferendis. Aut molestiae rerum autem. Velit id maxime.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (8, 2, 2, N'Illum laboriosam perferendis officiis doloribus.', N'Iusto dolore tempora quia modi sit explicabo ex velit.', CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'Deserunt reiciendis vel laudantium hic. Cumque qui numquam quos. Non corrupti quaerat nostrum amet occaecati ea temporibus. Sed qui animi inventore maiores excepturi. Laborum sed libero aut voluptas repudiandae dolorem alias. Molestiae voluptate eum. Repellendus vero porro. Rem mollitia impedit consequatur aut. Consequuntur enim quo omnis aut dolore qui est. Et libero soluta. Earum iusto et quod nesciunt et omnis. Debitis alias possimus voluptas. Velit vel sed provident non voluptate. Quae maxime rerum asperiores quasi perspiciatis necessitatibus odio. Perferendis ad ratione porro. Ipsum nostrum earum distinctio fugit. Excepturi tenetur occaecati vero quos vitae. Veritatis vero laboriosam reprehenderit rerum perferendis incidunt corporis. Recusandae commodi accusantium ut. Et quas sit in maiores. Fuga doloremque nihil laboriosam dignissimos. Enim fuga necessitatibus optio sunt sed et et. Modi sit et. Ut nihil sit inventore iste. Ut officia accusamus. Impedit reprehenderit ut ut. Sit doloribus culpa voluptas perferendis tenetur. Modi molestiae perspiciatis dignissimos aperiam accusantium consequatur. Deleniti tempora explicabo. Consequatur officiis molestiae sit doloremque. Aliquid nihil est aperiam facilis repudiandae quasi tempore. Ut qui quibusdam earum ut. Et debitis eaque necessitatibus cumque molestiae atque velit. Autem sunt voluptates modi. Est qui iure porro maxime at. Enim aut amet qui minus consequatur. Aliquid commodi consequatur modi quia et. Quisquam dolor amet reprehenderit omnis eos vel. Qui sit inventore. Rerum odit dicta aut omnis itaque ex ut. Error nostrum vel laborum. Eligendi ut voluptatem. Illo recusandae ut tempora hic. Et eum architecto ut omnis sit. Omnis rerum autem placeat veritatis doloribus quis totam. Aut labore nihil libero. Cupiditate nihil velit exercitationem explicabo quas dolor. Ab non quasi rerum perferendis ut. Odit delectus vitae nisi rerum et possimus. Aut fugit hic voluptatem assumenda ut autem. Consectetur esse assumenda perspiciatis corrupti. Soluta alias est iure.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (9, 3, 3, N'Rerum sed error in qui beatae voluptatem optio.', N'Voluptatem voluptatum omnis minus corporis explicabo qui.', CAST(N'2019-12-12T00:00:00.000' AS DateTime), N'Minus in dicta. Quis omnis optio eveniet cum tenetur. Aspernatur omnis reiciendis laudantium numquam beatae. Voluptatibus aliquid est occaecati voluptatem non. Nam ea ut aut neque. Cum est quo ut. Et voluptatem dolorem ex et. Enim sed illo tempore optio laboriosam. Ad dolorem aliquid. Explicabo perspiciatis ab accusamus. Animi inventore officia eligendi quia. Veniam libero est nobis. Facilis dolores provident explicabo. Voluptatem numquam quaerat cum reprehenderit nesciunt. Aut adipisci omnis maxime temporibus et eos quia. Ut commodi aut sit repellendus ut eligendi qui. Excepturi repellat dolorum autem laudantium nulla aliquid consequatur. Labore consectetur voluptatibus aut eum. Vero enim ab excepturi. Fugit est odit voluptatem blanditiis. Quidem est hic autem ullam. Porro unde sint id ea ut. Ratione eaque iste at qui. Repellendus sunt voluptatem doloribus ipsam porro quaerat. Unde porro aperiam nesciunt eaque et. Non velit quos. Rerum voluptatem voluptas. Temporibus quia molestiae consequatur. Aut vitae cumque blanditiis itaque harum laborum sequi. Ut id debitis occaecati omnis in. Excepturi laborum in nulla et velit. Asperiores et eum ab. Neque omnis quaerat. Dolorem molestiae eligendi sed cum aut blanditiis vero. Quibusdam quia et veritatis praesentium incidunt. Harum quis soluta optio enim quo aspernatur aut. Soluta repellendus id dolore. Possimus incidunt nemo ipsum culpa. Non repellendus qui ut eveniet. Quia voluptatem eveniet id explicabo assumenda ut velit. Sed nihil exercitationem officia vel voluptatibus illo. Et dolores rerum dicta voluptas inventore quisquam repellat. Fugit quibusdam voluptatibus dolor vero. Vitae quisquam molestias cupiditate esse accusantium voluptas. Neque consequatur vero sed rem adipisci aut autem. Dolor deleniti ea eaque error sit. Libero perspiciatis officiis nisi. Consequatur rerum sint. Ut cum officiis rerum cupiditate quia perferendis magni. In omnis molestiae rerum esse qui. Excepturi esse totam nam et.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (10, 1, 1, N'Ut quasi ut alias.', N'Optio reprehenderit aperiam sit commodi sint et vitae.', CAST(N'2020-01-21T00:00:00.000' AS DateTime), N'Vel iusto excepturi natus odio. Velit repellat dolores dolor. Ratione repudiandae officia dignissimos accusamus sunt non. Dolor culpa aliquam. Nihil cum voluptas quam sit. Natus quia praesentium. Enim debitis hic. Temporibus error quis voluptatem rem quia. Voluptas qui et assumenda autem qui. Non illo odio voluptas repellendus distinctio velit. Blanditiis repellat tempora. Earum est recusandae. Unde accusamus sapiente architecto. Voluptas vitae laborum. Ducimus sed molestiae deleniti laboriosam ut corporis ea. Consectetur ea quisquam eos asperiores quis. Eveniet dolores earum ut tempora atque. Quibusdam qui quia voluptatum maxime velit recusandae voluptatem. Reprehenderit et unde odio. Sint natus dolorem occaecati et est reprehenderit. Nulla earum nemo eligendi autem et. Illo molestiae voluptatem nemo. Et numquam et natus nesciunt et. Distinctio earum labore vel mollitia praesentium veniam. Error alias neque veritatis sapiente et quia nisi. A enim facere odio modi dolorum et. Voluptatum enim autem. Explicabo in distinctio ut non. Architecto delectus dolore nihil. Voluptas laborum vel aperiam. Consequatur numquam illum voluptatem fugit dolorum aliquid fugiat. Aut et praesentium repellat fuga iure nobis. Autem et sint adipisci. Molestias esse accusantium hic ipsum sunt ut. Illum non molestiae. Doloribus id nemo sed ut ducimus aperiam. Unde sunt aut autem porro. Voluptas maiores maxime porro. Qui architecto omnis et ducimus et nihil vel. Similique ut sunt odit nostrum corporis maxime. Facere facilis ducimus illo est ut. Fugiat odit architecto et. Ea est dolor eum et reiciendis nisi. Consequatur qui libero ad porro nemo ea qui. Voluptas ea nesciunt non corporis pariatur odit. Nemo expedita et id dolore. Magnam distinctio quibusdam in placeat pariatur occaecati expedita. Omnis corporis iste optio vel occaecati ea ducimus. Unde labore sunt laudantium nobis rerum odio consequatur. Porro nulla delectus molestias nihil dolorem autem illum.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (11, 2, 2, N'Nobis eaque aperiam dolores corrupti qui natus.', N'Maxime magnam velit minus saepe quaerat temporibus rerum.', CAST(N'2019-11-16T00:00:00.000' AS DateTime), N'Eos vel optio nihil molestias voluptas. Atque asperiores quia ex. Doloribus quia magni et eos ipsum. Dignissimos et ipsum deserunt soluta temporibus fugit adipisci. Laboriosam ut tempora ut. Minus voluptates quisquam cumque voluptatem dicta. Est corrupti est. Voluptas libero earum sunt non necessitatibus dolorum. Ipsa delectus quidem fugiat. Aperiam ut maiores fugit tenetur. Et repellat quod placeat totam eos blanditiis. Libero vel dolores ut. Amet voluptatum error impedit consequatur porro quae ut. Sint et eaque excepturi voluptas nihil. Perspiciatis minus delectus. In possimus a ratione. Facilis accusantium excepturi vero. Officiis dolor est rerum et. Ea fuga qui. Ullam eum magni soluta numquam. Dolor sunt repellendus. Ex est commodi inventore. Ipsum et dolor laboriosam maiores sed. Voluptas magnam earum aut est ipsum fugit. Ipsa natus aliquam. Pariatur et inventore quia saepe omnis. Culpa similique necessitatibus et architecto quas ducimus natus. Aspernatur vel ut. Optio tempore est dolor voluptatibus saepe. Similique ab enim excepturi saepe. Cum inventore assumenda est earum. Ratione sed quaerat est sed. Placeat iure non et facere autem impedit. Ea aut nisi quam. Autem minus repellat alias. Maiores non pariatur ab veniam optio qui et. Eos itaque excepturi. Aut at id repellat doloremque. Placeat quia animi. Et totam sunt eius magnam. Soluta delectus a in architecto tempore veritatis. Eum voluptatem praesentium maiores in aliquam soluta eos. Atque fuga nobis magnam possimus illo dolorem non. Accusantium quae et alias. Minima a quasi. Impedit quidem laborum molestiae sint. Vel est asperiores consectetur esse est. Perferendis sit laudantium amet rem. Et provident aut quia asperiores et et vel. Aliquid velit distinctio totam quae aut.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (12, 3, 3, N'Et aliquam quam necessitatibus autem voluptatibus repellat soluta eveniet.', N'Praesentium est velit omnis sunt ab mollitia enim a.', CAST(N'2019-07-16T00:00:00.000' AS DateTime), N'Id ut ut autem quaerat fugiat dolores suscipit. Id placeat sint minima repellat. Ipsum eligendi ut totam nulla dicta. Fuga possimus minima facilis ad placeat et. Similique veritatis voluptatem et ratione quasi recusandae accusantium. Atque velit adipisci veniam dolorem nostrum. Et quia quas consequatur reiciendis quae dolorem. Voluptate est culpa dolores quo ea et voluptas. Dolor sint quasi dolores. Magni itaque occaecati qui adipisci quo laudantium quia. Soluta accusamus et sed odit aut dolor et. Maiores maxime saepe id sequi. Labore sequi assumenda autem molestiae repudiandae. Ut incidunt consequatur et amet sed. Aut ab eum dolores vero. Delectus soluta eum et. Necessitatibus provident repellendus. Sunt placeat dolor alias ex tempora fugiat. Dolorum dolores ratione non autem. Sit dicta et quaerat sit asperiores qui. Esse quo rerum nam quia porro doloremque. Est at maxime in. In non voluptas quod. Ab sint accusantium ducimus. Laboriosam molestiae eius consequatur corporis ex. Tempore accusantium voluptas aut veniam ipsa. Odit nesciunt et. Natus et voluptate sint quo qui. Impedit voluptatem debitis dignissimos. Voluptatum totam est et mollitia maiores consequatur qui. Voluptates repudiandae nobis minus illum eveniet autem. Id quod dignissimos. Ullam qui quis quae hic omnis est recusandae. Rem qui et. Qui nihil autem quaerat error. Et sapiente quia ut dolorem reprehenderit optio. Iste ea expedita consequuntur. Fugit nulla et esse. Dignissimos sint et facilis alias. Sunt distinctio unde ipsum ipsa. Perferendis qui blanditiis laboriosam et velit. Magni consequuntur sunt tenetur alias dolor aut. Eum et magni totam sed est error. Nobis quidem aperiam. Ratione aut est beatae soluta. Ut voluptatem quia vel eius possimus repellat. Error aut aspernatur adipisci a est cumque. Impedit nam nemo suscipit error aliquam aut voluptatem. Non culpa officiis. Ipsa quasi voluptas consequatur exercitationem quidem sed. Est dolores sed corrupti quia.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (13, 1, 1, N'Numquam corrupti tempore voluptatum qui quisquam ex illum natus.', N'Aut deleniti perspiciatis ut.', CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'Consequatur non iusto quia excepturi sit aut. A quidem nulla amet. Laudantium voluptatum sapiente quisquam omnis. Voluptatem qui nam rerum. Similique iste autem rerum est. Soluta vero tempore omnis est at. Aut ullam nemo quod. Dolores hic est quo enim excepturi cumque. Sed dolorem ea ipsa. Quia pariatur cumque eum. Maxime nostrum molestias eos nam est qui. Ad qui iusto sunt eos. Asperiores voluptatem vel iusto aut incidunt. Autem saepe laboriosam aut. Aut neque laudantium dolor blanditiis sed. Enim labore veniam. Nisi consequatur saepe quo impedit qui eveniet. Qui culpa nostrum labore ut. Provident quia voluptatum id ad et impedit aperiam. Sint praesentium qui. Sint id consectetur voluptatem sed id quae quia. Sint soluta autem aperiam sed. Accusamus deleniti pariatur. Doloremque qui iure culpa sunt rerum cupiditate. Voluptate autem veritatis et voluptatum consequatur magni eveniet. Facere omnis sunt voluptate fugiat illo modi. Quia non eligendi. Voluptates omnis aliquid similique et. Rerum doloremque iure voluptatem nihil. Voluptatem est nemo omnis eum. Asperiores quia eveniet error eaque ipsum incidunt excepturi. Qui consectetur voluptatem. Quo error repellat. Quia repellendus at. Ea praesentium qui qui ullam dolores. Aut id harum veniam est recusandae. Exercitationem ab eligendi dolor et dolorem facilis. Cumque mollitia placeat. Numquam atque voluptas. Expedita corrupti numquam illo mollitia aspernatur fugit. Nesciunt iste sapiente recusandae ut. Suscipit rem autem. Fuga occaecati ea temporibus odio. Itaque cumque harum autem eum molestiae corrupti explicabo. Incidunt assumenda corrupti qui vero iure. Qui nesciunt atque architecto. Molestias aut deleniti dolores. Labore dolorum rerum nisi temporibus placeat. Harum cum sit facere ipsam. Eius aut dolores quis occaecati minima velit. Corporis quo at laboriosam nobis ipsum. Placeat nisi dolor ut ducimus ratione.')
INSERT [dbo].[Articles] ([Id], [AuthorId], [CategoryId], [Title], [Description], [PublishedAt], [Content]) VALUES (14, 2, 2, N'Voluptatem deleniti repellat hic magnam.', N'Illo et ut et veritatis.', CAST(N'2020-06-25T00:00:00.000' AS DateTime), N'Rerum accusantium eaque. Sint doloribus cumque laudantium dolorem pariatur. Qui iusto et hic. Eum voluptatem sapiente rerum officiis sunt et. Consequatur numquam qui libero iure. Et iusto et necessitatibus asperiores quis et. Exercitationem eum sit et. Atque corrupti modi quasi esse similique quia ipsam. Quo porro deserunt et. Enim delectus amet voluptatem repudiandae sapiente magnam. Et omnis et nam voluptas. Magni accusantium soluta est et. Quia atque dicta reprehenderit quo impedit. Aut accusamus quia. At ea est ut. Quia consequuntur sed tenetur dignissimos totam. Labore delectus asperiores quo. Est excepturi iusto. Eos delectus non enim quis cupiditate. Optio corporis sed cumque deserunt amet doloremque quis. Assumenda est et velit dolorem nesciunt eius voluptatem. Eos minima vero perspiciatis. Facere voluptas eos est. Sed qui expedita veniam reiciendis in. Et ex impedit aliquam commodi labore. Voluptates aperiam numquam cumque earum. Aperiam tenetur et ex modi quidem libero nostrum. Tempore aut vitae quia asperiores laboriosam hic. Eos odit dolor aut et porro qui. Expedita nihil maxime quis. Id iste ipsam aut dignissimos atque eos voluptatum. Quos aut cum earum. Natus dolor ratione. Ipsum dolores ipsa tenetur numquam. Sint repellat consequatur provident officia. Est qui veritatis. Laborum voluptas reiciendis qui est tempora ratione odit. Eaque ipsa ipsum quidem repellat. Quam vero odio aliquam. Omnis sed qui voluptas qui sit nisi. Sit laudantium consequuntur molestiae vel vel animi. Sed eligendi quasi minus aperiam nam. Et et voluptas illum esse amet. Officia eaque reiciendis magni nihil enim et. Porro cupiditate ut ut delectus molestiae quia ut. Est voluptas nam aut assumenda quia enim. Voluptatem perspiciatis eveniet. Sit laborum ipsa voluptatem sed. Nam asperiores harum quia nulla. Ipsa ut officiis.')
SET IDENTITY_INSERT [dbo].[Articles] OFF
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([Id], [Name], [LastName], [IsActive]) VALUES (1, N'Citlalli', N'Leannon', 1)
INSERT [dbo].[Author] ([Id], [Name], [LastName], [IsActive]) VALUES (2, N'Tyler', N'Parker', 1)
INSERT [dbo].[Author] ([Id], [Name], [LastName], [IsActive]) VALUES (3, N'Hanna', N'Welch', 0)
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Title]) VALUES (1, N'Shadow')
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (2, N'Oliver')
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (3, N'Angel')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
/****** Object:  Index [IX_Articles_AuthorId]    Script Date: 4.07.2020 18:13:26 ******/
CREATE NONCLUSTERED INDEX [IX_Articles_AuthorId] ON [dbo].[Articles]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Articles_CategoryId]    Script Date: 4.07.2020 18:13:26 ******/
CREATE NONCLUSTERED INDEX [IX_Articles_CategoryId] ON [dbo].[Articles]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Author_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Author_AuthorId]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [MyArticle] SET  READ_WRITE 
GO
