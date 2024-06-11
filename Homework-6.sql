/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DELIMITER $$
CREATE PROCEDURE times(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;
		WHILE seconds >= 86400 DO
			SET days = floor(seconds / 86400);
			SET seconds = seconds % 86400;
		END WHILE;
		WHILE seconds >= 3600 DO
			SET hours = floor(seconds / 3600);
			SET seconds = seconds % 3600;
		END WHILE;
		WHILE seconds >= 60 DO
			SET minutes = floor(seconds / 60);
			SET seconds = seconds % 60;
		END WHILE;
	SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL times(7777777);







/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/
DELIMITER $$
CREATE PROCEDURE nums(`start` INT, `end` INT)
BEGIN
    DECLARE i INT DEFAULT `start`;
    DECLARE res_str TEXT DEFAULT NULL;
    WHILE  i<=`end` DO
        IF i % 2 = 0 THEN
            IF res_str IS NULL THEN
                SET res_str = concat(i);
            ELSE
                SET res_str = concat(res_str, ', ', i);
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;
    SELECT res_str;
END $$
DELIMITER ;

CALL nums(52, 199);