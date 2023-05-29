-- Add a temporary column for datetime values
ALTER TABLE NYC311data ADD datetime_column DATETIME;

-- convert Created_Date column to datetime
UPDATE NYC311data SET datetime_column = CONVERT(DATETIME, Created_Date);
ALTER TABLE NYC311data ALTER COLUMN Created_Date DATETIME;
UPDATE NYC311data SET Created_Date = datetime_column;

-- convert Closed_Date column to datetime
UPDATE NYC311data SET datetime_column = CONVERT(DATETIME, Closed_Date);
ALTER TABLE NYC311data ALTER COLUMN Closed_Date DATETIME;
UPDATE NYC311data SET Closed_Date = datetime_column;

-- Create a new column Request_Closing_Time as time elapsed between request creation and request closing
ALTER TABLE NYC311data ADD Request_Closing_Time INT;
UPDATE NYC311data SET Request_Closing_Time = DATEDIFF(second, Created_Date, COALESCE(Closed_Date, GETDATE()));

-- Delete the temporary datetime column
ALTER TABLE NYC311data
DROP COLUMN datetime_column;

