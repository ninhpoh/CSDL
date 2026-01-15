USE social_network;

CREATE TABLE likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    UNIQUE KEY unique_like (post_id, user_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

ALTER TABLE posts ADD COLUMN likes_count INT DEFAULT 0;

DELIMITER //

CREATE PROCEDURE sp_like_post_if_else(
    IN p_post_id INT,
    IN p_user_id INT
)
BEGIN
    DECLARE v_already_liked INT;

    -- 1. Kiểm tra xem user này đã like post này chưa
    SELECT COUNT(*) INTO v_already_liked 
    FROM likes 
    WHERE post_id = p_post_id AND user_id = p_user_id;

    -- 2. Sử dụng IF ELSE để quyết định hành động
    IF v_already_liked > 0 THEN
        -- Nếu đã like rồi thì thông báo và không làm gì cả
        SELECT 'Thông báo: Bạn đã thích bài viết này từ trước rồi!' AS Message;
    ELSE
        -- Nếu chưa like thì mới bắt đầu Transaction để ghi dữ liệu
        START TRANSACTION;
        
        -- Thêm vào bảng likes
        INSERT INTO likes (post_id, user_id) VALUES (p_post_id, p_user_id);
        
        -- Cập nhật số lượng ở bảng posts
        UPDATE posts SET likes_count = likes_count + 1 WHERE post_id = p_post_id;
        
        COMMIT;
        SELECT 'Thành công: Đã cập nhật lượt thích!' AS Message;
    END IF;
END //

DELIMITER ;

CALL sp_handle_like(1, 1);

SELECT * FROM likes WHERE post_id = 1 AND user_id = 1;
SELECT post_id, likes_count FROM posts WHERE post_id = 1;

CALL sp_handle_like(1, 1);