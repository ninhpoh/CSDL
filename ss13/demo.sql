create database demo_ss13;
use demo_ss13;

create table users(
	user_id int primary key auto_increment,
    full_name varchar(255),
    username varchar(255),
    password varchar(255)
);

create table profiles(
	id int primary key auto_increment,
    user_id int unique,
    phone varchar(10),
    email varchar(255),
    address varchar(255),
    foreign key (user_id) references users(user_id)
);

DELIMITER //
create TRIGGER tg_insert_new_user
after insert 
on users for each row
begin
	insert into profiles (user_id) values (new.user_id);
end //

insert into users (full_name,username,password) value ('ninh','asd','12345');

DELIMITER //
create TRIGGER tg_delete_user
before delete
on users for each row
begin
	delete from profiles where user_id = old.user_id;
end //

delete from users where user_id = '1';