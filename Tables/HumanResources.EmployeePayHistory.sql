CREATE TABLE [HumanResources].[EmployeePayHistory] (
  [BusinessEntityID] [int] NOT NULL,
  [RateChangeDate] [datetime] NOT NULL,
  [Rate] [money] NOT NULL,
  [PayFrequency] [tinyint] NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_EmployeePayHistory_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_EmployeePayHistory_BusinessEntityID_RateChangeDate] PRIMARY KEY CLUSTERED ([BusinessEntityID], [RateChangeDate]),
  CONSTRAINT [CK_EmployeePayHistory_PayFrequency] CHECK ([PayFrequency]=(2) OR [PayFrequency]=(1)),
  CONSTRAINT [CK_EmployeePayHistory_Rate] CHECK ([Rate]>=(7.50) AND [Rate]<=(210.00))
)
ON [PRIMARY]
GO

ALTER TABLE [HumanResources].[EmployeePayHistory]
  ADD CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
GO