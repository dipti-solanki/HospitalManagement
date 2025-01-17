USE [master]
GO
/****** Object:  Database [HospitalManagementDb]    Script Date: 26-03-2020 2.19.15 PM ******/
CREATE DATABASE [HospitalManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HospitalManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HospitalManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HospitalManagementDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalManagementDb] SET QUERY_STORE = OFF
GO
USE [HospitalManagementDb]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[AppointmentDate] [datetimeoffset](7) NOT NULL,
	[AppointmentTime] [datetimeoffset](7) NOT NULL,
	[AppointmentDuration] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assigns]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assigns](
	[PatientId] [int] NOT NULL,
	[HealthcareAssistantId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[HospitalId] [int] NOT NULL,
	[DepartmentWork] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnostics]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnostics](
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[Diagnosis] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[DoctorQualification] [varchar](50) NOT NULL,
	[DoctorDesignation] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[TreatmentOfDisease] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[DrugId] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [varchar](50) NOT NULL,
	[DrugContent] [varchar](50) NOT NULL,
	[UsedFor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugTiming]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugTiming](
	[DrugId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[TimeOfDrug] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthcareAssistants]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthcareAssistants](
	[HealthcareAssistantId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Designation] [varchar](50) NOT NULL,
	[Qualification] [varchar](50) NOT NULL,
	[Age] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
 CONSTRAINT [PK_HealthcareAssistants] PRIMARY KEY CLUSTERED 
(
	[HealthcareAssistantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitals]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitals](
	[HospitalId] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [varchar](50) NOT NULL,
	[HospitalAddress] [varchar](50) NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Hospitals] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientFirstName] [varchar](50) NOT NULL,
	[PatientLastName] [varchar](50) NOT NULL,
	[PatientDisease] [varchar](50) NOT NULL,
	[PatientAge] [int] NOT NULL,
	[PatientGender] [varchar](50) NOT NULL,
	[PatientAddress] [varchar](50) NOT NULL,
	[RegistrationDate] [datetimeoffset](7) NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
	[RoomId] [int] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[PrescriptionId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[PrescriptionDetails] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prescriptions] PRIMARY KEY CLUSTERED 
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomWing] [varchar](10) NOT NULL,
	[Floor] [int] NOT NULL,
	[RoomType] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 26-03-2020 2.19.21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Doctors]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Patients]
GO
ALTER TABLE [dbo].[Assigns]  WITH CHECK ADD  CONSTRAINT [FK_Assigns_HealthcareAssistants] FOREIGN KEY([HealthcareAssistantId])
REFERENCES [dbo].[HealthcareAssistants] ([HealthcareAssistantId])
GO
ALTER TABLE [dbo].[Assigns] CHECK CONSTRAINT [FK_Assigns_HealthcareAssistants]
GO
ALTER TABLE [dbo].[Assigns]  WITH CHECK ADD  CONSTRAINT [FK_Assigns_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Assigns] CHECK CONSTRAINT [FK_Assigns_Patients]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Hospitals] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Hospitals]
GO
ALTER TABLE [dbo].[Diagnostics]  WITH CHECK ADD  CONSTRAINT [FK_Diagnostics_Diagnostics] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Diagnostics] CHECK CONSTRAINT [FK_Diagnostics_Diagnostics]
GO
ALTER TABLE [dbo].[Diagnostics]  WITH CHECK ADD  CONSTRAINT [FK_Diagnostics_Patients] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Diagnostics] CHECK CONSTRAINT [FK_Diagnostics_Patients]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Departments]
GO
ALTER TABLE [dbo].[DrugTiming]  WITH CHECK ADD  CONSTRAINT [FK_DrugTiming_Drugs] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drugs] ([DrugId])
GO
ALTER TABLE [dbo].[DrugTiming] CHECK CONSTRAINT [FK_DrugTiming_Drugs]
GO
ALTER TABLE [dbo].[DrugTiming]  WITH CHECK ADD  CONSTRAINT [FK_DrugTiming_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[DrugTiming] CHECK CONSTRAINT [FK_DrugTiming_Patients]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Rooms]
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_Doctors]
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_Patients]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Departments]
GO
USE [master]
GO
ALTER DATABASE [HospitalManagementDb] SET  READ_WRITE 
GO
