DELIMITER $$



CREATE TRIGGER transfer_clean_data

AFTER INSERT ON bakery.us_house_hold_income_Cleaned

FOR EACH ROW 

BEGIN

    CALL Copy_and_Clean_Data();

END $$



DELIMITER ;