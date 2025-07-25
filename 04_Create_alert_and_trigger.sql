-- Create an Alerts table to store alert messages
CREATE TABLE Alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    alert_date DATE NOT NULL,
    message VARCHAR(255) NOT NULL,
    is_resolved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- Create a trigger on Expenses INSERT to check expense vs income for that month
DELIMITER $$

CREATE TRIGGER trg_expenses_after_insert_check_alert
AFTER INSERT ON Expenses
FOR EACH ROW
BEGIN
    DECLARE total_income DECIMAL(10,2);
    DECLARE total_expenses DECIMAL(10,2);
    DECLARE alert_msg VARCHAR(255);
    DECLARE month_start DATE;
    DECLARE month_end DATE;

    -- Calculate the first and last day of the expense month
    SET month_start = DATE_FORMAT(NEW.expense_date, '%Y-%m-01');
    SET month_end = LAST_DAY(NEW.expense_date);

    -- Get total income for user in the month
    SELECT IFNULL(SUM(amount), 0)
    INTO total_income
    FROM Income
    WHERE user_id = NEW.user_id
      AND income_date BETWEEN month_start AND month_end;

    -- Get total expenses for user in the month (including this new expense)
    SELECT IFNULL(SUM(amount), 0)
    INTO total_expenses
    FROM Expenses
    WHERE user_id = NEW.user_id
      AND expense_date BETWEEN month_start AND month_end;

    -- If expenses exceed income, insert alert
    IF total_expenses > total_income THEN
        SET alert_msg = CONCAT('Alert: Expenses (', total_expenses, 
            ') exceeded Income (', total_income, ') in ', DATE_FORMAT(NEW.expense_date, '%Y-%m'));

        INSERT INTO Alerts (user_id, alert_date, message)
        VALUES (NEW.user_id, NEW.expense_date, alert_msg);
    END IF;

END$$

DELIMITER ;

SELECT alert_id, user_id, alert_date, message, created_at
FROM Alerts
WHERE is_resolved = FALSE
ORDER BY created_at DESC;
