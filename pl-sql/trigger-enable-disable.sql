ALTER TRIGGER tg_biuds_employees_salary_inc DISABLE;

ALTER TRIGGER tg_biuds_employees_salary_inc ENABLE;

ALTER TABLE employees DISABLE ALL TRIGGERS;

ALTER TABLE employees ENABLE ALL TRIGGERS;
