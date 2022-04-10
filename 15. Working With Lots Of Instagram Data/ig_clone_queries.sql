-- Challenge 1 # Finding 5 Oldest sers 

SELECT * FROM users
ORDER BY created_at
LIMIT 5;

# +----+------------------+---------------------+
# | id | username         | created_at          |
# +----+------------------+---------------------+
# | 80 | Darby_Herzog     | 2016-05-06 00:14:21 |
# | 67 | Emilio_Bernier52 | 2016-05-06 13:04:30 |
# | 63 | Elenor88         | 2016-05-08 01:30:41 |
# | 95 | Nicole71         | 2016-05-09 17:30:22 |
# | 38 | Jordyn.Jacobson2 | 2016-05-14 07:56:26 |
# +----+------------------+---------------------+

-- Challenge 2 # Most Popular Registration Date

SELECT 
    COUNT(*) AS total,
    DAYNAME(created_at) AS day
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

# +-------+----------+
# | total | day      |
# +-------+----------+
# |    16 | Thursday |
# |    16 | Sunday   |
# +-------+----------+

-- Challenge 3 # Identify Inactive Users (users with no photos)

SELECT 
    users.id, 
    username
FROM users
LEFT JOIN photos
    ON photos.user_id = users.id
WHERE image_url IS NULL
ORDER BY users.id;

# +----+---------------------+
# | id | username            |
# +----+---------------------+
# |  5 | Aniya_Hackett       |
# |  7 | Kasandra_Homenick   |
# | 14 | Jaclyn81            |
# | 21 | Rocio33             |
# | 24 | Maxwell.Halvorson   |
# | 25 | Tierra.Trantow      |
# | 34 | Pearl7              |
# | 36 | Ollie_Ledner37      |
# | 41 | Mckenna17           |
# | 45 | David.Osinski47     |
# | 49 | Morgan.Kassulke     |
# | 53 | Linnea59            |
# | 54 | Duane60             |
# | 57 | Julien_Schmidt      |
# | 66 | Mike.Auer39         |
# | 68 | Franco_Keebler64    |
# | 71 | Nia_Haag            |
# | 74 | Hulda.Macejkovic    |
# | 75 | Leslie67            |
# | 76 | Janelle.Nikolaus81  |
# | 80 | Darby_Herzog        |
# | 81 | Esther.Zulauf61     |
# | 83 | Bartholome.Bernhard |
# | 89 | Jessyca_West        |
# | 90 | Esmeralda.Mraz57    |
# | 91 | Bethany20           |
# +----+---------------------+

-- Challenge 4 # Identify Inactive Users (and user who created it)

SELECT 
    photos.id AS photo_id,
    image_url,
    users.id AS user_id,
    username,
    COUNT(likes.user_id) AS LIKES
FROM photos
JOIN likes
    ON photos.id = likes.photo_id
JOIN users
    ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY LIKES DESC
LIMIT 1;

-- Challenge 5 # Calculate avg number of photos per user

SELECT
    COUNT(DISTINCT image_url) AS total_photos,
    COUNT(DISTINCT username) AS total_username,
    COUNT(DISTINCT image_url) / COUNT(DISTINCT username) AS avg_per_user
FROM photos
JOIN users;

SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users);

-- Challenge 6 # Five Most Popualar Hashtags

SELECT
    photo_tags.tag_id,
    tags.tag_name,
    COUNT(photo_id) AS total_photos
FROM photo_tags
JOIN tags
    ON photo_tags.tag_id = tags.id
GROUP BY tag_id
ORDER BY total_photos DESC
LIMIT 5;

-- Challenge 7 # Finding Bots - users who have liked every single photo

SELECT 
    users.username,
    likes.user_id,
    COUNT(likes.photo_id) AS total_likes
FROM likes
JOIN users
    ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING total_likes = (SELECT COUNT(*) FROM photos);
