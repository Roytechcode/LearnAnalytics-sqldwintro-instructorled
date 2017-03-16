CREATE TABLE [dbo].[BusinessHierarchies](
	[BookId] [nvarchar](250)  ,
	[Division] [nvarchar](100) ,
	[Cluster] [nvarchar](100) ,
	[Desk] [nvarchar](100) ,
	[Book] [nvarchar](100) ,
	[Volcker] [nvarchar](100) ,
	[Region] [nvarchar](100) 
) 
WITH
(
	CLUSTERED COLUMNSTORE INDEX
,	DISTRIBUTION = ROUND_ROBIN
)
;



CREATE TABLE [dbo].[Dates](
	[Date] [datetime2](3) ,
	[DateKey] [decimal](38, 0) ,
	[MonthKey] [decimal](38, 0) ,
	[Month] [nvarchar](100) ,
	[Quarter] [nvarchar](100) ,
	[Year] [decimal](38, 0) ,
	[Year-Quarter] [nvarchar](100) ,
	[Year-Month] [nvarchar](100) ,
	[Year-MonthKey] [nvarchar](100) ,
	[WeekDayKey] [decimal](38, 0) ,
	[WeekDay] [nvarchar](100) ,
	[Day Of Month] [decimal](38, 0) 
)

WITH
(
	CLUSTERED COLUMNSTORE INDEX
,	DISTRIBUTION = ROUND_ROBIN
)
;



CREATE TABLE [dbo].[EquityTimeSeriesData](
	[Date] [varchar](30) ,
	[BookId] [decimal](38, 0) ,
	[P&L] [decimal](31, 7) ,
	[VaRLower] [decimal](31, 7) 
) 
WITH
(
	CLUSTERED COLUMNSTORE INDEX
,	DISTRIBUTION = HASH([P&L])
)
;


/*CLeanup

DROP TABLE [dbo].[BusinessHierarchies];
DROP TABLE [dbo].[Dates];
DROP TABLE [dbo].[EquityTimeSeriesData];
*/





