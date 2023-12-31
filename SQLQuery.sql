USE [master]
GO
/****** Object:  Database [EOS_Admin]    Script Date: 18/07/2023 11:31:38 SA ******/
CREATE DATABASE [EOS_Admin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EOS_Admin_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EOS_Admin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EOS_Admin_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EOS_Admin.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EOS_Admin] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EOS_Admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EOS_Admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EOS_Admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EOS_Admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EOS_Admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EOS_Admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [EOS_Admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EOS_Admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EOS_Admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EOS_Admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EOS_Admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EOS_Admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EOS_Admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EOS_Admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EOS_Admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EOS_Admin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EOS_Admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EOS_Admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EOS_Admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EOS_Admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EOS_Admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EOS_Admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EOS_Admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EOS_Admin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EOS_Admin] SET  MULTI_USER 
GO
ALTER DATABASE [EOS_Admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EOS_Admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EOS_Admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EOS_Admin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EOS_Admin] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EOS_Admin]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 18/07/2023 11:31:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nchar](50) NULL,
	[ClassMajor] [nvarchar](50) NULL,
	[NumberOfStudents] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 18/07/2023 11:31:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionNO] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](500) NULL,
	[Answer1] [nvarchar](250) NULL,
	[Answer2] [nvarchar](250) NULL,
	[Answer3] [nvarchar](250) NULL,
	[Answer4] [nvarchar](250) NULL,
	[CorrectAnswer] [nvarchar](250) NULL,
	[SubjectID] [int] NULL,
 CONSTRAINT [PK_PRJ301] PRIMARY KEY CLUSTERED 
(
	[QuestionNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result]    Script Date: 18/07/2023 11:31:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultID] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[StudentClass] [nchar](50) NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Point] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 18/07/2023 11:31:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] NOT NULL,
	[StudentCode] [varchar](50) NULL,
	[StudentName] [nvarchar](50) NULL,
	[Date_of_Birth] [date] NOT NULL,
	[Gender] [char](50) NULL,
	[PhoneNumber] [char](50) NULL,
	[class_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 18/07/2023 11:31:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] NOT NULL,
	[Code] [nchar](50) NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/07/2023 11:31:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Account] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassID], [ClassName], [ClassMajor], [NumberOfStudents]) VALUES (5, N'SE1708                                            ', N'Software Engineering', 30)
INSERT [dbo].[Class] ([ClassID], [ClassName], [ClassMajor], [NumberOfStudents]) VALUES (6, N'SE1721                                            ', N'Software Engineering', 28)
INSERT [dbo].[Class] ([ClassID], [ClassName], [ClassMajor], [NumberOfStudents]) VALUES (7, N'MK1602                                            ', N'Marketing', 29)
INSERT [dbo].[Class] ([ClassID], [ClassName], [ClassMajor], [NumberOfStudents]) VALUES (8, N'JA1562                                            ', N'Japan', 30)
INSERT [dbo].[Class] ([ClassID], [ClassName], [ClassMajor], [NumberOfStudents]) VALUES (9, N'EN2308                                            ', N'English', 23)
INSERT [dbo].[Class] ([ClassID], [ClassName], [ClassMajor], [NumberOfStudents]) VALUES (10, N'AI1412                                            ', N'Artificial Intelligent', 20)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionNO], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [SubjectID]) VALUES (6, N'1+3 = ?', N'1', N'2', N'3', N'4', N'4', 1)
INSERT [dbo].[Question] ([QuestionNO], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [SubjectID]) VALUES (7, N'1+1+1 =?', N'1', N'2', N'3', N'4', N'3', 1)
INSERT [dbo].[Question] ([QuestionNO], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [SubjectID]) VALUES (8, N'1+1-1 = ?', N'1', N'2', N'3', N'4', N'1', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (1, 1, N'SE1708                                            ', CAST(N'10:55:53.0100000' AS Time), CAST(N'11:31:41.3300000' AS Time), 8, NULL)
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (2, 2, N'SE1721                                            ', CAST(N'10:55:53.0100000' AS Time), CAST(N'11:31:41.3300000' AS Time), 7, NULL)
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (3, 3, N'MK1602                                            ', CAST(N'10:55:53.0100000' AS Time), CAST(N'11:31:41.3300000' AS Time), 0, N'Using Facebook')
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (4, 4, N'SE1708                                            ', CAST(N'07:32:14.1200000' AS Time), CAST(N'09:20:40.2200000' AS Time), 5, NULL)
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (5, 5, N'SE1708                                            ', CAST(N'07:30:14.1200000' AS Time), CAST(N'09:30:40.2200000' AS Time), 6, NULL)
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (6, 6, N'SE1708                                            ', CAST(N'07:25:14.1200000' AS Time), CAST(N'09:35:40.2200000' AS Time), 9, NULL)
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (7, 7, N'SE1708                                            ', CAST(N'07:22:14.1200000' AS Time), CAST(N'09:01:40.2200000' AS Time), 4, NULL)
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (8, 8, N'SE1708                                            ', CAST(N'17:32:14.1200000' AS Time), CAST(N'18:20:40.2200000' AS Time), 3, NULL)
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (9, 9, N'SE1708                                            ', CAST(N'07:32:14.1200000' AS Time), CAST(N'09:10:40.2200000' AS Time), 0, N'Using others software')
INSERT [dbo].[Result] ([ResultID], [StudentId], [StudentClass], [StartTime], [EndTime], [Point], [Description]) VALUES (10, 1, N'SE1708                                            ', CAST(N'09:12:40.1200000' AS Time), CAST(N'10:40:59.5990000' AS Time), 7, NULL)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (1, N'HE176740', N'Trịnh Đình Dũng', CAST(N'2003-11-05' AS Date), N'Male                                              ', N'0967435789                                        ', 5)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (2, N'HE123456', N'Bùi Lân Việt', CAST(N'2003-03-12' AS Date), N'Male                                              ', N'091234567                                         ', 6)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (3, N'HE123123', N'Huy', CAST(N'2003-01-01' AS Date), N'Female                                            ', N'01234567                                          ', 5)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (4, N'He165645', N'Thuận', CAST(N'2003-02-02' AS Date), N'Female                                            ', N'01231234                                          ', 5)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (5, N'HE123412', N'Duy', CAST(N'2003-03-03' AS Date), N'Male                                              ', N'09123987                                          ', 5)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (6, N'HS176740', N'Dũng', CAST(N'2003-02-22' AS Date), N'Female                                            ', N'09871234                                          ', 6)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (7, N'HS123456', N'Vinh', CAST(N'2003-04-04' AS Date), N'Male                                              ', N'0123123                                           ', 7)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (8, N'HS123455', N'Châu', CAST(N'2003-04-04' AS Date), N'Male                                              ', N'0123451                                           ', 7)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (9, N'AB12341', N'Quân', CAST(N'2003-05-05' AS Date), N'Male                                              ', N'0123789                                           ', 8)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (10, N'AB12342', N'Đạt', CAST(N'2003-05-05' AS Date), N'Male                                              ', N'01234990                                          ', 8)
INSERT [dbo].[Students] ([StudentID], [StudentCode], [StudentName], [Date_of_Birth], [Gender], [PhoneNumber], [class_id]) VALUES (11, N'AB12343', N'Hiếu', CAST(N'2003-05-05' AS Date), N'Male                                              ', N'12312345                                          ', 9)
INSERT [dbo].[Subjects] ([SubjectID], [Code], [Name]) VALUES (1, N'PRJ301                                            ', N'Java Web App Development')
INSERT [dbo].[Subjects] ([SubjectID], [Code], [Name]) VALUES (2, N'MAS291                                            ', N'Statistic & Probabilities')
INSERT [dbo].[Subjects] ([SubjectID], [Code], [Name]) VALUES (3, N'IOT102                                            ', N'Internet of Things')
INSERT [dbo].[Subjects] ([SubjectID], [Code], [Name]) VALUES (4, N'PRO192                                            ', N'OOP Programming')
INSERT [dbo].[Users] ([UserID], [Account], [Password], [Name]) VALUES (1, N'dung', N'123', N'Dung')
INSERT [dbo].[Users] ([UserID], [Account], [Password], [Name]) VALUES (2, N'admin', N'123', N'Admin')
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subjects]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Student]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([ClassID])
GO
USE [master]
GO
ALTER DATABASE [EOS_Admin] SET  READ_WRITE 
GO
