--
-- Table structure for table 'users'
--

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  username varchar(45) NOT NULL,
  password varchar(45) NOT NULL,
  enabled smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (username)
);

--
-- Dumping data for table 'users'
--

INSERT INTO users VALUES ('admin','admin',1),('user','user',1);

--
-- Table structure for table 'groups'
--

DROP TABLE IF EXISTS groups;

CREATE SEQUENCE groups_seq;

CREATE TABLE groups (
  id bigint check (id > 0) NOT NULL DEFAULT NEXTVAL ('groups_seq'),
  group_name varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

ALTER SEQUENCE groups_seq RESTART WITH 3;

--
-- Dumping data for table 'groups'
--

INSERT INTO groups VALUES (1,'administrators'),(2,'users');

--
-- Table structure for table 'group_members'
--

DROP TABLE IF EXISTS group_members;

CREATE SEQUENCE group_members_seq;

CREATE TABLE group_members (
  id bigint check (id > 0) NOT NULL DEFAULT NEXTVAL ('group_members_seq'),
  username varchar(50) NOT NULL,
  group_id bigint check (group_id > 0) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT group_members_ibfk_1 FOREIGN KEY (group_id) REFERENCES groups (id)
);

ALTER SEQUENCE group_members_seq RESTART WITH 3;

CREATE INDEX group_id ON group_members (group_id);

--
-- Dumping data for table 'group_members'
--

INSERT INTO group_members VALUES (1,'admin',1),(2,'user',2);

--
-- Table structure for table 'group_authorities'
--

DROP TABLE IF EXISTS group_authorities;

CREATE TABLE group_authorities (
  group_id bigint check (group_id > 0) NOT NULL,
  authority varchar(50) NOT NULL ,
  CONSTRAINT group_authorities_ibfk_1 FOREIGN KEY (group_id) REFERENCES groups (id)
);

--
-- Dumping data for table 'group_authorities'
--

INSERT INTO group_authorities VALUES (1,'ROLE_ADMIN'),(1,'ROLE_USER'),(2,'ROLE_USER');

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS persistent_logins;

CREATE TABLE persistent_logins (
  username varchar(64) NOT NULL,
  series varchar(64) NOT NULL,
  token varchar(64) NOT NULL,
  last_used timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (series)
);