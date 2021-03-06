USE [master]
GO
/****** Object:  Database [SampleAPIDb]    Script Date: 13/09/2018 15:13:17 ******/
CREATE DATABASE [SampleAPIDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SampleAPIDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SampleAPIDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SampleAPIDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SampleAPIDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SampleAPIDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SampleAPIDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SampleAPIDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SampleAPIDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SampleAPIDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SampleAPIDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SampleAPIDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SampleAPIDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SampleAPIDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SampleAPIDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SampleAPIDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SampleAPIDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SampleAPIDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SampleAPIDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SampleAPIDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SampleAPIDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SampleAPIDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SampleAPIDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SampleAPIDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SampleAPIDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SampleAPIDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SampleAPIDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SampleAPIDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SampleAPIDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SampleAPIDb] SET RECOVERY FULL 
GO
ALTER DATABASE [SampleAPIDb] SET  MULTI_USER 
GO
ALTER DATABASE [SampleAPIDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SampleAPIDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SampleAPIDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SampleAPIDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SampleAPIDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SampleAPIDb', N'ON'
GO
ALTER DATABASE [SampleAPIDb] SET QUERY_STORE = OFF
GO
USE [SampleAPIDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SampleAPIDb]
GO
/****** Object:  Table [dbo].[Mahasiswa]    Script Date: 13/09/2018 15:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mahasiswa](
	[Nim] [char](5) NOT NULL,
	[Nama] [varchar](50) NOT NULL,
	[IPK] [float] NOT NULL,
 CONSTRAINT [PK_Mahasiswa] PRIMARY KEY CLUSTERED 
(
	[Nim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matakuliah]    Script Date: 13/09/2018 15:13:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matakuliah](
	[KodeMtk] [char](5) NOT NULL,
	[Nama] [varchar](50) NOT NULL,
	[Sks] [int] NOT NULL,
 CONSTRAINT [PK_Matakuliah] PRIMARY KEY CLUSTERED 
(
	[KodeMtk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pengambilan]    Script Date: 13/09/2018 15:13:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pengambilan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nim] [char](5) NOT NULL,
	[KodeMtk] [char](5) NOT NULL,
	[Tanggal] [datetime] NOT NULL,
 CONSTRAINT [PK_Pengambilan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPengambilanLengkap]    Script Date: 13/09/2018 15:13:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPengambilanLengkap]
AS
SELECT        dbo.Mahasiswa.Nim, dbo.Mahasiswa.Nama, dbo.Mahasiswa.IPK, dbo.Matakuliah.KodeMtk, dbo.Matakuliah.Nama AS NamaMatakuliah, dbo.Matakuliah.Sks, dbo.Pengambilan.Id, dbo.Pengambilan.Tanggal
FROM            dbo.Mahasiswa INNER JOIN
                         dbo.Pengambilan ON dbo.Mahasiswa.Nim = dbo.Pengambilan.Nim INNER JOIN
                         dbo.Matakuliah ON dbo.Pengambilan.KodeMtk = dbo.Matakuliah.KodeMtk
GO
/****** Object:  Table [dbo].[Transaksi]    Script Date: 13/09/2018 15:13:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaksi](
	[TransaksiID] [int] IDENTITY(1,1) NOT NULL,
	[Nim] [char](5) NOT NULL,
	[IdJenis] [int] NOT NULL,
	[Debet] [decimal](18, 2) NOT NULL,
	[Kredit] [decimal](18, 2) NOT NULL,
	[CurrBalance] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Transaksi] PRIMARY KEY CLUSTERED 
(
	[TransaksiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewBalance]    Script Date: 13/09/2018 15:13:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewBalance]
AS
SELECT        dbo.Mahasiswa.Nim, SUM(dbo.Transaksi.Debet) - SUM(dbo.Transaksi.Kredit) AS Balance
FROM            dbo.Mahasiswa INNER JOIN
                         dbo.Transaksi ON dbo.Mahasiswa.Nim = dbo.Transaksi.Nim
GROUP BY dbo.Mahasiswa.Nim
GO
/****** Object:  Table [dbo].[JenisTransaksi]    Script Date: 13/09/2018 15:13:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JenisTransaksi](
	[IdJenis] [int] IDENTITY(1,1) NOT NULL,
	[NamaJenis] [varchar](50) NOT NULL,
 CONSTRAINT [PK_JenisTransaksi] PRIMARY KEY CLUSTERED 
(
	[IdJenis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[JenisTransaksi] ON 

INSERT [dbo].[JenisTransaksi] ([IdJenis], [NamaJenis]) VALUES (1, N'Deposit')
INSERT [dbo].[JenisTransaksi] ([IdJenis], [NamaJenis]) VALUES (2, N'Hardware')
INSERT [dbo].[JenisTransaksi] ([IdJenis], [NamaJenis]) VALUES (3, N'Software')
INSERT [dbo].[JenisTransaksi] ([IdJenis], [NamaJenis]) VALUES (4, N'Buku')
SET IDENTITY_INSERT [dbo].[JenisTransaksi] OFF
INSERT [dbo].[Mahasiswa] ([Nim], [Nama], [IPK]) VALUES (N'77777', N'Amir', 2.8)
INSERT [dbo].[Mahasiswa] ([Nim], [Nama], [IPK]) VALUES (N'88888', N'Budi', 3.1)
INSERT [dbo].[Mahasiswa] ([Nim], [Nama], [IPK]) VALUES (N'99999', N'Erick', 3.2)
INSERT [dbo].[Matakuliah] ([KodeMtk], [Nama], [Sks]) VALUES (N'AAAAA', N'Web Programming', 3)
INSERT [dbo].[Matakuliah] ([KodeMtk], [Nama], [Sks]) VALUES (N'BBBBB', N'Mobile Programming', 3)
SET IDENTITY_INSERT [dbo].[Pengambilan] ON 

INSERT [dbo].[Pengambilan] ([Id], [Nim], [KodeMtk], [Tanggal]) VALUES (1, N'77777', N'AAAAA', CAST(N'2018-09-11T15:56:24.790' AS DateTime))
INSERT [dbo].[Pengambilan] ([Id], [Nim], [KodeMtk], [Tanggal]) VALUES (2, N'88888', N'AAAAA', CAST(N'2018-09-11T15:56:35.720' AS DateTime))
SET IDENTITY_INSERT [dbo].[Pengambilan] OFF
SET IDENTITY_INSERT [dbo].[Transaksi] ON 

INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (18, N'77777', 1, CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (19, N'77777', 2, CAST(0.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (20, N'77777', 3, CAST(0.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (21, N'77777', 1, CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)))
INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (22, N'88888', 1, CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (25, N'99999', 1, CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (26, N'99999', 2, CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)))
INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (29, N'77777', 1, CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(230.00 AS Decimal(18, 2)))
INSERT [dbo].[Transaksi] ([TransaksiID], [Nim], [IdJenis], [Debet], [Kredit], [CurrBalance]) VALUES (30, N'99999', 3, CAST(0.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Transaksi] OFF
ALTER TABLE [dbo].[Mahasiswa] ADD  CONSTRAINT [DF_Mahasiswa_IPK]  DEFAULT ((0)) FOR [IPK]
GO
ALTER TABLE [dbo].[Matakuliah] ADD  CONSTRAINT [DF_Matakuliah_Sks]  DEFAULT ((0)) FOR [Sks]
GO
ALTER TABLE [dbo].[Pengambilan] ADD  CONSTRAINT [DF_Pengambilan_Tanggal]  DEFAULT (getdate()) FOR [Tanggal]
GO
ALTER TABLE [dbo].[Transaksi] ADD  CONSTRAINT [DF_Transaksi_Debet]  DEFAULT ((0)) FOR [Debet]
GO
ALTER TABLE [dbo].[Transaksi] ADD  CONSTRAINT [DF_Transaksi_Kredit]  DEFAULT ((0)) FOR [Kredit]
GO
ALTER TABLE [dbo].[Transaksi] ADD  CONSTRAINT [DF_Transaksi_CurrBalance]  DEFAULT ((0)) FOR [CurrBalance]
GO
ALTER TABLE [dbo].[Pengambilan]  WITH CHECK ADD  CONSTRAINT [FK_Pengambilan_Mahasiswa] FOREIGN KEY([Nim])
REFERENCES [dbo].[Mahasiswa] ([Nim])
GO
ALTER TABLE [dbo].[Pengambilan] CHECK CONSTRAINT [FK_Pengambilan_Mahasiswa]
GO
ALTER TABLE [dbo].[Pengambilan]  WITH CHECK ADD  CONSTRAINT [FK_Pengambilan_Matakuliah] FOREIGN KEY([KodeMtk])
REFERENCES [dbo].[Matakuliah] ([KodeMtk])
GO
ALTER TABLE [dbo].[Pengambilan] CHECK CONSTRAINT [FK_Pengambilan_Matakuliah]
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_Transaksi_JenisTransaksi] FOREIGN KEY([IdJenis])
REFERENCES [dbo].[JenisTransaksi] ([IdJenis])
GO
ALTER TABLE [dbo].[Transaksi] CHECK CONSTRAINT [FK_Transaksi_JenisTransaksi]
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_Transaksi_Mahasiswa] FOREIGN KEY([Nim])
REFERENCES [dbo].[Mahasiswa] ([Nim])
GO
ALTER TABLE [dbo].[Transaksi] CHECK CONSTRAINT [FK_Transaksi_Mahasiswa]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Mahasiswa"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Transaksi"
            Begin Extent = 
               Top = 8
               Left = 292
               Bottom = 138
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[19] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Mahasiswa"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Matakuliah"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pengambilan"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 250
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPengambilanLengkap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPengambilanLengkap'
GO
USE [master]
GO
ALTER DATABASE [SampleAPIDb] SET  READ_WRITE 
GO
