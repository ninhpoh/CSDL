use social_network_pro;

DELIMITER $$
CREATE PROCEDURE sp_GetPostsByUser (
    IN p_user_id INT
)
BEGIN
    SELECT 
        post_id,
        content,
        created_at
    FROM posts
    WHERE user_id = p_user_id
    ORDER BY created_at DESC;
END $$
DELIMITER ;

CALL sp_GetPostsByUser(1);

DROP PROCEDURE IF EXISTS sp_GetPostsByUser;
