CREATE EVENT run_data_cleaning

ON SCHEDULE EVERY 30 DAY

DO

    CALL Copy_and_Clean_Data();