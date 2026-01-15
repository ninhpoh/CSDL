CREATE DATABASE bt03;
use bt03;

CREATE TABLE company_funds (
    fund_id INT PRIMARY KEY AUTO_INCREMENT,
    balance DECIMAL(15,2) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL   
);

CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,                      
    salary DECIMAL(10,2) NOT NULL, 
    pay_date DATE NOT NULL,         
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


INSERT INTO company_funds (balance) VALUES (50000.00);

INSERT INTO employees (emp_name, salary) VALUES
('Nguyễn Văn An', 5000.00),
('Trần Thị Bốn', 4000.00),
('Lê Văn Cường', 3500.00),
('Hoàng Thị Dung', 4500.00),
('Phạm Văn Em', 3800.00);

DELIMITER //

CREATE PROCEDURE sp_pay_salary(IN p_emp_id INT)
BEGIN

    DECLARE v_salary DECIMAL(10,2);
    DECLARE v_fund_balance DECIMAL(15,2);
    DECLARE v_bank_error BOOL DEFAULT FALSE;

    START TRANSACTION;

    SELECT salary INTO v_salary FROM employees WHERE emp_id = p_emp_id;
    SELECT balance INTO v_fund_balance FROM company_funds LIMIT 1;

    IF v_salary IS NULL THEN
        ROLLBACK;
        SELECT 'Lỗi: Không tìm thấy nhân viên!' AS message;
    
    ELSEIF v_fund_balance < v_salary THEN

        ROLLBACK;
        SELECT 'Lỗi: Quỹ công ty không đủ số dư để trả lương!' AS message;
    
    ELSE

        UPDATE company_funds SET balance = balance - v_salary;
        
        INSERT INTO payroll (emp_id, salary, pay_date) 
        VALUES (p_emp_id, v_salary, CURDATE());

        SET v_bank_error = FALSE; 

        IF v_bank_error THEN
            ROLLBACK;
            SELECT 'Lỗi: Hệ thống ngân hàng trục trặc. Giao dịch đã được hủy!' AS message;
        ELSE
            COMMIT;
            SELECT CONCAT('Thành công: Đã chuyển lương cho nhân viên ID ', p_emp_id) AS message;
        END IF;
    END IF;

END //

DELIMITER ;

CALL sp_pay_salary(1); 

CALL sp_pay_salary(99);