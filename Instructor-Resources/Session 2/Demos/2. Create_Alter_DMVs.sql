SELECT	resource_type_desc	AS [resource_type_desc]
,		major_resource_id	AS [db_name]
,		operation			AS [db_operation]
,		state_desc			AS [state_desc]
,		start_time			AS [start_time]
,		last_modify_time	AS [last_modified_timestamp]
,		DATEDIFF(ss,start_time,last_modify_time) [duration_seconds]
FROM	sys.dm_operation_status
ORDER BY start_time DESC
;

SELECT db.[name]				AS [db_name]
,      ds.[edition]				AS [db_edition]
,      ds.[service_objective]	AS [db_service_objective]
FROM   sys.database_service_objectives ds
JOIN   sys.databases db                         ON ds.database_id = db.database_id
WHERE  ds.edition    = 'DataWarehouse'
;

/*Coding example*/
WHILE 
(
	SELECT TOP 1 
			state_desc
	FROM	sys.dm_operation_status os1
	WHERE	resource_type_desc	= 'Database'
	AND		major_resource_id	= 'ContosoRetailDW'
	AND		operation			= 'ALTER DATABASE'
	ORDER BY start_time DESC
) = 'IN_PROGRESS'
BEGIN
	PRINT 'ContosoRetailDW Scale operation in_progress';
	
	WAITFOR DELAY '00:00:05';
END

SELECT db.[name]				AS [db_name]
,      ds.[edition]				AS [db_edition]
,      ds.[service_objective]	AS [db_service_objective]
FROM   sys.database_service_objectives ds
JOIN   sys.databases db                         ON ds.database_id = db.database_id
WHERE  ds.edition    = 'DataWarehouse'
;