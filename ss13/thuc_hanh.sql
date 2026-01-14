create database thuc_hanh;
use thuc_hanh;

create table users(
	user_id INT primary key auto_increment,
	username VARCHAR(255),
	total_posts INT Default 0
);

create table posts(
	post_id INT primary key auto_increment,
	user_id INT,
	content TEXT,
	created_at DATETIME,
    
	foreign key (user_id) references users(user_id)
);

create table post_audits(
	audit_id INT primary key auto_increment,
	post_id INT,
	old_content TEXT,
	new_content TEXT,
	changed_at DATETIME
);

-- 1
DELIMITER //
CREATE TRIGGER tg_check_post_content 
BEFORE INSERT ON posts FOR EACH ROW
BEGIN
	IF (NEW.content IS NULL OR TRIM(NEW.content)='') THEN
    SET MESSAGE_TEXT = 'Nội dung bài viết không được để trống!';
	END IF;
END //

-- 2
DELIMITER //
CREATE TRIGGER tg_log_post_changes
AFTER UPDATE ON posts FOR EACH ROW
BEGIN
	INSERT INTO post_audits (post_id,old_content,new_content,changed_at) VALUE ();
END //

