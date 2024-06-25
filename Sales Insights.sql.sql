-- Sales Insights sql queries

-- Retrieve all records from the 'markets' table
SELECT *
FROM sales.markets;

-- Analyze the 'date' table records
SELECT *
FROM sales.date;

-- Count the total number of transactions
SELECT count(*)
FROM sales.transactions;

-- Calculate the transactions from a specific market ('Mark001')
SELECT *
FROM sales.transactions
WHERE market_code = 'Mark001';

-- Transactions in USD currency
SELECT *
FROM sales.transactions
WHERE currency = 'USD';

-- Calculate total sales amount for a specific market ('Mark001') in year 2020
SELECT SUM(trn.sales_amount)
FROM sales.transactions trn
JOIN sales.date dte
    ON trn.order_date = dte.date
WHERE dte.year = 2020 AND trn.market_code = 'Mark001';
    
-- Retrieve distinct product codes for transactions in 'Mark001' market    
SELECT DISTINCT product_code
FROM sales.transactions
WHERE market_code = 'Mark001';

-- Find the transactions where sales amount is less than 1
SELECT *
FROM sales.transactions
WHERE sales_amount <1;

-- Calculate distinct currencies present in transactions
SELECT DISTINCT currency
FROM sales.transactions;

-- Count transactions with currency value 'INR\r' (including carriage return)
SELECT count(*)
FROM sales.transactions
WHERE transactions.currency = 'INR\r';

-- Count transactions with currency value 'INR' (without carriage return)
SELECT count(*)
FROM sales.transactions
WHERE transactions.currency = 'INR';

-- Retrieve transactions with currencies 'USD\r' or 'USD'
SELECT *
FROM sales.transactions
WHERE transactions.currency = 'USD\r'
OR transactions.currency = 'USD';

-- Calculate total sales amount for transactions in 2019 with currency 'INR' or 'INR\r'
SELECT SUM(transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.date
    ON transactions.order_date = date.date
WHERE date.year = 2019 AND transactions.currency = "INR\r"
OR transactions.currency="USD\r";

-- Calculate total sales amount for transactions in February 2020 with currency 'INR' or 'INR\r'
SELECT SUM(transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.date
   ON transactions.order_date = date.date
WHERE date.year = 2020 AND date.month_name = "February"
AND (transactions.currency="INR\r" OR transactions.currency="USD\r");

-- Calculate total sales amount for transactions in market 'Mark001' in year 2020
SELECT SUM(transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.date
   ON transactions.order_date = date.date
where date.year = 2020 and transactions.market_code = "Mark001";