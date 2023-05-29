-- Check column data type
SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE table_name = 'NYC311data' AND COLUMN_NAME = 'Closed_Date';