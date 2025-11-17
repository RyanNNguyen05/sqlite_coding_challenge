--Tool used: VS code and SQLTools
-- Validation: Ran each query against bais_sqlite_lab.db and checked the results manually
-- TASK 1
SELECT c.first_name ||''|| c.last_name AS customer_name, SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;
-- TASK 2
SELECT p.category, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN products p ON oi.product_id = p.id
GROUP BY p.category
ORDER BY revenue DESC;
-- TASK 3
SELECT e.frist_name, e.last_name, 
d.name AS department_name,
e.salary AS employee_salary,
dept_avg.avg_salary AS department_avg
FROM eployees e
JOIN departments d ON e.department_id = d.id
JOIN (SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
) AS dept_avg
ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary
ORDER BY d.name, e.salary DESC;
--TASK 4
SELECT city, COUNT(*) AS gold_customer_count
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_customer_count DESC, city;