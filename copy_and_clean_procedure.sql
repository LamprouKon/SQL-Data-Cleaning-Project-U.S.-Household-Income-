DELIMITER $$



DROP PROCEDURE IF EXISTS Copy_and_Clean_Data; 



CREATE PROCEDURE Copy_and_Clean_Data()

BEGIN

    CREATE TABLE IF NOT EXISTS `us_house_hold_income_Cleaned` (

      `row_id` INT, `id` INT, `State_Code` INT, `State_Name` TEXT,

      `State_ab` TEXT, `Country` VARCHAR(255), `City` TEXT, `Place` TEXT,

      `Type` TEXT, `Primary` TEXT, `Zip_Code` INT, `Area_Code` INT,

      `ALand` INT, `AWater` INT, `Lat` DOUBLE, `Lon` DOUBLE,

      `TimeStamp` TIMESTAMP

    );



    INSERT INTO us_house_hold_income_Cleaned

    SELECT *, CURRENT_TIMESTAMP 

    FROM ushouseholdincome;



    DELETE FROM us_house_hold_income_Cleaned

    WHERE row_id IN (

        SELECT row_id FROM (

            SELECT row_id,

                   ROW_NUMBER() OVER(PARTITION BY id, `Timestamp` ORDER BY id, `Timestamp`) AS row_num

            FROM us_house_hold_income_Cleaned

        ) AS duplicates

        WHERE row_num > 1

    );



    UPDATE us_house_hold_income_Cleaned

    SET State_Name = 'Georgia'

    WHERE State_Name = 'georia';



    UPDATE us_house_hold_income_Cleaned SET Country = UPPER(Country);

    UPDATE us_house_hold_income_Cleaned SET City = UPPER(City);

    UPDATE us_house_hold_income_Cleaned SET Place = UPPER(Place);

    UPDATE us_house_hold_income_Cleaned SET State_Name = UPPER(State_Name);

    UPDATE us_house_hold_income_Cleaned SET `Type` = 'CDP' WHERE `Type` = 'CPD';

    UPDATE us_house_hold_income_Cleaned SET `Type` = 'Borough' WHERE `Type` = 'Boroughs';

END $$

DELIMITER ;



-- Run the procedure

CALL Copy_and_Clean_Data();