
SELECT name, database_id, create_date  
FROM sys.databases ;  
GO  
  
SELECT DISTINCT [table_schema], [TABLE_NAME]
FROM INFORMATION_SCHEMA.COLUMNS

SELECT * FROM [STAGE_2_DB].[BOOKING_SCH_S2].[BOOKING_TB_S2]
WHERE [STAGE_2_DB].[BOOKING_SCH_S2].[BOOKING_TB_S2].[DATE] >= '20200101'
AND [STAGE_2_DB].[BOOKING_SCH_S2].[BOOKING_TB_S2].[DATE] <= '20200901'
AND [STAGE_2_DB].[BOOKING_SCH_S2].[BOOKING_TB_S2].[Customer number] = 1674.041

SELECT * FROM [STAGE_2_DB].[BOOKING_SCH_S2].[BOOKING_TB_S2]
WHERE [STAGE_2_DB].[BOOKING_SCH_S2].[BOOKING_TB_S2].[DATE] >= '20200901'
AND [STAGE_2_DB].[BOOKING_SCH_S2].[BOOKING_TB_S2].[DATE] <= '20210301'
AND [STAGE_2_DB].[BOOKING_SCH_S2].[BOOKING_TB_S2].[Customer number] = 4365