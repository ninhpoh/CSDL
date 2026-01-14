use ss13;

DELIMITER //
CREATE TRIGGER before_like_insert
BEFORE INSERT ON likes
FOR EACH ROW
BEGIN
    DECLARE post_owner_id INT;

    SELECT user_id INTO post_owner_id 
    FROM posts 
    WHERE post_id = NEW.post_id;

    IF NEW.user_id = post_owner_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Bạn không thể thích bài viết của chính mình!';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_like_update
AFTER UPDATE ON likes
FOR EACH ROW
BEGIN
    -- Nếu thay đổi bài viết được thích
    IF OLD.post_id <> NEW.post_id THEN
        -- Giảm like bài cũ
        UPDATE posts SET like_count = like_count - 1 WHERE post_id = OLD.post_id;
        -- Tăng like bài mới
        UPDATE posts SET like_count = like_count + 1 WHERE post_id = NEW.post_id;
    END IF;
END //
DELIMITER ;

-- Lệnh vấp phải lỗi 
INSERT INTO likes (user_id, post_id) VALUES (1, 1);

INSERT INTO likes (user_id, post_id) VALUES (2, 1);

-- Kiểm tra like_count của post 1
SELECT post_id, content, like_count FROM posts WHERE post_id = 1;

-- Giả sử like_id vừa tạo là 6
UPDATE likes SET post_id = 3 WHERE like_id = 6;

-- Kiểm chứng: post 1 giảm 1 like, post 3 tăng 1 like
SELECT post_id, like_count FROM posts WHERE post_id IN (1, 3);

DELETE FROM likes WHERE post_id = 3 LIMIT 1;

-- Kiểm tra lại like_count bài 3
SELECT post_id, like_count
FROM posts
WHERE post_id = 3;

