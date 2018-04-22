USE twitter;

# Get all user followers

SELECT CONCAT(u.u_first, " ", u.u_last, " follows ", u2.u_first, " ", u2.u_last) AS Followers FROM user_follows 
	INNER JOIN users AS u ON user_follows.uid_1=u.uid
	INNER JOIN users AS u2 ON user_follows.uid_2=u2.uid;
        
# Get user followers by user        

SELECT CONCAT(u.u_first, " ", u.u_lASt, " follows ", u2.u_first, " ", u2.u_last) AS Followers FROM user_follows 
	INNER JOIN users AS u ON user_follows.uid_1=u.uid
	INNER JOIN users AS u2 ON user_follows.uid_2=u2.uid
    WHERE u.uid=1; # In this case Samantha Stevens
    
# Get how many followers a user has       

SELECT CONCAT(u.u_first, " ", u.u_last, " has ", COUNT(u.uid), " followers") AS Followers FROM user_follows 
	INNER JOIN users AS u ON user_follows.uid_1=u.uid
	INNER JOIN users AS u2 ON user_follows.uid_2=u2.uid
    WHERE u2.uid=3; # In this case Computer Man
        
# Get timeline per user
        
SELECT 	CONCAT(u.u_first, " ", u.u_last, " says ") AS user, m.message, CONCAT("Original by ", u2.u_first, " ", u2.u_last) AS retweet FROM user_has_messages AS uhm 
	INNER JOIN users AS u ON u.uid=uhm.uid
	INNER JOIN messages AS m ON m.mid=uhm.mid
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE u.uid=1; # Optional, if taken out full timeline is shown
    
# Get full timeline
    
SELECT 	CONCAT(u.u_first, " ", u.u_last, " says ") AS user, m.message, CONCAT("Original by ", u2.u_first, " ", u2.u_last) AS retweet from user_has_messages AS uhm 
	INNER JOIN users AS u ON u.uid=uhm.uid
	INNER JOIN messages AS m ON m.mid=uhm.mid
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid;
    
# Get timeline based on who a user is following
    
SELECT 	CONCAT(u.u_first, " ", u.u_last, " says ") AS user, m.message, CONCAT("Original by ", u2.u_first, " ", u2.u_last) AS retweet from user_has_messages AS uhm 
	INNER JOIN users AS u ON u.uid=uhm.uid
	INNER JOIN messages AS m ON m.mid=uhm.mid
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    INNER JOIN user_follows AS uf ON uf.uid_1=1 # User is Samantha Stevens
    WHERE uhm.uid=uf.uid_2;
    
# Get timeline based on who a user is following, with original tweets only
    
SELECT 	CONCAT(u.u_first, " ", u.u_last, " says ") AS user, m.message, CONCAT("Original by ", u2.u_first, " ", u2.u_last) AS retweet from user_has_messages AS uhm 
	INNER JOIN users AS u ON u.uid=uhm.uid
	INNER JOIN messages AS m ON m.mid=uhm.mid
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    INNER JOIN user_follows AS uf ON uf.uid_1=1 # User is Samantha Stevens
    WHERE uhm.uid=uf.uid_2 AND uhm.original_user=uf.uid_2; # Only original tweets
    
# Get all favorited tweets
    
SELECT CONCAT(u.u_first, " ", u.u_last, " favorited ") AS user, m.message, CONCAT(" by ", u2.u_first, " ", u2.u_last) AS original_user FROM user_favorites_message AS ufm 
	INNER JOIN users AS u ON ufm.uid=u.uid
    INNER JOIN messages AS m ON ufm.mid=m.mid
	INNER JOIN user_has_messages AS uhm ON ufm.mid=uhm.mid 
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE uhm.isRetweet=0;
    
# Get amount of favorites per user
    
SELECT COUNT(u.uid) AS favorites FROM user_favorites_message AS ufm 
	INNER JOIN users AS u ON ufm.uid=u.uid
    INNER JOIN messages AS m ON ufm.mid=m.mid
	INNER JOIN user_has_messages AS uhm ON ufm.mid=uhm.mid 
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE uhm.isRetweet=0 AND u2.uid=3; # In this case Computer Man
    
# Get favorites for individual message
    
SELECT CONCAT(u.u_first, " ", u.u_last, " favorited ") AS user, m.message, CONCAT(" by ", u2.u_first, " ", u2.u_last) AS original_user FROM user_favorites_message AS ufm 
	INNER JOIN users AS u ON ufm.uid=u.uid
    INNER JOIN messages AS m ON ufm.mid=m.mid
	INNER JOIN user_has_messages AS uhm ON ufm.mid=uhm.mid 
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE uhm.isRetweet=0 AND ufm.mid=1; # The message is "I like Twitter!" In this case
    
# Get how many times an individual message was favorited
    
SELECT COUNT(m.message) AS count_favorites FROM user_favorites_message AS ufm 
	INNER JOIN users AS u ON ufm.uid=u.uid
    INNER JOIN messages AS m ON ufm.mid=m.mid
	INNER JOIN user_has_messages AS uhm ON ufm.mid=uhm.mid 
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE uhm.isRetweet=0 AND ufm.mid=3; # The message is "Twitter is dumb!" In this case
    
# Get favorites by user
    
SELECT CONCAT(u.u_first, " ", u.u_last, " favorited ") AS user, m.message, CONCAT(" by ", u2.u_first, " ", u2.u_last) AS original_user FROM user_favorites_message AS ufm 
	INNER JOIN users AS u ON ufm.uid=u.uid
    INNER JOIN messages AS m ON ufm.mid=m.mid
	INNER JOIN user_has_messages AS uhm ON ufm.mid=uhm.mid 
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE uhm.isRetweet=0 AND ufm.uid=1; # In this case Samantha Stevens
    
#------------------- Inserts -------------------

# Simulates creating a new tweet

INSERT INTO messages (message) VALUES 
	('New tweets are fun!');
INSERT INTO user_has_messages VALUES
	(1,8,0,1);
    
SELECT 	CONCAT(u.u_first, " ", u.u_last, " says ") AS user, m.message, CONCAT("Original by ", u2.u_first, " ", u2.u_last) AS retweet from user_has_messages AS uhm # Get Samantha's timeline
	INNER JOIN users AS u ON u.uid=uhm.uid
	INNER JOIN messages AS m ON m.mid=uhm.mid
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE u.uid=1;
    
# Simulates removal of a tweet
    
DELETE FROM user_has_messages WHERE 
	uid=1 AND mid=8;
DELETE FROM messages WHERE
	mid=8;
    
SELECT 	CONCAT(u.u_first, " ", u.u_last, " says ") AS user, m.message, CONCAT("Original by ", u2.u_first, " ", u2.u_last) AS retweet from user_has_messages AS uhm # Get Samantha's timeline
	INNER JOIN users AS u ON u.uid=uhm.uid
	INNER JOIN messages AS m ON m.mid=uhm.mid
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE u.uid=1;
    
# Simulates following a new person
    
INSERT INTO user_follows VALUES 
	(1,5);

SELECT CONCAT(u.u_first, " ", u.u_last, " follows ", u2.u_first, " ", u2.u_last) AS Followers FROM user_follows # Get Samantha Steven's list of followings
	INNER JOIN users AS u ON user_follows.uid_1=u.uid
	INNER JOIN users AS u2 ON user_follows.uid_2=u2.uid
    WHERE u.uid=1;

# Simulates unfollowing a person

DELETE FROM user_follows WHERE 
	uid_1=1 AND uid_2=5;
    
SELECT CONCAT(u.u_first, " ", u.u_last, " follows ", u2.u_first, " ", u2.u_last) AS Followers FROM user_follows # Get Samantha Steven's list of followings
	INNER JOIN users AS u ON user_follows.uid_1=u.uid
	INNER JOIN users AS u2 ON user_follows.uid_2=u2.uid
    WHERE u.uid=1;
    
# Simulates favoriting a message
    
INSERT INTO user_favorites_message VALUES
	(1,6);

SELECT CONCAT(u.u_first, " ", u.u_last, " favorited ") AS user, m.message, CONCAT(" by ", u2.u_first, " ", u2.u_last) AS original_user FROM user_favorites_message AS ufm # Get Samantha Steven's favorites 
	INNER JOIN users AS u ON ufm.uid=u.uid
    INNER JOIN messages AS m ON ufm.mid=m.mid
	INNER JOIN user_has_messages AS uhm ON ufm.mid=uhm.mid 
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE uhm.isRetweet=0 AND ufm.uid=1; 
    
# Simulates unfavoriting a message
    
DELETE FROM user_favorites_message WHERE
	uid=1 AND mid=6;

SELECT CONCAT(u.u_first, " ", u.u_last, " favorited ") AS user, m.message, CONCAT(" by ", u2.u_first, " ", u2.u_last) AS original_user FROM user_favorites_message AS ufm # Get Samantha Steven's favorites 
	INNER JOIN users AS u ON ufm.uid=u.uid
    INNER JOIN messages AS m ON ufm.mid=m.mid
	INNER JOIN user_has_messages AS uhm ON ufm.mid=uhm.mid 
    INNER JOIN users AS u2 ON uhm.original_user=u2.uid
    WHERE uhm.isRetweet=0 AND ufm.uid=1; 
    
