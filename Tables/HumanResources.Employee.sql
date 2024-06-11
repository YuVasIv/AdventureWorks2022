CREATE TABLE [HumanResources].[Employee] (
  [BusinessEntityID] [int] NOT NULL,
  [NationalIDNumber] [nvarchar](15) NOT NULL,
  [LoginID] [nvarchar](256) NOT NULL,
  [OrganizationNode] [hierarchyid] NULL,
  [OrganizationLevel] AS ([OrganizationNode].[GetLevel]()),
  [JobTitle] [nvarchar](60) NOT NULL,
  [BirthDate] [date] NOT NULL,
  [MaritalStatus] [nchar](1) NOT NULL,
  [Gender] [nchar](1) NOT NULL,
  [HireDate] [date] NOT NULL,
  [SalariedFlag] [nchar](1) NOT NULL CONSTRAINT [DF_Employee_SalariedFlag] DEFAULT (1),
  [VacationHours] [smallint] NOT NULL CONSTRAINT [DF_Employee_VacationHours] DEFAULT (0),
  [SickLeaveHours] [smallint] NOT NULL CONSTRAINT [DF_Employee_SickLeaveHours] DEFAULT (0),
  [CurrentFlag] [nchar](6) NOT NULL CONSTRAINT [DF_Employee_CurrentFlag] DEFAULT (1),
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Employee_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Employee_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Employee_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID]),
  CONSTRAINT [CK_Employee_BirthDate] CHECK ([BirthDate]>='1930-03-01' AND [BirthDate]<=dateadd(year,(-18),getdate())),
  CONSTRAINT [CK_Employee_Gender] CHECK (upper([Gender])='F' OR upper([Gender])='M'),
  CONSTRAINT [CK_Employee_HireDate] CHECK ([HireDate]>='1996-09-01' AND [HireDate]<=dateadd(day,(1),getdate())),
  CONSTRAINT [CK_Employee_MaritalStatus] CHECK (upper([MaritalStatus])='S' OR upper([MaritalStatus])='M'),
  CONSTRAINT [CK_Employee_SickLeaveHours] CHECK ([SickLeaveHours]>=(0) AND [SickLeaveHours]<=(120)),
  CONSTRAINT [CK_Employee_VacationHours] CHECK ([VacationHours]>=(-40) AND [VacationHours]<=(240))
)
ON [PRIMARY]
GO