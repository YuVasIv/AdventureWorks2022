CREATE TABLE [HumanResources].[Shift] (
  [ShiftID] [tinyint] IDENTITY,
  [Name] [nvarchar](256) NOT NULL,
  [StartTime] [time] NOT NULL,
  [EndTime] [time] NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Shift_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Shift_ShiftID] PRIMARY KEY CLUSTERED ([ShiftID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Shift_Name]
  ON [HumanResources].[Shift] ([Name])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Shift_StartTime_EndTime]
  ON [HumanResources].[Shift] ([StartTime], [EndTime])
  ON [PRIMARY]
GO