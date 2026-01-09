use social_network_pro;

CREATE INDEX idx_hometown
ON users (hometown);

SELECT u.username, p.post_id, p.content
FROM users u
JOIN posts p ON u.user_id = p.user_id
WHERE u.hometown = 'Hà Nội'
ORDER BY u.username DESC
LIMIT 10;

EXPLAIN ANALYZE
SELECT u.username, p.post_id, p.content
FROM users u
JOIN posts p ON u.user_id = p.user_id
WHERE u.hometown = 'Hà Nội'
ORDER BY u.username DESC
LIMIT 10;
