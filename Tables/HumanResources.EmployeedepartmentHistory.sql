CREATE TABLE [HumanResources].[EmployeedepartmentHistory] (
  [BusinessEntityID] [int] NOT NULL,
  [DepartmentID] [smallint] NOT NULL,
  [ShiftID] [tinyint] NOT NULL,
  [StartDate] [date] NOT NULL,
  [EndDate] [date] NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_EmployeeDepartmentHistory_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] PRIMARY KEY CLUSTERED ([BusinessEntityID], [StartDate], [DepartmentID], [ShiftID]),
  CONSTRAINT [CK_EmployeeDepartmentHistory_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_EmployeeDepartmentHistory_DepartmentID]
  ON [HumanResources].[EmployeedepartmentHistory] ([DepartmentID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_EmployeeDepartmentHistory_ShiftID]
  ON [HumanResources].[EmployeedepartmentHistory] ([ShiftID])
  ON [PRIMARY]
GO

ALTER TABLE [HumanResources].[EmployeedepartmentHistory]
  ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [HumanResources].[Department] ([DepartmentID])
GO

ALTER TABLE [HumanResources].[EmployeedepartmentHistory]
  ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
GO

ALTER TABLE [HumanResources].[EmployeedepartmentHistory]
  ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID] FOREIGN KEY ([ShiftID]) REFERENCES [HumanResources].[Shift] ([ShiftID])
GO