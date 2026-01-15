CREATE DATABASE bt01;
use bt01;

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL CHECK (balance >= 0)
);

INSERT INTO accounts (account_name, balance) VALUES 
('Nguyễn Văn An', 1000.00),
('Trần Thị Bảy', 500.00);

DELIMITER //

CREATE PROCEDURE sp_transfer_money(
    IN from_account INT,
    IN to_account INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    DECLARE current_balance DECIMAL(10,2);

    START TRANSACTION;

    SELECT balance INTO current_balance FROM accounts WHERE account_id = from_account FOR UPDATE;

    IF current_balance IS NULL THEN
        SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Lỗi';
        ROLLBACK;
    ELSEIF current_balance < amount THEN
        SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Lỗi';
        ROLLBACK;
    ELSE
        UPDATE accounts SET balance = balance - amount WHERE account_id = from_account;

        UPDATE accounts SET balance = balance + amount WHERE account_id = to_account;

        IF ROW_COUNT() = 0 THEN
            SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Lỗi';
            ROLLBACK;
        ELSE
            COMMIT;
            SELECT 'Giao dịch thành công!' AS Message;
        END IF;
    END IF;
END //

DELIMITER ;

CALL sp_transfer_money(1, 2, 200.00);
CALL sp_transfer_money(1, 2, 2000.00);