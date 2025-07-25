CREATE VIEW monthly_income_summary AS
SELECT 
  user_id,
  DATE_FORMAT(income_date, '%Y-%m') AS month,
  SUM(amount) AS total_income
FROM Income
GROUP BY user_id, month;

CREATE VIEW monthly_expense_summary AS
SELECT 
  user_id,
  DATE_FORMAT(expense_date, '%Y-%m') AS month,
  SUM(amount) AS total_expense
FROM Expenses
GROUP BY user_id, month;

CREATE VIEW monthly_net_balance AS
SELECT 
  i.user_id,
  i.month,
  i.total_income,
  COALESCE(e.total_expense, 0) AS total_expense,
  (i.total_income - COALESCE(e.total_expense, 0)) AS net_balance
FROM monthly_income_summary i
LEFT JOIN monthly_expense_summary e ON i.user_id = e.user_id AND i.month = e.month;

CREATE VIEW category_expense_summary AS
SELECT
  e.user_id,
  c.category_name,
  SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
WHERE c.type = 'Expense'
GROUP BY e.user_id, c.category_name;

CREATE VIEW category_income_summary AS
SELECT
  i.user_id,
  c.category_name,
  SUM(i.amount) AS total_income
FROM Income i
JOIN Categories c ON i.category_id = c.category_id
WHERE c.type = 'Income'
GROUP BY i.user_id, c.category_name;

SELECT * FROM monthly_net_balance;
SELECT * FROM category_income_summary;