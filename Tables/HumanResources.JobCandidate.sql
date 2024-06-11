CREATE TABLE [HumanResources].[JobCandidate] (
  [JobCandidateID] [int] IDENTITY,
  [BusinessEntityID] [int] NULL,
  [Resume] [xml] NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_JobCandidate_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY CLUSTERED ([JobCandidateID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_JobCandidate_BusinessEntityID]
  ON [HumanResources].[JobCandidate] ([BusinessEntityID])
  ON [PRIMARY]
GO

ALTER TABLE [HumanResources].[JobCandidate]
  ADD CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
GO