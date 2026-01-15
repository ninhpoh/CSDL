CREATE DATABASE thuc_hanh;
USE thuc_hanh;

-- 1. Tạo bảng Users (Người dùng)

CREATE TABLE users (

    user_id INT AUTO_INCREMENT PRIMARY KEY,

    username VARCHAR(50) NOT NULL,

    total_posts INT DEFAULT 0

);

-- 2. Tạo bảng Posts (Bài viết)

CREATE TABLE posts (

    post_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT,

    content TEXT,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id)

);

-- 3. Tạo dữ liệu mẫu

INSERT INTO users (username, total_posts) VALUES ('nguyen_van_a', 0);

INSERT INTO users (username, total_posts) VALUES ('le_thi_b', 0);

delimiter //
CREATE PROCEDURE sp_create_post (p_user_id INT, p_content TEXT)
BEGIN 
    START TRANSACTION;
    SET autocommit = 0;
		SELECT username INTO @check_user FROM users WHERE user_id = p_user_id;
        
        if (@check_user IS NULL OR trim(@check_user) = '') THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Lỗi';
		END IF;
        
		if (p_content IS NULL OR trim(p_content) = '') THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Lỗi';
		END IF;
    
        INSERT INTO posts (user_id, content)
        VALUES (p_user_id, p_content);

        UPDATE users
        SET total_posts = total_posts + 1
        WHERE user_id = p_user_id;
        
    COMMIT;
END //

CALL sp_create_post('2','asd');