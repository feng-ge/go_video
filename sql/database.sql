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


CREATE DATABASE video_server;

USE video_server;

CREATE TABLE users (
   id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   login_name VARCHAR(64) UNIQUE,
   pwd TEXT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE video_info (
   id VARCHAR(64) NOT NULL PRIMARY KEY,
   author_id INT UNSIGNED,
   name TEXT,
   display_ctime TEXT,
   create_time DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE comments(
   id VARCHAR(64) NOT NULL PRIMARY KEY,
   video_id VARCHAR(64),
   author_id INT UNSIGNED,
   content TEXT,
   time DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- tinytext设置为主键报错，用varchar代替先
CREATE TABLE sessions(
   session_id VARCHAR(64) NOT NULL PRIMARY KEY,
   TTL VARCHAR(64),
   login_name VARCHAR(64)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE video_del_rec(
   session_id VARCHAR(64) NOT NULL PRIMARY KEY,
)