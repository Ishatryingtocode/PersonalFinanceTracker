USE PersonalFinanceTracker;

-- calculate the monthly savings (balance) for a given user
DELIMITER //

CREATE FUNCTION GetMonthlyBalance(
    p_user_id INT,
    p_month INT,
    p_year INT
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_income DECIMAL(10,2);
    DECLARE total_expenses DECIMAL(10,2);

    -- Get total income
    SELECT IFNULL(SUM(amount), 0)
    INTO total_income
    FROM Income
    WHERE user_id = p_user_id
      AND MONTH(income_date) = p_month
      AND YEAR(income_date) = p_year;

    -- Get total expenses
    SELECT IFNULL(SUM(amount), 0)
    INTO total_expenses
    FROM Expenses
    WHERE user_id = p_user_id
      AND MONTH(expense_date) = p_month
      AND YEAR(expense_date) = p_year;

    -- Return balance
    RETURN total_income - total_expenses;
END //

DELIMITER ;

SELECT GetMonthlyBalance(1, 7, 2025) AS MonthlyBalance;
SELECT GetMonthlyBalance(2, 7, 2025) AS MonthlyBalance;
