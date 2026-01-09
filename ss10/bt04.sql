use social_network_pro;
-- 2 
EXPLAIN ANALYZE
SELECT post_id, content, created_at
FROM posts
WHERE user_id = 1
  AND created_at >= '2026-01-01'
  AND created_at < '2027-01-01';

CREATE INDEX idx_created_at_user_id
ON posts (user_id, created_at);

EXPLAIN ANALYZE
SELECT post_id, content, created_at
FROM posts
WHERE user_id = 1
  AND created_at >= '2026-01-01'
  AND created_at < '2027-01-01';

-- 3 
EXPLAIN ANALYZE
SELECT user_id, username, email
FROM users
WHERE email = 'an@gmail.com';

CREATE UNIQUE INDEX idx_email
ON users (email);

EXPLAIN ANALYZE
SELECT user_id, username, email
FROM users
WHERE email = 'an@gmail.com';

-- 4 
DROP INDEX idx_created_at_user_id ON posts;
DROP INDEX idx_email ON users;
