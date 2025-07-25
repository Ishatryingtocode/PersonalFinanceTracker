# Personal Finance Tracker

A MySQL-based personal finance tracking system to log income and expenses, track monthly balances, and generate automatic alerts when spending exceeds income.

---

## Features

- Manage users, income, and expenses
- Categorize transactions as Income or Expense
- Monthly and category-based summary views
- Automatic alerts when expenses > income
- Stored function for calculating monthly savings

---

## Setup Steps

1. **Create Database:**  
   Create a MySQL database called `PersonalFinanceTracker`.

2. **Create Tables:**  
   - `Users`: Basic user info  
   - `Categories`: Defines types (Income or Expense)  
   - `Income` and `Expenses`: Store transactions  
   - `Alerts`: Auto-generated when expenses exceed income  

3. **Insert Sample Data:**  
   - Two users added: `teddy_lupin` and `dora_black`  
   - Several Income and Expense categories inserted  
   - Sample income and expense records for both users

---

## Views Overview

- **monthly_income_summary**: Total income per user per month  
- **monthly_expense_summary**: Total expenses per user per month  
- **monthly_net_balance**: Net savings (income - expenses)  
- **category_income_summary**: Income totals by category  
- **category_expense_summary**: Expense totals by category  

---

## Alerts & Trigger

- **Alerts Table:**  
  Stores messages when a user's expenses exceed their income for a month.

- **Trigger:**  
  Automatically inserts an alert after any new expense if total expenses > income for that month.

---

## Stored Function

**`GetMonthlyBalance(user_id, month, year)`**  
Returns net savings for a user in a given month.

**Example usage:**  
```sql
SELECT GetMonthlyBalance(1, 7, 2025);
```
---
## 📜 License

Free to use for **personal or educational purposes**.  
Contributions welcome!
