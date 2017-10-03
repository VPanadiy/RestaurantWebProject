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
-- Table structure for table 'authorities'
--

DROP TABLE IF EXISTS authorities;

CREATE SEQUENCE authorities_seq;

CREATE TABLE authorities (
  id int NOT NULL DEFAULT NEXTVAL ('authorities_seq'),
  username varchar(50) NOT NULL,
  authority varchar(50) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uni_username_role UNIQUE (authority,username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username)
);

ALTER SEQUENCE authorities_seq RESTART WITH 4;

CREATE INDEX fk_username_idx ON authorities (username);

--
-- Dumping data for table 'authorities'
--

INSERT INTO authorities VALUES (1,'admin','ROLE_ADMIN'),(2,'user','ROLE_USER');

--
-- Table structure for table 'persistent_logins'
--

DROP TABLE IF EXISTS persistent_logins;

CREATE TABLE persistent_logins (
  username varchar(64) NOT NULL,
  series varchar(64) NOT NULL,
  token varchar(64) NOT NULL,
  last_used timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (series)
);