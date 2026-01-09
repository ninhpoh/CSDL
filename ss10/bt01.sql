use social_network_pro;

CREATE OR REPLACE VIEW view_users_firstname AS
SELECT 
    user_id,
    username,
    full_name,
    email,
    created_at
FROM users
WHERE full_name LIKE 'Nguyễn';

SELECT * FROM view_users_firstname;

INSERT INTO users (username, full_name, gender, email, password, birthdate, hometown)
VALUES ('nguyenvana', 'Nguyễn Văn A', 'Nam', 'nguyenvana@example.com', '123456', '1990-05-10', 'Hà Nội');

DELETE FROM users
WHERE username = 'nguyenvana';
