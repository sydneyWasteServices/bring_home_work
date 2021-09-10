UPDATE [CONST_INFO].[EMPLOYEE_INFO].[EMPLOYEE_ID]
Set 



declare @var as nvarchar(max)
set @var = 'null'

if (len(@var) = 0)
	set @var = null
if (@var is null)
	print '@var was changed to null'
else
	print @var



DROP PROCEDURE IF EXISTS processallcolumns;

DELIMITER $$

CREATE PROCEDURE processallcolumns ()
BEGIN

  DECLARE i,num_rows INT ;

  DECLARE col_name char(250);

  DECLARE col_names CURSOR FOR
  SELECT column_name
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE table_name = 'PROCESSINGTABLE'
  ORDER BY ordinal_position;

  OPEN col_names ;

  select FOUND_ROWS() into num_rows;

  SET i = 1;
  the_loop: LOOP

     IF i > num_rows THEN
          CLOSE col_names;
          LEAVE the_loop;
      END IF;


      FETCH col_names 
      INTO col_name;     


      SET @command_text = CONCAT('UPDATE `PROCESSINGTABLE` SET ', col_name, '= IF(LENGTH(', col_name, ')=0, NULL,', col_name, ') WHERE 1 ;' ) ;

--      UPDATE `PROCESSINGTABLE` SET col_name=IF(LENGTH(col_name)=0,NULL,col_name) WHERE 1;
--      This won't work, because MySQL doesn't take varibles as column name.

      PREPARE stmt FROM @command_text ;
      EXECUTE stmt ;

      SET i = i + 1;  
  END LOOP the_loop ;



END$$
DELIMITER ;

call processallcolumns ();
DROP PROCEDURE processallcolumns;