CREATE TABLE [HumanResources].[Department] (
  [DepartmentID] [smallint] IDENTITY,
  [Name] [nvarchar](256) NOT NULL,
  [GroupName] [nvarchar](258) NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Department_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Department_DepartmentID] PRIMARY KEY CLUSTERED ([DepartmentID])
)
ON [PRIMARY]
GO