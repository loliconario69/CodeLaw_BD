DELIMITER $$

CREATE PROCEDURE `transaccion`()
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    SET autocommit=0;
    
    START TRANSACTION;
    ALTER USER 'AdminBD'@'localhost' IDENTIFIED BY 'la password mas segua del mundo';
    
    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
    
    SET autocommit=1;
END$$

DELIMITER ;

