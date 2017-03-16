CREATE DATABASE EquityDB COLLATE SQL_Latin1_General_CP1_CI_AS
(
	EDITION 			= 'DataWarehouse'
,	SERVICE_OBJECTIVE 	= 'DW100'
,	MAXSIZE 			= 1024 GB
)
;


ALTER DATABASE EquityDB
MODIFY(service_objective = 'DW400')
;

--DROP DATABASE EquityDB;



CREATE DATABASE ContosoRetailDW COLLATE SQL_Latin1_General_CP1_CI_AS
(
	EDITION 			= 'DataWarehouse'
,	SERVICE_OBJECTIVE 	= 'DW100'
,	MAXSIZE 			= 10240 GB
)
;
ALTER DATABASE ContosoRetailDW
MODIFY(service_objective = 'DW400')
;

--DROP DATABASE ContosoRetailDW;


