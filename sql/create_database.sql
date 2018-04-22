
-- -----------------------------------------------------
-- Schema Twitter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS Twitter DEFAULT CHARACTER SET utf8 ;
USE Twitter ;

-- -----------------------------------------------------
-- Table Twitter.Users
-- -----------------------------------------------------
DROP TABLE IF EXISTS Twitter.Users ;

CREATE TABLE IF NOT EXISTS Twitter.Users (
  uid INT NOT NULL AUTO_INCREMENT,
  u_first VARCHAR(45) NULL,
  u_last VARCHAR(45) NULL,
  PRIMARY KEY (uid))
;


-- -----------------------------------------------------
-- Table Twitter.Messages
-- -----------------------------------------------------
DROP TABLE IF EXISTS Twitter.Messages ;

CREATE TABLE IF NOT EXISTS Twitter.Messages (
  mid INT NOT NULL AUTO_INCREMENT,
  message CHAR(255) NULL,
  PRIMARY KEY (mid))
;


-- -----------------------------------------------------
-- Table Twitter.User_has_Messages
-- -----------------------------------------------------
DROP TABLE IF EXISTS Twitter.User_has_Messages ;

CREATE TABLE IF NOT EXISTS Twitter.User_has_Messages (
  uid INT NOT NULL,
  mid INT NOT NULL,
  isRetweet INT NULL,
  original_user INT NOT NULL,
  PRIMARY KEY (uid, mid, original_user),
  INDEX fk_Messages_has_Users_Users1_idx (uid ASC),
  INDEX fk_Messages_has_Users_Messages_idx (mid ASC),
  INDEX fk_User_has_Messages_Users1_idx (original_user ASC),
  CONSTRAINT fk_Messages_has_Users_Messages
    FOREIGN KEY (mid)
    REFERENCES Twitter.Messages (mid)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Messages_has_Users_Users1
    FOREIGN KEY (uid)
    REFERENCES Twitter.Users (uid)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_User_has_Messages_Users1
    FOREIGN KEY (original_user)
    REFERENCES Twitter.Users (uid)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table Twitter.User_Favorites_Message
-- -----------------------------------------------------
DROP TABLE IF EXISTS Twitter.User_Favorites_Message ;

CREATE TABLE IF NOT EXISTS Twitter.User_Favorites_Message (
  uid INT NOT NULL,
  mid INT NOT NULL,
  PRIMARY KEY (uid, mid),
  INDEX fk_Messages_has_Users_Users2_idx (uid ASC),
  INDEX fk_Messages_has_Users_Messages1_idx (mid ASC),
  CONSTRAINT fk_Messages_has_Users_Messages1
    FOREIGN KEY (mid)
    REFERENCES Twitter.Messages (mid)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Messages_has_Users_Users2
    FOREIGN KEY (uid)
    REFERENCES Twitter.Users (uid)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table Twitter.User_Follows
-- -----------------------------------------------------
DROP TABLE IF EXISTS Twitter.User_Follows ;

CREATE TABLE IF NOT EXISTS Twitter.User_Follows (
  uid_1 INT NOT NULL,
  uid_2 INT NOT NULL,
  PRIMARY KEY (uid_1, uid_2),
  INDEX fk_User_Follows_Users2_idx (uid_2 ASC),
  CONSTRAINT fk_User_Follows_Users1
    FOREIGN KEY (uid_1)
    REFERENCES Twitter.Users (uid)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_User_Follows_Users2
    FOREIGN KEY (uid_2)
    REFERENCES Twitter.Users (uid)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;

INSERT INTO users (u_first,u_last) VALUES
	('Samantha','Stevens'),
    ('Bob','Bobson'),
    ('Computer','Man'),
    ('Media','Addict'),
    ('Test','Pilot');
    
INSERT INTO messages (message) VALUES
	('I like Twitter!'),
    ('Good thing I have a 255 charicter limit!'),
    ('Twitter is dumb!'),
    ('( .-. )'),
    ('I like computers!'),
    ('Flying planes is pretty cool'),
    ('Windows look nice!');
    
INSERT INTO user_has_messages VALUES
	(1,1,0,1),
    (2,2,0,2),
    (3,3,0,3),
    (3,5,0,3),
    (3,2,1,2),
    (4,4,0,4),
    (1,3,1,3),
    (4,1,1,1),
    (5,6,0,5),
    (5,7,0,5),
    (5,1,1,1);
    
INSERT INTO user_follows VALUES
	(1,3),
    (1,2),
    (2,1),
    (2,4),
    (4,2),
    (2,5),
    (5,3);
    
INSERT INTO user_favorites_message VALUES
	(1,2),
    (1,3),
    (2,1),
    (2,6),
    (5,3),
    (5,5);