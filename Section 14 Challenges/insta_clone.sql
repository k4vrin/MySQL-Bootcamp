CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    comment_text VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

CREATE TABLE likes(
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows(
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO users(username) VALUES
('BlueTheCat'),
('CharlieBrown'),
('ColtSteele');
    

INSERT INTO photos(image_url, user_id) VALUES
('/sadasd', 1),
('/gsdgrfhgr', 2),
('/rfhth', 2);

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
('Meow!', 1, 2),
('Amazing Shot!', 3, 2),
('I <3 This', 2, 1);

INSERT INTO tags(tag_name) VALUES
('adorable'),
('cute'),
('sunrise');

INSERT INTO photo_tags(photo_id, tag_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 2);

INSERT INTO likes(user_id, photo_id) VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3),
(3, 3);

INSERT INTO follows(follower_id, followee_id) VALUES
(1, 2),
(1, 3),
(3, 1),
(2, 3);


-- Commands

SELECT * 
FROM photos
JOIN users
    ON users.id = photos.user_id;
    

SELECT
    image_url,
    COUNT(likes.photo_id)
FROM photos
JOIN likes
    ON likes.photo_id = photos.id
GROUP BY photos.id;

SELECT 
    username,
    COUNT(follows.follower_id) AS Followings
FROM users
JOIN follows
    ON users.id = follows.follower_id
GROUP BY follows.follower_id;

# Won't work because of primary key constraint
INSERT INTO likes(user_id, photo_id) VALUES(1, 1);