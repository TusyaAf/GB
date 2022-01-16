Microsoft Windows [Version 10.0.19043.1466]
(c) Корпорация Майкрософт (Microsoft Corporation). Все права защищены.

C:\Users\79104> -u root -p
"-u" не является внутренней или внешней
командой, исполняемой программой или пакетным файлом.

C:\Users\79104>mysql -u root -p
Enter password: *******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> drop database if exists vk;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> create database vk;
Query OK, 1 row affected (0.00 sec)

mysql> use vk;
Database changed
mysql> drop table if exists users;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> create table users;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> crate table users(
    -> id
    -> first name
    -> lastname
    -> email
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'crate table users(
id
first name
lastname
email' at line 1
mysql> create table users ( );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table users (
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create table users (id BIGINT unsigned not null auto_incrementprimary key, firstname VARCHAR(50), lastname VARCHAR(50) comment 'Фамилия', email VARCHAR(120) unique, password_hash VARCHAR(100), phone BIGINT unsigned unique,index users_firstname_lastname_idx(firstname, lastname));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'auto_incrementprimary key, firstname VARCHAR(50), lastname VARCHAR(50) comment '' at line 1
mysql> create table users (id BIGINT unsigned not null auto_increment primary key, firstname VARCHAR(50), lastname VARCHAR(50) comment 'Фамилия', email VARCHAR(120) unique, password_hash VARCHAR(100), phone BIGINT unsigned unique,index users_firstname_lastname_idx(firstname, lastname));
Query OK, 0 rows affected (0.07 sec)

mysql> create table profiles(user_id BIGINT unsigned not null unique, gender CHAR(1), birtday date, photo_id BIGINT unsigned not null, created_at datetime default now(), hometown VARCHAR(100));
Query OK, 0 rows affected (0.06 sec)

mysql> alter table profiles;
Query OK, 0 rows affected (0.02 sec)

mysql> alter table profiles add constraint fk_users_id foreign key (user_id) references users(id) on update cascade on delete restrict;
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> drop table if exists messages;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> create table messages;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table messages (id SERIAL, from_user_id BIGINT unsigned not null, to_user_id BIGINT unsigned not null, body text, created_at datetime default now(), foreign key (from_user_id) references users(id), foreign key (to_user_id) references user(id),);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table messages (id SERIAL, from_user_id BIGINT unsigned not null, to_user_id BIGINT unsigned not null, body text, created_at datetime default now(), foreign key (from_user_id) references users(id), foreign key (to_user_id) references user(id));
ERROR 1824 (HY000): Failed to open the referenced table 'user'
mysql> create table messages (id SERIAL, from_user_id BIGINT unsigned not null, to_user_id BIGINT unsigned not null, body text, created_at datetime default now(), foreign key (from_user_id) references users(id), foreign key (to_user_id) references users(id),);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table messages (id SERIAL, from_user_id BIGINT unsigned not null, to_user_id BIGINT unsigned not null, body text, created_at datetime default now(), foreign key (from_user_id) references users(id), foreign key (to_user_id) references users(id));
Query OK, 0 rows affected (0.07 sec)

mysql> create table friends_requests (initiator_user_id BIGINT unsigned not null, target_user_id BIGINT unsigned not null, 'status' enum('requested','approved','declined','unfriended'), requested_at datatme default now(), updated_at datatime on update CURRENT_TIMESTAMP, primary key (initiator_user_id, target_user_id), foreign key ((initiator_user_id) references users(id), foreign key (target_user_id) references users(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''status' enum('requested','approved','declined','unfriended'), requested_at data' at line 1
mysql> create table friends_requests (initiator_user_id BIGINT unsigned not null, target_user_id BIGINT unsigned not null, 'status' enum('requested','approved','declined','unfriended'), requested_at datatime default now(), updated_at datatime on update CURRENT_TIMESTAMP, primary key (initiator_user_id, target_user_id), foreign key ((initiator_user_id) references users(id), foreign key (target_user_id) references users(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''status' enum('requested','approved','declined','unfriended'), requested_at data' at line 1
mysql> create table friends_requests (initiator_user_id BIGINT unsigned not null, target_user_id BIGINT unsigned not null, 'status' enum('requested','approved','declined','unfriended'), requested_at datatime default now(), updated_at datatime on update CURRENT_TIMESTAMP, primary key (initiator_user_id, target_user_id), foreign key ((initiator_user_id) references users(id), foreign key (target_user_id) references users(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''status' enum('requested','approved','declined','unfriended'), requested_at data' at line 1
mysql> create table friends_requests (initiator_user_id BIGINT unsigned not null, target_user_id BIGINT unsigned not null, `status` enum('requested','approved','declined','unfriended'), requested_at datatime default now(), updated_at datatime on update CURRENT_TIMESTAMP, primary key (initiator_user_id, target_user_id), foreign key ((initiator_user_id) references users(id), foreign key (target_user_id) references users(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'datatime default now(), updated_at datatime on update CURRENT_TIMESTAMP, primary' at line 1
mysql> create table friends_requests (initiator_user_id BIGINT unsigned not null, target_user_id BIGINT unsigned not null, 'status' enum('requested','approved','declined','unfriended'), requested_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP, primary key (initiator_user_id, target_user_id), foreign key ((initiator_user_id) references users(id), foreign key (target_user_id) references users(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''status' enum('requested','approved','declined','unfriended'), requested_at date' at line 1
mysql> create table friends_requests (initiator_user_id BIGINT unsigned not null, target_user_id BIGINT unsigned not null, `status` enum('requested','approved','declined','unfriended'), requested_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP, primary key (initiator_user_id, target_user_id), foreign key ((initiator_user_id) references users(id), foreign key (target_user_id) references users(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(initiator_user_id) references users(id), foreign key (target_user_id) reference' at line 1
mysql> create table friends_requests (initiator_user_id BIGINT unsigned not null, target_user_id BIGINT unsigned not null, `status` enum('requested','approved','declined','unfriended'), requested_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP, primary key (initiator_user_id, target_user_id), foreign key (initiator_user_id) references users(id), foreign key (target_user_id) references users(id));
Query OK, 0 rows affected (0.10 sec)

mysql> alter table friend_requests add check (initiator_user_id <> target_user_id);
ERROR 1146 (42S02): Table 'vk.friend_requests' doesn't exist
mysql>  alter table friends_requests add check (initiator_user_id <> target_user_id);
Query OK, 0 rows affected (0.16 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table communities (id serial, name varchar(100), admin_user_id BIGINT unsigned not null, index communities_name_idx (name), foreign key (admin_user_id) references users(id));
Query OK, 0 rows affected (0.11 sec)

mysql> create table users_communities (user_id BIGINT unsigned not null, community_id BIGINT unsigned not null, primary key (user_id, community_id), foreign key (user_id) references users(id), foreign key (community_id) references communities(id));
Query OK, 0 rows affected (0.09 sec)

mysql> create table media_types (id serial, name varchar (50),  requested_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP);
Query OK, 0 rows affected (0.06 sec)

mysql> create table media (id serial, media_type_id BIGINT unsigned not null, filename varchar (255),user_id BIGINT unsigned not null, body text, size int, metadata JSON, created_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP), foreign ley (user_id) references users(id), foreign key (media_type_id) references media_types(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign ley (user_id) references users(id), foreign key (media_type_id) refere' at line 1
mysql> create table media (id serial, media_type_id BIGINT unsigned not null, filename varchar (255),user_id BIGINT unsigned not null, body text, size int, metadata JSON, created_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP), foreign key (user_id) references users(id), foreign key (media_type_id) references media_types(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign key (user_id) references users(id), foreign key (media_type_id) refere' at line 1
mysql> create table media (id serial, media_type_id BIGINT unsigned not null, filename varchar (255),user_id BIGINT unsigned not null, body text, size int, metadata JSON, created_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP), foreign key (user_id) references users(id), foreign key (media_type_id) references media_types(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign key (user_id) references users(id), foreign key (media_type_id) refere' at line 1
mysql> create table media (id serial, media_type_id BIGINT unsigned not null, filename varchar (255),user_id BIGINT unsigned not null, body text, size int, metadata JSON, created_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP),foreign key (user_id) references users(id), foreign key (media_type_id) references media_types(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',foreign key (user_id) references users(id), foreign key (media_type_id) referen' at line 1
mysql> create table media (id serial, media_type_id BIGINT unsigned not null, user_id BIGINT unsigned not null, body text, filename varchar(255), size int, metadata JSON, created_at datetime default now(), updated_at datetime on update current_timestamp, foreign key (user_id) references users(id), foreign key (media_type_id) references media_types(id));
Query OK, 0 rows affected (0.07 sec)

mysql> create table likes (id serial, user_id BIGINT unsigned not null, media_id BIGINT unsegned not null, created_at datetime default now());
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unsegned not null, created_at datetime default now())' at line 1
mysql> create table likes (id serial, user_id BIGINT unsigned not null, media_id BIGINT unsigned not null, created_at datetime default now());
Query OK, 0 rows affected (0.04 sec)

mysql> create table photo_albums (id serial, user_id BIGINT unsigned not null, name varchar(100), foreign key (user_id) references users(id));
Query OK, 0 rows affected (0.06 sec)

mysql> create table photos (id serial, album_id BIGINT unsigned not null, media_id BIGINT unsigned not null, foreign key (album_id)references photo_albums(id), foreign key(media_id) references media(id));
Query OK, 0 rows affected (0.08 sec)

mysql> create table user_profile (id serial, user_id BIGINT unsigned not null, language varchar(50), interests text, about_me text, school text, university text, pets text, followers int, communities int, photos int, audios int, videos int, foreign key (user_id) references users(id));
Query OK, 0 rows affected (0.06 sec)

mysql> create table notifications (id serial, user_id BIGINT unsigned not null, community_id BIGINT unsigned not null, body text, created_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table notifications (id serial, user_id BIGINT unsigned not null, community_id BIGINT unsigned not null, body text, created_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP, foreign key (user_id) references users(id), foreign key (community_id) references communities(id));
Query OK, 0 rows affected (0.06 sec)

mysql> create table news (id serial, user_id BIGINT unsigned not null, community_id BIGINT unsigned not null, body text, created_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP, comments text, commentors_id BIGINT unsigned not null, foreign key (user_id) references users(id), foreign key (community_id) references communities(id));
Query OK, 0 rows affected (0.06 sec)

mysql> create table comments (id serial, user_id BIGINT unsigned not null, news_id BIGINT unsigned not null, body text,created_at datetime default now(), updated_at datetime on update CURRENT_TIMESTAMP, foreign key (user_id) references users(id), foreign key (news_id) references news(id));
Query OK, 0 rows affected (0.05 sec)

mysql> alter table likes add (foreign key (user_id) references users(id));
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>