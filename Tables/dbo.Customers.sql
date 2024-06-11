CREATE TABLE [dbo].[Customers] (
  [First_Name] [varchar](50) NOT NULL,
  [Last_Name] [varchar](50) NOT NULL,
  [City] [varchar](55) NOT NULL,
  [Email] [varchar](100) NOT NULL,
  [Phone_Number] [varchar](30) NOT NULL,
  [Registration_Date] [date] NOT NULL
)
ON [PRIMARY]
GO