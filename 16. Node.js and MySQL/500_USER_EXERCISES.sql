-- Challenge 1

SELECT DATE_FORMAT(created_at, '%M %D %Y') AS earliest_date
FROM users
ORDER BY created_at
LIMIT 1;


# +-----------------+
# | earliest_date   |
# +-----------------+
# | April 11th 2021 |
# +-----------------+

-- Challenge 2

SELECT
    email,
    created_at
FROM users
WHERE created_at = (SELECT MIN(created_at) FROM users);

# +------------------------------+---------------------+
# | email                        | created_at          |
# +------------------------------+---------------------+
# | Frida.Ondricka96@hotmail.com | 2021-04-11 09:00:20 |
# +------------------------------+---------------------+

-- Challenge 3

SELECT
    MONTHNAME(created_at) AS month,
    COUNT(email) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

# +-----------+-------+
# | month     | count |
# +-----------+-------+
# | October   |    59 |
# | May       |    54 |
# | March     |    47 |
# | August    |    45 |
# | January   |    42 |
# | June      |    41 |
# | July      |    39 |
# | November  |    38 |
# | April     |    37 |
# | December  |    37 |
# | September |    36 |
# | February  |    25 |
# +-----------+-------+

-- Challenge 4 

SELECT COUNT(email) AS yahoo_users
FROM users
WHERE email LIKE '%@yahoo.com';

# +-------------+
# | yahoo_users |
# +-------------+
# |         158 |
# +-------------+

-- Challenge 5

SELECT COUNT(email) AS yahoo_users
FROM users
WHERE email LIKE '%@yahoo.com';

SELECT
    CASE
        WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider;

# +----------+-------------+
# | provider | total_users |
# +----------+-------------+
# | gmail    |         177 |
# | hotmail  |         165 |
# | yahoo    |         158 |
# +----------+-------------+