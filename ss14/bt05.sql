CREATE DATABASE social_network;
USE social_network;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    posts_count INT DEFAULT 0
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (username) VALUES ('Minh_Tuan'), ('Thu_Ha');

DELIMITER //

CREATE PROCEDURE CreatePost(IN p_user_id INT, IN p_content TEXT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Lỗi hệ thống: Giao dịch đã được hủy (Rollback)' AS Message;
    END;

    START TRANSACTION;

    INSERT INTO posts (user_id, content) VALUES (p_user_id, p_content);

    UPDATE users SET posts_count = posts_count + 1 WHERE user_id = p_user_id;

    COMMIT;
    SELECT 'Thành công: Giao dịch đã được ghi nhận (Commit)' AS Message;
END //

DELIMITER ;

CALL CreatePost(2, 'Nội dung hợp lệ');
CALL CreatePost(88, 'Nội dung lỗi'); 