use ss12;

-- 1
INSERT INTO Users (username, password, email) 
VALUES ('nguyenvanan', 'password123', 'van11a@gmail.com');

INSERT INTO Users (username, password, email) 
VALUES 
('tran_thi_binh', 'securepass456', 'thib@gmail.com'),
('le_van_chinh', 'mypassword789', 'vanc@gmail.com');

SELECT * FROM Users;

-- 2
CREATE VIEW vw_public_users AS
SELECT user_id, username, created_at
FROM Users;

SELECT * FROM vw_public_users;

-- 3
CREATE INDEX idx_username ON Users(username);
SELECT user_id, username, email 
FROM Users 
WHERE username = 'nguyenvanan';

-- 4
