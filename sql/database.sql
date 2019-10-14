-- DATABASE video_server

-- TABLE: video_info
-- id VARCHAR(64), PRIMARY KEY, NOT NULL
-- author_id UNSIGNED INT
-- name TEXT
-- display_ctime TEXT
-- create_time DATETIME
	
-- TABLE: comments
-- id VARCHAR(64), PRIMARY, NOT NULL
-- video_id VARCHAR(64)
-- author_id UNSIGNED INT
-- content TEXT
-- time DATETIME

-- TABLE: sessions
-- session_id TINYTEXT, PRIMARY KEY, NOT NULL
-- TTL TINYTEXT
-- login_name VARCHAR(64)

-- TABLE: video_del_rec
-- session_id VARCHAR(64), PRIMARY KEY, NOT NULL


-- CREATE DATABASE video_server;

-- USE video_server;

-- CREATE TABLE users (
--    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
--    login_name VARCHAR(64) UNIQUE,
--    pwd TEXT
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE TABLE video_info (
--    id VARCHAR(64) NOT NULL PRIMARY KEY,
--    author_id INT UNSIGNED,
--    name TEXT,
--    display_ctime TEXT,
--    create_time DATETIME
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE TABLE comments(
--    id VARCHAR(64) NOT NULL PRIMARY KEY,
--    video_id VARCHAR(64),
--    author_id INT UNSIGNED,
--    content TEXT,
--    time DATETIME
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -- tinytext设置为主键报错，用varchar代替先
-- CREATE TABLE sessions(
--    session_id VARCHAR(64) NOT NULL PRIMARY KEY,
--    TTL VARCHAR(64),
--    login_name VARCHAR(64)
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- CREATE TABLE video_del_rec(
--    session_id VARCHAR(64) NOT NULL PRIMARY KEY
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table comments (
	id varchar(64) not null,
	video_id varchar(64),
	author_id int(10),
	content text,
	time datetime default current_timestamp, primary key(id)
);

create table sessions (
	session_id tinytext not null,
	TTL tinytext,
	login_name text
);
alter table sessions add primary key (session_id(64));

create table users (
	id int unsigned not null auto_increment,
	login_name varchar(64),
	pwd text not null,
	unique key (login_name),
	primary key (id)
);

create table video_del_rec (
	video_id varchar(64) not null,
	primary key (video_id)
);

create table video_info (
	id varchar(64) not null,
	author_id int(10),
	name text,
	display_ctime text,
	create_time datetime default current_timestamp,
	primary key (id)
);