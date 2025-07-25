-- Users
INSERT INTO Users (username, email) VALUES
('teddy_lupin', 'teddy@gmail.com'),
('dora_black', 'dora@gmail.com');

-- Categories
INSERT INTO Categories (category_name, type) VALUES
('Salary', 'Income'),
('Freelance', 'Income'),
('Investment Returns', 'Income'),
('Food', 'Expense'),
('Transport', 'Expense'),
('Entertainment', 'Expense'),
('Rent', 'Expense'),
('Utilities', 'Expense'),
('Health', 'Expense'),
('Education', 'Expense');

-- Income
INSERT INTO Income (user_id, category_id, amount, income_date, description) VALUES
(1, 1, 4000.00, '2025-07-01', 'Monthly Salary'),
(1, 2, 600.00, '2025-07-10', 'Freelance Web Design'),
(1, 3, 150.00, '2025-07-20', 'Dividends from Stocks');

-- Income
INSERT INTO Income (user_id, category_id, amount, income_date, description) VALUES
(2, 1, 5000.00, '2025-07-01', 'Monthly Salary'),
(2, 2, 800.00, '2025-07-15', 'Freelance Writing');

-- Expenses
INSERT INTO Expenses (user_id, category_id, amount, expense_date, description) VALUES
(1, 4, 300.00, '2025-07-05', 'Groceries and dining out'),
(1, 5, 75.00, '2025-07-08', 'Gas and public transport'),
(1, 6, 120.00, '2025-07-12', 'Movies and streaming subscriptions'),
(1, 7, 1200.00, '2025-07-01', 'Monthly apartment rent'),
(1, 8, 150.00, '2025-07-07', 'Electricity and water bills'),
(1, 9, 60.00, '2025-07-14', 'Doctor visit and medicines'),
(1, 10, 200.00, '2025-07-18', 'Online course subscription');

-- Expenses
INSERT INTO Expenses (user_id, category_id, amount, expense_date, description) VALUES
(2, 4, 350.00, '2025-07-04', 'Groceries'),
(2, 7, 1500.00, '2025-07-01', 'Rent for apartment'),
(2, 8, 180.00, '2025-07-09', 'Utilities and internet'),
(2, 5, 90.00, '2025-07-11', 'Taxi and metro card'),
(2, 6, 200.00, '2025-07-13', 'Concert and outings');