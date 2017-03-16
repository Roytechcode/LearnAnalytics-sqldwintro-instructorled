-- A: Create a schema to store the transient data

CREATE SCHEMA [out]

-- A: Create a schema to store the transient data


CREATE EXTERNAL TABLE [out].[BusinessHierarchies]
WITH(LOCATION = '/BusHierarchies/'
,DATA_SOURCE = AzureStorage
,FILE_FORMAT = TextFile
)
AS 
SELECT * 
FROM [dbo].[BusinessHierarchies]     
OPTION 
(LABEL = 'CETAS : Export [cso].[FactOnlineSales]'
)
;
